# application.yml配置文件

```
classpath的根路径是 resources文件
```

![image-20230521150809021](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230521150809021.png)

```
# 配置数据库的连接字符串
spring:
  datasource:
    url: jdbc:mysql://127.0.0.1:3306/mycnblog?characterEncoding=utf8
    username: root
    password: 123123
    driver-class-name: com.mysql.cj.jdbc.Driver
# 设置 Mybatis 的 xml 保存路径
mybatis:
  mapper-locations: classpath:mapper/*Mapper.xml
  configuration: # 配置打印 mybatis 执行的 SQL
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
# 配置打印 MyBatis 执行的 SQL
logging:
  level:
    com:
      example:
        demo: debug
```

# ***Mapper配置文件

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="*Mappper.xml路径（根路径是com)">
</mapper>
```

错误：（会爆红）

![image-20230521150919807](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230521150919807.png)

namespace 的路径是java文件下Mapper的路径

正确：

![image-20230521151024182](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230521151024182.png)

用 . 来连接文件而不是 / ,最后一个文件不需要 .java 后缀

# 管理事务

在你给出的代码片段中，`DataSourceTransactionManager`和`TransactionDefinition`是两个Spring中的类，它们是用于事务管理的。

1. `DataSourceTransactionManager`: 这是Spring框架中用于管理数据库事务的类。事务管理是一种技术，它用来确保数据的一致性和完整性。当你需要对数据库执行一系列操作时，比如说先插入数据，然后更新数据，你可能会希望这些操作要么全部成功，要么全部失败。这就是事务管理的作用。`DataSourceTransactionManager`就是用来提供这种服务的，它可以帮你管理和控制事务的生命周期。

2. `TransactionDefinition`: 这是一个接口，定义了事务的基本属性，比如事务的传播行为、隔离级别、超时限制、是否是只读事务等。在实际使用中，你可以创建一个具体的`TransactionDefinition`对象，并设置你需要的事务属性，然后使用`DataSourceTransactionManager`来开始、提交或回滚事务。

这两个变量在一起常常被用于编程式事务管理，这意味着你可以在代码中显式地控制事务的边界，而不是依赖于Spring的声明式事务管理（通过`@Transactional`注解）。尽管声明式事务管理在大多数情况下更方便，但有些复杂的情况下，编程式事务管理提供了更大的灵活性。

# REQUIRED 和 NESTED 的区别

在Spring框架中的事务管理，对于REQUIRED和NESTED这两种事务传播行为，当子事务出现异常的情况下，父事务的提交行为会有所不同。

1. REQUIRED: 在REQUIRED模式下，如果子事务出现异常，并抛出未被捕获的异常，那么整个事务（包括父事务和所有其他子事务）将被标记为回滚，即父事务也无法提交。这是因为在REQUIRED模式下，**父事务和子事务都是同一个事务，它们一起提交或一起回滚。**

2. NESTED: 在NESTED模式下，子事务有自己的保存点，因此如果子事务出现异常，并抛出未被捕获的异常，**那么只有这个子事务被标记为回滚，其他的子事务和父事务可以继续执行并提交。**也就是说，如果子事务出现异常，父事务还是可以提交的。

   

   ```
   NESTED 是临时工，出事了直接踢掉就可以了
   REQUIRED 是正式工，出事了大家都出事了
   ```

   

但是需要注意的是，如果子事务的异常被上层捕获并处理，那么父事务可能仍然可以提交，这取决于具体的异常处理策略。

总的来说，是否允许父事务在子事务出现异常时提交，取决于使用的事务传播行为和异常处理策略。

```
在 IntelliJ IDEA 中，对可能抛出异常的代码创建 try-catch 块的快捷键是：

- 在 Windows/Linux 上：Ctrl + Alt + T
- 在 macOS 上：Cmd + Alt + T

以下是使用快捷键创建 try-catch 块的步骤：

1. 首先，选择或者将光标放在你想要用 try-catch 块包围的代码上。
2. 然后，使用上述的快捷键（Windows/Linux：Ctrl + Alt + T，macOS：Cmd + Alt + T）。
3. 在弹出的菜单中选择 "try-catch"。

这样就会自动在选中的代码块周围创建一个 try-catch 块，同时也会自动捕获相应的异常。
```

