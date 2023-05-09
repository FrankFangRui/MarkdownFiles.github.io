# MyBatis 查询操作

## 1. 参数占位符 #{} ${}

### 二者的区别

```
大部分情况都是使用#
当传递的参数是关键字的时候，使用$,此时也要注意传递的参数要能枚举，要先验证参数的合法性
$ 使用注意事项：一定是可以穷举的值，在使用之前一定要对传递的值进行合法性验证（安全性验证）
1. $ 存在 SQL 注入问题，而 # 不存在
2. $ 直接替换，#预处理
```



```
通过一个查询操作来展示两种占位符的区别
```

```
#{}：预编译处理。
${}：字符直接替换。
```

```
当着两个占位符在处理 Integer 类型的数据的时候不会出现错误
而当处理 String 类型的数据的时候  ${}就会出现错误
```

![image-20230508200845938](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508200845938.png)

![image-20230508200911243](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508200911243.png)

![image-20230508200941710](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508200941710.png)

```
出现错误：
```

![image-20230508201004145](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508201004145.png)

```
看报错信息，可以看出是SQL语法错误
select id from userinfo where username = 张三
这里的SQL语句中字符串没有''修饰，所以报错
可以看出 ${} 直接将 占位符 替换成了 字符串 中的文字，而不带 ''（直接替换）
```

```
当换成#{} 占位符 之后，程序成功启动
```

![image-20230508201320987](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508201320987.png)

```
通过日志可以看出 程序 像 JDBC 一样 先将 #{} 占位符 替换成了 ？，再判断 ？ 的类型（String) 然后将 '张三',替换 ？ ，最终SQL语句为 select id from userinfo where username = '张三',成功执行
```

```
当 要替代的字符 是关键字的时候（即插入到SQL语句当中不需要''的时候） #{} 也会出错，误将关键字变成字符串导致出错
select * from userinfo order by #{id desc};
-> select * from userinfo order by id 'desc';

此时用到${} 就直接替换，而不会出现将关键字变成字符串 
-> select * from userinfo order by id desc;
```

![image-20230509142305025](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509142305025.png)

![image-20230509142322758](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509142322758.png)

![image-20230509142739068](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509142739068.png)

![image-20230509142759873](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509142759873.png)

```
${} 直接将 asc 和 ${order} 替换
接下来看一下 #{}
```

![image-20230509142848493](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509142848493.png)

![image-20230509142950204](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509142950204.png)

```
#{} 进行了预编译，识别出 order 是 String 类型，所以就加上了 ' ',导致SQL语句出错
select * from userinfo order by 'asc'
```

```
传关键字是 ${} 的唯一使用场景
```

## 注意在.xml文件中注释用   <!-- --> 且只有这个



## 2. ${ } 导致的SQL 注入问题

```
${} #{} 的另一个很大的区别就是 $存在SQL注入问题，而#不存在
```

![image-20230509151812056](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509151812056.png)

![image-20230509151819879](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509151819879.png)

![image-20230509151841088](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509151841088.png)

```
加入username,password之后SQL语句变成
select * from userinfo where username='admin' and password = '' or 1='1';
这个密码就像万能要是一样，即使密码不正确也能开启账号
```

```
当将 $ 改成 #
```

![image-20230509152141388](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509152141388.png)

![image-20230509152148504](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509152148504.png)

```
把 passwrod 当成了 String ，结果就是 登录密码错误
```

### 即时查询，预查询

Mysql中的即时查询和预查询如下:

即时查询(Ad-hoc query):

- 是一次性的查询,执行后就失效。
- 是在需要时动态创建的。
- 效率较低,每次查询都需要重新编译查询语句。

用法:

```sql
SELECT * FROM users WHERE id = 1; 
SELECT name, age FROM users;
```

这些都是即时查询,查询语句是在需要时动态写出来的。

预查询(Prepared Statement):

- 事先编译好的查询模板。
- 包含参数占位符。
- 执行多次时,不需要每次都重新编译,效率更高。

用法:

```sql
PREPARE stmt1 FROM 'SELECT * FROM users WHERE id = ?';
SET @id = 1;
EXECUTE stmt1 USING @id;

PREPARE stmt2 FROM 'SELECT name, age FROM users WHERE name = ? AND age > ?'; 
SET @name = 'John';
SET @age = 30;
EXECUTE stmt2 USING @name, @age;
```

