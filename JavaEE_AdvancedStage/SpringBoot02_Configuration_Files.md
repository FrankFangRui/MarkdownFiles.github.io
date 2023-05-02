# SpringBoot 配置文件

## 1. 配置文件作用

```
配置整个项目中重要的数据
例如：数据库的连接信息，项目的启动端口，第三方系统的调用密钥，用于发现和定位问题的普通日志和异常日志
```

```
SpringBoot 配置文件分为两类
1. 系统使用的配置文件（系统配置文件），如端口号的设置，连接数据库的配置
2. 用户自定义的配置文件
```

```
SpringBoot项目启动，默认端口 8080
```

![image-20230429105755034](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429105755034.png)

![image-20230429105807004](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429105807004.png)

```
通过 application.properties 文件可以修改端口
```

![image-20230429105845435](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429105845435.png)

![image-20230429105906152](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429105906152.png)

```
无需 ; 结尾
此时重新启动项目，就可以用新设置的端口来访问
```

![image-20230429105957115](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429105957115.png)

```
旧端口已经无法访问，8888端口可以访问
每次设置之后，要更改端口号都要重新设置
```

![image-20230429110028106](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429110028106.png)

## 2. 配置文件格式

![image-20230429111835585](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429111835585.png)

```
如果 .properties 和 .yml 文件中设置同一个变量，那么以 .properties 中的内容为主
```

```
一般在一个项目中，只会出现它们两个中的一种，这样可以更好地维护，降低故障率
```

## 3. properties 配置文件说明

### 3.1 properties  和 yml 基本语法

```
SpringBoot 中的 application.properties 和 application.yml 都是配置文件，用于存储 SpringBoot 应用的配置信息。它们的主要区别在于文件格式和语法。接下来，我们将详细介绍这两种配置文件。

1. application.properties
application.properties 是基于 Java Properties 文件格式的配置文件。它使用简单的键值对来表示配置信息。每个键值对占据一行，键与值之间用等号（=）或冒号（:）分隔。这种格式简单易懂，同时也兼容许多 Java 库。

示例：
​```
# 通过 # 来添加注释
server.port=8080
spring.datasource.url=jdbc:mysql://localhost:3306/mydb
spring.datasource.username=root
spring.datasource.password=secret
​```

2. application.yml
application.yml 是基于 YAML (YAML Ain't Markup Language) 文件格式的配置文件。YAML 是一种可读性高且便于人类理解的数据序列化格式。它采用缩进和简洁的符号来表示层级关系，这使得配置文件更加易读。

示例：
​```
server:
  port: 8080
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: root
    password: secret
​```

总结：
application.properties 和 application.yml 都可以用于配置 SpringBoot 应用，但它们具有不同的文件格式和语法。application.properties 是基于 Java Properties 文件格式，使用键值对表示配置信息；而 application.yml 是基于 YAML 文件格式，使用缩进和简洁的符号表示层级关系。选择哪种配置文件取决于您的编程习惯和喜好。
```



### 配置文件的读取方法

```
错误示范：
```

![image-20230429161836254](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429161836254.png)

![image-20230429161916009](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429161916009.png)

![image-20230429162030264](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429162030264.png)

```
这个含义是将 字符串 "mytest" 赋值给 mytest 变量
所以在浏览器中显示 mytest 而不是 张三
```

![image-20230429161956668](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429161956668.png)

```
正确示范：
```

![image-20230429162103701](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429162103701.png)

```
"${XXX}" 是正确的读取 XXX变量 的方法
@Value("XXX") 是将 "XXX" 赋值给 注解修饰 的变量
@Value("${XXX}") 是将配置文件中的 值 赋值给注解修饰的 变量
```

```
当用了正确的方式读取之后，发现浏览器的字符编码错误
```

![image-20230429162621517](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429162621517.png)

```
通过 debugger 来看一下是否是IDEA中返回的字符就出现错误，还是浏览器接收字符出现编码错误
```

![image-20230429162744142](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429162744142.png)

