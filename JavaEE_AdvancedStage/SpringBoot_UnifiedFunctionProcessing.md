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

