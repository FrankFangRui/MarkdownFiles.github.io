#第13章_约束
 -- 查看表中的约束
 SELECT * FROM information_schema.table_constraints
 WHERE table_name = 'test1';
 
 -- NOT NULL (非空约束）
 

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
 
 # 
 SELECT *
 FROM test2;
 
 INSERT INTO test2(id,last_name,email,salary)
 VALUES(3,'TOM',NULL,4600);
 
 ALTER TABLE test2
 ADD CONSTRAINT uk_test2_sal UNIQUE(salary);
 
  INSERT INTO test2(id,last_name,email,salary)
 VALUES(2,'TOM',NULL,4600);
 
 DESC test2;
 
 ALTER TABLE test2
 MODIFY last_name VARCHAR(15) UNIQUE;
 
 # 复合的唯一约束
 CREATE TABLE USER(
 id INT,
 `name` VARCHAR(15),
 `password` VARCHAR(25),
 CONSTRAINT uk_user_name_pwd UNIQUE(`name`,`password`)
 );
 
 DESC USER;
 
 INSERT INTO USER
 VALUES(1,'Tom','abc');
 
 INSERT INTO USER
 VALUES(2,'Tom2','abc');
 
 # 案例
 #学生表
CREATE TABLE student(
    sid INT,	#学号
    sname VARCHAR(20),	#姓名
    tel CHAR(11) UNIQUE KEY,  #电话
    cardid CHAR(18) UNIQUE KEY #身份证号
);

#课程表
CREATE TABLE course(
    cid INT,  #课程编号
    cname VARCHAR(20)     #课程名称
);

#选课表
CREATE TABLE student_course(
    id INT,
    sid INT,
    cid INT,
    score INT,
    UNIQUE KEY(sid,cid)  #复合唯一
);
 
SELECT * FROM information_schema.table_constraints
WHERE table_name = 'student_course';

ALTER TABLE student_course
DROP INDEX sid;

# 主键约束


 
CREATE TABLE test5(
id INT,
last_name VARCHAR(15),
salary DECIMAL(10,2),
email VARCHAR(25),
CONSTRAINT pk_test5_id PRIMARY KEY(id)
);

CREATE TABLE test3(
id INT PRIMARY KEY,
last_name VARCHAR(15) PRIMARY KEY,
salary DECIMAL(10,2),
email VARCHAR(25)
);
 
CREATE TABLE test4(
id INT,
last_name VARCHAR(15),
salary DECIMAL(10,2),
email VARCHAR(25),
CONSTRAINT PRIMARY KEY(id)
);

SELECT * FROM information_schema.table_constraints
WHERE table_name = 'test6';

CREATE TABLE test3(
id INT PRIMARY KEY,
last_name VARCHAR(15),
salary DECIMAL(10,2),
email VARCHAR(25)
);

CREATE TABLE test6(
id INT ,
last_name VARCHAR(15),
salary DECIMAL(10,2),
email VARCHAR(25)
);

ALTER TABLE test6
ADD PRIMARY KEY(id);

ALTER TABLE test6
DROP PRIMARY KEY;

DESC test6;

