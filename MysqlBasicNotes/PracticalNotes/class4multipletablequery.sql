# 第06章_多表查询

/*
SELECT ...,....,....
FROM ....
WHERE .... AND / OR / NOT....
ORDER BY .... (ASC/DESC),....,...
LIMIT ...,...

*/
#1. 熟悉常见的几个表
DESC employees;

DESC departments;

DESC locations;

# 查询员工名为'Abel'的人在哪个城市工作？

# 通过网络进行三次交互才得出答案，比较麻烦
# 通过employees这张表得知，Able的department_id是80，进而进行下一次循环
SELECT * 
FROM employees
WHERE last_name = 'Abel';
#通过departments这张，得知当department_id是80的时候，location_id是2500
SELECT * 
FROM departments
WHERE department_id = 80
#同理当location_id等于2500的时候，可以得到Able的工作城市
SELECT *
FROM locations
WHERE location_id = 2500;

#如果不进行多表查询的话，语句会像并联式地一样，要不断通过前一个语句才能得到信息之间的关联


#能不能把三张表放到一张表里面？

#可以，但是会导致信息冗余
/*
有大部分的人的信息会重复，比如同一个部门的人，不存在部门等情况

导致IO次数高，效率低下

并发效率低，可能存在表格被锁现象，其他人无法调用
*/

#2.出现笛卡尔积的错误
# 错误的原因： 缺少了多表的连接条件

# 错误的实现方式：每个员工都与每个部门匹配了一遍

#错误的实现方式：
# 查询两个表中的两个数据，查询的结果会出现两个表中的全部数据一一组合，这就是出现笛卡尔积的原因
SELECT employee_id,department_name
FROM employees,departments;  #查询出2889条记录

SELECT *
FROM employees; # 107条记录

SELECT 2889 / 107
FROM DUAL;

SELECT *
FROM departments; # 27条记录

#3. 多表查询的正确方式：需要有连接条件

SELECT employee_id,department_name
FROM employees,departments
#两个表的连接条件
# 通过 WHERE 防止笛卡尔积的出现，限制两个表之间的连接条件，什么时候两个表的数据才能出现在同一行中
# 翻译：只有当employees表中的department_id与departments表中department_id相同的时候
#       才会将这两个表中的employee_id与department_name查询出来，放入一个表中的同一行
WHERE employees.`department_id` = departments.department_id;

#多表查询的要求之一： 多个表之间要有共同存在的列名，才能构成不同表的连接点

#4.如果查询语句中出现了多个表中都存在的字段，则必须指明此字段所在的表

SELECT employee_id,department_name,employees.department_id 
#因为department_id这个Column在employees和departments两张表中都有出现，所以系统不知道去哪张表调用，要提前设置好
FROM employees,departments
WHERE employees.`department_id` = departments.department_id;

#建议：从sql优化的角度，建议多表查询时，每个字段前都指明其所在的表

#5.指明字段所在的表的时候，语句变得非常长，可以通过给表起别名简化语句，在SELECT和WHERE中是使用表的别名
SELECT emp.employee_id,dept.department_name,emp.department_id 
FROM employees emp,departments dept
WHERE emp.`department_id` = dept.department_id;

#多表查询的要求之一：当查询的信息在多表都有出现的时候，要指明信息所在的表

# 如果给表起了别名，一旦在SELECT或WHERE中使用表名的话，则必须使用表的别名,而不能使用表的原名
#（涉及到执行顺序的问题，最先执行FROM ，已经将别名覆盖了原来表的名字)
# 错误操作：
SELECT emp.employee_id,departments.department_name,emp.department_id 
FROM employees emp,departments dept
WHERE emp.`department_id` = departments.department_id;

#6.如果有n个表实现多表的查询，则需要n-1个连接条件 

#在 n 个表之间，至少要有n-1个绳子把 n 个表连接成一行
       
#练习：查询员工的employee_id,last_name,department_name,city
SELECT e.employee_id,e.last_name,d.department_name,l.city,e.department_id,l.location_id
FROM employees e,departments d,locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

