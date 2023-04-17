# 第05章_排序与分页

#一.排序

# 如果没有使用排序操作，默认情况下查询返回的数据是按照添加数据的顺序显示的
SELECT * FROM employees;

# 练习：按照salary从高到低的顺序显示员工信息

# 使用 ORDER BY 对查询到的数据进行排序处理
# 升序：ASC (ascend)
# 降序：DESC （descend)

#练习： 按照salary从高到低的顺序显示员工信息
SELECT employee_id,last_name,salary
FROM employees
ORDER BY salary DESC;

#练习： 按照salary从低到高的顺序显示员工信息
SELECT employee_id,last_name,salary
FROM employees
ORDER BY salary ASC;

SELECT employee_id,last_name,salary
FROM employees
ORDER BY salary;
#如果在ORDER BY后没有显示指明排序的方式的话，则默认按照升序排列

#2.我们可以使用列的别名，进行排序
SELECT employee_id,salary,salary * 12 AS annual_sal
FROM employees
ORDER BY annual_sal;

#列的别名只能在ORDER BY中使用，不能在WHERE中使用。
#错误：
SELECT employee_id,salary,salary * 12 annual_sal
FROM employees
WHERE annual_sal > 81600;

#3.强调格式 ： WHERE 需要声明在FROM后，ORDER BY之前
SELECT employee_id,salary
FROM employees
WHERE department_id IN (50,60,70)
ORDER BY department_id DESC;

#4.二级排序

#练习：显示员工信息，按照department_id的降序排列，salary的升序排列
SELECT employee_id,salary,department_id
FROM employees
ORDER BY department_id DESC,salary ASC;
#按照department_id降序排列，如果id相同，则按照salary升序排列

#二.分页
#2.1 mysql使用limit实现数据的分页显示

#需求1：每页显示20条记录，此时显示第1页
SELECT employee_id,last_name
FROM employees
LIMIT 0,20 # 第一个数字是偏移量，第二个数字是显示的行的数

#需求2：每页显示20条记录，此时显示第2页
SELECT employee_id,last_name
FROM employees
LIMIT 20,20 # 第一个数字是偏移量，第二个数字是显示的行的数

#需求3：每页显示20条记录，此时显示第3页
SELECT employee_id,last_name
FROM employees
LIMIT 40,20 # 第一个数字是偏移量，第二个数字是显示的行的数

#需求：每页显示pageSize条记录，此时显示第pageNo页：
#公式：LIMIT (pageNo - 1) * pageSize , pageSize;

#2.2 WHERE ... ORDER BY ... LIMIT 声明顺序如下：

# LIMIT的格式： 严格来说： LIMIT 位置偏移量，条目数
# 结构 ： "LIMIT 0,条目数" 等价于 " LIMIT 条目数"
SELECT employee_id,last_name,salary
FROM employees
WHERE salary > 6000
ORDER BY salary DESC
#limit 0,10;
LIMIT 10;

#练习：表里面有107条数据，我们只想要显示第 32、33 条数据怎么办？

SELECT employee_id,last_name
FROM employees
LIMIT 31,2;

#2.3 MySQL8.0 新特性： LIMIT ... OFFSET ...

#OFFSET 后指的是偏移量，OFFSET 左边是显示的行的数目
SELECT employee_id,last_name
FROM employees
LIMIT 31 OFFSET 3;

#练习：表里面有107条数据，我们只想要显示第 32、33 条数据怎么办？

SELECT employee_id,last_name
FROM employees
LIMIT 2 OFFSET 31;

#练习：查询员工表中工资最高的员工信息
SELECT employee_id,last_name,salary
FROM employees
ORDER BY salary DESC
LIMIT 1;
#LIMIT 0,1;

#2.4 LIMIT 可以使用在MySQL，PGSQL，MariaDB,SQLite 等数据库中使用，表示分页，实际操作要添加关键字
               
-- 题目
#1. 查询员工的姓名和部门号和年薪，按年薪降序,按姓名升序显示
SELECT last_name,department_id,salary * 12
FROM employees
ORDER BY salary DESC,last_name ASC
#2. 选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序，显示第21到40位置的数据
SELECT last_name,salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC
LIMIT 20,20;
#3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序
SELECT last_name,email,department_id
FROM employees
WHERE email LIKE '%e%'
#WHERE email REGEXP '[e]'
ORDER BY LENGTH(email) DESC,department_id ASC;