Tomcat

![image-20230323093941621](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323093941621.png)

![image-20230319151838264](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319151838264.png)

```
把文件放在webapps这个文件夹中就能被Tomcat访问到
文件放在webapps/ROOT这个文件下，启动Tomcat，文件就能被访问到
但是如果有很多文件的话，ROOT文件夹下就会很乱，可以在webapps文件下创建一个单独的目录，这个单独的文件夹就可以视为一个webapp
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319152713380.png" alt="image-20230319152713380" style="zoom:50%;" />

![image-20230319152754101](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319152754101.png)

## Servlet

### 项目依赖

```
<!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.1.0</version>
    <scope>provided</scope>
</dependency>

```



![image-20230322085317584](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322085317584.png)

![image-20230322085328521](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322085328521.png)

![image-20230319155117432](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319155117432.png)

![image-20230319153238802](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319153238802.png)

![image-20230327094929738](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327094929738.png)

![image-20230319153613671](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319153613671.png)

![image-20230319153602325](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319153602325.png)

## Servlet 执行的完整流程

![image-20230327100457303](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327100457303.png)

![image-20230327100647975](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327100647975.png)

![image-20230327101023312](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327101023312.png)

![image-20230327101049117](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327101049117.png)

![image-20230327101110553](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327101110553.png)

![image-20230327101131624](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327101131624.png)

![image-20230327101344821](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327101344821.png)



### 写一个 servlet 的 hello world

![image-20230319153725154](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319153725154.png)

![image-20230319153755417](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319153755417.png)



### 1. 创建项目

创建一个 maven 项目

![image-20230319154334976](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319154334976.png)

项目创建完之后，目录结构

![image-20230319154612661](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319154612661.png)

```
项目之间依赖关系更强，需要一个构建工具
```

![image-20230319155000272](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319155000272.png)

![image-20230319154918702](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319154918702.png)

### 2. 引入 Servlet 依赖

```
注意要在 pom.xml 中创建 
<dependencies>

</dependencies>
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320090341430.png" alt="image-20230320090341430" style="zoom:67%;" />

```
<!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.1.0</version>
    <scope>provided</scope>
</dependency>

```

![image-20230319155225059](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319155225059.png)

![image-20230319155305045](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319155305045.png)

```
中央仓库网址：www.mvnrepository.com
```

![image-20230319155722510](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319155722510.png)

```
手动在pom.xml中创建dependencies标签
```

