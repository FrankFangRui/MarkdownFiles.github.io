# SpringMVC 程序开发

## SpringMVC介绍

```
1.Spring MVC 是一个 Web 框架（HTTP)
2.Spring MVC 是基于 Servlet API 构建的
3.来自于 Spring webMVC 模块
```

![image-20230503111420712](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503111420712.png)

SpringMVC是一个基于Java的Web应用程序框架，它属于Spring框架的一部分，旨在简化Web应用程序的开发过程。SpringMVC遵循MVC（Model-View-Controller）设计模式，通过将应用程序逻辑分离为模型、视图和控制器三个组件，有助于提高代码的可维护性和可扩展性。

接下来，我们将逐步了解SpringMVC的组成部分：

1. Model（模型）：模型是应用程序的数据结构和业务逻辑的表示，负责处理数据和与数据库交互。在SpringMVC中，模型通常由Java Beans或POJO（Plain Old Java Objects）实现。

2. View（视图）：视图负责呈现模型中的数据。在SpringMVC中，视图可以是JSP（JavaServer Pages）、Thymeleaf或其他模板引擎生成的HTML页面。

3. Controller（控制器）：控制器是模型和视图之间的协调者，负责处理用户请求并根据请求内容更新模型或选择合适的视图进行响应。在SpringMVC中，控制器通常由带有@RequestMapping或@GetMapping等注解的Java类实现。

4. DispatcherServlet：作为SpringMVC的核心组件，DispatcherServlet负责接收所有HTTP请求，并将请求分发给相应的控制器进行处理。在应用程序初始化时，开发者需要在web.xml文件中配置DispatcherServlet。

5. ApplicationContext：这是Spring框架的核心，负责管理应用程序中的所有Bean。在SpringMVC中，ApplicationContext可以包含Bean定义、Bean的生命周期管理以及依赖注入等功能。

总结一下，SpringMVC是一个基于Java的Web应用程序框架，它遵循MVC设计模式并提供了一系列组件来简化Web应用程序的开发。这些组件包括模型、视图、控制器、DispatcherServlet和ApplicationContext。

## MVC 和 SpringMVC 的关系

MVC（Model-View-Controller）是一种设计模式，用于将应用程序的逻辑分为三个互相关联的组件：模型（Model）、视图（View）和控制器（Controller）。这种分离有助于提高代码的可维护性和可扩展性。而SpringMVC是一个实现了MVC设计模式的Java Web应用框架。下面我们将逐步解释MVC设计模式和SpringMVC之间的关系：

1. Model（模型）：
   - MVC：模型是应用程序的数据结构和业务逻辑的表示，负责处理数据和与数据库交互。
   - SpringMVC：模型通常由Java Beans或POJO（Plain Old Java Objects）实现，负责表示业务数据和业务逻辑。

2. View（视图）：
   - MVC：视图负责呈现模型中的数据。
   - SpringMVC：视图可以是JSP（JavaServer Pages）、Thymeleaf或其他模板引擎生成的HTML页面，负责展示数据给用户。

3. Controller（控制器）：
   - MVC：控制器是模型和视图之间的协调者，负责处理用户请求并根据请求内容更新模型或选择合适的视图进行响应。
   - SpringMVC：控制器通常由带有@RequestMapping或@GetMapping等注解的Java类实现，负责处理用户请求并更新模型或选择视图。

4. 实现方式：
   - MVC：MVC是一种设计模式，可以用不同的编程语言和框架来实现。
   - SpringMVC：SpringMVC是一个基于Java的Web应用程序框架，专门用于实现MVC设计模式。

总结一下，MVC是一种设计模式，用于将应用程序逻辑分为模型、视图和控制器三个组件。SpringMVC则是一个基于Java的Web应用程序框架，它采用了MVC设计模式并提供了一系列组件来简化Web应用程序的开发。因此，SpringMVC与MVC之间的关系是：SpringMVC是MVC设计模式的一种实现。

##  Spring MVC 的作用

SpringMVC框架是一个基于Java的Web应用程序框架，它遵循MVC（Model-View-Controller）设计模式。SpringMVC的主要作用是简化Web应用程序的开发过程、提高代码的可维护性和可扩展性。接下来我们将逐步了解SpringMVC框架的用途：

