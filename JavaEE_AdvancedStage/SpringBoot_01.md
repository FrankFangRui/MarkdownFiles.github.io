# Spring Boot 核心

```
1.快速添加依赖， 不用在 pom.xml 添加依赖
2.内置 Web 容器， 可以通过 http 请求来发送信息给浏览器
3.自动装配***
```

### 自动装配机制

```
Spring Boot 的自动装配机制是一种使开发人员能够更轻松地构建和配置 Spring 应用程序的方法。自动装配能够根据项目中的依赖关系自动配置 Spring 应用程序。这使得开发者无需手动配置大量组件，而是可以依赖 Spring Boot 来自动完成这些任务。

Spring Boot 自动装配的核心概念如下：

1. @EnableAutoConfiguration：这个注解通常在主应用类上使用，它启用了 Spring Boot 的自动装配功能。它告诉 Spring Boot 去查找 META-INF/spring.factories 文件中指定的自动配置类。

2. 自动配置类：这些类定义了基于类路径中可用的组件、库和其他条件的默认配置。这些类使用 @Configuration 注解进行标注，表示它们是 Spring 配置类。自动配置类可以通过 @Conditional 注解来定义特定条件，当满足这些条件时，才会启用自动配置。

3. META-INF/spring.factories：这是一个特殊的文件，用于列出自动配置类。该文件位于每个自动配置模块的资源目录中。Spring Boot 在启动过程中会扫描这个文件，加载其中列出的自动配置类。

4. @ConditionalOn* 注解：这些注解用于自动配置类中的条件。例如，@ConditionalOnClass 表示当特定的类在类路径上存在时，才会启用对应的自动配置。@ConditionalOnMissingBean 和 @ConditionalOnBean 用于检查 Spring 上下文中是否存在指定的 bean。这些条件可以灵活地定义自动配置类的生效条件。

Spring Boot 自动装配的整个流程如下：

1. 开发者在主应用类上添加 @EnableAutoConfiguration 注解，启用自动装配功能。
2. Spring Boot 在启动时扫描 META-INF/spring.factories 文件，找到所有的自动配置类。
3. 根据自动配置类中的条件，Spring Boot 确定哪些配置需要启用。
4. 满足条件的自动配置类将被加载到 Spring 上下文中，完成相关组件的默认配置。

这个机制使得开发者能够专注于编写应用程序的核心功能，而不必关心底层的配置细节。当然，如果需要自定义配置，Spring Boot 也提供了足够的灵活性，可以覆盖默认的自动装配配置。
```

```
和 Spring 装配 的 区别？

Spring 框架是 Java 开发者用于构建企业级应用程序的强大工具。它提供了依赖注入（DI）和控制反转（IoC）等核心功能，以降低模块之间的耦合性，提高应用程序的可扩展性和可维护性。

在 Spring 中，装配指的是将定义好的 bean 组件组合在一起，以满足应用程序运行时的需求。Spring 的装配有以下几种方式：

1. 基于 XML 的装配：这是 Spring 最早的配置方式，需要在 XML 文件中定义 bean 和它们之间的依赖关系。虽然 XML 是一个通用的配置格式，但随着应用程序规模的增长，XML 文件可能变得冗长且难以维护。

2. 基于注解的装配：为了简化 XML 配置，Spring 引入了基于注解的装配。这种方式允许开发者直接在 Java 代码中使用注解（如 @Component、@Service、@Autowired 等）来定义 bean 和它们之间的依赖关系。这种方式使得代码更加简洁，易于理解和维护。

3. 基于 Java 配置的装配：另一种替代 XML 配置的方法是基于 Java 的配置。在这种方式中，开发者可以使用 @Configuration 和 @Bean 注解在 Java 类中定义配置。这样，整个配置都集中在一个或多个 Java 类中，使得代码更加模块化。

与 Spring 装配相比，Spring Boot 自动装配的主要区别在于：

1. Spring Boot 提供了一种基于约定优于配置（Convention over Configuration）的方法，大多数情况下，开发者无需手动配置 bean，而是依赖 Spring Boot 根据应用程序中存在的依赖关系来自动完成配置。

2. Spring Boot 自动装配的主要目标是简化和加速应用程序的开发过程。通过自动配置，开发者可以在较短的时间内搭建起一个基本的应用程序框架，从而专注于实现应用程序的核心功能。

3. 虽然 Spring Boot 提供了自动装配功能，但它并不限制开发者进行自定义配置。实际上，开发者可以结合 Spring 的各种装配方式（如基于 XML、注解或 Java 配置）来覆盖或扩展 Spring Boot 的默认配置。

总之，Spring Boot 自动装配是基于 Spring 框架之上的一种新的装配方法，它旨在简化配置过程，提高开发效率。然而，它并不取代 Spring 的传统装配方式，而是为开发者提供了一种更简洁、快速的选择。
```

# SpringBoot创建

![image-20230428113207706](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230428113207706.png)

```
2022.12 发布了 Spring Boot 3.0 基于 Spring 6 要求最低的JDK 版本是 17
目前使用的是 SpringBoot 2.X 要求最低 JDK 8
```

![image-20230428114248169](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230428114248169.png)

```
Group : com.example   com.公司名
Artifact: 项目的名字
Version: 项目的版本号
Project Type: gradle maven 都是打包和资源管理工具，主流 maven ，gradle是maven的升级，gradle打包更快多线程，maven是单线程，gradle第一次之后的打包是增量式打包，不变的东西就不打包了，maven都是全部打包，和第一次打包时间一样
Java: 8 选择的版本是8
Package name:生成springboot默认的包，一般设置成这个样子，成规范了
```

```
SpringBoot版本选择后面有（SNAPSHOT)是尝鲜版，可能有错
```

![image-20230428120247908](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230428120247908.png)

加了Mysql就要配置数据源，不然就启动不起来

