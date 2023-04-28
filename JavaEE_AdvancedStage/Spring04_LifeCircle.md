# Bean对象的生命周期

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



<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426201240181.png" alt="image-20230426201240181" style="zoom:50%;" />



<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426201840204.png" alt="image-20230426201840204" style="zoom:50%;" />

```
Lombok可以用蓝色 所示的 注解来替代方法
@Data 注解 包含常用的注释
3）使用 @lombok 注解
```

## Bean对象的作用域

```
在Java和Spring框架中，Bean（Java对象）的作用域（Scope）是指在程序运行过程中，一个Bean实例的生命周期和可见性。在Spring框架中，Bean的作用域主要有以下几种：

1. 单例（Singleton）：Bean的实例在整个应用程序（Ioc容器）中只有一个，它是默认的作用域。当Spring容器创建一个单例Bean时，所有对这个Bean的引用都将指向同一个实例。这意味着对于同一个Bean的多次请求，返回的是相同的实例。
使用场景：通常都是无状态的 Bean 使用该作用域。无状态表示Bean对象的属性状态不需要更新。即只读不修改
备注：Spring默认选择该作用域

2. 原型（Prototype）：每次请求一个Bean时，都将创建一个新的实例。（获取Bean(即通过 applicationContext.getBean等方法获取) 及装配Bean(即通过@Autowired注入)都是新的对象实例）
原型作用域适用于那些需要独立实例的场景，比如多个线程使用不同的实例来避免共享状态导致的潜在问题。
使用场景：通常有状态的Bean使用该作用域

3. 请求（Request）：在Web应用中，对于每个HTTP请求，Bean的实例都是独立的。这意味着在同一个HTTP请求的生命周期内，对同一个Bean的多次请求返回相同的实例，但是不同HTTP请求将使用不同的实例。
备注：限定SpringMVC中使用

4. 会话（Session）：在Web应用中，Bean的实例是基于HTTP会话的。这意味着在同一个会话的生命周期内，对同一个Bean的多次请求返回相同的实例，但是不同会话将使用不同的实例。
使用场景：用户回话的共享Bean,比如：记录一个用户的登录信息
备注：限定SpringMVC中使用

5. 应用（Application）（了解）：在Web应用中，Bean的实例是基于整个Web应用程序的。这意味着在整个Web应用程序的生命周期内，对同一个Bean的多次请求返回相同的实例，无论请求来自哪个会话或用户。
使用场景：Web应用的上下文信息，比如：记录一个应用的共享信息

6. websocket:在一个HTTP WebSocket的生命周期中，定义一个Bean实例
场景：WebSocket的每次会话中，保存了一个Map结构的头信息，将用来包裹客户端消息头。第一次初始化后，直到WebSocket结束都是同一个Bean
备注：限定Spring WebSocket 中使用


在Spring中，可以通过在XML配置文件中设置bean元素的scope属性，或者在Java配置中使用`@Scope`注解，来定义Bean的作用域。选择合适的作用域可以帮助你更好地管理Bean的生命周期和资源使用，从而提高应用程序的性能和稳定性。
```

### 单例模式

![image-20230427093441510](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427093441510.png)

```
在UserBeans中，设置Bean对象的属性
```

![image-20230427093526942](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427093526942.png)

```
在UserController中，将 user1 赋值给 u , 并且重新设置属性
```

![image-20230427093737276](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427093737276.png)

```
在第三个类中，获取 user1 对象，并且输出对象的属性
```

![image-20230427094053469](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427094053469.png)

```
调用，并输出
```

![image-20230427094118598](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427094118598.png)

```
此时会发现，王五的类中输出的name是李四，而王五不知道李四把user给修改了，所以看到 UserBean 中name设置的是张三，就会感到很奇怪，这是因为当Spring容器创建一个单例Bean时，所有对这个Bean的引用都将指向同一个实例。
```

### Bean 作用域设置

```
什么时候存 Bean, 就在 @Bean 上加上作用域
```

![image-20230427101145182](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427101145182.png)

```
此时王五就可以直接获取到 UserBeans 中的对象
```

![image-20230427102737982](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427102737982.png)