/*

演绎式： 提出问题  ——————>  解决问题

归纳式： 总 ——————> 分

*/

#7. 多表查询的分类
/*

角度1： 等值连接 vs 非等值连接

角度2： 自连接 vs 非自连接

角度3:  内连接 vs 外连接

*/ 
# 7.1 等值连接 vs 非等值连接

#非等值连接的例子：指一个表中的指与另一个表中的区间进行配对

# 当出现一个信息(值）要与一个区间（值得区间）匹配的时候，用非等值连接

#例如：未成年人 ---> 0 ~ 18 岁 ， 成年人 ---> 大于18岁

SELECT *
FROM job_grades;

SELECT last_name,salary,grade_level
FROM employees e,job_grades j
# where e.salary between j.lowest_sal and j.highest_sal;
WHERE e.salary >= j.lowest_sal AND e.salary <= j.highest_sal;

# 7.2 自连接 vs 非自连接

SELECT * FROM employees;

# 自连接： 本质上同一个系统，类内部的关系

#例如：家族 ---> 父母关系   职场 ---> 上下级关系   生物链 ---> 捕食与被捕食关系

#自连接：通过同一张表，不同数据之间连接
#练习：查询员工id,员工姓名及其管理者的id和姓名
# 同一张表，但是employee_id要和manager_id连接

SELECT emp.employee_id,emp.last_name,mgr.employee_id,mgr.last_name
FROM employees emp , employees mgr
WHERE emp.manager_id = mgr.employee_id;

# 7.3 内连接 vs 外连接

# 内连接：
SELECT employee_id,department_name
FROM employees e ,departments d
WHERE e.`department_id` = d.department_id;


# 外连接： 合并具有同一列的两个以上的表的行，结果集中除了包含一个表与另一个表匹配的行之外，
#          还查询到了左表 或 右表中不匹配的行

# 外连接的分类：左外连接、右外连接、满外连接

# 左外连接：两个表在连接过程中除了返回满足连接条件的行以外还返回左表中不满足条件的行，这种连接称为左外连接
# 右外连接：两个表在连接过程中除了返回满足连接条件的行以外还返回右表中不满足条件的行，这种连接称为👉外连接

#练习：查询所有的员工的last_name,department_name信息
# 关键字：所有 ————> 外连接
SELECT employee_id,department_name
FROM employees e ,departments d
WHERE e.department_id = d.department_id;

#SQL92语法实现内连接：见上
#SQL92语法实现外连接：使用 + ————————MySQL不支持SQL92语法中外连接的写法！
#MySQL不支持,ORACLE支持：
#左外连接
SELECT employee_id,department_name
FROM employee e ,departments d
WHERE e.department_id = d.department_id(+);
#右外连接
SELECT employee_id,department_name
FROM employee e ,departments d
WHERE e.department_id(+) = d.department_id;

/*
WHERE语句中形象地把两个表的信息表示了出来
左外连接：左边多，右边补加号
结果就会加上department_name为NULL，而employee_id存在的情况
左外连接：将左边信息存在，右边信息不存在的行显示出来
employee_id          department_name
——                   ——
——                   ——
——                   ——
——                   ——
——                  (+)
——                  (+)
——                  (+)
*/

#SQL99语法中使用JOIN...ON的方式实现多表的查询。这种方式也能解决外连接的问题。MySQL是支持此种方式的 
#SQL99语法如何实现多表的查询

# JOIN...ON 的作用：连接两个表，在SELECT的时候可以同时获取两个表内的数据

#SQL99语法实现内连接：FROM 一个队伍 JOIN 一个人 ON 加入的人经谁介绍进来的 

# 特点：同样的信息（department_id)来自两个表，但是 FROM 中只写出一个表，另一个表以JOIN
#       的形式加入，ON后面填入的是 连接条件

SELECT last_name,department_name
FROM employees e  JOIN departments d
ON e.department_id = d.department_id

# INNER 可以省略

SELECT last_name,department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id

