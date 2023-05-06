## Spring MVC 接收对象

Spring MVC (Spring Boot -> Spring Web)

### 接收对象的两种类型

#### 1.普通对象

![image-20230504163508955](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504163508955.png)

#### 2.JSON 对象（不等于普通对象）

![image-20230504163535907](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504163535907.png)

![image-20230504163638690](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504163638690.png)

## 获取参数（下）

### 从 URL（（基础） BaseURL）中直接获取参数：

```
传递参数方式1： www.school.com/student?studentId=100
传递参数方式2： www.school.com/student/100
第二种方式更简洁，SEO效果更好
```

```
传递参数方式1和方式2都是将参数传递给网页服务器的方法，但它们在实际使用和SEO（搜索引擎优化）效果上有所不同。

方式1：查询参数（Query Parameter）
这种方式使用URL的问号（?）后面添加参数名和值的形式。例如：www.school.com/student?studentId=100。在这个例子中，参数名是studentId，参数值是100。

方式2：路径参数（Path Parameter）
这种方式将参数值直接添加到URL的路径中。例如：www.school.com/student/100。在这个例子中，参数值100被直接插入到URL路径中。

什么是SEO（搜索引擎优化）？
搜索引擎优化（SEO）是一种通过改进网站内容、结构和技术实现，提高网站在搜索引擎结果页面（SERP）上的排名的方法。网站在搜索引擎结果页面上的排名越高，获得更多访问者的可能性就越大。

为什么第二种传递参数方式SEO效果更好？
相对于查询参数，路径参数对于SEO来说具有以下优势：

1. 更简洁易懂：路径参数的URL结构更加简洁，对用户和搜索引擎来说更容易理解。清晰的URL结构有助于提高搜索引擎对网站内容的抓取和索引效果。

2. 提高关键词权重：路径参数允许将关键词直接放在URL路径中，这有助于提高关键词在搜索引擎排名中的权重。而查询参数中的关键词往往被认为不如路径参数中的关键词重要。

3. 避免重复内容问题：搜索引擎可能会将带有不同查询参数的URL视为不同页面，即使它们实际上显示的是相同内容。使用路径参数可以减少这种重复内容问题的发生。

4. 更好的链接传递权重：当其他网站链接到您的网页时，使用路径参数的URL可以更好地传递链接权重，从而提高您网站在搜索引擎中的排名。

总之，虽然两种传递参数方式都可行，但在SEO效果上，路径参数的URL结构更有优势。当然，SEO并不仅仅取决于URL结构，还需要关注其他许多方面，如内容质量、网站速度和内部链接等。
```

#### @PathVariable 方法

![image-20230504165728292](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504165728292.png)

![image-20230504165734749](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504165734749.png)



```
当想在 URL 中添加参数
```

![image-20230504170245809](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504170245809.png)

![image-20230504170252379](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504170252379.png)

```
一定要保证中间的参数 (and) 和在 URL 中输入的参数一样不然就会出错
```

![image-20230504170338282](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504170338282.png)

```
同样也不能省略参数
```

![image-20230504170653618](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504170653618.png)



#### @RequestPart 上传文件

![image-20230504184208788](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504184208788.png)

![image-20230504185253272](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504185253272.png)

```
解决 文件覆盖 和 上传文件类型 不同的问题
通过拼接 根目录，唯一文件名，文件的后缀的方式来保证每次存储不会覆盖之前的文件和确定文件类型
```

![image-20230504191449516](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504191449516.png)

![image-20230504192140488](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504192140488.png)

```
发现文件名中有-，可以 replace 去除
```

![image-20230504192811243](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504192811243.png)

![image-20230504192225734](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504192225734.png)

```
path += file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

这段代码主要用于处理文件路径和文件扩展名。我们来逐步分析这段代码：

1. `file.getOriginalFilename()`：获取文件的原始文件名，包括扩展名。例如，如果文件名是 "example.txt"，那么这个方法将返回 "example.txt"。

2. `file.getOriginalFilename().lastIndexOf(".")`：在原始文件名中查找最后一个点（.）的索引位置。点号通常用于分隔文件名和扩展名。例如，如果文件名是 "example.txt"，那么这个方法将返回 7（索引从0开始）。

3. `file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."))`：使用 `substring()` 方法从原始文件名中截取最后一个点（.）后面的部分。在这个例子中，从索引7开始截取，得到 ".txt"。

