# 第09章 子查询
# 子查询和多表查询是重点

#1.由一个具体的需求引入子查询

#需求：谁的工资比Abel的高？
#方式1：

# 与数据库服务器有两次交互
SELECT last_name,salary
FROM employees
WHERE last_name = 'Abel';

SELECT last_name,salary
FROM employees
WHERE salary > 11000;

#方式2：自连接
#通过建立另一个相同的表，然后一张表中的所有数据与另一张表中last_name = 'Abel'的salary比较
SELECT e2.last_name,e2.salary
FROM employees e1,employees e2
WHERE e2.salary > e1.salary # 多表的连接条件
AND e1.last_name = 'Abel';

#方式3：子查询
SELECT last_name,salary
FROM employees
WHERE salary > (
                SELECT salary
                FROM employees
                WHERE last_name = 'Abel'
                #括号内的结果是11000
                );

#2. 称谓的规范：外查询（或主查询）、内查询（或子查询）
/*
子查询（内查询）在主查询之前一次执行完成。
子查询的结果被主查询（外查询）使用 。
    注意事项
    子查询要包含在括号内
    将子查询放在比较条件的右侧
    单行操作符对应单行子查询，多行操作符对应多行子查询
*/

SELECT last_name,salary
FROM employees
WHERE (
       SELECT salary
       FROM employees
       WHERE last_name = 'Abel'
             ) < salary;
             
/*
3.子查询的分类
角度1：从内查询返回的结果的条目数
       单行子查询 vs 多行子查询
    
角度2：内查询是否被执行多次
        相关子查询 vs 不相关子查询
        
 比如：相关子查询的需求：查询工资大于本部门平均工资的员工信息
       不相关子查询的需求：查询工资大于本公司平均工资的员工信息
*/

#4.单行子查询
#4.1 单行操作符： = != >= <= > <
#题目： 查询工资大于149号员工工资的员工的信息

# 子查询的编写技巧（或步骤）：① 从里往外写  ② 从外往里写

SELECT salary
FROM employees 
WHERE employee_id = 149;

SELECT employee_id ,last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees 
		WHERE employee_id = 149;)


#题目：返回job_id与141号员工相同，salary比143号员工多的员工姓名，job_id和工资

# 找到141号员工ID
SELECT job_id
FROM employees
WHERE employee_id = 141
# 找到143号员工工资
SELECT salary
FROM employees
WHERE employee_id = 143

SELECT last_name,job_id,salary
FROM employees
WHERE job_id =(SELECT job_id
FROM employees
WHERE employee_id = 141)
AND salary > (SELECT salary
FROM employees
WHERE employee_id = 143);

#题目：返回公司工资最少的员工的last_name,job_id和salary

SELECT MIN(salary)
FROM employees

SELECT last_name,job_id,salary
FROM employees
WHERE salary = (SELECT MIN(salary)
FROM employees);

# 题目：查询与141号或174号员工的manager_id和department_id相同的
# 其他员工的employee_id，manager_id，department_id

SELECT employee_id,manager_id,department_id
FROM employees
WHERE manager_id = 
(
SELECT manager_id
FROM employees
WHERE employee_id IN (141,174)
)
AND
(
SELECT department_id
FROM employees
WHERE employee_id IN (141,174)
)


# 题目：查询与141号员工的manager_id和department_id相同的
# 其他员工的employee_id，manager_id，department_id

SELECT employee_id,manager_id,department_id
FROM employees
WHERE manager_id = ( 
                    SELECT manager_id  
                    FROM employees
	            WHERE employee_id = 141;
                    )

AND department_id = ( 
                    SELECT department_id
                    FROM employees
	            WHERE department_id = 141;
                    )
AND employee_id <> 141;

#方式2：了解,WHERE（）内顺序和等号右边SELECT右边变量的顺序要一样
SELECT employee_id,manager_id,department_id
FROM employees
WHERE (manager_id ,department_id) = (
                                     SELECT manager_id,department_id
                                     FROM employees
                                     WHERE employee_id = 141
)
AND employee_id <> 141;

# 题目：查询    最低工资大于50号部门最低工资的    部门id和其最低工资