SELECT last_name ,department_name,city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;

#SQL99语法实现外连接：

#练习：查询所有的员工的last_name,department_name信息
#OUTER 可有可无，和INNER一样

#左外连接:
SELECT last_name,department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;
/*
结果：
last_name   department_name
Grant       (NULL)
*/

#右外连接:
SELECT last_name,department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id;


# 刁钻问题：
# 为什么当SELECT中的列名字交换位置之后， RIGHT OUTER JOIN 却是左外连接
# 交换SELECT中的列名字位置，是只交换列的位置吗？
# 答案：因为SELECT语句中的两个列名字，分别来自两个行，是否是左外连接还是右外连接
# 看的不是显示窗口的列的左还是右，SELECT语句控制了输出的形式，RIGHT OUTER JOIN控制了
# 哪一个列是有外连接的，不控制这个列处于左边还是右边

SELECT department_name,last_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT * 
FROM employees;

SELECT * 
FROM departments;

# 满外连接：mysql不支持FULL OUTER JOIN方式
SELECT last_name,department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

#8. UNION 和 UNION ALL　的使用
# UNION 操作符返回两个查询的结果集的并集，去除重复记录
# UNION ALL 操作符返回两个查询的结果集的并集，对于两个结果集的重复部分，不去重

# 注意： 执行UNION ALL语句时所需要的资源比UNION语句少。如果明确知道合并数据后的
#        结果数据不存在重复数据，或者不需要去除重复的数据，则尽量使用UNION ALL语句
#        以提高数据查询的效率

#9、7种JOIN的实现：

# 1、 内连接

SELECT employee_id,department_name
FROM employees e  JOIN departments d
ON e.department_id = d.department_id

# 2、 左外连接:
SELECT employee_id,department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

# 增强理解：左外连接下，B表不包括AB表重复的部分为（空）NULL，正如左外连接显示出来
# 的表格一样，会出现 右边列(department_name) 为NULL的情况

# 3、 右外连接:
SELECT employee_id,department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id;

# 4、 A表去掉AB表重复部分
SELECT employee_id,department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;# 此处 d.department_id 还是 e.department_id都可以

# 5、 B表去掉AB表重复部分　
SELECT employee_id,department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

# 6、 满外连接
# 方式一；左外连接 UNION ALL 5、
SELECT employee_id,department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
UNION ALL 
SELECT employee_id,department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;
# 方式二：右外连接　UNION ALL 4、
SELECT employee_id,department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id;
UNION ALL
SELECT employee_id,department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

#7、 全集去掉AB表重复部分
#    4、UNION ALL 5、
SELECT employee_id,department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
UNION ALL
SELECT employee_id,department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

-- 【题目】
# 1.显示所有员工的姓名，部门号和部门名称。
SELECT e.last_name,d.department_id,d.department_name
FROM employees e,departments d
WHERE e.department_id = d.department_id;

-- 正确答案：

SELECT last_name,e.department_id,department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;


-- 错误原因："所有"表示要用外连接，包括部门号或部门名称为NULL的员工


# 2.查询90号部门员工的job_id和90号部门的location_id

SELECT e.job_id,d.location_id
FROM employees e,departments d
WHERE e.department_id = 90 AND d.department_id = 90;

-- 答案二 ：

SELECT job_id,location_id
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id =90;

-- 原理：因为查询的job_id和location_id都是90号部门的，所以可以先将两个表连接在一起
# 然后通过department_id = 90直接限制答案

# 3.选择所有有奖金的员工的 last_name , department_name , location_id , city

SELECT e.last_name, d.department_name, d.location_id , l.city
FROM employees e
LEFT OUTER JOIN departments d
ON d.department_id = e.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
WHERE commission_pct IN NOT NULL;

# 如果SELECT语句中列名在所有表中具有唯一性，不用标注是哪个表的

SELECT last_name, department_name, d.location_id , city
FROM employees e
LEFT OUTER JOIN departments d
ON d.department_id = e.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
WHERE commission_pct IN NOT NULL;