4. `path += ...`：将截取到的扩展名（如 ".txt"）追加到已有的路径字符串 `path`。这通常用于在处理文件上传或文件操作时，将文件的扩展名添加到新的文件名中。例如，如果 `path` 是 "uploads/newfile"，那么这段代码执行后，`path` 将变为 "uploads/newfile.txt"。

总结：这段代码的作用是从原始文件名中提取文件扩展名，并将其添加到给定的路径字符串中。
```

```
file.transferTo(new File(path));
将前端上传的文件存入 path 路径，这个File类型已经通过上面的代码定义好了
这段代码用于将一个文件（通常是上传的文件）保存到服务器的指定路径。我们来分析这段代码的组成部分：

1. `new File(path)`：根据给定的路径字符串 `path` 创建一个新的 `File` 对象。这个 `File` 对象表示服务器上的一个文件，路径为 `path`。例如，如果 `path` 是 "uploads/newfile.txt"，那么这个 `File` 对象表示位于服务器 "uploads" 目录下名为 "newfile.txt" 的文件。

2. `file.transferTo(...)`：这个方法用于将当前的 `file` 对象（通常是一个上传的文件）保存到服务器的指定位置。在这个例子中，服务器的指定位置由 `new File(path)` 表示。`file.transferTo(...)` 方法会将文件内容写入到指定的 `File` 对象中，完成文件在服务器上的保存过程。

总结：这段代码的作用是将一个文件（如上传的文件）保存到服务器的指定路径。具体而言，它将文件内容写入到一个由 `path` 指定的文件中。

```

#### 获取cookie

添加Cookie

![image-20230504200708059](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504200708059.png)

##### (Servlet) 查询所有 cookie，遍历所有cookie

![image-20230504200935411](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504200935411.png)

![image-20230504201002728](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504201002728.png)

##### @CookieValue 获取单个 cookie

![image-20230504202756460](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504202756460.png)

```
为什么在URL没有设置cookie属性，后端也能收到cookie?
因为每一次访问一个网站，浏览器都会将当前网站的所有 cookie 传给后端
```

![image-20230504202554359](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504202554359.png)

### 获取 header

##### (Servlet) 传统方法获取 cookie,header,req中属性

![image-20230504203509126](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504203509126.png)

![image-20230504203547928](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504203547928.png)

##### @RequestHeader 获取 header

![image-20230504203130453](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504203130453.png)

![image-20230504203123273](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504203123273.png)

### Session 的存储和读取

```
Session获取存储方式和Servlet一样，SpringMVC没有提供注解
获取Session肯定不是通过前端URL中参数设置的，因为前端传送的信息都是不安全的，可以通过postman等工具直接绕过前端，**前端是不可信的**，无法判断前端的请求是正常请求还是不正常的
所有需要登录的项目都需要session
```

##### 存储Session

![image-20230504212321706](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504212321706.png)

![image-20230504212344540](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504212344540.png)

##### (Servlet)获取Session

![image-20230504212026812](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504212026812.png)



![image-20230504212206856](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504212206856.png)

![image-20230504212213696](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504212213696.png)

![image-20230504212312076](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504212312076.png)

![image-20230504212927718](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504212927718.png)

```
当把程序停掉，后重启 不访问 setsession,直接访问 getsession 应该说 暂无 session 信息，但是却显示有 session
```

![image-20230504213028224](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504213028224.png)

```
同一个浏览器仍然可以拿到 session
而换一个浏览器就无法获得，因为 session 根据 cookie 获取到，cookie 中会携带 jsessionid 来指名 session
```

![image-20230504213112980](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504213112980.png)



```
当执行了 getsess 之后 cookie 中就出现了 JSESSIONID
```

![image-20230504214249047](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504214249047.png)

```
此时通过访问 getsess 获取 session 对象
```

![image-20230504214320023](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504214320023.png)

```
当删除 cookie 中存储的 jsessionid 浏览器就无法识别当前用户
```

![image-20230504214421668](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504214421668.png)

```
Cookie、Session 和 JSESSIONID 是网络应用程序中用于识别和跟踪用户会话的重要技术。我们可以逐步了解它们之间的关系：

1. Cookie：
   Cookie 是一种通过浏览器存储在用户计算机上的小型文本文件，用于保存有关用户的信息。它们可以用于实现多种功能，例如跟踪用户的登录状态、个性化设置和购物车数据。Cookie 通常包含一个名称、值和到期日期。到期日期定义了 Cookie 存在的时间。当到期日期达到时，Cookie 将被删除。

