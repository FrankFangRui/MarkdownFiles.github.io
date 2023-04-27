## 4.更简单地读取和存储对象

```
resource 文件中的 .xml 文件中不再有 bean 对象，而是添加
<content:component-scan base-package="XXX"></content:component-scan>
XXX是java文件下的内容
```

![image-20230422222533907](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422222533907.png)

```
使用注解可以更简单地存储和读取对象
1.在 .xml 中配置包名路径，包中存放的是 Bean 对象
注意如果此时还存在 <bean> 标签所表示的对象，会和包内的对象叠加
```

```
<content:component-scan base-package="com.demo.componet"></content:component-scan>
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422224840427.png" alt="image-20230422224840427" style="zoom:50%;" />

```
`<content:component-scan>` 是 Spring Framework 的一个配置元素，用于在指定的包（package）下自动扫描和注册符合条件的类。它的主要作用是简化 Spring 应用程序的配置，通过自动发现和注册符合条件的 Spring bean（如带有 @Component, @Service, @Repository 和 @Controller 注解的类）。

在你给出的示例中：

​```
<content:component-scan base-package="com.demo">
​```

这个配置表示 Spring 将会自动扫描 `com.demo` 包及其子包下的所有类，找到那些带有相关注解（如 @Component, @Service, @Repository 和 @Controller）的类，并将它们自动注册为 Spring bean。这样，你就无需在配置文件中逐个手动注册这些类了，从而简化了配置过程。

这种自动扫描和注册机制使得 Spring 应用程序的组件更易于管理和维护，也提高了代码的可读性和可维护性。
```



```
2.在对象的类上方添加注释
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422225017071.png" alt="image-20230422225017071" style="zoom:50%;" />

```
3.在Spring中获取Bean对象的时候
```

![image-20230422225119586](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422225119586.png)

```
第一个参数由原来的 Bean 标签中的 ID 名字变为 Bean 对象的类名，特别要注意的是 首字母 变为小写
```

### 从源代码中分析特殊问题

```
Q1:如果类名首字母时小写，要怎么从 Spring 中获取 Bean ?
A1:和首字母是大写的输出情况一样，首字母是大写的时候 id 要把类名首字母变小写，而类名首字母小写，可以直接作为 id
```

```
Q2:如果类名的 首字母 和 第二个字母 都是大写的情况，会怎么样？
使用把首字母变为小写当作 id ，会出错，如果直接使用原类名，即第一第二个字母都是大写的情况，就可以成功获取到 Bean 对象
```

```
我们可以查询 Spring 中关于 bean 存储时生成的命名规则：
beanName 存储在 AnnotationBeanNameGenarator 类中存储
```

![image-20230423152359369](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230423152359369.png)

```
在 IDEA 中双击 shift 查找和 bean 有关的类，找到Spring源代码中 AnnotationBeanNameGenerator（生成bean名字） 这个类，看到它最下方的一个方法，发现它返回 注解名字 的时候，调用了 JDK 的源代码 Introspector类中 decapitalize 静态方法
```

![image-20230422225119586](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422225119586.png)

```
（）内传入bean的名字
```

![image-20230423144045088](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230423144045088.png)

![image-20230423144213223](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230423144213223.png)

```
这个 JDK 源代码中，如果第一二个字母中只有第一个字母是大写的，就把它变成小写，如果第一第二个字母都是大写，就不变化
```

```
从而就可以直到 bean 对象的命名规则，1.为空 就返回为空的名字 2.名字长度大于 1 ， 第一第二个字母都是大写的情况，直接返回名字 3. 否则就将首字母小写
```

```
所以说 为什么要用 注解类 类名的首字母小写来 寻找 类对象，因为就是这样存储在 Spring 容器当中的，而上面所说还有两种特殊情况
```

![image-20230423160321677](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230423160321677.png)

### 五大类注解详解

#### 五大类注解的介绍

```
为什么需要五个类注解
1）通过类注解，可以直到类的用途是什么 （看到车牌 闽A 就知道是福州的车）
2）功能有细微不同
```