# 4.选择city在Toronto工作的员工的 last_name , job_id , department_id , department_name

SELECT last_name,job_id,e.department_id,department_name
FROM employees e
JOIN  departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id
WHERE city = "Toronto";
# 5.查询员工所在的部门名称、部门地址、姓名、工作、工资，其中员工所在部门的部门名称为’Executive’

SELECT department_name, street_address,last_name,job_id,salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id
WHERE department_name = "Executive";

# 6.选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格式
-- employees Emp# manager Mgr#
-- kochhar 101 king 100

SELECT emp.last_name employees,emp.employee_id "Emp#", mgr.last_name manager,mgr.employee_id "Mgr#"
FROM employees emp, employees mgr
WHERE emp.manager_id = mgr.employee_id;


-- 正确答案：

#使用左外连接，因为不是每个员工都有管理者（boss)
SELECT emp.last_name employees, emp.employee_id "Emp#", mgr.last_name manager,
mgr.employee_id "Mgr#"
FROM employees emp
LEFT OUTER JOIN employees mgr
ON emp.manager_id = mgr.employee_id;

# 7.查询哪些部门没有员工

SELECT d.department_id
FROM departments d 
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.department_id IS NULL;


# 8. 查询哪个城市没有部门

SELECT l.location_id,city
FROM locations l
LEFT JOIN departments d
ON l.location_id = d.location_id
WHERE d.location_id = NULL;

#左外连接特别包含了没有部门的情况（全集中包含全部A表）

# 9. 查询部门名为 Sales 或 IT 的员工信息
SELECT employee_id ,last_name,department_name
FROM employees e,departments d
WHERE e.department_id = d.department_id
AND d.department_name IN('Sales','IT');

-- 多表查询2
-- 储备：建表操作：
CREATE TABLE `t_dept` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`deptName` VARCHAR(30) DEFAULT NULL,
`address` VARCHAR(40) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `t_emp` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`name` VARCHAR(20) DEFAULT NULL,
`age` INT(3) DEFAULT NULL,
`deptId` INT(11) DEFAULT NULL,
empno INT NOT NULL,
PRIMARY KEY (`id`),
KEY `idx_dept_id` (`deptId`)
#CONSTRAINT `fk_dept_id` FOREIGN KEY (`deptId`) REFERENCES `t_dept` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 1. 所有有门派的人员信息
-- （ A、B两表共有）
INSERT INTO t_dept(deptName,address) VALUES('华山','华山');
INSERT INTO t_dept(deptName,address) VALUES('丐帮','洛阳');
INSERT INTO t_dept(deptName,address) VALUES('峨眉','峨眉山');
INSERT INTO t_dept(deptName,address) VALUES('武当','武当山');
INSERT INTO t_dept(deptName,address) VALUES('明教','光明顶');
INSERT INTO t_dept(deptName,address) VALUES('少林','少林寺');
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('风清扬',90,1,100001);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('岳不群',50,1,100002);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('令狐冲',24,1,100003);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('洪七公',70,2,100004);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('乔峰',35,2,100005);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('灭绝师太',70,3,100006);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('周芷若',20,3,100007);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('张三丰',100,4,100008);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('张无忌',25,5,100009);
INSERT INTO t_emp(NAME,age,deptId,empno) VALUES('韦小宝',18,NULL,100010);
-- 【题目】
#1.所有有门派的人员信息
-- （ A、B两表共有）

SELECT id ,NAME ,age ,deptID
FROM t_dept d
JOIN t_emp e
ON d.deptID = e.id

#2.列出所有用户，并显示其机构信息
-- （A的全集）

SELECT *
FROM t_emp a LEFT JOIN t_dept b
ON a.deptId = b.id;

#3.列出所有门派
-- （B的全集）

SELECT *
FROM t_dept b;

#4.所有不入门派的人员
-- （A的独有）

SELECT *
FROM t_emp a LEFT JOIN t_dept b
ON a.deptId = b.id
WHERE b.id IS NULL;

#5.所有没人入的门派
-- （B的独有）