这里我们预先定义了查询模板 stmt1 和 stmt2,包含参数占位符。
然后设置参数值,最后执行这两个预查询语句。

优点:

- 效率高, particularly for repeated queries。
- 防止 SQL 注入攻击。

所以在实际应用中,通常优先使用预查询,它可以有效地提高性能和安全性。

```
使用 $ 就像 即时查询，将语句块拼在一起，构成一个SQL，容易出安全问题
使用 # 就像 预查询，预定义了查询模板，只要把参数引入
```

## like 查询

![image-20230509162942384](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509162942384.png)

![image-20230509162947738](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509162947738.png)

![image-20230509162954085](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509162954085.png)

```
当使用like查询的时候，使用#$占位符都不合适，当使用#的时候
select * from userinfo where username like '%"m"%'
#将字符串""也插入Like中，会导致出错，
而使用$又有安全问题，此时就要使用Mysql中的 CONCAT() 函数
```

![image-20230509163243048](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509163243048.png)

![image-20230509164032657](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509164032657.png)

```
将字符串连接成一串英文，使能够在SQL中正常执行
```

```
当把传递过去的参数添加 %% 来满足数据符合 like
select * from userinfo where username like #{username}
传递一个 %m% 过去
虽然可以成功，但是导致传递的数据被污染了，如果后续更改了 like ，直接改成 = 就会导致出错
```

## resultMap 用法

```
使用场景： 实现程序中属性和表中字段映射的功能（当程序中的属性和表中的字段不一致时，可以强制的映射到一起
```

![image-20230509194500899](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509194500899.png)

```
resultMap id="baseMap" 指 resultMap 的名称，在后续中会用到
```

![image-20230509194547992](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509194547992.png)

```
type="XXX"，将 resultMap 映射到程序中的实体类
column 指的是数据库中的列名
property 指的是 实体类中的属性名
```

## 字段和属性不一致的简单解决方案

```
为什么要有这个方案？在设计表的时候，让字段名和属性名一样不久可以了吗？
答：数据库的设计规范和程序的设计规范是不同的，数据库在进行字段拼接的时候通常使用下划线拼接,比如 read_count,但是程序中使用其他命名方式，例如驼峰命名法 readCount. 
```



```
用 * 来查询表中字段，会导致传回来的信息太多，耗费时间，资源
使用 别名 as
```

![image-20230509195929323](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509195929323.png)

```
当程序中的属性和数据库中的字段名不一致时的解决方案：
1.使用 resultMap 标签（在 mapper.xml 定义）
2.使用数据库别名 as，将字段名重命名
当只有一部分的 字段名不一致的时候，建议使用 2.
```

MyBatis 是一个优秀的持久层框架，它允许你将 SQL 语句与 Java 对象进行映射。在实际项目中，数据库表的字段名和 Java 对象的属性名可能不一致。为了解决这个问题，MyBatis 提供了两种主要的解决方案：

1. 使用 resultMap：

resultMap 是 MyBatis 中的一个映射配置，用于处理复杂的映射关系。通过 resultMap，你可以明确地指定数据库字段与 Java 对象属性之间的对应关系。以下是一个 resultMap 的例子：

```xml
<resultMap id="userResultMap" type="com.example.User">
    <id property="userId" column="user_id" />
    <result property="userName" column="user_name" />
    <result property="userEmail" column="user_email" />
</resultMap>
```

在这个例子中，我们创建了一个名为 "userResultMap" 的映射，将数据库表中的 "user_id" 字段映射到 Java 对象的 "userId" 属性，将 "user_name" 字段映射到 "userName" 属性，以及将 "user_email" 字段映射到 "userEmail" 属性。在查询语句中使用这个 resultMap，例如：

```xml
<select id="selectUser" resultMap="userResultMap">
    SELECT user_id, user_name, user_email FROM user WHERE user_id = #{userId}
</select>
```

2. 使用别名（alias）：

为了简化映射关系，你可以在 SQL 语句中使用别名（alias）为数据库字段指定一个与 Java 对象属性相同的名称。这样，MyBatis 就可以自动将数据库字段映射到 Java 对象属性。以下是一个使用别名的例子：

```xml
<select id="selectUser" resultType="com.example.User">
    SELECT user_id as userId, user_name as userName, user_email as userEmail FROM user WHERE user_id = #{userId}
</select>
```