```
`@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)` 是一个 Spring 框架的注解，用于定义 bean 的作用域。在 Spring 框架中，bean 是用于创建和管理对象的一种机制。作用域用于确定 bean 实例的生命周期。当一个 bean 被声明为 prototype 作用域时，每次从容器中请求该 bean 时，都将创建一个新的实例。

让我们分析一下这个代码：

1. `@Scope`：这是一个 Spring 注解，用于指定 bean 的作用域。
2. `ConfigurableBeanFactory.SCOPE_PROTOTYPE`：这是一个常量，表示 prototype 作用域。在这个作用域中，每次请求 bean 时，都会创建一个新的实例。

将 bean 的作用域设置为 prototype 可以在某些情况下提高应用程序的灵活性。例如，当需要在应用程序中使用多个独立的实例时，prototype 作用域非常有用。这样可以确保每个实例都拥有自己的状态和数据，防止数据污染和潜在的线程安全问题。

当我们谈论“全局变量”的方式设置时，实际上是在讨论 Spring 容器管理的 bean 的生命周期。在这种情况下，通过将作用域设置为 prototype，我们确保了每次请求该 bean 时都会创建一个新的实例。这样，我们可以避免在全局范围内共享同一个实例，从而降低了潜在的线程安全风险和数据污染问题。

总结一下，`@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)` 注解将 bean 的作用域设置为 prototype，确保每次请求该 bean 时都会创建一个新的实例。这可以帮助提高应用程序的灵活性，并降低潜在的线程安全风险和数据污染问题。
```



# Spring执行流程和Bean的生命周期

## 1.Spring的执行流程

![image-20230427102722931](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427102722931.png)

```
1.启动容器（启动项目） 创建Spring上下文对象
2.读取配置文件，初始化
  a) 使用 xml,直接注册 bean
  b) 配置 bean 根（扫描）目录
3.将 bean 存储到 Spring 中，通过类注解进行扫描和装配 (下图1)
4.将 bean 从 Spring 读取出来，装配到想要的类 （下图2)
注册 Bean 对象到容器当中
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427105802079.png" alt="image-20230427105802079" style="zoom:50%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427110101925.png" alt="image-20230427110101925" style="zoom:50%;" />

```
当使用 @Bean 注解修饰一个方法时，该方法返回的对象会被自动添加到 Spring 容器中。Spring 容器会管理这个 bean 的生命周期，包括创建、初始化和销毁等。

例如，在以下 Java 配置类中，myBean() 方法被 @Bean 注解修饰：

package com.example;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {
    @Bean
    public MyBean myBean() {
        return new MyBean();
    }
}

在这个例子中，当 Spring 容器初始化时，myBean() 方法会被调用，方法返回的 MyBean 实例会被存储在 Spring 容器中。您可以通过在其他类中使用 @Autowired 注解或在应用程序中通过 context.getBean("myBean", MyBean.class) 获取这个 bean。
```

## 2.Bean 生命周期

```
Bean 是 Java 中的一个重要概念，它通常指代可复用的软件组件。在 Spring 框架中，Bean 的生命周期指的是从 Bean 的创建、初始化、使用到销毁的整个过程。Spring 框架负责管理 Bean 的生命周期，以确保正确地创建、配置和销毁 Bean。以下是 Bean 生命周期的详细介绍：

1. 实例化（Instantiation）：首先，Spring 容器会创建 Bean 的实例。这通常是通过调用 Bean 的构造函数或使用工厂方法来完成的。

2. 设置 Bean 属性（Populating Bean Properties）：创建实例后，Spring 容器会根据配置文件为 Bean 设置属性。这包括为 Bean 注入依赖和设置属性值。

3. 设置 Bean 名称（Setting Bean Name）：Spring 容器会为 Bean 分配一个唯一的名称。这可以是开发者在配置文件中定义的名称，也可以是容器自动生成的名称。

4. 初始化（Initialization）：Bean 初始化阶段包括以下步骤：
   a. 检查 Bean 是否实现了 `BeanNameAware` 接口。如果实现了，调用 `setBeanName` 方法传入 Bean 的名称。
   b. 检查 Bean 是否实现了 `BeanFactoryAware` 接口。如果实现了，调用 `setBeanFactory` 方法传入 Bean 所属的 BeanFactory。
   c. 检查 Bean 是否实现了 `ApplicationContextAware` 接口。如果实现了，调用 `setApplicationContext` 方法传入 Bean 所属的 ApplicationContext。
   d. 检查 Bean 是否实现了 `BeanPostProcessor` 接口。如果实现了，调用 `postProcessBeforeInitialization` 方法对 Bean 进行预处理。
   e. 检查 Bean 是否实现了 `InitializingBean` 接口。如果实现了，调用 `afterPropertiesSet` 方法对 Bean 进行初始化。
   f. 如果 Bean 配置了自定义初始化方法（如：init-method），调用该方法对 Bean 进行初始化。
   g. 最后，调用 `postProcessAfterInitialization` 方法进行后置处理。

5. 使用（Usage）：当 Bean 完成初始化后，就可以被其他组件使用。在这个阶段，Bean 会完成其主要的业务功能。

