## JDBC

![image-20230327153551565](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327153551565.png)

![image-20230327153558318](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327153558318.png)

![image-20230327153605206](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327153605206.png)

![image-20230327153703508](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327153703508.png)

![image-20230327153951067](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327153951067.png)

![image-20230327154005239](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327154005239.png)

```
JDBC 就是转接头，多个不同的数据库都可以用 JDBC 来连接到应用程序上
```

![image-20230328080400382](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328080400382.png)

### 驱动包下载

![image-20230328080545967](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328080545967.png)

![image-20230328081436939](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328081436939.png)

![image-20230328081448218](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328081448218.png)

![image-20230328081527044](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328081527044.png)

![image-20230328081537826](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328081537826.png)

![image-20230328081546825](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328081546825.png)

![image-20230328082235680](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328082235680.png)

![image-20230328082447494](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328082447494.png)

![image-20230328082453553](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328082453553.png)

![image-20230328082502868](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328082502868.png)

![image-20230328085546537](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328085546537.png)

![image-20230328085602762](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328085602762.png)

![image-20230328085654150](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328085654150.png)

![image-20230328090011544](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328090011544.png)

![image-20230328085700666](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328085700666.png)

![image-20230328090920227](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328090920227.png)

![image-20230328090928814](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328090928814.png)

![image-20230328091332401](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328091332401.png)

![image-20230328091346154](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328091346154.png)

![image-20230328092514478](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328092514478.png)

![image-20230328092530052](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328092530052.png)

### 三个 setXXX 方法

![image-20230328093408606](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328093408606.png)

![image-20230328093728309](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328093728309.png)

### 建立连接

![image-20230328094308403](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328094308403.png)

![image-20230328094500616](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328094500616.png)

![image-20230328094602790](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328094602790.png)

![image-20230328094509024](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328094509024.png)

![image-20230328094810530](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328094810530.png)

![image-20230328095254917](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328095254917.png)

![image-20230328095300857](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328095300857.png)

![image-20230328095319731](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328095319731.png)

![image-20230328095509401](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328095509401.png)

```java
public class JDBC {
    // 通过 JDBC 来操作数据库，往数据库里面插入一些数据
    // 往 java105 这个数据库中的 student 表里，插入一条数据
    public static void main(String[] args) throws SQLException {
        //1. 创建数据源对象，数据源对象就描述了要访问的数据库是啥，在哪
        // 这里使用了向下转型，调用了子类MysqlDataSource的方法
        DataSource dataSource = new MysqlDataSource();
        ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/java105?characterEncoding=utf8&useSSL=false");
        ((MysqlDataSource)dataSource).setUser("root");
        ((MysqlDataSource)dataSource).setPassword("123123");

        // 2. 让代码和数据库服务器建立连接
        Connection connection = dataSource.getConnection();
        //System.out.println(connection);

        // 3.构造要执行的 SQL 语句
        String sql = "insert into student values(1,'张三')";
        PreparedStatement statement = connection.prepareStatement(sql);
```



## JDBC-2

![image-20230328104722274](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328104722274.png)

```java
        // 4.执行 SQL 【发送请求 & 读取响应】
        // 执行方法，有两个
        // executeUpdate 对应插入删除修改语句，返回值表示这次 SQL 操作影响到的行数
        // executeQuery 对应查询语句，返回值则是返回的临时表数据
        int n = statement.executeUpdate();
        System.out.println("n = " + n);

        // 5. 完成之后，就需要关闭释放相关资源
        statement.close();
        connection.close();
```

```
上面是临时表数据，下面是影响到的行数
```

![image-20230328111108005](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328111108005.png)

![image-20230328111011390](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328111011390.png)

![image-20230328105825052](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328105825052.png)

![image-20230328110234634](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328110234634.png)

![image-20230328111400990](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328111400990.png)

### 运行程序的时候，插入数据

![image-20230328111347484](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328111347484.png)

![image-20230328112051834](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328112051834.png)

![image-20230328112620255](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328112620255.png)

![image-20230328112940328](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328112940328.png)

![image-20230328113438850](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328113438850.png)

![image-20230328113626646](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328113626646.png)

```
会自动加入引号
```

![image-20230328113647022](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328113647022.png)

![image-20230328113653959](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328113653959.png)





![image-20230328143223978](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328143223978.png)

![image-20230328143302456](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328143302456.png)

### JDBCSelect

```java
   // 查询语句要使用 executeQuery 来完成
        // 返回的结果是 ResultSet, 结果集，里面是一个“表”这样的数据结构
        // 一个表有很多行和列
        ResultSet resultSet = statement.executeQuery();

        // 遍历结果集
        while(resultSet.next()){
            // 每次循环，就能获取到 resultSet 中的一行，进一步就可以拿到每一列
            // getXXX 也是有一系列方法的，会根据要取的数据的类型，来灵活决策
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            System.out.println("id =" + id + ", name =" + name);
        }

        // 释放资源
        resultSet.close();
        statement.close();
        connection.close();
```

![image-20230328152126206](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328152126206.png)

![image-20230328152149497](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328152149497.png)

![image-20230328152300738](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328152300738.png)

![image-20230328153016057](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230328153016057.png)