```
五大类注解用途
1. @Controller(控制器): 归属于业务逻辑层，用来控制用户的行为，它用来检查用户参数的有效性  门卫 防止有人带危险物品进入医院，对进入者进行筛选
【验证数据是否有效（比如说用户输入的密码长度是否合理）】
2. @Service(服务):归属于服务层，调用持久化类实现响应的功能   服务人员，引导患者去哪个诊室
【不实现业务，不直接和数据库交互的，它类似于控制中心, 编排要调用哪些接口，要调用数据库的哪些表，而不是去调用，只是列出计划
计划调用两个持久化类，一个添加用户，一个添加日志（记录了添加了这个用户）】
3. @Repository(仓库)：归属于持久层，直接和数据库进行交互。
通常每一个表都会对应一个 @Repository， 有一个用户登录，就要准备一个用户表，还要准备一个日志表来记录用户登录这个行为，但是关联这两个表是 服务层 做的事情，持久层只是创建表
4. @Configuration(配置):归属于配置层，用来配置当前项目的一些信息，比如说 拦截器 的路由规则，拦截的配置，禁止哪些 URL 登录
5. @Component(组件):归属于公共工具类，提供某些公共方法，例如 将某个密码进行加密和核对密码

```

![image-20230423204257941](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230423204257941.png)

#### 五大类注解之间的关系

```
在一个类上加注解，就是为了让这个类也具有注解的功能
```

![image-20230423205835232](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230423205835232.png)

```
@Component 是另外 四个类注解的父类
```

### 存对象到  Spring  中实现方式2：

```
使用 @Bean 方法注解，将方法返回的对象存储到 Spring 中
如果给所有方法都加 @Bean 注解，Spring在访问的时候，要找查询指定路径下所有类下面的所有方法，效率太低
和在 resource的 .xml 中不使用 指定路径 来确定 Bean 对象 ，而是用 <bean>标签来确认对象一样，效率很低
```

![image-20230426144403834](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426144403834.png)

```
getBean()，中第一个参数指的是 ArticleController 这个类中,会返回对象引用的方法的名字，这个方法前面要有@Bean注解，第二个参数指的是，这个类本身的文件的地址
```

![image-20230426144415858](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426144415858.png)

![image-20230426144456516](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426144456516.png)

![image-20230426144511593](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426144511593.png)

![image-20230424092804630](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424092804630.png)

![image-20230424092821979](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424092821979.png)

![image-20230424093755470](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424093755470.png)

```
直接通过 方法名 来调用 获取Bean 对象（方法返回对象引用）(从类名，变成了方法名字），会出现，如果有多个类，其中有相同的 student 方法，此时 Spring 就会随机调用一个 bean 对象而不是报错
```

```
如何解决这个问题？
在注解之后添加 备注名
```

![image-20230424100453967](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424100453967.png)

![image-20230424100516175](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424100516175.png)

![image-20230424100525287](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424100525287.png)

```
当@Bean设置了 name 属性之后，使用原方法名就无法获得 bean 对象了，只能使用设置的名称才能生效
```

![image-20230424101003425](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424101003425.png)

![image-20230424100840083](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424100840083.png)

```
用原方法名调用，会报错找不到 student 这个 bean 对象，因为已经给 这个 bean 对象设置了代号了
就像新车去车管所上牌，没有牌照交警会通融你，旧车去车管所换个牌，没有拍照会吊销驾照
```



### 从  Spring 更简单地获取 Bean

#### 方式1：属性注入

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424201518407.png" alt="image-20230424201518407" style="zoom:67%;" />

```
Spring不推荐使用属性注入的方式来获取对象
原因：
1）功能性问题：JDK 不能注入 final 修饰的对象 （会和Java语法冲突）
```

![image-20230424201724964](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424201724964.png)

```
final 修饰的对象不可变（基本数据类型：值不可变；引用数据类型：引用指向的对象（地址）不可变）
final 修饰的对象，要么直接赋值（private final int num = 10),要么在构造方法中赋值
```

![image-20230424202336037](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424202336037.png)



