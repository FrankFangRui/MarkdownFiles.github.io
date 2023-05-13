## 1. 创建一个Maven项目

![image-20230513114054337](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230513114054337.png)

## 2. 在pom.xml 中引入依赖

```
<dependencies>
            <dependency>
                <groupId>org.springframework</groupId>
                <artifactId>spring-context</artifactId>
                <version>5.2.3.RELEASE</version>
            </dependency>
            <dependency>
                <groupId>org.springframework</groupId>
                <artifactId>spring-beans</artifactId>
                <version>5.2.3.RELEASE</version>
            </dependency>
</dependencies>
```

`spring_config.xml`和`pom.xml`是Spring项目中两种非常重要的配置文件，但它们的角色和作用是不同的。

1. `spring_config.xml`：这是Spring框架的配置文件，用于定义并配置Spring容器中的Beans。Spring框架是一个依赖注入和控制反转（IoC）的容器，它需要一个配置文件来了解如何初始化、配置和组装各种对象。你可以在此文件中配置数据源、事务管理器、服务层Beans、DAO层Beans等等。

2. `pom.xml`：这是Maven项目对象模型（POM）的配置文件。Maven是一个项目管理工具，可以帮助你管理项目的构建、报告和文档。`pom.xml`文件定义了项目的基本信息，如项目名称、版本、URL、开发者等等。此外，它还定义了项目的依赖关系，指定了项目需要哪些库和版本。它还可以配置项目的构建过程，包括编译源代码、打包、运行测试、生成报告等等。

总的来说，`spring_config.xml`主要用于配置Spring框架的行为，而`pom.xml`主要用于配置Maven项目的构建和依赖。它们都是项目配置的重要部分，但关注的领域是不同的。

## 3. （一次性）配置国内源

![image-20230513114332377](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230513114332377.png)

## 4.在 resource 文件下创建 spring_config.xml 配置文件

![image-20230513114530033](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230513114530033.png)

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:content="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd">
    <content:component-scan base-package="com.example.demo"></content:component-scan>
</beans>
```

```
注意修改 base-package 下的路径 以蓝色 java 包为根路径向下扫描，只有在 base-package 路径下的 bean 对象才能被 Spring 容器识别
```

![image-20230513114611329](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230513114611329.png)

```
注意：spring_config.xml 文件中 URL 爆红可能是 pom.xml 文件中的依赖不正确（格式，符号打错了..)
```

