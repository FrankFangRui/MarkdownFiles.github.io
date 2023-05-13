## 3.创建使用Bean对象

### 1.获取Spring上下文对象

```
因为把对象都交给了Spring管理，所以要获取对象就要从Spring当中获取，要么就先要获得Spring的上下文
```

```
// 1. 先得到 Spring 对象
        ApplicationContext context = new ClassPathXmlApplicationContext("spring_config.xml");
```

```
()内是resource文件中的.xml文件路径，也就是要获取的对象存储的地方
```

![image-20230422103636578](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422103636578.png)

#### 通过旧式  BeanFactory 来作为 Spring 的上下文

```
BeanFactory beanFactory = new XmlBeanFactory(new ClassPathResource("spring_config.xml"));
```



### 2.通过Spring上下文对象来获取Bean对象

```
// 2. 在 Spring 当中获取 Bean 对象
// getBean方法
User user = (User)context.getBean("user");
```

```
因为 getBean 方法返回的是Object类型，所以需要强制类型转换一下
()内的ID要和resource中.xml里bean对象的ID相同
```

![image-20230422103929981](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422103929981.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422104200643.png" alt="image-20230422104200643"  />

```
class="" 中填入的是类的路径 包含 包名 加 类名，根路径是 蓝色 java 文件，而不只是类名
```

![image-20230513214436093](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230513214436093.png)

```
通过这个方法，不用 new 一个对象，就获取到了一个对象，这就是Ioc/DI思想
```

### 两个Bean对象指向同一个对象

![image-20230422111703198](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422111703198.png)

![image-20230422111739629](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422111739629.png)

```
通过代码会发现，当两个 Bean 对象，id不同，但是指向同一个 class 对象时候，这两个不同的Bean对象的地址是不同的，也就是说它们不是相同的对象
```

### getBean 方法的更多用法

#### 1. 根据名称来获取 Bean

```
User user = (User) context.getBean("user");
```

```
当在 <beans> 中不存在 id="user"的对象的时候，就存在对 null 强制转换的风险
```

![image-20230422162614128](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422162614128.png)

![image-20230422162556306](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422162556306.png)

#### 2.根据 Bean 对象的类型来获取 Bean

```
User user = context.getBean(User.class);
这个方法不需要强转
```

![image-20230422162002465](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422162002465.png)

```
当 Spring 中存在相同的 bean 对象的时候，就会报错
```

![image-20230422161453608](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422161453608.png)

```
使用这种方法，可以通过类来直接获取对象，而不需要通过 id 来获取 bean 对象，会出现弊端
如果 A 程序员，在 <beans> 当中设置了一个 bean 对象，Class="User", 并使用 getBean(User.class)来获取这个bean对象，而程序员 B 没有查看resource中spring_config.xml文档中有没有A设置的这种变量，不知道 A 使用了User.class作为参数传送给 getBean()，同时正常设置了<beans>中的 bean 对象,id="user",class="User"
这个时候 A 程序员的代码，getBean(User.class),就会出现不知道找哪个 bean 对象的问题,是找 没有id的，还是有id的 User.class?此时就会报错
```

![image-20230422160936352](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422160936352.png)

```
通过报错可以得知，想找一个匹配的 bean 对象但是找到两个，一个对象叫做 user，另一个叫做 User#0 （系统自动分配的）
```

#### 3. 同时根据 id, class 来获取 bean对象 （ 最常见的一种方式）

```
User user = context.getBean("user",User.class);
```

```
根据 bean 对象的 id 和 类型来获取对象
```

```
这个写法最保险，顺滑，不会出现第二钟情况的冲突，也不需要第一种情况的强制类型转换
```

### ApplicationContext 和 BeanFactory 的区别 *********

```
相同点：
1. 都可以获得 Spring 上下文对象
2. 都是来自 Spring 的顶级接口
不同点：
1. 青出于蓝而胜于蓝：因为 Application 是继承于 BeanFactory 的，BeanFactory 只有最基本的访问 Bean 的能力，而 ApplicationContext 除了拥有 BeanFactory 功能之外，还包含更多的功能，如：国际化支持、资源访问、时间传播等
2. ApplicationContext是快餐店，东西都准备好了：性能方面：ApplicationContext 加载方式是将 Bean 对象一次性加载，所以在后面访问 Bean 对象时会很快， BeanFactory 需要某个 Bean 对象时，才加载 Bean 对象，所以它在执行获取 Bean 的时候，比较慢
```

通过代码展现一下 ApplicationContext 和 BeanFactory 在 加载内容 的时间不同

```
User对象，创建成功时候会输出标记
```

![image-20230422192420798](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422192420798.png)

![image-20230422192431295](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422192431295.png)

```
ApplicationContext 对象，创建成功的时候输出标记
```

![image-20230422193425613](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422193425613.png)

```
结果：
```

![image-20230422193432586](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422193432586.png)

```
可以看出，当 context对象创建的那一行代码结束之后，并没有立马输出 context 对象创建成功，而是先创建了 User对象，说明在 ApplicationContext 对象创建的时候，就会一次性加载所有 bean 对象
```

而当使用 beanFactory 来作为上下文对象获取 bean 的时候

![image-20230422193752845](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422193752845.png)

![image-20230422193759322](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230422193759322.png)

```
当 beanFactory 创建的时候，并没有加载 bean 对象，而是下方代码使用到 getBean 的时候，才创建对象
```

### 平铺com.example.demo

![image-20230513220134144](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230513220134144.png)

### 3.使用 Bean （可选项）

```
// 3. 使用Bean（可选项）
System.out.println(user.sayHi());
System.out.println(user2.sayHi());
```