![image-20230424202352891](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424202352891.png)

```
2）通用性问题：只适用于 IoC 容器，换成其他框架容器，代码就会报错，@Autowired 修饰的变量值为 null ，因为没有容器给它赋值
```

```
3）设计原则问题：更容易违背单一设计原则
单一设计原则：逻辑明确 ：只做一件事； 耦合度低
数据持久类中都是针对一张表的CRUD而不是针对多张表，如果一个业务要同时操作两张表，在业务逻辑层server中写实现，而不是在数据持久层中操作，下次只要更改一张表也是在server中操作
为什么 “更容易” 因为属性注入简单易用，很容易在一个类中出现多个不必要的变量，就会有可能增加耦合度
```

```
单一设计原则是指一个类或者一个模块只做一件事。让一个类或者一个模块专注于单一的功能，减少耦合性，提高内聚性。这个原则是面向对象设计五大重要原则之一，也被称为 SRP（Single Responsibility Principle。
如果一个类有一个以上的职责，这些职责就耦合在一起，这样会导致代码的复杂度增加，维护难度增加，可读性降低等问题。因此，单一设计原则是面向对象设计中非常重要的一个原则
```

```
如果没有给变量加上@Autowired注解，就会出现空指针异常
下面的代码在 StudentService 类中
```

![image-20230424211221684](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424211221684.png)

![image-20230424211234845](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424211234845.png)

![image-20230424211203593](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424211203593.png)

```
getBean(String var1, Class<T> var2) throws BeansException是Spring Framework中的一个方法，用于从Spring应用程序上下文中检索一个bean。该方法返回一个指定类型的bean实例。其中，var1是bean的名称，var2是bean的类型。如果找不到指定名称和类型的bean，则会抛出BeansException异常。
```

```
getBean 对象返回的是类对象的哈希地址，而这个类对象的哈希地址指向为null，会产生空指针异常
```

![image-20230424211608396](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424211608396.png)

代码解释：

```
首先在 .xml 配置文件中加入等会要用到注解的所有的类的包（从demo开始）
```

![image-20230426152605244](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426152605244.png)

```
ArticleController这个类，就是属性注入的位置，要加上 @Controller 注解，在这个类中有 @Autowired 注解修饰的变量，Spring容器就会去寻找变量并注入这个属性
获取 bean 对象也叫做对象装配，是把对象取出来放到某个类中，有时候也叫对象注入
```

![image-20230426152820184](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426152820184.png)

```
通过Service来调取数据库
```

![image-20230426153757327](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426153757327.png)

```
此时就不需要用到 Article 这个类了，而只是在 Service 中调用
```

![image-20230426154002727](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426154002727.png)

```
即使 Article 这个类不在 .xml 指定目录下也没关系
```

```
获取Spring上下文对象，然后输出
getBean中的参数就是 @Autowired 获取的 bean 对象名字，加上所在的类
```

![image-20230426154150312](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426154150312.png)

#### 方式2：setter 注入

```
Spring4.x之前推荐setter注入
```

![image-20230424214628809](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230424214628809.png)

```
优点：相对于属性注入，更加符合单一设计原则，针对对象方法级别，因为一个 setter 方法只针对一个对象，只有在用到这个对象的时候才会去写
缺点：1）和属性注入一样，不能注入到不可变（final修饰）的对象
2）setter方法是实例方法可以多次调用，意味着注入对象可被修改，注入对象存在被修改的风险
另外属性注入中变量可能会被重新覆盖，重新从Spring容器中赋值，setter注入同样存在这个风险
```

代码解释：

![image-20230426155319615](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426155319615.png)

#### 方式3：构造方法注入

```
如果在一个类当中只有一个构造方法可以省略 @Autowired
```

![image-20230425092930677](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425092930677.png)

![image-20230425092945430](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425092945430.png)

```
如果一个类中有多个构造方法，就需要加上 @Autowired
```

![image-20230425093202584](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425093202584.png)

```
而且需要给每个构造方法都加上@Autowired注解
```

