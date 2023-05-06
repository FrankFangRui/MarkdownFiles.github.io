# MyBatis 查询数据库

## 回顾JDBC

JDBC（Java Database Connectivity）是 Java 提供的一种用于连接和操作数据库的技术。JDBC 提供了一组 API，使得 Java 程序可以与多种数据库进行交互。下面我们分步介绍 JDBC 的操作过程：

1. 加载数据库驱动：首先需要加载数据库的 JDBC 驱动。这通常是通过 Class.forName() 方法来实现的，例如：
```java
Class.forName("com.mysql.jdbc.Driver");
```

2. 建立数据库连接：使用 DriverManager 类的 getConnection() 方法，传入数据库的 URL、用户名和密码，获取数据库连接对象。例如：
```java
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "username", "password");
```

3. 创建 Statement 或 PreparedStatement 对象：通过 Connection 对象的 createStatement() 或 prepareStatement() 方法创建 Statement 或 PreparedStatement 对象。PreparedStatement 对象可以预编译 SQL 语句并支持参数绑定，以提高性能和安全性。例如：
```java
Statement statement = connection.createStatement();
PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
```

4. 绑定参数：如果使用 PreparedStatement，需要将 SQL 语句中的占位符与实际参数进行绑定。例如：
```java
preparedStatement.setInt(1, 1);
```

5. 执行 SQL 语句：使用 Statement 或 PreparedStatement 对象的 executeQuery() 或 executeUpdate() 方法执行查询或更新操作。例如：
```java
ResultSet resultSet = preparedStatement.executeQuery();
int rowsAffected = preparedStatement.executeUpdate();
```

6. 处理结果集：如果执行的是查询操作，需要遍历 ResultSet 对象，获取查询结果。例如：
```java
while (resultSet.next()) {
    int id = resultSet.getInt("id");
    String name = resultSet.getString("name");
    // ...
}
```

7. 关闭资源：执行完毕后，需要逐个关闭 ResultSet、Statement（或 PreparedStatement）和 Connection 对象，以释放数据库资源。通常在 finally 代码块中执行。例如：
```java
try {
    resultSet.close();
    preparedStatement.close();
    connection.close();
} catch (SQLException e) {
    // 处理异常
}
```

通过以上步骤，我们可以在 Java 程序中使用 JDBC 进行数据库操作。虽然 JDBC 是一个功能强大的 API，但操作过程繁琐，需要编写大量重复的代码。这也是为什么许多开发者会选择使用 ORM 框架（如 MyBatis、Hibernate 等）来简化数据库操作。

## 搭建 MyBatis 开发环境

![image-20230506163327167](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506163327167.png)

![image-20230506163337764](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506163337764.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506152145163.png" alt="image-20230506152145163" style="zoom:50%;" />

```
创建项目的时候，这五个依赖都要加入
```

```
当 添加了 Mysql 依赖，但是没有设置 Mysql 链接的时候，就会报错
```

![image-20230506152250428](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506152250428.png)

```
当IDEA右边窗口没有Maven的时候，通过点击Project 右键 Add Framework 来添加框架依赖
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506152521799.png" alt="image-20230506152521799" style="zoom:33%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506152531961.png" alt="image-20230506152531961" style="zoom:33%;" />

```
链接数据库
spring.datasource.url=jdbc:mysql://localhost:3306/mycnblog?characterEncoding=utf8&useSSL=utf8
spring.datasource.username=root
spring.datasource.password=123123
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

![image-20230506153417544](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506153417544.png)

```
MyBatis 组成 2 部分：
1.接口 （包含表的所有操作方法）  --> 给程序其他类调用
2.XML 实现接口  --> 写具体 SQL 语句，（把SQL语句直接通过 String 写在类当中很难看）
```

## 根据 id 查询数据库的用户信息

![image-20230506210546918](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506210546918.png)

```
1. 创建实体类
```

![image-20230506210623890](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506210623890.png)

```
2. 构建Mapper层的代码实现
2.1 创建接口 （包含表的所有操作方法）
```

![image-20230506211052921](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506211052921.png)

```
2.2 创建 XML 实现
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506211218179.png" alt="image-20230506211218179" style="zoom:50%;" />

```
在 mybatis 文件夹下创建 .xml 文件
```

![image-20230506211431159](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506211431159.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506211721438.png" alt="image-20230506211721438" style="zoom:50%;" />

```
namespace 指代的是 mapper 文件夹中 UserMapper 文件的 source 地址
select 中的 id 指代的是 UserMapper 中的方法名, resultType 指的是返回的类型（返回 用户信息 对象），即 entity 中的 UserInfo 地址 
id = ${user_id}
{} 内是动态标签，目的是传递参数，可以变化但是要和 UserMapper 中的 @Param中的参数一样
```

![image-20230506212044383](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506212044383.png)

