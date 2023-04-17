# 第7章_单行函数

#1.数值函数

# 基本的操作
SELECT ABS(-123),ABS(32),SIGN(-23),SIGN(43),PI(),CEIL(32.32),CEILING(-43.23),FLOOR(32.32),
FLOOR(-43.23),MOD(12,5),12 MOD 5,12 % 5
FROM DUAL;

# 取随机数
SELECT RAND(),RAND(),RAND(10),RAND(10),RAND(-1),RAND(-1)
FROM DUAL;

# 如果括号内有数字且数字一样，则输出的数据一样
# 因为RAND()的输出范围是0~1，所以输出0~10的随机数就在RAND()前 * 10 —> RAND() * 10

# 四舍五入
SELECT ROUND(123.556),ROUND(123.456,0),ROUND(123.456,1),ROUND(123.456,2),
ROUND(123.456,-1),ROUND(153.456,-2)
FROM DUAL;
# RAND(x,y)  在考虑四舍五入的时候，只考虑到 y + 1 位小数，并对其四舍五入
#            并不对 y + 1 位小数之后的数进行四舍五入进位
# ROUND(123.456,0) ——> 123      ROUND(123.456,1) ——> 123.5
# ROUND(123.456,-1) ——> 120     ROUND(153.456,-2)——> 200
# 当y为负数的时候，为保留到整数位
# y = -1 保留到个位，结果中 个位数四舍五入
# y = -2 保留到十位，结果中 十位数四舍五入

#截断操作
SELECT TRUNCATE(123.456,0),TRUNCATE(123.496,1),TRUNCATE(129.45,-1)
FROM DUAL;

#单行函数可以嵌套
SELECT TRUNCATE(ROUND(123.456,2),0)
FROM DUAL;
#TRUNCATE(ROUND(123.456,2),0) = TRUNCATE(123.46,0)

#角度与弧度的互换

SELECT RADIANS(30),RADIANS(45),RADIANS(60),RADIANS(90),DEGREES(2*PI()),
DEGREES(RADIANS(60))
FROM DUAL;

#三角函数
SELECT SIN(RADIANS(30)),DEGREES(ASIN(1)),TAN(RADIANS(45)),DEGREES(ATAN(1))
FROM DUAL;

#指数和对数
SELECT POW(2,5),POWER(2,4),EXP(2)
FROM DUAL;

SELECT LN(EXP(2)),LOG(EXP(2)),LOG10(10),LOG2(4)
FROM DUAL;

#进制间的转换
SELECT BIN(10),HEX(10),OCT(10),CONV(10,2,8)
FROM DUAL;

#2. 字符串函数
# UTF8中一个汉字占3个字节,一个英文字符占1个字节

SELECT ASCII('Abfasdf'),CHAR_LENGTH('hello'),CHAR_LENGTH('我们'),
LENGTH('hello'),LENGTH('我们')
FROM DUAL;

# xxx worked for yyy
SELECT CONCAT(emp.last_name,' worked for ',mgr.last_name) "details"
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id;

SELECT CONCAT_WS ('—','hello','world','hello','fuzhou')
FROM DUAL;
#字符串的索引是从1开始的！
SELECT INSERT('helloworld',2,3,'aaaaa'),REPLACE('hellolll','ll','mmm')
FROM DUAL;

SELECT UPPER('hello'),LOWER('Hello')
FROM DUAL;

SELECT last_name,salary
FROM employees
WHERE LOWER(last_name) = 'king';#MySQL中对大小写不敏感 'king'也能查出'King' 使用last_name = 'king'也行

SELECT LEFT('hello',2),RIGHT('hello',3),RIGHT('hello',13)
FROM DUAL;

# LPAD:实现右对齐效果 例如：薪资  方便比较
# RPAD:实现左对齐效果 例如：家庭住址  方便阅读
SELECT employee_id,last_name,LPAD(salary,10,'*')
FROM employees;

SELECT CONCAT('——',LTRIM('   h el  lo   '),'***'),
TRIM('o' FROM 'oohelloo')
FROM DUAL;