SELECT department_id,MIN(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING MIN(salary) > (
			SELECT MIN(salary)
			FROM employees
			WHERE department_id = 50
			);

# 题目：显式员工的employee_id,last_name和location。
# 其中，若员工department_id与location_id为1800
# 的department_id相同，则location为’Canada’，其余则为’USA’。
SELECT employee_id,last_name,CASE department_id WHEN (

SELECT department_id
FROM departments
WHERE location_id = 1800

) THEN 'Canada'
  ELSE 'USQ' END "location"
FROM employees
#找出location_id为1800的员工id
SELECT department_id
FROM departments
WHERE location_id = 1800

#4.2 子查询中的空值问题
SELECT last_name,job_id
FROM employees
WHERE job_id = 
		(SELECT job_id 
		 FROM employees
		 WHERE last_name = 'frank');
# 当子查询中的结果为NULL 那么主查询中不会显示值（包括NULL）

#4.3 非法使用子查询
# 当子查询返回多行值的时候，用 = 接收会报错
SELECT employee_id,last_name
FROM employees
WHERE salary = 
		(SELECT MIN(salary)
		FROM employees
		GROUP BY department_id);

#5.多行子查询
#5.1 多行子查询的操作符： IN  ANY  ALL SOME(同ANY)

#5.2举例：
# IN:
SELECT employee_id,last_name
FROM employees 
WHERE salary IN
		(SELECT MIN(salary)
		FROM employees
		GROUP BY department_id);
		
# ANY / ALL :
#题目：返回其它job_id中比job_id为‘IT_PROG’部门任一工资低的
#员工的员工号、姓名、job_id 以及salary
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE job_id <> 'IT_PROG'
AND salary < ANY
		(SELECT salary
		FROM employees 
		WHERE job_id = 'IT_PROG');
		
# 题目：返回其它job_id中比job_id为‘IT_PROG’部门所有工资都低的员工的员工号、姓名、job_id以及salary
SELECT employee_id ,last_name,job_id,salary
FROM employees
WHERE salary < ALL
		(SELECT salary
		FROM employees
		WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

#题目：查询平均工资最低的部门id

#问题：为什么去掉GROUP BY后 department_id 是90，不论是MIN，MAX还是AVG函数？
SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id;

#MySQL中聚合函数是不能嵌套使用的。
#方式1：
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) = 
(SELECT MIN(avg_sal)
	FROM(
        # 把查询出来的内容当作一个表，这个表一定要有一个别名
	SELECT AVG(salary) avg_sal
	FROM employees
	GROUP BY department_id
	) t_dept_avg_sal
);

#方式2：
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) <= ALL(
                        SELECT AVG(salary) avg_sal
                        FROM employees
                        GROUP BY department_id
                        )
#5.3 空值问题
SELECT last_name
FROM employees
WHERE employee_id NOT IN (
SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL
);          

#6. 相关子查询
#回顾： 查询员工中工资大于公司平均工资的员工的last_name,salary和其department_id  

SELECT last_name,salary,department_id
FROM employees
WHERE salary > (
                SELECT AVG(salary)
                FROM employees
                );
                            
#题目：查询员工中工资大于本部门平均工资的员工的last_name,salary和其department_id
#方式1：使用相关子查询
SELECT last_name,salary,department_id
FROM employees el
# 不相关子查询 （） 内得到的是常量
# 相关子查询 中 外查询会影响子查询返回的值
WHERE salary > (
		SELECT AVG(salary)
		FROM employees e2
		WHERE e2.department_id = e1.department_id #此处限制同一个部门
		#子查询的表用来找平均工资，主查询的表用来比较
		);
		
#方式2：在FROM中声明子查询

SELECT last_name,salary,e1.department_id
FROM employees e1,(
                   SELECT department_id,AVG(salary) dept_avg_sal # 以具体字段出现，而不是函数，必须要有别名
		   FROM employees GROUP
		   BY department_id) e2
# 此处整张表由 employee | e2 组成
WHERE e1.`department_id` = e2.department_id
AND e2.dept_avg_sal /*注意此处不能写e2.AVG(salary)，因为此时AVG(salary)不是以函数出现的*/
< e1.`salary`;

#题目：查询员工的id,salary,按照department_name排序

SELECT employee_id,salary
FROM employees e
ORDER BY (
          SELECT department_name
          FROM departments d
          WHERE e.department_id = d.department_id
          ) ASC;
          
# 结论： 在SELECT中，除了　GROUP　BY　和　LIMIT　之外，其他位置都可以声明子查询！

# 题目：题目：若employees表中employee_id与job_history表中employee_id相同的数目不小于2，输出这些相同
# id的员工的employee_id,last_name和其job_id

SELECT * 
FROM job_history

SELECT employee_id,last_name,job_id
FROM employees e
WHERE 2 <= (
            SELECT COUNT(*)
            FROM job_history j
            WHERE e.employee_id = j.employee_id
            )
            
#6.2 EXISTS 与 NOT EXISTS 关键字
# 题目：查询公司管理者的employee_id，last_name，job_id，department_id信息
#方式1：自连接
SELECT DISTINCT mgr.employee_id,mgr.last_name,mgr.job_id,mgr.department_id
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id

#方式2：子查询

SELECT employee_id,last_name,job_id,department_id
FROM employees 
WHERE employee_id IN (
			SELECT DISTINCT manager_id
			FROM employees
		     );

SELECT DISTINCT manager_id
FROM employees