6. 销毁（Destruction）：当容器关闭或应用程序终止时，Spring 容器会销毁 Bean。销毁阶段包括以下步骤：
   a. 检查 Bean 是否实现了 `BeanPostProcessor` 接口。如果实现了，调用 `postProcessBeforeDestruction` 方法进行预处理。
   b. 检查 Bean 是否实现了 `DisposableBean` 接口。如果实现了，调用 `destroy` 方法进行销毁处理。
   c. 如果 Bean 配置了自定义销毁方法（如：destroy-method），调用该方法进行销毁处理。

总结：Bean 的生命周期从实例化开始，经过属性设置、初始化和使用，最后到销毁。Spring 容器在整
```

```
在 Spring 容器中，设置属性（Populating Bean Properties）和初始化（Initialization）的过程都发生在类加载后的运行时阶段，而不是类加载阶段。在类加载阶段，Java 类加载器负责加载字节码到 JVM 内存中，完成链接和初始化等操作。Spring 容器在类加载完成后，负责 Bean 的实例化、属性设置和初始化等管理工作。

具体来说，设置属性和初始化过程的顺序如下：

1. 类加载阶段：Java 类加载器负责将编译后的字节码加载到 JVM 内存中，完成类的链接和初始化操作。

2. 实例化（Instantiation）：类加载完成后，Spring 容器根据 Bean 定义创建 Bean 的实例，通过调用其构造函数或工厂方法。

3. 设置属性（Populating Bean Properties）：Bean 实例化后，Spring 容器会根据配置文件为 Bean 设置属性，包括注入依赖和设置属性值。这个过程发生在运行时阶段，即类加载完成后。

4. 初始化（Initialization）：在设置属性之后，Spring 容器会对 Bean 进行初始化，包括检查 Bean 是否实现了特定接口，执行相应操作，调用 `BeanPostProcessor`、`InitializingBean` 等相关方法。这个过程也发生在运行时阶段，即类加载完成后。

总之，设置属性和初始化的过程都发生在类加载完成后的运行时阶段，不属于类加载阶段的一部分。
```

### 初始化和实例化的区别

```
初始化和实例化是两个不同的概念，它们在对象的创建和配置过程中有不同的作用。以下是它们之间的主要区别：

1. 实例化（Instantiation）：
实例化是创建类的对象的过程。在实例化过程中，会为对象分配内存并调用构造方法（构造函数）或工厂方法来初始化其基本属性。在 Java 或 Spring 中，实例化通常通过使用 `new` 关键字、反射或工厂方法来创建类的对象。实例化之后，对象将处于初始状态，其属性尚未设置为最终所需的值。

2. 初始化（Initialization）：
初始化是为对象设置其属性值和状态的过程，通常包括配置和依赖注入。在 Spring 容器中，初始化阶段发生在实例化之后和使用之前，包括为对象设置属性值、注入依赖、执行特定的初始化方法等。这个过程确保对象在使用之前被正确配置，以便满足其在应用程序中的功能需求。

总之，实例化和初始化是对象创建和配置过程中的两个连续阶段。实例化是创建对象并分配内存的过程，而初始化是为对象设置属性值、状态和依赖的过程。在 Spring 容器中，实例化和初始化都是由容器自动完成的，确保对象在使用前正确创建和配置。
```

```
以下是一个使用 Spring 框架的简单代码示例，展示了实例化和初始化的过程。我们将创建一个 `Person` 类，并使用 Spring 容器对其进行实例化和初始化。

1. 首先，创建一个简单的 `Person` 类：

​```java
public class Person {
    private String name;
    private int age;

    public Person() {
        System.out.println("Person 实例化...");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        System.out.println("设置 name 属性...");
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        System.out.println("设置 age 属性...");
        this.age = age;
    }

    public void init() {
        System.out.println("Person 初始化...");
    }

    public void sayHello() {
        System.out.println("Hello, my name is " + name + ", and I am " + age + " years old.");
    }
}
​```

2. 创建一个 Spring 配置文件（如 `applicationContext.xml`），以便将 `Person` 类定义为一个 Spring Bean，并指定初始化方法：

​```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="person" class="com.example.Person" init-method="init">
        <property name="name" value="John Doe"/>
        <property name="age" value="30"/>
    </bean>
</beans>
​```

3. 编写一个主类来运行 Spring 应用程序：

​```java
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Application {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        Person person = (Person) context.getBean("person");
        person.sayHello();
        context.close();
    }
}
​```

4. 当运行应用程序时，将会看到如下输出，说明实例化和初始化的过程已经完成：

