# SpringBoot统一功能处理

## Spring拦截器实现统一用户登录权限验证

### 1.实现拦截器

```
1.实现 HandlerInterceptor 接口
2.重写 preHandle 方法，在方法中编写自己的业务代码
```

![image-20230516145854246](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516145854246.png)

### 2.设置拦截规则

```
将拦截器添加到配置文件当中，并且设置拦截的规则
```

![image-20230516150620721](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516150620721.png)

![image-20230516163600858](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516163600858.png)

```
有了拦截器之后，会在调用 Controller 之前进行相应的业务处理
```

在你提供的代码中，`LoginInterceptor`拦截器的`preHandle`方法在每个请求处理之前都会被调用。如果用户没有登录（即`session.getAttribute("userinfo")`返回`null`），该方法会重定向用户到`/login.html`，并返回`false`，这会导致请求处理的中断。

如果你没有在`addInterceptors`方法中使用`excludePathPatterns("/**/*.html")`将`.html`文件排除出拦截范围，那么当用户被重定向到`/login.html`时，`LoginInterceptor`拦截器的`preHandle`方法将再次被调用，而此时用户仍然没有登录，所以又会再次重定向到`/login.html`，造成了无限重定向。

所以，如果你想让未登录的用户能够看到登录页面，而不是陷入无限重定向，你需要在拦截器配置中将`.html`文件排除出拦截范围。这样，当用户被重定向到`/login.html`时，就不会再次触发`LoginInterceptor`拦截器的`preHandle`方法，用户就可以正常看到登录页面了。

![image-20230516162615814](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516162615814.png)

## 给项目配置统一的前缀

### 1.在系统的配置文件中设置

```
    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        configurer.addPathPrefix("/zhangsan", c -> true);
    }
```

![image-20230516193902073](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516193902073.png)

```
这两个模式都是Ant-style路径模式，用于匹配文件路径。这两个模式的区别在于它们匹配的路径深度。

- `/**/*.html`：这个模式将匹配所有深度的路径，只要它们以`.html`结束。例如，它将匹配`/page.html`、`/pages/page.html`、`/pages/subpages/page.html`等。

- `/*.html`：这个模式只匹配一级的路径，即只有在根目录下的`.html`文件会被匹配。例如，它将匹配`/page.html`，但不会匹配`/pages/page.html`或`/pages/subpages/page.html`。

所以，如果你想排除所有深度路径下的`.html`文件，你应该使用`/**/*.html`。如果你只想排除根目录下的`.html`文件，你应该使用`/*.html`。
```

```
如果上面的 addInterceptors 方法同时存在，那么可以不添加前缀来访问不拦截的URL地址
即 localhost:8080/user/login 也能访问成功，但是如果把代码注释掉（上图）
就需要给所有 URL 都加上前缀才能正常访问
```

![image-20230516194122764](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516194122764.png)

![image-20230516194135427](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516194135427.png)

### 2.在 application.properties 文件中配置

![image-20230516201450726](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516201450726.png)

![image-20230516201431893](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516201431893.png)

```
当在配置文件中和properties文件中同时存在前缀，那么两个前缀都无法访问
```

## 统一异常处理

```
当没有对 服务器代码中的异常 进行处理，返回到前端的错误代码会令网站使用者很困惑
```

![image-20230516202743544](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516202743544.png)

![image-20230516202753962](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516202753962.png)

```
进行统一处理：
```

![image-20230516203731659](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516203731659.png)

![image-20230516203749813](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230516203749813.png)

```
返回一个 json 类型的数据给前端，这样前端就可以进行处理，返回报错页面
```

## 统一数据返回格式

```
1.给类加上 @ControllerAdvice 注释
2.实现 implements ResponseBodyAdvice 接口
重写 supports , beforeBodyWrite 方法
```

![image-20230517123307122](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230517123307122.png)

```
将要传送给前端的数据，经过 ResponseAdvice 这个类进行处理
```

`ObjectMapper`是Jackson库中的一个类，Jackson是一个在Java中广泛使用的JSON处理库。`ObjectMapper`提供了一种简单的方式来将Java对象序列化为JSON并反序列化为Java对象。

这里是`ObjectMapper`的一些主要功能：

- **序列化**：将Java对象转换为JSON格式。例如，您可能有一个用户对象，您希望将其转换为JSON以发送到Web服务。

- **反序列化**：将JSON字符串解析并转换为Java对象。例如，您可能从Web服务接收到一个用户的JSON表示，您希望将其转换为Java对象以便在您的应用程序中使用。

- **数据绑定**：将JSON字符串转换为Java对象或将Java对象转换为JSON。

在您提供的代码中，`ObjectMapper`用于将Java HashMap对象转换为JSON字符串。这是通过调用`writeValueAsString()`方法完成的，该方法接受一个对象作为参数，将其转换为JSON字符串，然后返回该字符串。如果在转换过程中出现错误（例如，无法序列化对象），则会抛出`JsonProcessingException`。

```
通过将 String 转换成 json 类型数据传递给前端
```

