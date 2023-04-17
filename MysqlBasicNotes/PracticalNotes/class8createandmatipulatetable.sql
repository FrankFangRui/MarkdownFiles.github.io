#第10章_创建和管理表

SELECT * 
FROM `order`

#1.创建和管理数据库

#1.1 如何创建数据库
#方式1：
CREATE DATABASE mytest1;  # 创建的此数据库使用的是默认的字符集

#查看创建数据库的结构
SHOW CREATE DAx'x'X'xTABASE mytest1;

#方式2：显示指明了要创建的数据库的字符集
CREATE DATABASE mytest2 CHARACTER SET 'gdk';

#
SHOW CREATE DATABASE mytest1;

#方式3(推荐）：如果要创建的数据库已经存在，则创建不成功，但不会报错。

CREATE DATABASE IF NOT EXISTS mytest2 CHARACTER SET 'utf8';

#如果要创建的数据库不存在，则创建成功
CREATE DATABASE IF NOT EXISTS mytest3 CHARACTER SET 'utf8';

SHOW DATABASES; 

#1.2 管理数据库
#查看当前连接中的数据库都有哪些
SHOW DATABASES;

#切换数据库
USE mytest2;

#查看当前数据库中保存的数据表
SHOW TABLES;

#查看当前使用的数据库
SELECT DATABASES() FROM DUAL;

#查看指定数据库下保存的数据表
SHOW TABLES FROM mysql;

#1.3 修改数据库
#更改数据库的字符集
SHOW CREATE DATABASE mytest2;

ALTER DATABASE mytest2 CHARACTER SET 'utf8';

#数据库不能改名，一些可视化工具可以改名，它是建新库，把所有表复制到新库，再删旧库完成的。

#1.4 删除数据库
#方式1：
DROP DATABASE mytest1;
SHOW DATABASES;

#方式2：推荐：如果要删除的数据库存在，则删除成功，如果不存在，则默默结束，不会报错
DROP DATABASE IF EXISTS mytest1;

DROP DATABASE IF EXISTS mytest2;

#2. 如何创建数据表
USE atguigudb;

SHOW CREATE DATABASE atguigudb;

SHOW TABLES;

#方式1：白手起家 的 方式
CREATE TABLE IF NOT EXISTS myemp1(   #需要用户具备创建表的权限
id INT,
emp_name VARCHAR(15), #使用VARCHAR来定义字符串，必须在使用VARCHAR时指明其长度
hire_date DATE
);
#查看表结构
DESC myemp1;
#查看创建表的语句结构
SHOW CREATE TABLE myemp1;#如果创建表时没有指明使用的字符集，则默认使用表所在的数据库的字符集
#查看表数据
SELECT * FROM myemp1;

#方式2：基于现有的表,同时导入数据   复制其他表的数据
 # 创建一个表的名字叫做 myemp2 ,同时表的结构在 AS 的后面
CREATE TABLE myemp2
AS 
SELECT employee_id,last_name,salary
FROM employees;

DESC myemp2;
DESC employees;

SELECT *
FROM myemp2;

#说明1：查询语句中字段的别名，可以作为新创建的表的字段的名称。
#说明2：此时的查询语句可以结构比较丰富，使用前面章节讲过的各种select
CREATE TABLE myemp3
AS
SELECT employee_id emp_id,last_name lname,d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

SELECT *
FROM myemp3;

DESC myemp3;

#练习1：创建一个表employees_copy,实现对employees表的复制，包括表数据
CREATE TABLE employees_copy
AS
SELECT * 
FROM employees;

SELECT * FROM employees_copy;
#练习2：创建一个表employees_blank,实现对employees表的复制，不包括表数据
CREATE TABLE employees_blank
AS
SELECT *
FROM employees
# where department_id > 10000; # 用所有数据都不符合的条件，来让所有数据都不显示
WHERE 1 = 2; 、

SELECT * FROM employees_blank

#3.修改表 --> ALTER TABLE
DESC myemp1;

# 3.1 添加一个字段
ALTER TABLE myemp1
ADD salary DOUBLE(10,2); #默认添加到表中的最后一个字段的位置

ALTER TABLE myemp1
ADD phone_number VARCHAR(20) FIRST; #添加到第一个

ALTER TABLE myemp1
ADD email VARCHAR(45) AFTER emp_name;

# 3.2 修改一个字段：数据类型、长度、默认值（略）
ALTER TABLE myemp1
MODIFY emp_name VARCHAR(25);

ALTER TABLE myemp1
MODIFY emp_name VARCHAR(35) DEFAULT 'aaa'; # DEFAULT 如果是NULL，则默认aaa

# 3.3 重命名一个字段
ALTER TABLE myemp1
CHANGE salary monthly_salary DOUBLE(10,2);

ALTER TABLE myemp1
CHANGE email my_email VARCHAR(50);

# 3.4 删除一个字段
ALTER TABLE myemp1
DROP COLUMN my_email;

#4.重命名表
#方式1：
RENAME TABLE myemp1
TO myemp11;

DESC myemp11;

#方式2：
ALTER TABLE myemp2
RENAME TO myemp12;

DESC myemp12;

#5.删除表
DROP TABLE IF EXISTS myemp2;

DROP TABLE IF EXISTS myemp12;
#6.清空表

#清空表，表示清空表中的所有数据，但是表结构保留

SELECT * FROM employees_copy

TRUNCATE TABLE employees_copy #清空表

SELECT * FROM employees_copy;

DESC employees_copy;
 
#7. DCL 中 COMMIT 和 ROLLBACK
# COMMIT ： 提交数据，一旦执行COMMIT，则数据就被永久的保存在了数据库中，意味着数据不能回滚（撤销）
# ROLLBACK ：回滚数据，一旦执行ROLLBACK，则可以实现数据的回滚，回滚到最近的一次COMMIT之后

#8.对比 TRUNCATE TABLE 和 DELETE FROM
# 相同点： 都可以实现对表中所有数据的删除，同时保留表结构
# 不同点：
#    TRUNCATE TABLE ：一旦执行此操作，表数据全部清除。同时，数据是不可以回滚的
#    DELETE FROM ：一旦执行此操作，表数据可以全部清除（不带WHRER就可以实现全部清除）。同时，数据是可以实现回滚的

/*
9. DDL 和 DML 的说明
  ① DDL的操作一旦执行，就不可回滚。指令 SET autocommit = FALSE 对DDL操作失效。DDL会自动提交，不受 auto commit影响
  
  ② DML的操作默认情况，一旦执行，也是不可回滚的。但是，如果在执行DML之前
    执行了 SET autocommit = FALSE （自动提交 默认是true）, 则执行的DML操作就可以实现回滚。
 */
# 演示：DELETE FROM
#1)
COMMIT;
#2)
SELECT *
FROM myemp3;
#3)
SET autocommit = FALSE;
#4)
DELETE FROM myemp3;
#5)
SELECT * 
FROM myemp3;
#6)
ROLLBACK;
# 演示：TRUNCATE TABLE
#1)
COMMIT;
#2)
SELECT *
FROM myemp3;
#3)
SET autocommit = FALSE;
#4)
TRUNCATE TABLE myemp3;
#5)
SELECT * 
FROM myemp3;
#6)
ROLLBACK;