1. 分离关注点：
   SpringMVC通过MVC设计模式将应用程序的数据处理、用户界面和控制逻辑分离，有助于降低代码的复杂性，提高可维护性。

2. 灵活的视图技术支持：
   SpringMVC支持多种视图技术，如JSP（JavaServer Pages）、Thymeleaf、Freemarker等，开发者可以根据需求选择合适的视图技术。

3. 轻松处理表单数据：
   SpringMVC提供了表单绑定和验证功能，可以轻松处理用户提交的表单数据，简化表单处理过程。

4. 灵活的URL映射和请求处理：
   SpringMVC使用注解（如@RequestMapping、@GetMapping等）来映射URL到控制器方法，提供了灵活的URL映射和请求处理方式。

5. 集成Spring框架：
   SpringMVC是Spring框架的一部分，可以与Spring的其他组件（如IoC容器、事务管理等）无缝集成，提供了一站式的解决方案。

6. 简化测试：
   SpringMVC提供了测试支持，可以方便地进行单元测试和集成测试，有助于保证代码质量。

7. 可扩展性：
   SpringMVC提供了很多可扩展的接口，开发者可以根据需求进行定制和扩展。

总结一下，SpringMVC框架的主要作用包括简化Web应用程序的开发过程、提高代码的可维护性和可扩展性、支持多种视图技术、处理表单数据、灵活的URL映射和请求处理、与Spring框架集成以及简化测试。这些特点使得SpringMVC成为一个非常受欢迎的Java Web应用程序框架。

```
现在绝大部分的 Java 项目都是基于 Spring (或 Spring Boot) 的，而 Spring 的核心就是 Spring MVC
创建项目引入依赖的时候 ，Spring Web 框架 其实就包含 Spring MVC 框架
Spring MVC 是一切项目的基础，之后的所有 Spring,Spring Boot 项目都是基于 Spring MVC 的
```

![image-20230503112925173](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503112925173.png)

## Spring MVC 的使用

```
SSM = Spring + Spring MVC + MyBatis = SSM 项目
新 SSM = SpringBoot + Spring Web (Spring MVC) + MyBatis 
更新的说法： SM 框架（SpringBoot[内置SpringWeb] + MyBatis)
```

```
Spring MVC  创建方式：
1. 使用Maven方式传统的创建 SpringMVC(已过时)
2. 使用 SpringBoot 添加 SpringWeb 模块 = Spring MVC ，添加了才具有 http 的能力
```

![image-20230503121517852](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503121517852.png)

```
关于请求头的详解：
```

![image-20230503154753298](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503154753298.png)

### 1.浏览器获取前端接口和后端程序连接功能实现

#### 1.1 实现方式：@RequestMapping("/xxx") 既能修饰类又能修饰方法

```
   当类上不加直接在方法上加，说明不需要一级路径，只用二级路径（当作一级连接），但如果有两个类都只有修饰方法，且xxx相同，那就会出错
```

```
特性：既支持 GET 方式的请求又支持 POST 方式的请求
```

```
有些情况下，要设置接口只支持 Post/Get
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503154602035.png" alt="image-20230503154602035" style="zoom:50%;" />

```
在 RequestMapping 中有一个 method 方法，可以规定 请求方法的类型
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503154647820.png" alt="image-20230503154647820" style="zoom:50%;" />

![image-20230503155245703](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503155245703.png)

```
设置 只支持 POST 请求
@RequestMapping(value = "/hi",method = RequestMethod.POST)
```

```
此时用 postman 来用 GET 请求访问，就会报错说不支持 GET 方法
```

![image-20230503155442755](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503155442755.png)

#### 1.2 实现方式 @PostMapping("/xxx")

![image-20230503160502981](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503160502981.png)

```
   表示当前接口只支持 POST 方法
   // @RequestMapping(value = "/hi",method = RequestMethod.POST) 等同于
    @PostMapping("/hi")
    表示当前接口只支持 GET 方法
    @GetMapping("/hi")
```

## 获取参数

![image-20230503161252049](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503161252049.png)

![image-20230503161300664](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503161300664.png)

![image-20230503161346973](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503161346973.png)