SELECT *
FROM t_dept b LEFT JOIN t_emp a
ON a.deptId = b.id
WHERE a.deptId IS NULL;

#6.列出所有人员和机构的对照关系
-- (AB全有)
#MySQL Full Join的实现 因为MySQL不支持FULL JOIN,下面是替代方法
#left join + union(可去除重复数据)+ right join
SELECT *
FROM t_emp A LEFT JOIN t_dept B
ON A.deptId = B.id
UNION
SELECT *
FROM t_emp A RIGHT JOIN t_dept B
ON A.deptId = B.id
#7.列出所有没入派的人员和没人入的门派
-- （A的独有+B的独有）

SELECT *
FROM t_emp A LEFT JOIN t_dept B
ON A.deptId = B.id
WHERE B.`id` IS NULL
UNION
SELECT *
FROM t_emp A RIGHT JOIN t_dept B
ON A.deptId = B.id
WHERE A.`deptId` IS NULL

#10.SQL99语法的新特性1： 自然连接

SELECT employee_id,last_name,department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
AND e.manager_id = d.manager_id;

# NUTURAL JOIN ：它会帮你自动查询两张连接表中‘所有相同的字段’，然后进行‘等值连接’。
SELECT employee_id,last_name,department_name
FROM employees e NATURAL JOIN departments d

#11. SQL99语法的新特性2：USING
SELECT employee_id,last_name,department_name
FROM employees e JOIN departments d
WHERE e.department_id = d.department_id;

#在USING的括号中填入指定的同名字段。同时使用JOIN...USING可以简化JOIN ON的等值连接
SELECT employee_id,last_name,department_name
FROM employees e JOIN departments d
USING (department_id);

#与自连接不同
#自连接：两张相同的表，不同名字段    JOIN...USING:两张不同的表，同名字段
SELECT emp.employee_id,emp.last_name,mgr.employee_id,mgr.last_name
FROM employees emp , employees mgr
WHERE emp.manager_id = mgr.employee_id;

#拓展：
SELECT last_name,job_id,e.department_id,department_name
FROM employees e 
JOIN  departments d JOIN locations l
ON e.department_id = d.department_id
AND l.location_id = d.location_id
WHERE city = "Toronto";

#注意：要控制连接表的数量，如果连接的表超过三个，会导致效率降低（就像for循环嵌套过多）



【题目】
# 1.显示所有员工的姓名，部门号和部门名称。
SELECT e.last_name,d.department_id,d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id

# 2.查询90号部门员工的job_id和90号部门的location_id

SELECT e.job_id,d.location_id
FROM employees e JOIN departments d
WHERE d.department_id = 90
# 3.选择所有有奖金的员工的 last_name , department_name , location_id , city
SELECT e.last_name,d.department_name,d.location_id,l.city
FROM employees e 
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
WHERE commission_pct IS NOT NULL

# 4.选择city在Toronto工作的员工的 last_name , job_id , department_id , department_name
SELECT e.last_name,e.job_id,d.department_id,d.department_id
FROM employees e,departments d,locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND city = 'Toronto'
# 5.查询员工所在的部门名称、部门地址、姓名、工作、工资，其中员工所在部门的部门名称为’Executive’
SELECT d.department_name,l.street_address,e.last_name,e.job_id,e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id
WHERE d.department_name = 'Executive'
# 6.选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格式
employees Emp# manager Mgr#
kochhar 101 king 100

SELECT 	e.last_name employees,e.employee_id `Emp#`,m.last_name managers,m.employee_id `Mgr#`
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
# 7.查询哪些部门没有员工
SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
WHERE e.employee_id IS NULL
# 8. 查询哪个城市没有部门
SELECT l.city
FROM locations l
LEFT JOIN departments d
ON l.location_id = d.location_id
WHERE d.department_id IS NULL
# 9. 查询部门名为 Sales 或 IT 的员工信息
SELECT e.employee_id,e.last_name,e.job_id
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Sales' OR d.department_name = 'IT'