SELECT REPEAT('hello',4),LENGTH(SPACE(5)),STRCMP('abc','abd')
FROM DUAL;

SELECT SUBSTR('hello',2,2),LOCATE('111','hello')
FROM DUAL;

SELECT ELT(2,'a','b','c','d'),FIELD('mm','gg','jj','dd','mm'),
FIND_IN_SET('mm','gg,mm,jj,dd,mm,gg')
FROM DUAL;

#3. 日期和时间函数

#3.1 获取日期、时间
SELECT CURDATE(),CURRENT_DATE(),CURTIME(),NOW(),SYSDATE(),
UTC_DATE(),UTC_TIME(),UTC_TIME()+0
FROM DUAL;

#3.2 日期与时间戳的转换
# 距离1970年1月1日早八点的毫秒数
SELECT UNIX_TIMESTAMP(),UNIX_TIMESTAMP('2021-11-24 08:00:00'),
FROM_UNIXTIME(1658743969),FROM_UNIXTIME(UNIX_TIMESTAMP('2021-11-24 08:00:00'))
FROM DUAL;


#3.3 获取月份、星期、星期数、天数等函数
SELECT YEAR(CURDATE()),MONTH(CURDATE()),DAY(CURDATE()),
HOUR(CURTIME()),MINUTE(NOW()),SECOND(SYSDATE())
FROM DUAL;


SELECT MONTHNAME('2021-10-26'),DAYNAME('2021-10-26'),WEEKDAY('2021-10-26'),
QUARTER(CURDATE()),WEEK(CURDATE()),DAYOFYEAR(NOW()),
DAYOFMONTH(NOW()),DAYOFWEEK(NOW())
FROM DUAL;

#3.4 日期的操作函数

SELECT EXTRACT(SECOND FROM NOW()),EXTRACT(DAY FROM NOW()),
EXTRACT(HOUR_MINUTE FROM NOW()),EXTRACT(QUARTER FROM '2021-05-12')
FROM DUAL;

#3.5 时间和秒钟转换的函数
SELECT TIME_TO_SEC(CURTIME()),
SEC_TO_TIME(83355)
FROM DUAL;

#3.6 计算日期和时间的函数

SELECT NOW(),DATE_ADD(NOW(),INTERVAL 1 YEAR),
DATE_ADD(NOW(),INTERVAL -1 YEAR),
DATE_SUB(NOW(),INTERVAL 1 YEAR)
FROM DUAL;


SELECT DATE_ADD(NOW(), INTERVAL 1 DAY) AS col1,DATE_ADD('2021-10-21 23:32:12',INTERVAL 1 SECOND) AS col2,
ADDDATE('2021-10-21 23:32:12',INTERVAL 1 SECOND) AS col3,
DATE_ADD('2021-10-21 23:32:12',INTERVAL '1_1' MINUTE_SECOND) AS col4,
DATE_ADD(NOW(), INTERVAL -1 YEAR) AS col5, #可以是负数
DATE_ADD(NOW(), INTERVAL '1_1' YEAR_MONTH) AS col6 #需要单引号
FROM DUAL;


SELECT ADDTIME(NOW(),20),SUBTIME(NOW(),30),SUBTIME(NOW(),'1:1:3'),DATEDIFF(NOW(),'2021-10-01'),
TIMEDIFF(NOW(),'2021-10-25 22:10:10'),FROM_DAYS(366),TO_DAYS('0000-12-25'),
LAST_DAY(NOW()),MAKEDATE(YEAR(NOW()),32),MAKETIME(10,21,23),PERIOD_ADD(20200101010101,10)
FROM DUAL;

#3.7 日期的格式化与解析
# 格式化：日期 ---> 字符串
# 解析：  字符串 ----> 日期

#此时我们谈的是日期的显式格式化和解析

#之前，我们接触过隐式的格式化或解析
SELECT *
FROM employees
WHERE hire_date = '1993-01-13';