```
方法（）内的参数名称 和 URL ?后面的参数名称 一定要对应（相同）
（）内只有name一个参数，前端传送了两个参数，最终还是显示一个参数（即匹配上的那个参数）而且不会报错
```

![image-20230503162006922](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503162006922.png)

```
当更改了两个参数之后：
```

![image-20230503162507819](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503162507819.png)

![image-20230503162519251](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503162519251.png)

### 传参数注意事项

```
在SpringBoot(SpringMVC)中传参一定要传 包装类型 ，而非基础类型
```

```
原因： 当需要一个基础类型，但又忘记传递的时候，使用基础类型会报错（程序报500）, 而包装类型不会报错，只是值为 null 而已
```

![image-20230503173444354](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503173444354.png)

![image-20230503173508791](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503173508791.png)

```
将num改为Integer类型
```

![image-20230503173550599](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503173550599.png)

![image-20230503173557191](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503173557191.png)

### 传递多个参数

```
当传递多个参数的时候，如果每次都通过修改方法的形式参数来传递值，会导致如果要添加参数，每次都要修改形式参数，导致代码冗余
如果直接传送一个对象，将属性封装就能解决这个问题
```

![image-20230503175221333](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503175221333.png)

![image-20230503175327421](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503175327421.png)

```
在前端看来 URL传送的内容不会因为将形式参数由属性变为变量而发生改变，因为 URL 中的属性会传送到 形式参数中的对象 的属性，将形式参数由属性变为对象是优化后端代码，在前端中看不出来（前端通过 ajax 或者 form 表单传递参数
```

![image-20230503175249371](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503175249371.png)

![image-20230503175257988](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503175257988.png)

![image-20230503175307351](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503175307351.png)

### 参数重命名

```
当前端在 URL 设置的传递给后端的参数名称没有逻辑的时候，为了自己后端的代码能简明，可以对前端传递过来的参数进行重命名，在（）中的参数前加上 @RequestParam 注解
```

![image-20230503182327070](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503182327070.png)

![image-20230503182438986](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503182438986.png)

![image-20230503182503129](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503182503129.png)

注意 @RequestParam 中的参数要和前端相同，不然会报错

![image-20230503183449250](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503183449250.png)

注意 当重命名 之后 就一定要传 这个参数

如果不想传递，就要 设置 required = false

![image-20230503183304067](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503183304067.png)

![image-20230503183325782](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503183325782.png)

```
required 默认为 true，即默认前端一定要传递这个值
```

![image-20230503183416993](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503183416993.png)

### @RequestBody 接收 JSON 对象

```
form-data原始表单
form-urlencoded加密表单
binary二进制
前端传递是 json 对象
```

![image-20230503184448475](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503184448475.png)

![image-20230503184730983](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503184730983.png)

```
输出的参数不是传入的参数，因为代码中默认接收的是普通对象，不是一个 JSON 对象
```

![image-20230503184843030](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503184843030.png)

```

```

![image-20230503185738464](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503185738464.png)

![image-20230503190107026](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503190107026.png)

```
当添加了 @RequestBody 注解之后， 发送 GET 请求还是没有正确得到数据
原因是 @RequestBody 传入的参数要通过 POST 方法传入
GET没有body，POST有body
传递JSON对象，POST好用，GET不好用，因为不好在URL中输入JSON对象，而在BODY中输入对象格式清除
```

![image-20230503191854778](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503191854778.png)

GET请求可以有body吗？ https://zhuanlan.zhihu.com/p/456921996

![image-20230503190357442](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503190357442.png)

```
当给一个没有@RequestBody 标注的形式参数（对象） 传 JSON 对象的时候，会无法赋值
```

![image-20230503190841413](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503190841413.png)

![image-20230503190849585](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503190849585.png)

```
当添加了 @RequestBody 就可以传送 JSON 对象
```

![image-20230503190940685](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503190940685.png)

![image-20230503190934229](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503190934229.png)

## 配置 IDEA 热部署

```
在改动 IDEA 代码的时候同时会 reload ，不用每次改动代码之后都要重写启动项目
```

```
专业版：
1.引入 devtools 框架依赖
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>
2.启动文件进行配置
```

![image-20230503172118874](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503172118874.png)

![image-20230503172109096](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503172109096.png)

![image-20230503172317437](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230503172317437.png)