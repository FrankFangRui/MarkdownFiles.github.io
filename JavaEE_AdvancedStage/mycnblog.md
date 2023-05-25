# 博客系统

## 创建步骤

### 1. New Project

```
创建 Spring Initializr 项目:
Type：Maven
Java: 8
```

```
Spring Boot: 2.7.X 版本
引入依赖:
Lombok
Spring Boot DevTools
Spring Web
MyBatis Framework
MySQL Driver
```

### 2. 进行配置文件设置

```
删除多余文件：
这四个文件都是与Maven包装器(Maven Wrapper)有关的。
在 IDEA 中创建 Spring Boot 项目时，这四个文件会被自动创建，它们的用途如下：
1. `.mvn`：这是一个文件夹，不是文件。它通常包含 `wrapper` 文件夹和 `maven-wrapper.properties` 文件。`maven-wrapper.properties` 文件主要用于配置Maven的下载源和版本。

2. `mvnw`：这是一个Unix Shell脚本，它用于在没有安装Maven的环境中自动下载和运行正确版本的Maven。

3. `mvnw.cmd`：这是Windows命令脚本，功能与 `mvnw` 类似，但适用于Windows环境。

4. `help.md`：这可能是一个提供帮助信息的Markdown文件。不过，我需要指出的是，`help.md`并非Spring Boot项目的标准文件，可能是由特定模板或框架添加的。你可能需要查看该文件的内容来了解其具体作用。

总的来说，这些文件用于确保每个开发者或者在CI/CD管道中都能使用同样版本的Maven，避免因为版本不同而导致的构建问题。
```

#### .yml文件

```
在 resource 中创建 application.yml 文件，删除.properties 文件
```

```
.yml 文件内容：
```

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

```
注意 datasource 中的 url,username,password 会根据项目变化而变化
还要注意 mapper-locations 路径，mapper的根路径在 resource 文件下
```

#### mapper

![image-20230525195437642](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230525195437642.png)

![image-20230525195429770](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230525195429770.png)

#### static

```
将前端代码放入 static 当中
```

### 3. 初始化数据库

```
创建数据库，注意字符集
```

### 4.创建项目分层

![image-20230525201049477](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230525201049477.png)

### 5.添加统一 返回类型

### 6.拦截统一的异常处理

```
不要建议写太早
因为早晚加效果一样
如果加的太早，错误信息不会报出来
最好在项目做的差不多的时候再加入
```

