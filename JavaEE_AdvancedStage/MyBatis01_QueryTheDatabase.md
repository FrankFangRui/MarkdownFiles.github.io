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