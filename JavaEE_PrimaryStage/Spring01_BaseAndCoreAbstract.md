## 传统开发中的问题 

​      传统开发中代码的耦合性太大，如果需要需改一个特性（轮胎的尺寸），就需要修改一连串的代码，效率很低

## 新旧方式的比较

旧方式：

如果要给轮胎增加一个新的特性，来更改轮胎的尺寸就要更改一连串不同类上的方法

通过一个个类的构造方法来传递参数

车架类传递给底盘类，再传递给轮胎类

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420201024112.png" alt="image-20230420201024112" style="zoom:50%;" />

这个修改的权限在于程序员手中

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420201204846.png" alt="image-20230420201204846" style="zoom:50%;" />

新方式：

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420201251876.png" alt="image-20230420201251876" style="zoom:50%;" />

新方式直接传送类，不用修改一系列代码，但是修改轮胎尺寸的权限不在于程序员，而是谁把参数传送给 Bottom(Tire tire) ，tire 的生命周期不由程序员决定，而是由什么时候传送给Bottom(Tire tire) 决定，这就是控制反转（Inversion Of Control)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420202129682.png" alt="image-20230420202129682" style="zoom:50%;" />

当需要添加参数（颜色）的时候，只需要修改 Tire 类的代码，其他类的代码不需要改变，成功降低了代码的耦合性，当 tire 修改的时候，只需要修改 Tire 类，而其他类不需要修改

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420202921763.png" alt="image-20230420202921763" style="zoom:50%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420202930784.png" alt="image-20230420202930784" style="zoom:50%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420203042855.png" alt="image-20230420203042855" style="zoom:50%;" />

## 什么是 IOC （Inversion Of Control)

```
控制反转，就是在有一系列的类当中，A类引用B类，B类引用C类，然后在引用的时候，直接在这个类当中 new 这个要引用的类，在这种情况下如果C类的构造方法发生改变的话，就要同时修改ABC三个类当中的构造方法，导致代码耦合性高，而控制反转就是 在AB类中直接传入构建好的类，而不是直接new一个类，这个时候要修改传送的 C类的值的时候，就只需要修改 C类的构造方法就可以了
```

 ![image-20230421094319543](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230421094319543.png)

![image-20230421094334684](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230421094334684.png)

```
Spring 是什么？
如何理解 Spring？
IoC 和 DI 是啥？有什么区别？
Spring 最核心的功能是啥？
```

Spring是一个开源的Java框架，它的核心功能是提供了一个容器，可以管理对象的生命周期和对象之间的依赖关系。Spring框架的核心特性可用于开发任何Java应用程序，但也有一些扩展可用于在Java EE平台之上构建Web应用程序。Spring框架旨在通过启用基于POJO的编程模型使J2EE开发更易于使用并促进良好的编程实践。²⁴

IoC和DI是两个概念，但是它们之间有很大的关联。IoC是一种设计模式，是一种思想，相当于一个容器，而DI就好比是实现IoC的一种方式。IoC强调的是将对象实例的创建控制权由spring容器来统一管理，需要的时候从容器中取出，而不是由调用者自身去创建，从而达到降低代码耦合性与硬代码的目的。而依赖注入强调的是当调用者需要使用对象实例时，spring会自动将对象实例注入到调用者中去。¹³⁴

希望这能帮到你。还有什么其他问题吗？

源: 与必应的对话， 2023/4/21
(1) Spring 框架 - 概述. https://www.w3schools.cn/spring/spring_overview.asp.
(2) Spring框架的主要功能_hibeary的博客-CSDN博客. https://blog.csdn.net/hibeary/article/details/83641897.
(3) Spring的主要核心_什么是spring容器的内核_啊嘻嘻嘻西八的博客-CSDN博客. https://blog.csdn.net/Saika_xy/article/details/87482474.
(4) Spring核心技术详解(一) - 知乎 - 知乎专栏. https://zhuanlan.zhihu.com/p/93925540.
(5) spring三个核心功能_今朝您好的博客-CSDN博客. https://blog.csdn.net/gengenwa/article/details/118631021.