#格式化：
SELECT DATE_FORMAT(CURDATE(),'%Y-%M-%D'),
DATE_FORMAT(NOW(),'%Y-%m-%d'),TIME_FORMAT(CURTIME(),'%h:%i:%S'),
DATE_FORMAT(NOW(),'%Y-%M-%D %h:%i:%S %W %w %T %r')
FROM DUAL;

#解析：格式化的逆过程
SELECT STR_TO_DATE('2021-October-25th 11:37:30 Monday 1','%Y-%M-%D %h:%i:%S %W %w')
FROM DUAL;

SELECT GET_FORMAT(DATE,'USA')
FROM DUAL;

SELECT DATE_FORMAT(CURDATE(),GET_FORMAT(DATE,'USA'))
FROM DUAL;

#4.流程控制函数
#4.1 IF(VALUE,VALUE1,VALUE2)

SELECT last_name,salary,IF(salary >= 6000,'高工资','低工资') "details"
FROM employees;

SELECT last_name,commission_pct,IF(commission_pct IS NOT NULL,commission_pct,0) "details",
salary * 12 * (1 + IF(commission_pct IS NOT NULL,commission_pct,0)) "annual_sal"
FROM employees;

#4.2 IFNULL(VALUE1,VALUE2):看做是IF(VALUE,VALUE1,VALUE2)的特殊情况
SELECT last_name,commission_pct,IFNULL(commission_pct,0) "details"
FROM employees;

#4.3 CASE WHEN ... THEN ...WHEN ... THEN ... ELSE ... END
# 类似于java的if ... else if ... else if ... else
SELECT last_name,salary,CASE WHEN salary >= 15000 THEN '白骨精' 
			     WHEN salary >= 10000 THEN '潜力股'
			     WHEN salary >= 8000 THEN '小屌丝'
			     ELSE '草根' END "details",department_id
FROM employees;

SELECT last_name,salary,CASE WHEN salary >= 15000 THEN '白骨精' 
			     WHEN salary >= 10000 THEN '潜力股'
			     WHEN salary >= 8000 THEN '小屌丝'
			     END "details"
FROM employees;

#4.4 CASE ... WHEN ... THEN ... WHEN ... THEN ... ELSE ... END
# 类似于java的swich ... case...
/*

练习1
查询部门号为 10,20, 30 的员工信息, 
若部门号为 10, 则打印其工资的 1.1 倍, 
20 号部门, 则打印其工资的 1.2 倍, 
30 号部门,打印其工资的 1.3 倍数,
其他部门,打印其工资的 1.4 倍数

*/
SELECT employee_id,last_name,department_id,salary,CASE department_id WHEN 10 THEN salary * 1.1
								     WHEN 20 THEN salary * 1.2
								     WHEN 30 THEN salary * 1.3
								     ELSE salary * 1.4 END "details"
FROM employees;

/*

练习2
查询部门号为 10,20, 30 的员工信息, 
若部门号为 10, 则打印其工资的 1.1 倍, 
20 号部门, 则打印其工资的 1.2 倍, 
30 号部门打印其工资的 1.3 倍数

*/
SELECT employee_id,last_name,department_id,salary,CASE department_id WHEN 10 THEN salary * 1.1
								     WHEN 20 THEN salary * 1.2
								     WHEN 30 THEN salary * 1.3
								     END "details"
FROM employees
WHERE department_id IN (10,20,30);

#5.加密与解密函数

# password()函数在MySQL8.0已经被弃用

SELECT PASSWORD('mysql')
FROM DUAL;

#ENCODE()\DECODE() 在MySQL8.0中弃用
# 'mysql' 是加密解密的钥匙
SELECT ENCODE('atguigu','mysql'),DECODE(ENCODE('atguigu','mysql'),'mysql')
FROM DUAL;

#不可逆加密：明文能变成暗文，暗文不能变成明文
SELECT MD5('mysql'),SHA('mysql'),MD5(MD5('mysql'))
FROM DUAL;

# 6.MySQL信息函数