```
给返回字符串的地方打上断点，重新运行项目
```

![image-20230429162815423](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429162815423.png)

```
项目重新运行成功，但是要执行 return mytest 还需要通过 localhost:8888/getcongf 才会进行访问
```

![image-20230429163042582](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429163042582.png)

![image-20230429163116361](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429163116361.png)

```
可以看出读取的时候就是乱码，不是浏览器的问题
```



![image-20230429164229931](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429164229931.png)

![image-20230429174145957](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429174145957.png)

```
要小心 .yml 中的格式
```

![image-20230429174159816](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429174159816.png)

## 4. yml 配置文件说明

```
YAML 的缩写，Yet Another Markup Language ，另一种标记语言
```

![image-20230429164650978](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429164650978.png)

```
一个很大的程序，可能有不同的语言，但是配置文件时都是 .yml 
```

### 4.1 yml 基本语法

```
# 字符串
string.value: Hello
# 布尔值，true或false
boolean.value: true
boolean.value1: false
# 整数
int.value: 10
int.value1: 0b1010_0111_0100_1010_1110 # 二进制
# 浮点数
float.value: 3.14159
float.value1: 314159e-5 # 科学计数法
# Null，~代表null，和 空着不一样
null.value: ~
```

```
key: value 
: 和 value 之间有一个空格不能省略
key不能有缩进
```

![image-20230429170804737](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429170804737.png)



![image-20230429171103532](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429171103532.png)

```
.properties 中有中文会编码错误
.yml 有中文能正常编码
```

### 4.2 yml 使用进阶

#### 字符串的区别

