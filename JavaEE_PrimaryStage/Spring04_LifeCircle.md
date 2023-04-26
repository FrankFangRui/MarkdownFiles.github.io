# Bean对象的生命周期

## Bean对象的作用域

```
在Java和Spring框架中，Bean（Java对象）的作用域（Scope）是指在程序运行过程中，一个Bean实例的生命周期和可见性。在Spring框架中，Bean的作用域主要有以下几种：

1. 单例（Singleton）：Bean的实例在整个应用程序中只有一个，它是默认的作用域。当Spring容器创建一个单例Bean时，所有对这个Bean的引用都将指向同一个实例。这意味着对于同一个Bean的多次请求，返回的是相同的实例。

2. 原型（Prototype）：每次请求一个Bean时，都将创建一个新的实例。原型作用域适用于那些需要独立实例的场景，比如多个线程使用不同的实例来避免共享状态导致的潜在问题。

3. 请求（Request）：在Web应用中，对于每个HTTP请求，Bean的实例都是独立的。这意味着在同一个HTTP请求的生命周期内，对同一个Bean的多次请求返回相同的实例，但是不同HTTP请求将使用不同的实例。

4. 会话（Session）：在Web应用中，Bean的实例是基于HTTP会话的。这意味着在同一个会话的生命周期内，对同一个Bean的多次请求返回相同的实例，但是不同会话将使用不同的实例。

5. 应用（Application）：在Web应用中，Bean的实例是基于整个Web应用程序的。这意味着在整个Web应用程序的生命周期内，对同一个Bean的多次请求返回相同的实例，无论请求来自哪个会话或用户。

6. 线程（Thread）：Bean的实例是基于线程的。这意味着在同一个线程的生命周期内，对同一个Bean的多次请求返回相同的实例，但是不同线程将使用不同的实例。

在Spring中，可以通过在XML配置文件中设置bean元素的scope属性，或者在Java配置中使用`@Scope`注解，来定义Bean的作用域。选择合适的作用域可以帮助你更好地管理Bean的生命周期和资源使用，从而提高应用程序的性能和稳定性。
```

## Lombok

```
Lombok 是一种 Java 库，它可以通过注解减少 Java 代码的样板代码（boilerplate code）量，从而提高开发人员的生产力。Lombok 可以自动生成 Java 类的 getter、setter、equals()、hashCode()、toString() 等方法，还可以通过注解简化构造函数的编写。使用 Lombok 可以减少大量的样板代码，使代码更简洁易读。

Lombok 可以与许多常见的 Java 开发工具和框架一起使用，例如 Eclipse、IntelliJ IDEA、Maven、Gradle 等。Lombok 已经成为许多 Java 开发人员的常用工具之一，它可以大大减少开发工作量，提高代码质量和可维护性。
```

```
<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.18.24</version>
    <scope>provided</scope>
</dependency>
```

```
1）从MVN仓库引入依赖，放到pom.xml，然后点击reload引入到当前项目中
```

```
2）然后还要安装一个插件，如果不安装此插件，就不能正常使用lombok的功能，就比如 .setXXX/.getXXX 没有提示和报错
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426200605311.png" alt="image-20230426200605311" style="zoom:50%;" />![image-20230426200624161](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426200624161.png)



![image-20230426200724375](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426200724375.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426201240181.png" alt="image-20230426201240181" style="zoom:50%;" />



<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426201840204.png" alt="image-20230426201840204" style="zoom:50%;" />

```
Lombok可以用蓝色 所示的 注解来替代方法
@Data 注解 包含常用的注释
3）使用 @lombok 注解
```