SELECT VERSION(),CONNECTION_ID(),DATABASE(),SCHEMA(),
USER(),CURRENT_USER(),CHARSET('尚硅谷'),COLLATION('尚硅谷')
FROM DUAL;

# 7.其他函数
#FORMAT(x,y)函数，如果y小于零，则保留整数位
SELECT FORMAT(123.125,2),FORMAT(123.125,0),FORMAT(123.125,-2)
FROM DUAL;

SELECT CONV(16,10,2),CONV(8888,10,16),CONV(NULL,10,2)
FROM DUAL;


# 以“192.168.1.100”为例，计算方式为192乘以256的3次方，加上168乘以256的2次方，加上1乘以256，再加上100。
SELECT INET_ATON('192.168.1.100'),INET_NTOA(INET_ATON('192.168.1.100'))
FROM DUAL;

#BENCHMARK()用于测试表达式的执行效率
SELECT BENCHMARK(100000 ,MD5('mysql'))
FROM DUAL;

SELECT CHARSET('atguigu'),CHARSET(CONVERT('atguigu' USING 'utf8mb4'))
FROM DUAL;


【题目】
# 1.显示系统时间(注：日期+时间)

SELECT NOW()
FROM DUAL;

# 2.查询员工号，姓名，工资，以及工资提高百分之20%后的结果（new salary）

SELECT employee_id,last_name,salary,salary * 1.2 'new salary'
FROM employees;

# 3.将员工的姓名按首字母排序，并写出姓名的长度（length）

SELECT last_name,LENGTH(last_name)
FROM employees
ORDER BY last_name DESC;

# 4.查询员工id,last_name,salary，并作为一个列输出，别名为OUT_PUT

SELECT CONCAT(employee_id, ' ',last_name,' ' ,salary) OUT_PUT
FROM employees;

# 5.查询公司各员工工作的年数、工作的天数，并按工作年数的降序排序

SELECT DATEDIFF(SYSDATE(),hire_date) / 365 worked_years,DATEDIFF(SYSDATE(),hire_date) worked_days
FROM employees
ORDER BY worked_years DESC

# 6.查询员工姓名，hire_date , department_id，满足以下条件：雇用时间在1997年之后，department_id
为80 或 90 或110, commission_pct不为空

SELECT last_name, hire_date,department_id
FROM employees
WHERE hire_date >= '1997-01-01'
AND department IN (80,90,110)
AND commission_pct IS NOT NULL

# where hire_date >= str_to_date('1997-01-01','%Y-%m-%d')
# where  date_format(hire_date,'%Y') >= '1997';

# 7.查询公司中入职超过10000天的员工姓名、入职时间

SELECT last_name,hire_date
FROM employees
#WHERE TO_DAYS(NOW()) - to_days(hire_date) > 10000;
WHERE DATEDIFF(NOW(),hire_date) > 10000;

# 8.做一个查询，产生下面的结果

<last_name> earns <salary> monthly but wants <salary*3>

SELECT CONCAT(last_name, ' earns ', salary , ' monthly but wants ',
 salary * 3  )"Dream Salary"
FROM employees;


-- 正确答案：

SELECT CONCAT(last_name, ' earns ', TRUNCATE(salary, 0) , ' monthly but wants ',
TRUNCATE(salary * 3, 0)) "Dream Salary"
FROM employees;


# 9.使用CASE-WHEN，按照下面的条件：


-- job grade
-- AD_PRES A
-- ST_MAN B
-- IT_PROG C
-- SA_REP D
-- ST_CLERK E
-- 产生下面的结果
-- Last_name Job_id Grade
-- king AD_PRES A


SELECT last_name Last_name, job_id Job_id, CASE job_id WHEN 'AD_PRES' THEN 'A'
WHEN 'ST_MAN' THEN 'B'
WHEN 'IT_PROG' THEN 'C'
WHEN 'SA_REP' THEN 'D'
WHEN 'ST_CLERK' THEN 'E'
ELSE 'F'
END "grade"
FROM employees













































