![image-20230429181815604](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429181815604.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429181357137.png" alt="image-20230429181357137" style="zoom:67%;" />

![image-20230429181831378](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429181831378.png)

```
加了 \n 之后
```

![image-20230429181918143](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429181918143.png)

![image-20230429181910631](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429181910631.png)

```
无' " 的字符串和 '' 的字符串，没有将\n转义，而""将\n转义成了换行 ，通过\使转义符哈不要转义
```

![image-20230429182125428](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429182125428.png)

![image-20230429182138270](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429182138270.png)

#### 配置对象

![image-20230429194936527](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429194936527.png)

![image-20230429194918801](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429194918801.png)

```
给对象类使用 @ConfigurationProperties("") 注解来获取 yml 配置文件中的对象属性
使用 @Data 来设置getter,setter,toString() 等方法，以便new对象的时候获取属性
```

![image-20230429195006029](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429195006029.png)

![image-20230429195018830](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429195018830.png)

#### 配置集合

```yaml
dbtypes:
  name:
    - mysql
    - sqlserver
    - db2
```

或者使用行内写法：

```yaml
dbtype: {name: [mysql,sqlserver,db2]}
```

![image-20230429200505806](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429200505806.png)

![image-20230429200527230](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429200527230.png)

![image-20230429200558484](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429200558484.png)

## 5.properties VS yml

![image-20230429200716905](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429200716905.png)

```
properties和yml（YAML）都是用于配置文件的格式，但它们有一些关键区别。以下是这两种格式的比较：

1. 语法和结构：properties文件使用简单的键值对形式，每一行表示一个键值对，键和值之间用等号（=）或冒号（:）分隔。而yml文件使用YAML（YAML Ain't Markup Language）格式，是一种更加人类可读的数据序列化标准，它使用缩进和简洁的符号来表示层次结构和数据类型。

例如，一个properties文件：
​```
database.url = jdbc:mysql://localhost:3306/mydb
database.username = user
database.password = pass
​```

相应的yml文件：
​```yaml
database:
  url: jdbc:mysql://localhost:3306/mydb
  username: user
  password: pass
​```

2. 数据类型和数据结构：properties文件主要用于存储字符串类型的数据，对于复杂的数据结构支持较弱。而yml文件支持多种数据类型，如字符串、数字、布尔值、列表和映射等，可以表示更复杂的数据结构。

3. 可读性：yml文件的可读性相对更好，因为它使用缩进来表示层次结构，使得配置内容更清晰。而properties文件的可读性较差，特别是在有大量键值对时。

4. 注释：properties文件使用井号（#）或感叹号（!）作为注释符号，yml文件使用井号（#）作为注释符号。

5. 应用场景：properties文件主要用于Java应用程序中，它是Java平台的标准配置文件格式。yml文件在许多不同的编程语言和框架中都有广泛应用，如Python、Ruby、Node.js等，Spring Boot等框架也支持yml文件作为配置文件。

总之，properties和yml文件格式各有优缺点。properties文件简单易用，但在表示复杂数据结构时较弱。yml文件具有更好的可读性和更强大的数据结构表示能力，适用于更多的应用场景。在实际项目中，选择哪种格式取决于具体需求和使用场景。
```

## 设置不同环境的配置文件

```
在不同的环境下，例如开发环境和测试环境，往往需要的配置文件不一样，把不同环境的配置都放在一个文件里面容易出现错误而且不好修改
就需要在不同环境在设置不同的配置文件
application-dev.yml
application-prod.yml
```

![image-20230429201840347](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230429201840347.png)

```
此时在主配置文件当中（没有 -XXX 后缀）, 中通过设置
spring:
  profiles:
    active: dev
来决定要用哪一个配置文件
dev指的就是左边yml文件的后缀 (application-dev.yml)

注意在 yml 文件中不能出现重复标签
```

```
在Spring Boot应用程序中，`application.properties`或`application.yml`文件是默认的配置文件，它们包含应用程序的默认配置属性。当您启动应用程序时，Spring Boot会自动加载这些默认配置文件，并使用其中的属性来配置应用程序的各个组件。

如果您想要加载其他配置文件，例如特定于环境的配置文件或自定义配置文件，您可以通过`spring.profiles.active`属性来指定要加载的配置文件。

例如，当您将`spring.profiles.active`设置为`prod`时，Spring Boot将尝试加载以下文件：

- `application.yml` 或 `application.properties`
- `application-prod.yml` 或 `application-prod.properties`

在加载这些文件时，它们的属性将覆盖默认的`application.yml` 或 `application.properties`文件中的属性。

如果您想要加载其他的配置文件，例如`custom-config.yml`，可以将其放置在classpath中，然后在`spring.profiles.active`中指定它的名称，例如：

​```
spring:
  profiles:
    active: custom
​```

这将加载以下文件：

- `application.yml` 或 `application.properties`
- `custom-config.yml`

需要注意的是，当指定了`spring.profiles.active`属性时，Spring Boot只会加载激活的配置文件，并忽略其他配置文件。因此，如果您想要加载多个配置文件，您需要在激活的配置文件中包含所有必要的属性。

如果您的应用程序有其他的配置文件，例如特定于环境的配置文件或自定义配置文件，但没有在spring.profiles.active属性中指定它们的名称，那么这些配置文件将不会被加载。因此，您需要确保在默认的application.yml 或 application.properties配置文件中包含所有必要的属性。

需要注意的是，如果您的应用程序有多个激活的配置文件，例如dev和prod，并且它们都定义了相同的属性，那么最后被加载的属性将是最后一个被加载的配置文件中的属性。这可能会导致属性值被覆盖或覆盖其他属性值的问题。因此，在定义属性时需要小心，确保属性的定义顺序正确，并且不会相互冲突。
```

```
那意思就是没有用active来连接其他文件的话，只会加载 application 文件是吗？
```

```
是的，如果没有指定`spring.profiles.active`属性，Spring Boot将只加载默认的`application.yml` 或 `application.properties`配置文件，而不会加载其他配置文件。如果您没有定义其他配置文件，那么应用程序将只使用默认的`application.yml` 或 `application.properties`文件中的属性来配置应用程序的各个组件。

因此，如果您想要使用其他配置文件来配置应用程序的组件，您需要使用`spring.profiles.active`属性来指定要加载的配置文件，或者将其他配置文件包含在默认的`application.yml` 或 `application.properties`文件中。
```