​```
Person 实例化...
设置 name 属性...
设置 age 属性...
Person 初始化...
Hello, my name is John Doe, and I am 30 years old.
​```

在这个示例中，实例化是通过调用 `Person` 类的无参构造函数完成的。初始化过程包括设置 `name` 和 `age` 属性以及调用自定义的 `init` 方法。这些操作都是在 Spring 容器中自动完成的，确保对象在使用前正确创建和配置。
```

```
那Bean对象注入和装配不包含在实例化当中是吗，对象的属性包含在实例化当中
是的，Bean 对象的注入和装配不包含在实例化过程中。实例化、注入和装配是 Spring 容器创建和管理 Bean 对象的三个关键步骤，它们在 Bean 生命周期中处于不同的阶段。

1. 实例化（Instantiation）：实例化是指通过调用 Bean 的构造函数或工厂方法创建 Bean 对象。在这个阶段，对象已经存在，但它的属性和依赖关系尚未设置。实例化是 Bean 生命周期的第一步。

2. 注入（Injection）和装配（Autowiring）：注入和装配发生在实例化之后，它们负责为 Bean 对象设置属性值、注入依赖对象和建立关联关系。Spring 容器根据配置文件或注解来进行注入和装配，使得对象之间的依赖关系得以解决。注入和装配是设置 Bean 属性（Populating Bean Properties）阶段的主要任务。

以下是注入和装配的两种主要方式：

  a. XML 配置文件：通过 `<property>` 标签或 `<constructor-arg>` 标签来注入属性值或依赖对象。
  b. 注解：使用 `@Autowired`、`@Inject` 或 `@Resource` 等注解来自动装配依赖对象。

3. 初始化（Initialization）：在注入和装配完成之后，Spring 容器会对 Bean 对象进行初始化。这个阶段包括执行特定接口的方法（如 `InitializingBean` 的 `afterPropertiesSet` 方法）、执行自定义初始化方法等。初始化阶段确保对象在使用之前已经被正确配置。

总之，Bean 对象的注入和装配不包含在实例化过程中。它们是 Bean 生命周期中的不同阶段，分别负责创建对象、设置属性和依赖关系以及进行初始化。
```

```
工厂方法和静态方法都是创建对象的方法，但是它们的实现方式不同。静态方法是在类中定义的方法，可以直接通过类名调用，而不需要创建对象。工厂方法是在抽象类中定义的抽象方法，由子类实现，用于创建对象。工厂方法模式是一种创建型设计模式，它提供了一种将对象的创建过程封装起来的方式。这种方式可以使客户端代码与具体类的实现分离，从而提高代码的可维护性和可扩展性。

静态工厂模式和工厂方法模式都是工厂模式的一种，但是它们之间有一些区别。静态工厂模式是在一个类中定义一个静态方法，用于创建对象。这个静态方法通常被称为“工厂方法”。与此相反，工厂方法模式是在一个抽象类中定义一个抽象方法，由子类实现。这个抽象方法通常被称为“工厂方法”。因此，静态工厂模式只能创建一种类型的对象，而工厂方法模式可以创建多种类型的对象。
```



```
1.实例化 Bean (为 Bean 分配内存空间) 对应JVM中的“加载” 【从无到有，将字节码转换成内存中的对象，只是分配了内存】  调用构造方法创建对象，但是对象的属性还没有配置   买一个毛坯房
2.设置属性 (Bean 注入和装配)  通过@Autowired注解，来自动将Bean对象的属性注入  准备装修材料
3.Bean 初始化     开始装修
  a) 各种通知 打电话给各个装修师傅来装修
  b) 初始化的前置工作 师傅到达现场，勘察环境，指定装修方法【前置工作】
  c) 进行初始化的工作【使用注解 @PostConstruct 初始化、使用（xml) init-method 初始化】 有两种师傅，一种带了科技，一种手工操作，先后进行装修
  d) 初始化的后置工作  装修之后的清理工作
4.使用Bean 入住房子
5.销毁Bean 卖掉房子
```

![image-20230427150323787](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427150323787.png)

![image-20230427150754609](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427150754609.png)

![image-20230427150624811](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427150624811.png)

![image-20230427150830658](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427150830658.png)

![image-20230427150842873](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427150842873.png)

![image-20230427153142120](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427153142120.png)

```
为什么执行了两遍？
因为即使用了单独<bean>标签又使用了 @Component
所以就会找到两个对象
```

```
这里的配置确实导致了前两个方法被执行了两次。这是因为你既使用了 <content:component-scan> 进行自动扫描和注册，又使用了 <bean> 元素手动注册了一个 BeanLifeComponent 的实例。这导致了两个实例被创建和初始化，因此 setBeanName 和 postConstruct 方法都被执行了两次。

