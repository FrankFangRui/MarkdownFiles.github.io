#第13章_约束
 -- 查看表中的约束
 SELECT * FROM information_schema.table_constraints
 WHERE table_name = 'test1';
 
 -- NOT NULL (非空约束）
 
 CREATE DATABASE dbtest;
 USE dbtest;
 
 CREATE TABLE test1(
 id INT NOT NULL,
 last_name VARCHAR(15) NOT NULL,
 email VARCHAR(25),
 salary DECIMAL(10,2)
 );
 
 DESC test1;
 
 INSERT INTO test1(id,last_name,email,salary)
 VALUE(1,'Tom','tom@126.com',3400);
# 错误
 INSERT INTO test1(id,last_name,email,salary)
 VALUE(1,NULL,'tom@126.com',3400);
 
 INSERT INTO test1(id,email)
 VALUE(2,'frank@126.com');
 
 UPDATE test1
 SET email = NULL
 WHERE id = 1;
 
 SELECT *
 FROM test1;
 
 ALTER TABLE test1
 MODIFY email VARCHAR(25) NOT NULL;
 
 CREATE TABLE test1(
 id INT NOT NULL,
 last_name VARCHAR(15) NOT NULL,
 email VARCHAR(25),
 salary DECIMAL(10,2)
 ); 
 
 # 在CREATE TABLE 的时候创建约束
 CREATE TABLE test2(
 id INT UNIQUE, # 列级约束
 last_name VARCHAR(15),
 email VARCHAR(25),
 salary DECIMAL(10,2),
 #表级约束
 CONSTRAINT uk_test2_email UNIQUE(email)
 );
 SELECT * FROM information_schema.table_constraints
 WHERE table_name = 'test2';