在这个例子中，我们为数据库字段指定了与 Java 对象属性相同的别名，如 "user_id" 别名为 "userId"，"user_name" 别名为 "userName"，以及 "user_email" 别名为 "userEmail"。这样，MyBatis 可以自动完成映射，而无需显式配置 resultMap。

总结一下，你可以选择使用 resultMap 或别名来解决数据库字段与 Java 对象属性不一致的问题。resultMap 提供了更强大、灵活的映射配置，适用于复杂的映射关系，而别名则为简单的映射关系提供了简洁的解决方案。



当你使用 `as` 关键字为数据库字段设置别名时，你需要确保 Java 实体类的属性与别名匹配。这样，MyBatis 可以自动完成字段到属性的映射。接下来，我将展示一个实体类和对应的 Mapper 接口的例子。

首先是实体类 `User`：

```java
public class User {
    private Long userId;
    private String userName;
    private String userEmail;

    // 省略 getter 和 setter 方法

    // 你也可以添加构造函数、toString() 方法等
}
```

在这个实体类中，我们定义了三个属性：`userId`、`userName` 和 `userEmail`。这些属性与我们在 SQL 语句中设置的别名相匹配。

接下来是 `UserMapper` 接口：

```java
import com.example.User;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    @Select("SELECT user_id as userId, user_name as userName, user_email as userEmail FROM user WHERE user_id = #{userId}")
    User selectUser(Long userId);
}
```

在 `UserMapper` 接口中，我们定义了一个名为 `selectUser` 的方法，该方法接收一个 `Long` 类型的参数 `userId`。我们使用 `@Select` 注解编写了 SQL 语句，并使用 `as` 关键字为数据库字段设置了别名。这样，MyBatis 就可以自动将查询结果映射到 `User` 实体类的属性上。

如果你更喜欢使用 XML 配置而非注解，那么可以创建一个名为 `UserMapper.xml` 的文件，并编写如下配置：

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.example.UserMapper">
    <select id="selectUser" resultType="com.example.User">
        SELECT user_id as userId, user_name as userName, user_email as userEmail FROM user WHERE user_id = #{userId}
    </select>
</mapper>
```

这里的 SQL 语句与使用 `@Select` 注解的方式相同，我们使用了 `as` 关键字为数据库字段设置别名。

### 多表查询

`@Param` 注解在 MyBatis 的 Mapper 接口中用于指定方法参数的名称。这对于单参数方法来说并不是必需的，但是对于多参数方法来说是非常有用的。在默认情况下，MyBatis 会使用参数名 `arg0`、`arg1` 等来表示方法中的参数。使用 `@Param` 注解可以让你为参数指定一个更具有描述性的名称，从而提高代码的可读性。

假设我们有如下的 Mapper 接口：

```java
@Mapper
public interface ArticleMapper {
    List<Article> getArticlesByCategoryAndStatus(String category, String status);
}
```

在 SQL 映射文件中，你需要这样使用参数：

```xml
<select id="getArticlesByCategoryAndStatus" resultType="com.example.Article">
    SELECT * FROM article WHERE category = #{arg0} AND status = #{arg1}
</select>
```

这里的 `arg0` 和 `arg1` 分别表示方法中的第一个和第二个参数。然而，这并不是很直观。为了提高可读性，我们可以使用 `@Param` 注解为参数指定名称：

```java
@Mapper
public interface ArticleMapper {
    List<Article> getArticlesByCategoryAndStatus(@Param("category") String category, @Param("status") String status);
}
```

现在，我们可以在 SQL 映射文件中使用这些名称：

```xml
<select id="getArticlesByCategoryAndStatus" resultType="com.example.Article">
    SELECT * FROM article WHERE category = #{category} AND status = #{status}
</select>
```

如你所见，通过使用 `@Param` 注解，我们的代码变得更加清晰和易于理解。当你在项目中使用多参数方法时，强烈建议使用 `@Param` 注解为参数指定名称。

## 多表联查

```
通过 联表查询语句（left join/inner join) + XXXVO 解决
```

![image-20230509212800491](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509212800491.png)

![image-20230509212809211](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509212809211.png)

![image-20230509212819108](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509212819108.png)

![image-20230509212831755](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230509212831755.png)