```
优点：
1）final修饰的对象引用本身就只有两种赋值方式：在创建对象引用的时候就赋值，通过构造方法赋值
所以通过构造方法注入就可以注入一个不可变的对象
```

![image-20230425095800966](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425095800966.png)

```
2）注入的对象不会被修改
   a)加了 final 修饰符
   b)构造方法是随着类加载只执行一次的（不想 setter 方法可以通过对象引用执行多次）
3）注入的对象会被完全初始化， 因为在类加载的时候就执行构造方法对对象引用进行注入，所以当用引用来调用其他类中的方法的时候，能保证引用一定被完全初始化，而setter方法，是在类创建好之后Spring再调用的
4）@Autowired 可以省略，说明不在 Spring 中也可以使用，通用性更好
```

代码解释：

![image-20230426155210805](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426155210805.png)

#### 总结

```
日常开发中，使用 属性注入 实现更简单的读取 Bean ，仍然是最主流的方式
因为简单
```

以上的实现方式是一个常见的面试问题



#### @Resource 和 @Autowired 的区别

![image-20230426160132907](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426160132907.png)

```
相同点：目的都是实现依赖注入
不同点：
1.功能支持不同：@Autowired支持属性注入，setter注入，构造方法注入； @Resource 支持属性，setter注入，但不支持构造方法注入
2.出身不同：@Autowired 来自 Spring ，@Resource 来自 JDK
3.参数支持不同：@Resource 支持更多的参数设置，@Autowired 只支持 required 参数
```

```
为什么 @Resource 不能用于构造函数注入，因为在加载A类的时候，如果构造函数要调用到B类，而B类加载的时候，又要调用到A类，就会产生循环依赖问题，给JDK带来很大负担，所以直接删除掉这个功能，而Spring中通过三层缓存解决这个问题
```

```
Spring三层缓存是Spring在启动过程中使用到的三个map，称为三级缓存。会先查询二级缓存，如果发现二级缓存中有该对象，说明其这个bean已经被代理，有了代理对象，则就从二级缓存中获取，如果二级缓存中不存在该对象，则从三级缓存中查询，如果有该对象说明该对象已经被实例化，但是还未被代理，则通常情况下会直接从三级缓存中获取该对象并返回。¹²³

三级缓存的作用是解决Spring的循环依赖问题。²³
Spring从5.3版本开始取消了三级缓存的功能。

源: 与必应的对话， 2023/4/25
(1) Spring的三级缓存各自的作用 - 掘金 - 稀土掘金. https://juejin.cn/post/6939423997826170916.
(2) Spring使用三级缓存解决循环依赖 - 掘金 - 稀土掘金. https://juejin.cn/post/7099745254743474212.
(3) 一文告诉你Spring是如何利用"三级缓存"巧妙解决Bean的循环依赖问题的【享学Spring】. https://cloud.tencent.com/developer/article/1497692.
```

#### @Resource介绍

![image-20230425114434950](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425114434950.png)

![image-20230425114420084](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425114420084.png)

```
如果没有指定对象名字，当 ApplicationContext类的 context 去Spring容器中根据名称，类型去寻找 bean对象的时候，就会说找到两个但是只需要一个 bean 对象，就会说 error creating bean
```

![image-20230425114658027](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425114658027.png)