#方式3：使用EXISTS
SELECT employee_id,last_name,job_id,department_id
FROM employees e1
WHERE EXISTS ( # EXISTS 表示SELECT出来的数据，满足EXISTS中的关系
              SELECT *
              FROM employees e2
              WHERE e1.employee_id = e2.manager_id
              );
              
# 题目：查询departments表中，不存在于employees表中的部门的department_id和department_name

#方式1：
SELECT d.department_id,department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

#方式2：
SELECT department_id ,department_name
FROM departments d
WHERE NOT EXISTS (
		SELECT *
		FROM employees e
		WHERE d.department_id = e.department_id
		)
		
SELECT COUNT(*)
FROM departments;

#【题目】
#1.查询和Zlotkey相同部门的员工姓名和工资
SELECT last_name,salary
FROM employees
WHERE department_id = ( SELECT d.department_id 
			FROM departments d JOIN employees e
			ON d.department_id = e.department_id
			WHERE last_name = 'Zlotkey'
			);
			
#标准答案：

SELECT last_name, salary
FROM employees
WHERE department_id = (
SELECT department_id
FROM employees
WHERE last_name = 'Zlotkey'
)

#2.查询工资比公司平均工资高的员工的员工号，姓名和工资。

SELECT employee_id,last_name,salary
FROM employees
WHERE salary > (
		SELECT AVG(salary)
                FROM employees
                )

#3.选择工资大于所有JOB_ID = 'SA_MAN'的员工的工资的员工的last_name, job_id, salary

SELECT last_name,job_id,salary
FROM employees
WHERE salary > (
		SELECT salary
		FROM employees
		WHERE job_ID = 'SA_MAN'
		);

#4.查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名

SELECT employee_id ,last_name
FROM employees
WHERE department_id = ANY(
			SELECT DISTINCT department_id
			FROM employees
			WHERE last_name LIKE '%u%'
			);

#5.查询在部门的location_id为1700的部门工作的员工的员工号

SELECT employee_id
FROM employees
WHERE department_id IN (
			SELECT department_id
			FROM employees
			WHERE department_id = 1700
			)

#6.查询管理者是King的员工姓名和工资

SELECT last_name,salary
FROM employees 
WHERE manager_id IN(
                    SELECT employee_id
                    FROM employees 
                    WHERE last_name = 'King'
                    )
                    
#7.查询工资最低的员工信息: last_name, salary
# 错误答案：
SELECT last_name,salary
FROM employees
WHERE salary = ( SELECT salary
		 FROM employees
		 WHERE salary = MIN(salary)
		 )

# 标准答案：
SELECT last_name,salary
FROM employees
WHERE salary = (
		SELECT MIN(salary)
		FROM employees
);

/*错误答案会出现：Invalid use of group function即“集函数的无效用法”

错句示例：SELECT sname AS '优秀学生姓名',AVG(score) as '平均成绩' FROM `grade_info` WHERE AVG(score)>90 GROUP BY sno;

正确写法：SELECT sname AS '优秀学生姓名',AVG(score) as '平均成绩' FROM `grade_info` GROUP BY sno HAVING AVG(score) > 90 ;



说明：

GROUP BY，顾名思义：根据...分组，在SQL中常根据指定字段分组（指定字段内容相同是为一组），然后针对组进行相关操作

WHERE和HAVING的区别在于：

where 子句的作用是对查询结果进行分组前，将不符合where条件的行去掉，即在分组之前过滤数据，where条件中不能包含聚组函数，使用where条件过滤出特定的行。

having 子句的作用是筛选满足条件的组，即在分组之后过滤数据，条件中经常包含聚组函数，使用having 条件过滤出特定的组，也可以使用多个分组标准进行分组。

示例错句的问题就在于：WHERE子句中使用集函数。

另外需要注意的地方是，SQL语法：


SELECT [DISTINCT|DISINCTROW|ALL] select_expression,... -- 查询结果
[FROM table_references -- 指定查询的表
[WHERE where_definition] -- where子句，查询数据的过滤条件
[GROUP BY col_name,...] -- 对[匹配where子句的]查询结果进行分组
[HAVING where_definition] -- 对分组后的结果进行条件限制
[ORDER BY{unsigned_integer | col_name | formula} [ASC | DESC],...] -- 对查询结果进行排序
[LIMIT [offset,] rows] -- 对查询的显示结果进行条数限制
[PROCEDURE procedure_name] --查询存储过程返回的结果集数据
]
*/

查询语句书写顺序须遵循上述规则。

#8.查询平均工资最低的部门信息

SELECT *
FROM departments
WHERE department_id = (
#子查询1：查询（部门中）最小的平均工资
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) <= ALL(
#子查询2：查询出每个部门的平均工资
SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id
)
);
#如下语句，如果没有 GROUP BY 则则查询的是employees整个表的平均工资
#如果有 GROUP BY ，则表格中会出现每一个部门的平均工资
SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id