2. Session：
   Session 是服务器端用来跟踪用户状态的技术。当用户访问一个 Web 应用程序时，服务器会创建一个 Session 对象来存储有关该用户的信息。这使得服务器可以在多个请求之间识别同一用户，从而提供一致的用户体验，例如保持登录状态。由于 Session 是在服务器端存储的，因此它们不会像 Cookie 那样受到用户浏览器设置的影响。

3. JSESSIONID：
   JSESSIONID 是 Java Web 应用程序中使用的一个特殊 Cookie，用于在客户端和服务器之间建立一个关联。当用户首次访问 Java Web 应用程序时，服务器会为其分配一个唯一的 JSESSIONID。然后，浏览器会将此 JSESSIONID 作为 Cookie 存储，并在后续请求中将其发送回服务器。服务器使用这个 JSESSIONID 来查找与用户关联的 Session 对象，从而跟踪用户状态。

总结一下它们之间的关系：

- Cookie 是一种客户端存储技术，用于保存用户相关信息；
- Session 是服务器端的一种技术，用于跟踪用户状态；
- JSESSIONID 是一个特殊的 Cookie，它将客户端的 Cookie 与服务器端的 Session 关联起来。

在整个过程中，Cookie 和 JSESSIONID 充当了联系客户端和服务器端会话的纽带。这使得 Web 应用程序能够跨多个请求为用户提供一致的体验。
```

```
当退出了 IDEA ,即 服务器退出，此时就无法访问了
```

```
当你在同一个浏览器中通过 URL 访问 IDEA（IntelliJ IDEA，一款 Java 集成开发环境）中的服务器时，你实际上是在与 IDEA 的内置服务器进行通信。我们可以逐步了解为什么在项目停止运行后 URL 仍然能访问成功，但在 IDEA 退出后就无法访问成功：

1. 项目运行：
   当你在 IDEA 中启动一个项目时，IDEA 会启动一个内置的服务器来运行你的应用程序。这个服务器负责处理来自浏览器的 HTTP 请求并返回响应。在此阶段，通过 URL 访问服务器是可以成功的，因为服务器正在运行并监听请求。

2. 项目停止运行：
   当你在 IDEA 中停止项目运行时，你可能会认为服务器已经停止，但实际上 IDEA 的内置服务器可能仍在运行。这就是为什么在项目停止运行后，URL 仍然能访问成功。这种情况可能是因为 IDEA 的服务器缓存了你的项目或某些静态资源，或者因为某些设置导致服务器没有完全关闭。

3. 退出 IDEA：
   当你关闭 IDEA 时，它的内置服务器也会完全关闭。由于服务器不再运行，它将不再监听任何来自浏览器的请求。这就是为什么在 IDEA 退出后，通过 URL 访问服务器会失败。

总结一下，当你在同一个浏览器中通过 URL 访问 IDEA 中的服务器时，你实际上是在与 IDEA 的内置服务器进行通信。项目停止运行后，URL 仍然能访问成功，可能是因为服务器仍在运行并缓存了项目或静态资源。当你退出 IDEA 时，内置服务器会完全关闭，导致无法再通过 URL 访问。
```



##### @SessionAttribute获取Session

![image-20230504222907079](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504222907079.png)

![image-20230504222457779](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504222457779.png)

## @ResponseBody 演示

```
当在类上使用了@ResponseBody 注解，返回的是 数据（字符串等）
```

![image-20230504223740079](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504223740079.png)

![image-20230504223842724](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504223842724.png)

```
去除之后，返回的是html页面
```

![image-20230504223817610](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504223817610.png)

![image-20230504223852242](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504223852242.png)



## 计算器演示

![image-20230504225354800](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225354800.png)

```
要通过8080端口访问，而不是打开 calc.html 这个文件
```

![image-20230504225405370](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225405370.png)

![image-20230504225503804](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225503804.png)

![image-20230504225415321](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225415321.png)

```
结果：
```

![image-20230504225521153](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225521153.png)

![image-20230504225527364](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225527364.png)

```
当输入参数不合法
```

![image-20230504225606787](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225606787.png)

![image-20230504225622922](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504225622922.png)



## 返回JSON对象

![image-20230504230136139](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504230136139.png)

![image-20230504230148582](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504230148582.png)

```
Response 返回的类型是 JSON
```

![image-20230504230103017](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230504230103017.png)

## @forward请求转发和请求重定向