详细解释如下：

使用 <content:component-scan base-package="com.demo"> 自动扫描和注册组件。因为 BeanLifeComponent 类上有 @Component 注解，所以 Spring 会自动创建一个该类的实例。

在这个实例的生命周期中，会执行如下方法：

setBeanName，因为实现了 BeanNameAware 接口。
postConstruct，因为使用了 @PostConstruct 注解。
使用 <bean> 元素手动注册了另一个 BeanLifeComponent 的实例，配置如下：

<bean id="myComponent" class="com.demo.component.BeanLifeComponent"
      init-method="init"></bean>
在这个实例的生命周期中，会执行如下方法：

setBeanName，因为实现了 BeanNameAware 接口。
postConstruct，因为使用了 @PostConstruct 注解。
init，因为在 <bean> 元素中指定了 init-method="init"。
所以，setBeanName 和 postConstruct 方法分别在两个不同的实例中执行了一次，共计执行了两次。

为了避免这种情况，你可以选择以下方案之一：

如果你想使用自动扫描和注册，那么可以移除手动注册的 <bean> 元素，这样就只会有一个 BeanLifeComponent 实例。
如果你想使用手动注册，可以在 BeanLifeComponent 类上移除 @Component 注解，并保留 <bean> 元素。这样，Spring 不会自动扫描和注册该类，而只会根据你的配置创建一个实例。
```

![image-20230427151135394](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427151135394.png)

```
Bean 初始化的过程中 setBeanName 这些方法都会自动执行吗？	

是的，在 Spring Bean 初始化过程中，实现了某些特定接口或使用了特定注解的方法会被自动执行。setBeanName 方法就是其中之一，它是 BeanNameAware 接口的一个方法。

以下是 Spring Bean 生命周期中的一些关键步骤及其相关的接口和注解：

实例化 Bean：Spring 会根据配置创建 Bean 的实例。如果有多个构造函数，可以使用 @Autowired 注解指定要使用的构造函数。

填充属性值：根据配置，Spring 会自动将依赖项注入到 Bean 的属性中。可以使用 @Autowired、@Resource 或 @Inject 注解来标注属性。

设置 Bean 名称：如果 Bean 实现了 BeanNameAware 接口，Spring 会调用 setBeanName 方法，传入当前 Bean 的名称。

设置 Bean 工厂：如果 Bean 实现了 BeanFactoryAware 接口，Spring 会调用 setBeanFactory 方法，传入当前 Bean 所属的工厂实例。

应用后处理器前置处理：BeanPostProcessor 接口的 postProcessBeforeInitialization 方法在初始化方法之前被调用。

初始化方法调用：Spring 支持多种初始化方法调用，包括：

使用 @PostConstruct 注解。
实现 InitializingBean 接口，重写 afterPropertiesSet 方法。
在配置中指定 init-method 属性，提供一个自定义的初始化方法。
应用后处理器后置处理：BeanPostProcessor 接口的 postProcessAfterInitialization 方法在初始化方法之后被调用。

Bean 可以被使用了。

销毁 Bean：在 Bean 生命周期结束时，Spring 会调用销毁方法，包括：

使用 @PreDestroy 注解。
实现 DisposableBean 接口，重写 destroy 方法。
在配置中指定 destroy-method 属性，提供一个自定义的销毁方法。
通过实现这些特定接口或使用相应的注解，你可以在 Bean 生命周期的关键节点插入自定义逻辑，以满足特定需求。
```

示例讲解：

![image-20230427163343381](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427163343381.png)

![image-20230427163352352](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427163352352.png)

![image-20230427163400458](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427163400458.png)

![image-20230427163412564](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427163412564.png)

![image-20230427163418854](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230427163418854.png)

```
为什么输出的结构都是 按照 CBA 的顺序呢？
在 A 中发现要 配置B对象属性，然后到 B 中初始化变量 B，然后发现要配置C对象属性，然后到 C 中，C不需要配置属性，然后 初始化 C 对象之后（执行了PostConstruct方法）,然后开始继续 初始化变量 B，之后 初始化变量 A
```

```
@Autowired注解是Spring框架中的一个注解，它可以自动装配一个bean。当一个类中有@Autowired注解的变量时，Spring会在类加载时自动为这个变量赋值。
Bean的生命周期：
实例化：在APP3中创建对象赋值给引用 ac，然后通过Spring来获取Bean对象，此时就会实例化Bean对象，开始调用对象的构造方法，并在内存中开辟出空间
属性注入：Spring会为带有 @Autowired 的属性注入对象
初始化：开始调用Bean中的postConstruct等方法
```