#关于为什么出现HAVING就要有GROUP BY的理解：
#HAVINIG出现必然有聚合函数AVG(),MIN()等，这些函数如果没有按照一些条件分组
#则会出现整张表的AVG(),MIN()，达不到预定的目的比如：求每个表中的列的AVG(),MIN()
#GROUP BY出现是为了达成预定目的

#9.查询平均工资最低的部门信息和该部门的平均工资（相关子查询）

SELECT department_id,salary
FROM departments
WHERE department_id = ( 
			SELECT department_id 
			FROM employees
			GROUP BY department_id
			HAVING AVG(salary) <= ALL ( 
						SELECT AVG(salary) avg_sal
						FROM employees
						GROUP BY department_id
					      )
					      );

#10.查询平均工资最高的 job 信息
#11.查询平均工资高于公司平均工资的部门有哪些?
#12.查询出公司中所有 manager 的详细信息
#13.各个部门中 最高工资中最低的那个部门的 最低工资是多少?
#14.查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary
#15. 查询部门的部门号，其中不包括job_id是"ST_CLERK"的部门号
#16. 选择所有没有管理者的员工的last_name
#17．查询员工号、姓名、雇用时间、工资，其中员工的管理者为 'De Haan'
#18.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资（相关子查询）
#19.查询每个部门下的部门人数大于 5 的部门名称（相关子查询）
#20.查询每个国家下的部门个数大于 2 的国家编号（相关子查询）

【题目】
#1.查询和Zlotkey相同部门的员工姓名和工资
SELECT e.last_name, e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = (
SELECT d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.last_name = 'Zlotkey');

SELECT last_name, salary
FROM employees
WHERE department_id = (
SELECT department_id
FROM employees
WHERE last_name = 'Zlotkey'
)
#2.查询工资比公司平均工资高的员工的员工号，姓名和工资。
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
)
#3.选择工资大于所有JOB_ID = 'SA_MAN'的员工的工资的员工的last_name, job_id, salary
SELECT last_name, job_id, salary
FROM employees
WHERE salary > ALL (
SELECT salary 
FROM employees
WHERE job_id = 'SA_MAN');
#4.查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名
SELECT employee_id,last_name
FROM employees
WHERE department_id = ANY (-- 名字中包含 u 的人有很多，筛选出的 department_id 会重复，用上 DISTINCT
SELECT DISTINCT department_id
FROM employees
WHERE last_name LIKE '%u%');
#5.查询在部门的location_id为1700的部门工作的员工的员工号
-- 在 employees 这张表中找不到 location_id
SELECT employee_id
FROM employees
WHERE department_id IN (
SELECT department_id
FROM departments
WHERE location_id = 1700)
#6.查询管理者是King的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE manager_id IN (
SELECT manager_id 
FROM employees
WHERE last_name = 'King')

#7.查询工资最低的员工信息: last_name, salary
SELECT last_name,salary
FROM employees
WHERE salary = (
SELECT MIN(salary)
FROM employees
);
#8.查询平均工资最低的部门信息
SELECT d.department_id, d.department_name
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY department_id
HAVING AVG(salary)<
 (
SELECT AVG(salaru)
FROM employ

-- 先找出每个部门的平均工资
SELECT AVG(salary) avg_sal 
FROM employees
GROUP BY department_id
-- 再找出这些部门中平均薪资最小的部门
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) <= ALL(
SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id
)
-- 筛选出这个部门的全部信息
SELECT *
FROM departments
WHERE department_id = (
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) <= ALL(
SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id
)
);

SELECT AVG(salary) avg_sal
FROM employees

SELECT AVG(salary) avg_sal
FROM employees
GROUP BY department_id

-- 两者的区别就是，第二根查询出来的 AVG 是以 department_id来分组的，查到的是每个组的 AVG
-- 第一个查的是全部 department 的 AVG

#9.查询平均工资最低的部门信息和该部门的平均工资（相关子查询）
#10.查询平均工资最高的 job 信息
#11.查询平均工资高于公司平均工资的部门有哪些?
#12.查询出公司中所有 manager 的详细信息
#13.各个部门中 最高工资中最低的那个部门的 最低工资是多少?
#14.查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary
#15. 查询部门的部门号，其中不包括job_id是"ST_CLERK"的部门号
#16. 选择所有没有管理者的员工的last_name
#17．查询员工号、姓名、雇用时间、工资，其中员工的管理者为 'De Haan'
#18.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资（相关子查询）
#19.查询每个部门下的部门人数大于 5 的部门名称（相关子查询）
#20.查询每个国家下的部门个数大于 2 的国家编号（相关子查询）


