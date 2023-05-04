USE atguigudb;
SELECT * FROM information_schema.table_constraints
WHERE table_name = 'employees';

CREATE TABLE student(
    sid INT,
    sname VARCHAR(20) NOT NULL,
    tel CHAR(11) , 
    cardid CHAR(18) NOT NULL
    );
    
SHOW TABLES;

DESC student;

SELECT * 
FROM information_schema.table_constraints
WHERE table_name = 'student';

INSERT INTO student VALUES(1,'FangRui',NULL,'2');

SELECT * 
FROM student;

ALTER TABLE student MODIFY tel CHAR(11)  NOT NULL;