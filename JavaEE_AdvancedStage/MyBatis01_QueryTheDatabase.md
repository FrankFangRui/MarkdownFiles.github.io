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

## Mybatis的作用

MyBatis 是一个开源的持久层框架，它提供了在Java应用程序中进行数据库访问的简化方法。以下是 MyBatis 的主要作用：

1. **数据持久化：** MyBatis 通过将数据库操作与 SQL 语句映射到 Java 方法上，简化了数据持久化的过程。它允许开发人员将 SQL 语句与 Java 代码分离，通过 XML 配置或注解方式描述 SQL 语句，提供了更灵活和可维护的数据访问方式。

2. **灵活的 SQL 映射：** MyBatis 提供了丰富的 SQL 映射功能，支持动态 SQL、条件查询、结果映射和高级查询等。通过 SQL 映射语句，可以执行各种复杂的数据库操作，如插入、更新、删除和查询。

3. **性能优化：** MyBatis 通过提供一些高效的查询方法和缓存机制来优化数据库访问性能。它支持一级缓存和二级缓存，减少了对数据库的频繁访问，提高了应用程序的性能。

4. **与多种数据库兼容：** MyBatis 支持多种数据库，如Oracle、MySQL、PostgreSQL等，提供了针对不同数据库的特定特性和优化配置。

5. **事务管理：** MyBatis 可以与事务管理器（如Spring事务管理器）集成，提供了对数据库事务的支持。开发人员可以通过配置和管理事务，确保数据的一致性和完整性。

6. **易于学习和使用：** MyBatis 的学习曲线相对较低，它的配置和使用都相对简单明了。通过学习 MyBatis，开发人员可以更好地理解和掌握底层数据库访问的原理和技术。

总体而言，MyBatis 是一个功能强大、灵活且易于使用的持久层框架，它提供了简化数据库访问的方法，帮助开发人员更有效地进行数据持久化操作，并优化应用程序的性能。

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
配置Mybatis中的XML路径，根路径是在 source 文件夹下
```

![image-20230507153829367](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230507153829367.png)

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
select 标签<> 中的 id 指代的是 UserMapper 中的 Param, resultType 指的是返回的类型（返回 用户信息 对象），即 entity 中的 UserInfo 地址 (实体类)
id = ${user_id}
{} 内是动态标签，目的是传递参数，可以变化但是要和 UserMapper 中的 @Param中的参数一样
```

![image-20230506212044383](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230506212044383.png)

```
2.3 实现服务层
```

![image-20230507150417887](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230507150417887.png)

```
2.4 实现控制器
```

![image-20230507151309657](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230507151309657.png)

![image-20230507151647229](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230507151647229.png)



```
从上面两个代码中就可以看出 控制器 是调用服务层的，同时控制器还起到筛选的作用，将前端传送过来 id == null 的不合法的数据取出，只有合法的数据才能访问 服务层
服务层 通过 调用接口的实现类 ，实现类 通过 .xml 文件中的 SQL 语句实现对数据库的操作
```

![image-20230507153110689](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230507153110689.png)

![image-20230507153119390](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230507153119390.png)