![image-20230319155807584](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319155807584.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319160059105.png" alt="image-20230319160059105" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319160122021.png" alt="image-20230319160122021" style="zoom:50%;" />![image-20230319160215532](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319160215532.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319160236696.png" alt="image-20230319160236696" style="zoom:50%;" />



### 3. 创建目录结构

```
在 main 目录下，创建 webapp ,然后在这个目录下创建 WEB-INF 文件，文件下创建 web.xml
web.xml 写的东西直接复制黏贴，是一个固定的东西，不必修改和去背
```

![image-20230319161439961](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319161439961.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319162004172.png" alt="image-20230319162004172" style="zoom:67%;" />

#### web.xml


<!DOCTYPE web-app PUBLIC
"-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
"http://java.sun.com/dtd/web-app_2_3.dtd" >
<web-app>
<display-name>Archetype Created Web Application</display-name>
</web-app>

![image-20230319161853101](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319161853101.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319162044453.png" alt="image-20230319162044453" style="zoom:50%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319162141635.png" alt="image-20230319162141635" style="zoom:67%;" />

### 4. 编写代码

```
代码放在 Java 文件下 ， 也可以创建一些 package
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319162240017.png" alt="image-20230319162240017" style="zoom:67%;" />

![image-20230319162509088](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319162509088.png)

![image-20230319202806824](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319202806824.png)

```
要注意导包
```

![image-20230319162746710](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319162746710.png)

```
doGet 表示，当前Tomcat在收到某些GET请求的时候，会调用这个 doGet 方法
HttpServletRequest req 请求
HttpServletResponse resp 响应
此处 doGET 做的工作，就是"根据请求，计算响应"
req 对象，这是 Tomcat 把 HTTP 请求报文，解析成了一个对象了
```

![image-20230319163224204](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319163224204.png)

![image-20230319163433320](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319163433320.png)

![image-20230319164852132](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319164852132.png)

```
要注释/删除掉自动生成的 super.doGet(req,resp) 这个代码
```

![image-20230319165029771](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319165029771.png)

```
        // 是 Tomcat 这边打印一个日志 (在控制台中打印）
        System.out.println("hello");
        // 给客户端返回一个 hello （返回到前端页面上）
        resp.getWriter().write("hello");    
```

![image-20230322094511338](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322094511338.png)

```
这样是错误的，要加个 / 
```

![image-20230322094533644](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322094533644.png)

![image-20230319165825590](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319165825590.png)

```
满足上述条件（GET请求，URL里面是/hello)此时 tomcat 才会调用到这个的 doGET 方法
```

![image-20230319170137789](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319170137789.png)

![image-20230319170234306](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319170234306.png)

### 5. 打包程序

```
注意打包程序是生成 jar 包（.class文件的打包文件），通过在 pom.xml 文件中添加packing设置来让生成的是 war包，生成的是在当前项目中的 target 目录下，要能在最终的网页上显示，需要把最新生成的 .war 文件放到 Apache 的 webapps 文件下
```

![image-20230319184932066](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319184932066.png)

![image-20230319185032262](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319185032262.png)

![image-20230319185527157](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319185527157.png)

```
然后就会在 targer 目录下生成一个 .jar 文件
```

![image-20230319185606838](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319185606838.png)

```
这时候就需要在 pom.xml 文件中添加一些内容
```

![image-20230319185644240](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319185644240.png)

```
生成了 Tomcat 可识别的 war 包文件
把他放入 Apache 的 webapps 目录下
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319185743392.png" alt="image-20230319185743392" style="zoom:50%;" />

### 6. 部署程序

```
此时要启动 tomcat
```

![image-20230319190118945](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319190118945.png)

```
war包就会在 webapps 中被 Tomcat 解压缩
```

![image-20230319190658840](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319190658840.png)

```
解压缩之后的效果：
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319191017180.png" alt="image-20230319191017180" style="zoom:67%;" />

### 7. 验证程序

```
通过浏览器，构造一个HTTP请求，来访问 Tomcat 服务器
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319191319427.png" alt="image-20230319191319427" style="zoom:50%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319191343540.png" alt="image-20230319191343540" style="zoom:50%;" />

![image-20230319191539448](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319191539448.png)

```
上面的输出打印到 Tomcat 控制台，下面打印到网页
```

![image-20230319192252518](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319192252518.png)

```
Apache的webapps文件目录下存放着很多webapp,通过第一级目录确认是webapps中的那个webapp 
```

![image-20230319192508908](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319192508908.png)

![image-20230319192531919](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319192531919.png)

```
找到 HelloServlet 这个类 之后自动创建实例
```

![image-20230319192602706](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319192602706.png)

![image-20230319192744503](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319192744503.png)

![image-20230319193752120](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319193752120.png)

![image-20230319194640947](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319194640947.png)

![image-20230319194942367](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319194942367.png)

![image-20230319195439485](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319195439485.png)

![image-20230319200711210](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319200711210.png)

![image-20230319200727226](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230319200727226.png)

## Servlet-2

### 自动配置

![image-20230320091930086](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320091930086.png)

![image-20230320091948813](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320091948813.png)

![image-20230320092431660](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320092431660.png)

```
如果没有这个插件，也可以从官网上面下载
```

![image-20230320094153768](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320094153768.png)



![image-20230320095421095](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320095421095.png)

```
下拉窗中点击 edit configuration ，点击弹出窗口左边的➕，添加 smartcat,这里的 ContentPath 是第一级目录
```

![image-20230320094122085](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320094122085.png)

```
配置成功之后，点击开始按钮
```

![image-20230320095502149](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320095502149.png)

```
配置发现错误
```

![image-20230320095643283](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320095643283.png)

![image-20230320095658812](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320095658812.png)

![image-20230320095724350](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320095724350.png)

![image-20230320095946283](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320095946283.png)

![image-20230320100013517](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320100013517.png)

```
当把 Startup 窗口关闭之后，再次启动 java105-2
```

![image-20230320100057990](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320100057990.png)

![image-20230320103144721](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320103144721.png)

![image-20230320103314952](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320103314952.png)

```
通过 startup 启动 tomcat ，在 127.0.0.1:8080 下有欢迎页面
```

![image-20230320103509371](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320103509371.png)

### ![image-20230320103640787](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320103640787.png)

### 浏览器报错

#### 404

![image-20230320104204514](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320104204514.png)

![image-20230320104304715](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320104304715.png)

![image-20230320104317846](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320104317846.png)

![image-20230320104339522](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320104339522.png)

![image-20230320104805975](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320104805975.png)

![image-20230320104838967](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320104838967.png)

![image-20230320104914477](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320104914477.png)

#### 405

![image-20230320105428628](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320105428628.png)

![image-20230320105542624](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320105542624.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320105550349.png" alt="image-20230320105550349" style="zoom:50%;" />



![image-20230320105734448](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320105734448.png)

```
super.doGet(req,resp);
如果程序员没有重写方法，super方法就会调用父类方法报错
```

![image-20230320110622652](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320110622652.png)

![image-20230320111041119](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320111041119.png)

#### 500

![image-20230320111055260](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320111055260.png)

![image-20230320111109845](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320111109845.png)

![image-20230320111120144](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320111120144.png)

![image-20230320111537445](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320111537445.png)

![image-20230320111640351](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320111640351.png)

![image-20230320112434039](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320112434039.png)

### Servlet API 详解

![image-20230320112505302](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320112505302.png)

![image-20230320112746862](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320112746862.png)

![image-20230320112815085](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320112815085.png)

![image-20230320113144138](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320113144138.png)



![image-20230320113056032](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320113056032.png)

![image-20230320113128984](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230320113128984.png)

### Servlet的生命周期

```
你好，这是Bing。我可以帮你回答Servlet的生命周期是什么。根据搜索结果¹²³，Servlet的生命周期由创建、初始化、服务请求和销毁四个阶段组成。具体来说：

- 创建阶段：当Web服务器接收到客户端请求Servlet时，会检查是否已经加载了该Servlet类，如果没有，则会加载该类并创建其实例。
- 初始化阶段：当Servlet实例被创建后，Web服务器会调用其init()方法进行初始化操作，如获取配置参数、建立数据库连接等。
- 服务阶段：当Servlet实例被初始化后，Web服务器会调用其service()方法来处理客户端的请求。service()方法会根据请求类型（如GET或POST）调用相应的doGet()或doPost()方法来执行具体的业务逻辑。
- 销毁阶段：当Web服务器不再需要Servlet实例时，会调用其destroy()方法来释放资源和清理工作。最后，Servlet实例会被垃圾回收器回收。

这就是我对Servlet的生命周期的理解。你还有什么问题吗？

源: 与必应的对话， 2023/3/21(1) 【愚公系列】2023年03月 Java教学课程 086-Servlet服务器生命周期和 .... https://cloud.tencent.com/developer/article/2240898 访问时间 2023/3/21.
(2) Servlet的生命周期_servlet生命周期的三个阶段_zhouym_的博客-CSDN博客. https://blog.csdn.net/zhouym_/article/details/90741337 访问时间 2023/3/21.
(3) Servlet的生命周期和方法_diao_梓键的博客-CSDN博客. https://blog.csdn.net/airooter/article/details/110038171 访问时间 2023/3/21.
(4) java基础面试题（Servlet生命周期） - genkun - 博客园. https://www.cnblogs.com/lgk8023/p/6427977.html 访问时间 2023/3/21.
(5) Servlet 生命周期 | 菜鸟教程. https://www.runoob.com/servlet/servlet-life-cycle.html 访问时间 2023/3/21.
(6) Servlet生命周期详解_super_.的博客-CSDN博客. https://blog.csdn.net/super_DuoLa/article/details/122173346 访问时间 2023/3/21.
```

![image-20230321201623913](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230321201623913.png)



## Servlet-3

### 枚举类

![image-20230322091449149](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322091449149.png)

```
枚举类是Java中的一种特殊类型，它是一种固定的常量集合。枚举类型的每个值都是一个常量，也称为枚举常量。在Java中，枚举类型是一种特殊的类，它可以包含方法和构造函数。以下是一个简单的枚举类的例子：

​```
enum Color {
    RED, GREEN, BLUE;
}
​```

在这个例子中，我们定义了一个名为Color的枚举类型，它包含三个枚举常量：RED、GREEN和BLUE。这些常量都是Color类型的实例。你可以像这样使用它们：

​```
Color c = Color.RED;
​```

这将创建一个名为c的Color类型的变量，并将其设置为RED枚举常量的值。你可以使用switch语句来测试枚举类型的值，就像这样：

​```
switch (c) {
    case RED:
        System.out.println("Color is red");
        break;
    case GREEN:
        System.out.println("Color is green");
        break;
    case BLUE:
        System.out.println("Color is blue");
        break;
}
​```

这将输出“Color is red”，因为我们将c设置为RED枚举常量的值。希望这可以帮助你理解枚举类的基本概念。你还有其他问题吗？
```





```
URI 和 URL 的区别是什么？
```

![image-20230321202544626](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230321202544626.png)

![image-20230321202602130](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230321202602130.png)

![image-20230321201243282](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230321201243282.png)

### HttpServletRequest

![image-20230321202800835](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230321202800835.png)

```
QueryString
好的，我来给你展示一下HTTP请求中的queryString长什么样子。根据搜索结果¹²³⁴，我们可以看到：

- queryString是一种HTTP请求参数的传递方式，它 只 适用于GET请求，它将参数以键值对的形式附加在URL后面，以?开头，并以&分隔。
- 一个queryString的例子是：`https://bing.com/search?q=HTTP%e8%af%b7%e6%b1%82%e4%b8%ad%e7 %9a %84+queryString`，其中q是参数名，HTTP请求中的queryString是参数值，它们之间用=连接。

你看到了吗？queryString就是URL后面跟着的一串字符。你觉得这样回答清楚吗？
 
```

![image-20230321203048177](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230321203048177.png)

```
返回name（key)对应的值
```

![image-20230321203120952](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230321203120952.png)

```
获取key值
```



![image-20230322085547045](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322085547045.png)

![image-20230322084831571](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322084831571.png)



![image-20230322090008903](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322090008903.png)

![image-20230322090017322](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322090017322.png)

```
QueryString 会在第五行打印，如果URL中没有的话就会显示null,
QS的格式是：以 ？ 开头， & 连接键值对
在Web中不包含 ？开头，JS中包含 ？
```

![image-20230322090444402](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322090444402.png)

![image-20230322090547776](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322090547776.png)



![image-20230322092217001](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322092217001.png)

![image-20230322092534424](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322092534424.png)

![image-20230322092202134](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322092202134.png)

![image-20230322093543701](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322093543701.png)

![image-20230322093557664](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322093557664.png)

![image-20230322094924167](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322094924167.png)

![image-20230322095100331](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322095100331.png)

![image-20230322100017204](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322100017204.png)

```
chrome 会自动将输入的中文进行 encode（不是所有浏览器都会这样）,我们也可以找个urlencode网站，将输入的中文进行encode，编码的结果再放入url当中
```

![image-20230322100158560](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322100158560.png)

![image-20230322140419614](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322140419614.png)

![image-20230322140438429](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322140438429.png)

![image-20230322140448684](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322140448684.png)

![image-20230322140517897](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322140517897.png)

![image-20230322140531273](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322140531273.png)

### 通过POST获取 body（x-www-form-urlencoded） 中的参数

![image-20230322160155099](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322160155099.png)

```
在 URL 后面添加请求是 GET 请求
用 postman 构造 才是 POST 请求
```

![image-20230322142208367](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322142208367.png)

#### form形式发送Post

![image-20230322143856401](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322143856401.png)

![image-20230322144438201](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322144438201.png)

![image-20230322144507562](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322144507562.png)

```html
<!DOCTYPE html>
<html>
<body>

<form action="/action_page.php">
  <label for="fname">First name:</label><br>
  <input type="text" id="fname" name="fname"><br>
  <label for="lname">Last name:</label><br>
  <input type="text" id="lname" name="lname"><br><br>
  <input type="submit" value="Submit">
</form> 

</body>
</html>
```

![image-20230322144634464](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322144634464.png)

![image-20230322145049965](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322145049965.png)

![image-20230322145058677](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322145058677.png)

```
id 是为了确定 input 是哪一个label,name 确定提交时候的内容是哪一个表的，name是url中键值对的键
```

![image-20230322150004004](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150004004.png)

![image-20230322150118074](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150118074.png)

```
绝对路径最左边要加上 / 
```

![image-20230322150300871](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150300871.png)

![image-20230322150649088](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150649088.png)

![image-20230322150654383](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150654383.png)

```
在浏览器中提交的时候，可以通过 fiddler 看POST请求内容
```

![image-20230322150801208](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150801208.png)

![image-20230322150806529](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150806529.png)

```
body 中 中文被自动encode了
```

![image-20230322150901533](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150901533.png)

```
form表单的content-type
```

![image-20230322150921315](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322150921315.png)

```
注意请求头要正确
```

![image-20230322152354066](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322152354066.png)

![image-20230322151124190](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322151124190.png)

```
发现响应的页面乱码了，但是IDEA窗口中的输出结果说明服务器针对请求的解析就已经乱了，还需要显示地告诉 servlet ，你按照哪种编码来理解请求的body,需要给解析请求这里也加上对于编码方式的声明
```

![image-20230322151410670](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322151410670.png)

```
请求这里设置的utf8是告诉servlet(tomcat)如何解析，响应这里设置的utf8是告诉浏览器如何解析
```

![image-20230322151911885](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322151911885.png)

![image-20230322152024143](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322152024143.png)

#### 使用postman发送POST

![image-20230322153556060](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322153556060.png)

### 通过POST获取 body(json)中的参数

![image-20230322164246832](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322164246832.png)

![image-20230322164255023](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322164255023.png)

![image-20230322171141565](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322171141565.png)

```
去 www.mvnrespository.com中找到Jackson Databind，把里面的代码配置到 pom.xml 的dependencies当中
```

![image-20230324194532472](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324194532472.png)

![image-20230322171513904](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322171513904.png)

![image-20230322171701230](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322171701230.png)

![image-20230322172206656](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322172206656.png)

```
json -> java
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322172627447.png" alt="image-20230322172627447" style="zoom:67%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322172915148.png" alt="image-20230322172915148" style="zoom:67%;" />

```java
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 方锐
 * @since 2023/3/22 16:45
 */
class Student {
    // 1.这个类里面的属性必须是 public 或者带有 public 的 getter/setter
    // 否则 jaskson 无法访问这个对象的属性
    // 2.这个类必须要有无参版本的构造方法，如果不写任何构造方法，编译器能够自动生成无参构造方法
    public int studentId;
    public String studentName;
}

@WebServlet("/json")
public class JsonServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 此处假设请求的body格式为
        // { studentId: 10,studentName:张三
        // jackson 提供的核心的类
        // 一个方法叫做 readValue,把 json 格式的数据转成 java 的对象
        // 还有一个方法叫做 writeAsString,把 java 对象转成 json 格式的字符串
        ObjectMapper objectMapper = new ObjectMapper();
        // readValue 第一个参数可以是字符串，也可以是输入流
        // 第二个参数，是一个类对象, 就是要解析出来的结果的对象的类
        Student s = objectMapper.readValue(req.getInputStream(),Student.class);
        System.out.println(s.studentId);
        System.out.println(s.studentName);
// 上图图一
//        resp.setContentType("text/html; charset=utf8");
//        resp.getWriter().write(s.studentId + ", " + s.studentName);
 
 // 上图图二
        resp.setContentType("application/json;charset=utf8");
     resp.getWriter().write(objectMapper.writeValueAsString(s));
    }
}

```

![image-20230322173220225](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230322173220225.png)

### HttpServletResponse

#### 状态码

```
这些状态码具体怎么处理（前端页面显示啥）都是属于程序员自定义的
```

![image-20230323161912492](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323161912492.png)

```
setHeader(ContentType,value) 
等价于
setContentType(value)
```

```
因为HttpServletResponse对象是一个空对象，所以这些方法都是用来往这个空对象中设置参数的
```

![image-20230323164343211](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323164343211.png)

![image-20230323164757503](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323164757503.png)

```
此时网页不会有内容，因为代码就不包含输出
```

![image-20230323165402090](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323165402090.png)

```
通过Fiddler抓包，发现响应中 status 为 200
```

![image-20230323170057015](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323170057015.png)

![image-20230323170211646](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323170211646.png)

```
如果想要抓包的内容响应更加丰富，可以让 tomcat 返回一个自带的错误页面
```

![image-20230323170337618](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323170337618.png)

![image-20230323170331201](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323170331201.png)



![image-20230323170431770](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323170431770.png)

![image-20230323170443769](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323170443769.png)

![image-20230323170515487](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323170515487.png)

#### 设置响应  header

##### refresh

```
通过设置 header 头，实现页面的自动刷新
header 设置 refresh 属性 ， 值是一个 “ 秒数 ” 
浏览器就会在时间到了之后自动刷新
```

![image-20230323172605513](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323172605513.png)

```
通过 refresh 操作就可以避免人工一直点刷新，让新内容重新出来
```

![image-20230323191515779](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323191515779.png)

![image-20230323191539629](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323191539629.png)

```
每隔一秒 就发送一个响应包来刷新页面
```

![屏幕截图 2023-03-23 191627](C:\Users\方锐\Pictures\Screenshots\屏幕截图 2023-03-23 191627.png)![屏幕截图 2023-03-23 191622](C:\Users\方锐\Pictures\Screenshots\屏幕截图 2023-03-23 191622.png)

```
相隔的时间不是刚好 1 s
视频中是 2s
```

![image-20230323191813669](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323191813669.png)![image-20230323192314160](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323192314160.png)

##### redirect

```
重定向响应
```

![image-20230323192730610](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323192730610.png)

![image-20230323192704087](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323192704087.png)

![image-20230323192805231](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323192805231.png)

### 表白墙

![image-20230323194144666](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323194144666.png)

```
1. 做好准备工作，创建项目，pom.xml中引入jackson,servlet依赖（dependency),创建目录结构 src目录下 webapp/WEB-INF/web.xml，导入固定代码
2. 设计一下前后端如何交互 （ 前端啥时候给后端发请求，发的请求啥样的，返回的请求啥样的）
```

#### 1.准备工作

![image-20230323195839428](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230323195839428.png)![image-20230324092253818](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324092253818.png)

![image-20230324094147827](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324094147827.png)

![image-20230324094157318](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324094157318.png)

![image-20230325154813010](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325154813010.png)

![image-20230324094223246](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324094223246.png)

#### 2.设置前后端如何交互

##### doPost

```
首先在前端页面中添加 jQuery CDN
```

![image-20230325155334273](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325155334273.png)



![image-20230325155638622](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325155638622.png)

![image-20230324191121381](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324193903186.png)



![image-20230325160050885](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325160050885.png)

![image-20230325160249954](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325160249954.png)

![image-20230324191855249](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324191855249.png)

![image-20230324191908828](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324191908828.png)

![image-20230324191926681](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324191926681.png)

![image-20230324194104650](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324194104650.png)

![image-20230324194243396](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324194243396.png)

![image-20230325161936919](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325161936919.png)

```
let data{...} 为后续转成 json 格式打下基础
```

![image-20230325161551969](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325161551969.png)

![image-20230326112721427](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326112721427.png)

![image-20230326112608774](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326112608774.png)

![image-20230325162158755](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325162158755.png)

```
要把 .html 文件放到 webapp 下才能访问的到
```

```
通过 fiddler 抓包
```

![image-20230325163711050](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325163711050.png)

![image-20230325163813837](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325163813837.png)

![image-20230325164637098](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325164637098.png)

![image-20230325164648653](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325164648653.png)

![image-20230325164653386](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325164653386.png)

![image-20230325164743176](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325164743176.png)

##### doGet

```
doPost 已经将信息传送到服务器，要通过doGet来获取信息
什么时候发送 doPost 进行读档操作？ 在页面刷新重载的时候
```

![image-20230325165320660](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325165320660.png)

![image-20230325172133022](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325172133022.png)

```
在前端中添加内容，因为 script 标签中的代码，在页面刷新的时候执行，所以在页面刷新的时候会提交 ajax 请求
```

![image-20230325172048418](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325172048418.png)

```
效果：
```

![image-20230325192500512](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325192500512.png)

```
当发送完信息之后，再次刷新网页，就会发现提交下面的那些信息还在
因为刷新的时候发送了 GET 
每刷新一次页面，都会重新发送一次 GET请求给网页，网页会返回响应
```

![image-20230326120917456](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326120917456.png)

![image-20230325192704516](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325192704516.png)

```
交互数据：
```

![image-20230325192734236](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325192734236.png)

```
上面的交互数据中最下方的数据，会作为 body 传送到 function() 当中
```

![image-20230325192942408](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325192942408.png)

![image-20230325193050717](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325193050717.png)

```
然后内容会被添加到 container 之后
```

![image-20230325193122221](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325193122221.png)



```
整个程序，有两个环节涉及到前后端交互
1.点击提交的时候，把当前输入框的内容发送到服务器
   客户端在按钮的 onclick 中，构造一个 ajax, 发送一个post请求
```

![image-20230325195459497](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325195459497.png)

![image-20230325201349176](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325201349176.png)

![image-20230325195601916](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325195601916.png)

```
通过 doPost 处理 ajax 发送的请求
```

![image-20230325195859655](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325195859655.png)



```
2.页面加载的时候，从服务器获取到数据的列表
```

![image-20230325201430859](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325201430859.png)

```
发给服务器 GET 请求
```

![image-20230325201521753](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325201521753.png)

```
服务器执行 doGet 方法
```

![image-20230325201550989](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325201550989.png)

```
doGet 方法接收GET请求
这个请求目的是为了获取数据，没有什么参数要接收和解析
```

![image-20230325201716622](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325201716622.png)

```
把 post 存入 messageList 的数据，转成 json形式的字符串并进行返回
```

![image-20230325202330335](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325202330335.png)

```
得到响应数据的结果，然后这一串数据作为响应的正文（body)传送给 funtion(body)
```

![image-20230325202426065](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325202426065.png)

![image-20230325202532877](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325202532877.png)

```
body 就是响应的正文，只不过类型被 jQuery 给自动转换了，本来是 String 类型，自动转成 对象数组 了，如果 jQuery 没有做这个事情，就需要 JSON.parse 来完成
```

```
循环遍历来取出元素，构造 div 连接到 container 中
```

![image-20230325203014490](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325203014490.png)

![image-20230325203100367](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325203100367.png)

#### JDBC版本-将数据存储到数据库当中

![image-20230325204609756](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230325204609756.png)

```java
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 方锐
 * @since 2023/3/23 19:52
 */
@WebServlet("/message")
public class MessageServlet extends HttpServlet {
    //这个对象在doGet,doPost方法中都需要使用,直接设置为成员变量
    private ObjectMapper objectMapper = new ObjectMapper();
    private List<Message> messageList = new ArrayList<>();

    //负责让页面获取到数据
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 显示声明当前的响应数据类型，不要让客户端去猜，也为了能在前端代码中让 jquery 自动识别数据内容并解析
        resp.setContentType("application/json; charset=utf8");
        //只需要一行代码， 把 messageList 转成 json 字符串，并返回给页面即可
        //通过 writeValueAsString 把服务器上保存的 json 数据转换成 String，通过write输出到屏幕上
//        resp.getWriter().write(objectMapper.writeValueAsString(messageList));
        try {

            List<Message> messageList = load();
            resp.getWriter().write(objectMapper.writeValueAsString(messageList));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 提交数据
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取到 body 中的数据并解析
        // req.getInputStream() 获取发送过来的 req 中的请求体中的内容，将其转换成 Message.class 中的Java形式
        Message message = objectMapper.readValue(req.getInputStream(),Message.class);
        // 把 message 保存一下，最简单的办法就是保存在内存当中（用 List 来保存一下）
        try {
            save(message);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.setStatus(200);
        System.out.println("提交数据成功：from=" + message.getFrom()
                + ", to=" + message.getTo() + ", message=" + message.getMessage());
    }
    private List<Message> load() throws SQLException {
        // 从数据库查询数据

        // 把数据保存到数据库中

        // 1. 先有一个数据源
        DataSource dataSource = new MysqlDataSource();
        ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/java105?characterEncoding=utf8&useSSL=false");
        ((MysqlDataSource)dataSource).setUser("root");
        ((MysqlDataSource)dataSource).setPassword("123123");

        // 2.建立连接
        Connection connection = dataSource.getConnection();

        // 3.构造 SQL
        String sql = "select * from message";
        PreparedStatement statement = connection.prepareStatement(sql);


        // 4.执行 SQL
        ResultSet resultSet = statement.executeQuery();


        // 5.遍历结果集合
        List<Message> messageList = new ArrayList<>();
        while(resultSet.next()){
            Message message = new Message();
            message.setFrom(resultSet.getString("from"));
            message.setTo(resultSet.getString("to"));
            message.setMessage(resultSet.getString("message"));
            messageList.add(message);
        }

        // 6.关闭连接
        statement.close();
        connection.close();
        return messageList;
    }
    private void save(Message message) throws SQLException {
        // 把数据保存到数据库中

        // 1. 先有一个数据源
        DataSource dataSource = new MysqlDataSource();
        ((MysqlDataSource)dataSource).setURL("jdbc:mysql://127.0.0.1:3306/java105?characterEncoding=utf8&useSSL=false");
        ((MysqlDataSource)dataSource).setUser("root");
        ((MysqlDataSource)dataSource).setPassword("123123");

        // 2.建立连接
        Connection connection = dataSource.getConnection();

        // 3.构造 SQL
        String sql = "insert into message values(?,?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,message.getFrom());
        statement.setString(2,message.getTo());
        statement.setString(3,message.getMessage());

        // 4.执行 SQL
        int ret = statement.executeUpdate();
        System.out.println("ret = " + ret);

        // 5.关闭连接
        statement.close();
        connection.close();
    }
}

```

```
注意 URL 的填写
注意导包的名字，有不同类型的包，导入 .sql 类型的
```

## Servlet-4

### 单例模式处理DataSource

![image-20230329150157118](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329150157118.png)

```
在 save，load 这两个方法中分别存在一个 DataSource, 没有必要，容易产生误区，可以用单例模式把它们同时表示出来
```

![image-20230329153632000](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329153632000.png)

### Cookie 和 Session

![image-20230329161423957](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329161423957.png)

![image-20230329162026491](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329162026491.png)

![image-20230412170335071](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230412170335071.png)

![image-20230412171239151](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230412171239151.png)

#### HttpServletRequest

![image-20230329162041915](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329162041915.png)

```
getSession() 中填入 true 和 false 的区别就是
如果当前会话存在，直接返回对应的 HttpSession
如果当前会话不存在，false 会直接返回null
而 true 会直接创建一个键值对，键保存到服务器的哈希表中，值(sessionId)返回到浏览器
```

#### HttpServletResponse

![image-20230329163252738](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329163252738.png)

#### HttpSession

![image-20230329164638599](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329164638599.png)

![image-20230329164649267](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329164649267.png)

#### 模拟登录案例

![image-20230329164810846](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329164810846.png)

![image-20230329171350371](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329171350371.png)

```
action="login" 表示login是相对路径
```

![image-20230329171849167](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329171849167.png)

![image-20230329172604454](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329172604454.png)

![image-20230329172622697](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329172622697.png)

![image-20230329172754784](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329172754784.png)

![image-20230329172843869](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329172843869.png)

```
login.html 中 的 form 表单的name和 req.getParameter("") 中填入的字符串 要一样
action="login" 要和类前的 @WebServlet("/login") 要对应
```

![image-20230329172826461](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230329172826461.png)

##### 登录失败

```
页面因为html的password会把密码变成⚪⚪，但是在 POST请求中能看到密码
```

![image-20230331210251125](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331210251125.png)

```
失败的时候 resp的status是设定的 403
```

![image-20230331210350491](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331210350491.png)

##### 登录成功

```
登录成功，resq的status是302
```

![image-20230331212822427](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331212822427.png)

```
登录成功之后会有两条http请求
一条是登录的请求，一条是重定向的请求
重定向的请求resp的status是404，因为没有设置重定向的地址
```

![image-20230331210632289](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331210632289.png)

![image-20230331212908438](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331212908438.png)

![image-20230331210816338](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331210816338.png)

![image-20230331212608535](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331212608535.png)

```
登录成功之后服务器返回的 resp，同时服务器通过getSession,生成 sessionId
```

![image-20230331213417554](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331213417554.png)

```
然后把这个sessionId通过 resp 的 Set-Cookie 返回给浏览器
resp中还包含 location 告诉浏览器往哪里跳转
```

![image-20230331213510138](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331213510138.png)

![image-20230331213039646](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230331213039646.png)

![image-20230401093535032](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401093535032.png)

![image-20230401093652231](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401093652231.png)![image-20230401095339651](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401095339651.png)

![image-20230401095413164](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401095413164.png)

### 上传文件

![image-20230401100342702](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401100342702.png)

![image-20230401100637494](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401100637494.png)

![image-20230401101119807](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401101119807.png)

![image-20230401101232583](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401101232583.png)

![image-20230401101241793](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401101241793.png)

![image-20230401101847422](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401101847422.png)

![image-20230401101859538](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401101859538.png)

```
上传之后，保存在电脑的文件当中（之后会保存在服务器当中）
```

![image-20230401102136277](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401102136277.png)

![image-20230401102209032](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401102209032.png)

#### post请求

![image-20230401102433958](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401102433958.png)

![image-20230401102519079](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230401102519079.png)

