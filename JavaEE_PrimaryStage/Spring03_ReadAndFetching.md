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
注意如果此时还存在 <bean>标签所表示的对象，会和包内的对象叠加
```

```
<content:component-scan base-package="com.demo.componet"></content:component-scan>
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422224840427.png" alt="image-20230422224840427" style="zoom:50%;" />

```
2.在对象的类上方添加注释
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422225017071.png" alt="image-20230422225017071" style="zoom:50%;" />

```
3.在Spring中获取Bean对象的时候
```

![image-20230422225119586](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422225119586.png)

```
第一个参数由原来的Id变为 Bean 对象的类名，特别要注意的是 首字母 变为小写
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