![image-20230425114641623](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425114641623.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425114746426.png" alt="image-20230425114746426" style="zoom:80%;" />

![image-20230425114759118](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425114759118.png)

```
当换成@Autowired也会报错，但是发现没有和 @Resource（name = "XXX") 一样的设置对象名字的方法
```

![image-20230425115241203](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425115241203.png)

```
解决方法 1：设置接收的类引用的名字和返回对象的方法名一样，把@Resource中的name直接给引用
弊端：增加了代码耦合度，这里的引用名字要受限于 StudentBeans 中的方法名字，如果它那边命名不规范，会导致我这边命名也不规范
```

![image-20230425115458234](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425115458234.png)

```
通过 @Qualifier 注解 来筛选name 起到@Resource( name = "") 中的作用，不用更改自己 private 修饰的Student引用名字
```

![image-20230425115815529](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230425115815529.png)

### 总结

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426165122274.png" alt="image-20230426165122274" style="zoom:50%;" />



![image-20230426165238570](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426165238570.png)

```
ArticleBeans 中放 @Bean 注解修饰的方法，当 Spring 容器需要对象的时候，就从 .xml 文件的指定路径下寻找 @Bean 注解修饰的方法
```

![image-20230426165356130](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426165356130.png)

```
ArticleController 中创建对象引用 Article article 并用
@Autowired
@Qualifier("getArticle1")
修饰，Spring会将找到的Bean对象注入到这个 article 引用当中
```

![image-20230426165219555](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426165219555.png)

```
ArticleService 目前没有用到，主要用来连接数据库，从数据库中查询数据，赋值到对象属性中
```

![image-20230426165709553](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230426165709553.png)

```
Article 对象本身，在ArticleBeans类中已经将这个类变成 @Bean， 通过ArticleBeans可以将依赖（实例）直接赋值给@Autowired修饰的变量，即控制抓换（Ioc),DI（依赖注入）
```

```
依赖注入的依赖指的是什么？
ArticleBeans 将实例（依赖）注入到 ArticleController 当中
依赖注入的依赖指的是类的依赖关系，即一个类需要使用另一个类的实例，这个实例就是依赖。依赖注入（DI）是一种消除类之间依赖关系的设计模式⁴。通过DI，对象只能通过构造函数参数，工厂方法的参数或在构造 或 创建对象实例后在对象实例上设置的属性来定义其依赖关系（即，与它们一起工作的其他对象）²。这样可以使得代码更加灵活，更容易维护和测试⁶。

希望这能帮到你。

源: 与必应的对话， 2023/4/26
(1) 理解依赖注入（DI – Dependency Injection） - 知乎 - 知乎专栏. https://zhuanlan.zhihu.com/p/67032669.
(2) 依赖注入 和 new 一个实例有什么区别吗？ - 知乎. https://www.zhihu.com/question/425602814.
(3) php依赖注入是什么意思-PHP问题-PHP中文网. https://www.php.cn/php-ask-489776.html.
(4) 依赖注入 和 new 一个实例有什么区别吗？ - 知乎. https://bing.com/search?q=%e4%be%9d%e8%b5%96%e6%b3%a8%e5%85%a5%e7%9a%84%e4%be%9d%e8%b5%96%e6%98%af%e4%bb%80%e4%b9%88.
(5) 依赖注入 | Vue.js. https://cn.vuejs.org/guide/components/provide-inject.html.
(6) 依赖注入的简单理解 - 腾讯云开发者社区-腾讯云. https://cloud.tencent.com/developer/article/1914847.
(7) 什么是依赖注入_taijianyu的博客-CSDN博客. https://blog.csdn.net/taijianyu/article/details/2338311.
(8) spring的依赖注入是什么意思 - CSDN博客. https://blog.csdn.net/qq_25843323/article/details/49981671.
(9) 依赖项注入 - .NET | Microsoft Learn. https://learn.microsoft.com/zh-cn/dotnet/core/extensions/dependency-injection.
```

```
依赖注入（Dependency Injection，简称DI）是一种设计模式，用于降低软件组件之间的耦合度，提高代码的可重用性和可测试性。在这个设计模式中，"依赖"（Dependency）通常指的是一个组件或对象所需要的其他组件或对象。

在没有使用依赖注入的情况下，组件或对象通常会自己创建或实例化它所依赖的其他组件或对象。这样做的问题在于，组件或对象之间的耦合度过高，难以进行测试或替换。而依赖注入通过将依赖关系从组件内部移到组件外部，将依赖的创建和管理交给其他组件（如容器或工厂），从而实现解耦。

在依赖注入中，"依赖"是指一个组件在完成自身功能时需要与其他组件协作的关系。通过将这些依赖关系注入到组件中，而非让组件自己创建和管理这些关系，可以使组件之间的依赖关系更加清晰和可控。
```

