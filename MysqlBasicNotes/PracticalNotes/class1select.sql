#第03章 基本的SELECT语句


-- 1.SQL的分类
/*
DDL:数据定义语言。CREATE \ ALTER \ DROP \ RENAME \ TRUNCATE

DML:数据操作语言。增删改查 ：INSERT \ DELETE \ UPDATE \ SELECT (重中之重）

DCL:数据控制语言。COMMIT \ ROLLBACK \ SAVEPOINT \ GRANT \ REVOKE
*/
USE dbtest;

SELECT * FROM student;

USE atguigudb;
SELECT * FROM employees;

/*
 2. 当选中两条insert语句，如果两个句子之间没有分割符号就会报错

insert into student
values(3,'TOM')

insert into student
values(4,'jarry');

如果只选中一个语句，那末尾有没有; 不影响
最后一个语句末尾没有也不影响
*/
INSERT INTO student
VALUES(3,'TOM');

INSERT INTO student
VALUES(4,'jarry');

-- show create table student;
SHOW CREATE TABLE student;
/*
\G结尾的语句是横向排列的表格
; 结尾的语句是纵向排列的表格
互为转置关系
*/

-- 3. 关键字不能被缩写也不能分行
/*
蓝色的字都是关键字
INSERT INTO student
VALUES(4,'jarry');
报错：
insert INTO studnet
VALUES(4,'jarry');
报错：
INSERT INTO student
VALUES(4,'jarry');
*/
-- 4. MySQL 在Windows环境下是大小写不敏感的（不区分大小写）
/*
Windows环境下一个文件夹中不能出现 ABC.txt 和 abc.txt 文件，无法区分大小写

select 自动变成大写

数据库名、表名、表别名、字段名、字段别名等都小写
SQL 关键字、函数名、绑定变量等都大写
*/

-- 5.导入现有的数据表，表的数据
#方式1： source 文件的全路径名
-- 举例：  source d:\mysqldb.sql

#方式2： 基于具体的图形化界面的工具可以导入数据
-- SQLyog中 选择工具--执行SQL脚本--选中XXX.sql即可

#最基本的SELECT语句： SELECT 字段1,字段2,... FROM 表名
SELECT 1 + 1, 3 * 2;

SELECT 1 + 1, 3 * 2;
FROM DUAL; # dual: 伪表

# * ： 表中的所有的字段（或列）
SELECT * FROM student;

SELECT employee_id,last_name,salary
FROM employee;
-- 最终会出现这三个列

# 6. 列的别名
# 三种方式： 第一种省略， 第二种加上AS ，第三种用 "" (特别是名称中有空格的情况）
# as: 全称：alias（别名）可以省略
# 列的别名可以使用一堆""引起来,不要使用''。
-- 返回结果集 
SELECT employee_id emp_id,last_name AS lname,department_id "dept_id"
FROM employees;

/*
报错:
SELECT salary * 12 annual sal
原因：别名中有空格
正确：
SELECT salary * 12 "annual sal"
*/

# 7.去除重复行
#查询员工表中一共有哪些部门id呢？
#错误的：没有去重的情况
SELECT department_id
FROM employees;
#正确的：去重的情况
SELECT DISTINCT department_id
FROM employees;

#错误的： 
SELECT salary, DISTINCT department_id
FROM employees;

#整体不重复，salary重复id要不重复，id重复salary不重复
#没有实际意义
SELECT DISTINCT salary,  department_id
FROM employees;

# 8.空值参与运算
# 1.空值： null
# 2.null不等同于0,'','null'
# null表示未分配，还未定义，0...可能有含义,比如值，分组等
SELECT * FROM employees;

# 3. 空值参与运算：结果一定也为零,因为空值导致结果无法确定（奖金率cpt不确定，无法得知薪资）
SELECT employee_id,salary "月工资",salary * ( 1 + commission_pct) * 12 "年工资", commission_pct
FROM employees;

# IFNULL(XXX,0) --->  XXX是NULL用0来替换
SELECT employee_id,salary "月工资",salary * ( 1 + IFNULL(commission_pct,0)) * 12 "年工资", commission_pct
FROM employees;


# 9.着重号```  当一个名称和关键字冲突 用``   
SELECT * FROM `ORDER`;

#10. 查询常数
SELECT '尚硅谷',123,employee_id,last_name
FROM employees;

#11.显示表结构

DESCRIBE employees;#显示了表中字段的详细信息

DESC departments;

#练习：查询90号部门的员工信息
SELECT * 
FROM employees
#过滤条件,声明在FROM结构的后面
WHERE department_id = 90;

#练习：查询last_name为'King'的员工信息
SELECT *
FROM employees
WHERE last_name = 'King';

# '' 中也忽略大小写，实际上是MySQL的容错率高

-- 【题目】
# 1.查询员工12个月的工资总和，并起别名为ANNUAL SALARY
SELECT employee_id,last_name,salary * 12 'ANNUAL SALARY'
FROM employees;
# 2.查询employees表中去除重复的job_id以后的数据
SELECT DISTINCT job_id
FROM employees;
# 3.查询工资大于12000的员工姓名和工资
SELECT last_name,salary
FROM employees
WHERE salary > 12000;
# 4.查询员工号为176的员工的姓名和部门号
SELECT last_name,department_id
FROM employees
WHERE employee_id = 176;
# 5.显示表 departments 的结构，并查询其中的全部数据
DESC departments;
SELECT *
FROM departments;