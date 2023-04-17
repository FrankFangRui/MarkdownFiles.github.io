#第04章 运算符
#1.算数运算符： + - * / div % mod
SELECT 100,100 + 0, 100 - 0 , 100 + 50 , 100 + 50 * 30 , 100 + 35.5 , 100 - 35.5
FROM DUAL;

#在SQL中，+没有连接的作用，就表示加法运算。此时，会将字符串转换为数值（隐式转换）
SELECT 100 + '1' # 在java语言中，结果是: 1001
FROM DUAL;

SELECT 100 + 'a' # 将'a'看成0处理
FROM DUAL;

SELECT 100 + NULL # NULL值参与运算，结果为NULL
FROM DUAL;

SELECT 100, 100 * 1 , 100 * 1.0 , 100 / 1.0 , 100 / 2, 100 + 2 * 5 / 2 , 100 / 3 , 100 DIV 0 , 100 / 0 
FROM DUAL;
# 用除法，最终结果无论除不除的尽，结果都是浮点型
# 先乘除后加减 

# 取模运算： % mod
SELECT 12 % 3 , 12 % 5 , 12 MOD -5 ,12 % 5 , -12 % -5
FROM DUAL;
# 结果的符号与被模数的符号一样（%左边的数）,与模数的符号无关

#2.比较运算符
#2.1  = <=> <> != < <= > >=
# 如果字符串不能变成数字，那就等于零
# 字符串存在隐式转换，如果转换数值不成功，则看做0
SELECT 1 = 2 ,1 != 2, 1 = '1', 1 ='a' , 0 = 'a'
FROM DUAL;

# 两边都是字符串的话，字符串之间不存在隐式转换，按照ANSI的比较规则进行比较。
SELECT 'a' = 'a' , 'ab' = 'ab', 'a' = 'b'
FROM DUAL;

# 只要有NULL参与判断，结果就为NULL
SELECT 1 = NULL,NULL = NULL
FROM DUAL;

SELECT last_name,salary
FROM employees
#where salary = 6000;
WHERE commission_pct = NULL; #结果不会显示 pct 为NULL的行，因为NULL = NULL返回的是NULL，而不是1，返回1则会输出此行

# <=> ：安全等于。记忆技巧: 为NULL而生

SELECT 1 <=> 2, 1 <=> '1' , 1 <=> 'a' , 0 <=> 'a'
FROM DUAL;

SELECT 1 <=> NULL, NULL <=> NULL
FROM DUAL;

#练习：查询表中commission_pct为NULL的数据有哪些
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct <=> NULL;

SELECT 3 <> 2 , '4' <> NULL, '' != NULL , NULL != NULL
FROM DUAL;

#2.2
#① IS NULL \ IS NOT NULL \ ISNULL
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct IS NULL;
#或
SELECT last_name,salary,commission_pct
FROM employees
WHERE ISNULL(commission_pct);

#练习：查询表中commission_pct不为NULL的数据有哪些
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
#或
SELECT last_name,salary,commission_pct
FROM employees
WHERE NOT commission_pct  <=> NULL;

#② LEAST() \ GREATEST()

SELECT LEAST('g','b','t','m'),GREATEST('g','b','t','m')
FROM DUAL;

SELECT LEAST(first_name,last_name),LEAST(LENGTH(first_name),LENGTH(last_name))
FROM employees;

#③ BETWEEN ... AND  (BETWEEN 条件1 AND 条件2 ) 查询条件1和条件2范围内的数据，包含边界
#查询工资在6000到8000的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE salary BETWEEN 6000 AND 8000;

#交换6000和8000之后，查询不到数据
SELECT employee_id,last_name,salary
FROM employees
WHERE salary BETWEEN 8000 AND 6000;

#查询工资不在6000到8000的员工信息
SELECT employee_id,last_name,salary
FROM employees
#WHERE salary > 8000 or salary < 6000;
WHERE NOT salary  BETWEEN 6000 AND 8000;
#NOT放在between左边也可以

#④ in(set) \ not in (set)

#练习：查询部门为10，20，30部门的员工信息
SELECT last_name,salary,department_id
FROM employees
#where department_id = 10 or 20 or 30;
#20，30 非零看作1，结果为1，所有行都计算
# 逻辑连接符连接的语句要是完整的语句
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;
WHERE department_id IN (10,20,30);

#练习：查询工资不是6000,7000,8000的员工信息
SELECT last_name,salary,department_id
FROM employees
WHERE salary NOT IN (6000,7000,8000);

#⑤ LIKE :模糊查找
# % : 代表不确定个数的字符 （ 0个，1个，或多个）

#练习：查询last_name中包含字符'a'的员工信息
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%';

#练习：查询last_name中以字符'a'开头的员工信息
SELECT last_name
FROM employees
WHERE last_name LIKE 'a%';

#练习：查询last_name中包含字符'a'且包含字符'e'的员工信息
SELECT last_name
FROM employees
#where last_name like '%a%' and last_name like '%e%';
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%';

#查询第2个字符是'a'的员工信息
# _ : 代表一个不确定的字符
SELECT last_name 
FROM employees
WHERE last_name LIKE '__a%';

#练习：查询第2个字符是_且第三个字符是'a'的员工信息
#需要使用转义字符：\ (将符号变为本身的意思，不具有特殊含义)
SELECT last_name
FROM employees
WHERE last_name LIKE '_\_a%';

#或者 (了解)
# ESCAPE 'XXX': 将特定字符XXX  变为转义符
SELECT last_name
FROM employees
WHERE last_name LIKE '_$_a%' ESCAPE '$';

# ⑥ REGEXP \ RLIKE : 正则表达式

SELECT 'shkstart' REGEXP '^shk','shkstart' REGEXP 't$','shkstart' REGEXP 'hk'
FROM DUAL;

SELECT 'atguigu' REGEXP 'u.g','atguigu' REGEXP '[ab]'
FROM DUAL;

# 3. 逻辑运算符 ： OR ||  AND &&  NOT ！ XOR

# AND 的优先级大于　OR，先对AND两边的操作数进行操作

# OR  AND 
SELECT last_name,salary,department_id
FROM employees
#where department_id = 10 or department_id = 20;
#where department_id = 10 and department_id = 20;
WHERE department_id = 50 AND salary > 6000;

# NOT
SELECT last_name,salary,department_id
FROM employees
#where salary not between 6000 and 8000;
#where commission_pct is not null;
#where not commission_pct <=> null;
WHERE ISNULL(commission_pct);

# XOR ：追求的"异"
SELECT last_name,salary,department_id
FROM employees
WHERE department_id = 50 XOR salary > 6000;

# 4.位运算： & | ^ ~ >> <<
 
SELECT 12 & 5 , 12 | 5,  12 ^ 5
FROM DUAL;

# 12 : 0 0 0 0 1 1 0 0
#  5 : 0 0 0 0 0 1 0 1
#12&5: 0 0 0 0 1 0 0 0

SELECT 12 & 5, 12 | 5 , 12 ^ 5
FROM DUAL;

# ~： 取反
# 1 : 0 0 0 0 0 0 0 1
#~1 : 1 1 1 1 1 1 1 0

SELECT 10 & ~1 FROM DUAL;

SELECT 4 << 1 , 8 >> 1
FROM DUAL;
# 4 : 0 0 0 0 0 1 0 0
# 8 : 0 0 0 0 1 0 0 0
# 左移一位 相当于乘二， 右移一位 相当于除二


--  【题目】
# 1.选择工资不在5000到12000的员工的姓名和工资
SELECT last_name , salary
FROM employees
WHERE salary < 5000 OR salary > 12000;
# 2.选择在20或50号部门工作的员工姓名和部门号
SELECT last_name,department_id
FROM employees
WHERE department_id = 20 OR department_id = 50;
# 3.选择公司中没有管理者的员工姓名及job_id
SELECT last_name,job_id
FROM employees
WHERE ISNULL(manager_id)
# 4.选择公司中有奖金的员工姓名，工资和奖金级别
SELECT last_name,salary,commission_pct
FROM employees
WHERE NOT ISNULL(commission_pct);
# 5.选择员工姓名的第三个字母是a的员工姓名
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';
# 6.选择姓名中有字母a和k的员工姓名
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%k%' OR last_name LIKE '%k%a%';
# 7.显示出表 employees 表中 first_name 以 'e'结尾的员工信息
SELECT employee_id,first_name,last_name
FROM employees
WHERE first_name LIKE '%e';
# 8.显示出表 employees 部门编号在 80-100 之间的姓名、工种
SELECT last_name,job_id
FROM employees
WHERE department_id BETWEEN 80 AND 100;
# 9.显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、工资、管理者id
SELECT last_name,salary,manager_id
FROM employees
WHERE manager_id IN(100,101,110);