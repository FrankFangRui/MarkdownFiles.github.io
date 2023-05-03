# SpringBoor 日志文件

## 1.日志的作用

```
Spring Boot 日志文件主要用于记录应用程序运行时的详细信息，以便开发人员和运维人员能够在出现问题时迅速定位并解决。日志文件具有以下几个作用：

1. 错误定位：通过记录异常和错误信息，帮助开发者发现并解决问题。
2. 系统监控：通过记录系统运行状况，如性能数据、访问记录等，有助于监控和维护系统的稳定性。
3. 审计追踪：记录用户操作和访问信息，以便在出现问题时追查责任归属。
4. 性能优化：通过分析日志中的性能数据，帮助开发者优化代码，提升系统性能。
5. 数据分析：日志文件中的数据可以用于用户行为分析、流量统计等，有助于产品的持续优化和迭代。

Spring Boot 通常使用 Logback、Log4j2 或 java.util.logging 作为日志框架，通过配置文件（如 logback-spring.xml、log4j2-spring.xml 或 application.properties）可以灵活地调整日志级别、输出格式、输出目标等。这样一来，开发人员可以根据实际需求自定义日志策略，更好地满足项目的监控、调试和优化需求。
```

## 2.日志的使用

```
SpringBoor项目在启动的时候就默认有日志输出
```

![image-20230502110119682](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502110119682.png)

```
可以看出 Spring Boot 内置了日志框架
输出的日志不是开发者定和打印了
默认打印在控制台上，且无法保存，下次重写加载之后就消失了，那么要怎么将日志永久保存下来呢？
```

```
上方 Spring 标志是通过 System.out.println() 输出在控制台上的
```

```
System.out.println VS 日志
通过 println 输出日志有两个缺点：
1）打印信息不全：输出只有（）内自己指定的内容，没有来源信息（哪个类输出的）和时间信息
2）不能实现日志的打印的隐藏和显示
附加条：System.out.println 打印的日志不能保存到磁盘当中，只能打印到服务台上
```



## 3.自定义日志打印

```
实现步骤：
1）在程序中获取日志对象
2）使用日志对象相关语法输出要打印的内容
```

### 3.1 在程序中得到日志对象

注意导包：

![image-20230502111044402](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502111044402.png)

![image-20230502110932489](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502110932489.png)

### 3.2 使用日志对象打印日志

![image-20230502113611320](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502113611320.png)

![image-20230502114438057](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502114438057.png)

```
发现控制台打印的日志当中没有 trace 和 debug
```

![image-20230502115023181](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502115023181.png)

```
日志归属的 包名 + 类名
```

![image-20230502115053311](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502115053311.png)

```
c. e. 是 com. demo.的缩写
```

```
线程名称
```

![image-20230502115256015](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502115256015.png)

```
线程id
```

![image-20230502115320790](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502115320790.png)

```
日志级别
```

![image-20230502115336988](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502115336988.png)

```
日志打印时间
```

![image-20230502115355666](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502115355666.png)

```
日志内容
```

![image-20230502115537151](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502115537151.png)

#### 常用的日志框架说明（了解）

![image-20230502120038756](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502120038756.png)

```
日志实现 由 日志门面来实现，开发者只需要操作 日志门面
```

```
举个例子： log4j,logback下面有各自的操作方法，而程序员只需要通过日志门面上 日志实现的接口 就可以实现对应方法，如果有一天Log4j，logback中有方法的调整，此时代码中就不用调整，因为通过接口访问不用管内部的实现是什么，极大程度上实现了 解耦合
日志门面 就是 一个中介，日志实现 里 的log4j,JUL就像不同的国家，开发者要去买东西就找中介（代购），代购去不同国家买，当一个国家买不到就去另一个国家，而开发者就不用考虑这个问题，如果没有代购，开发者要直接去一个国家买就很麻烦，要准备银行卡等等，如果这个国家没有，还要去准备其他国家银行卡，就很麻烦，通过中介就能 解耦合（开发者和不同国家的耦合），极大方便开发者
```

## 4. 日志级别

###   4.1 日志级别有什么用？

```
日志级别在软件开发和运维中主要有以下几个用途：

1. **筛选关键信息**：通过设置不同的日志级别，可以筛选出对开发者和运维人员有用的关键信息，从而帮助他们更快地定位和解决问题。

2. **提高系统性能**：输出过多的日志信息会影响系统性能。通过调整日志级别，可以减少不必要的日志输出，从而提高系统性能。例如，在生产环境中，通常会选择较高的日志级别以减少日志输出量。

3. **降低日志存储成本**：日志数据占用存储空间，长时间存储大量日志会增加成本。通过设置合适的日志级别，可以减少不必要的日志数据，降低日志存储成本。

4. **简化日志分析**：在处理大量日志数据时，日志级别可以帮助开发者和运维人员快速找到关键信息，简化日志分析过程。

5. **提高系统可维护性**：通过查看不同级别的日志信息，开发者和运维人员可以更好地了解系统的运行状态和潜在问题，从而提高系统的可维护性。

总结一下，日志级别的作用主要是帮助开发者和运维人员更有效地诊断和解决问题，提高系统性能、降低日志存储成本、简化日志分析过程以及提高系统可维护性。通过合理地设置日志级别，可以提高软件开发和运维工作的效率。
```

### 4.2 日志级别的分类与使用

```
六个常见日志级别的作用和应用场景。

1. **TRACE**：
   作用：记录程序执行的细节信息，包括函数调用、循环迭代等。
   应用场景：仅在调试问题时使用，通常不会在生产环境启用此级别的日志。

2. **DEBUG**：
   作用：记录调试信息，包括程序的输入、输出和中间结果等。
   应用场景：在开发和测试阶段，开发人员使用此级别的日志来帮助定位问题。在生产环境中，此级别的日志通常会被禁用以提高性能。

3. **INFO**：
   作用：记录程序的一般信息，如服务启动、关闭、配置变更等。
   应用场景：在各种运行环境中广泛使用，有助于了解程序的运行状态和正常操作。此级别的日志通常会被保留以供参考。

4. **WARN**：
   作用：记录潜在问题或异常情况，这些问题可能不会立即影响程序的正常运行，但可能需要关注和解决。
   应用场景：用于提醒开发者和运维人员关注可能出现的问题，以及需要优化和改进的地方。此级别的日志在生产环境中通常会被保留。

5. **ERROR**：
   作用：记录导致程序无法正常运行的错误信息，如无法连接数据库、文件读取失败等。
   应用场景：在各种运行环境中广泛使用，用于报告严重错误。此类信息通常需要立即关注和解决，以确保系统的正常运行。

6. **FATAL**：
   作用：表示程序遇到了严重的错误，无法继续运行。
   应用场景：在发生极其严重的错误时使用，这类错误通常需要立即解决，以便恢复系统的正常运行。

通过逐步了解这六个日志级别，我们可以看出它们在软件开发和运维中的重要作用。不同的日志级别可以帮助开发者和运维人员根据需要获取不同层次的信息，从而提高问题定位和解决的效率。在实际应用中，应根据程序的运行环境和需求合理设置日志级别。
```

```
日志级别规则：当程序中设置了日志级别之后，那么程序只会打印和设置级别相当和大于当前日志级别的日志，小于当前级别的日志不会输出
```

![image-20230502171233662](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502171233662.png)



```
日志级别设置
```

![image-20230502171357926](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502171357926.png)

```
在配置文件当中设置 logging.level 的配置项
```

```
日志设置非常的灵活，可以针对不同的目录设置不同的日志级别
```

![image-20230502172628973](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502172628973.png)

## 5. 日志持久化

```
保存日志到磁盘当中，要在 logging下，Logging不能重复
```

![image-20230502173810348](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502173810348.png)

https://docs.spring.io/spring-boot/docs/current/reference/html/application-properties.html#application-properties

```
想要查看 Spring Boot 更多系统配置项，访问上面的网页
```

![image-20230502174527533](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502174527533.png)

```
可以看出，单个日志记录文件最大 10 MB，最多有七个日志文件（这些都是可以更改的）
```

```
没有设置路径，只设置名字，会生成在根路径
```

![image-20230502174926302](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502174926302.png)

![image-20230502174939718](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502174939718.png)

## 6. 更加简单地打印日志

```
每个类都要获得日志对象十分麻烦，可以用更简单的方式获取对象
1. 添加 lombok 框架支持
2. 给类加上 @slf4j 注解
```

![image-20230502181702007](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502181702007.png)

```
作用等同于 得到日志对象
```

### 旧项目添加新依赖框架

![image-20230502181825426](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502181825426.png)

![image-20230502182116282](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502182116282.png)

```
右键点击 Generate,然后点击 EditStarter 标签
```

```
弹出窗口，点击 OK
```

![image-20230502182205334](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502182205334.png)

```
点击 EditStarters 中的 Modules 添加依赖
```

![image-20230502182241743](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502182241743.png)

```
最后要在 Maven 中 reload 一下
```

### Lombok原理

```
代码：
```

![image-20230502183102457](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502183102457.png)

```
通过 lombok 能够打印日志的原因就是在 target 目录中（target为项目最终执行的代码，即生成的字节码文件）,发现 target 目录下，文件中日东添加了 日志对象，而 @slf4j 注解消失了 （IDEA中能将.class文件反编译成java代码）
```

![image-20230502183427239](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502183427239.png)

![image-20230502183200761](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502183200761.png)

```
Java程序运行的原理：
```

![image-20230502183450349](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502183450349.png)

```
lombok 的作用：辅助生成 .class 文件，以简化用户代码中的代码量
```

![image-20230502183507432](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502183507432.png)

### Lombok 更多注解说明

```
@NonNull 注解
```

![image-20230502184528234](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502184528234.png)

```
此时new对象是一定要传入 name 这个参数，否则会报错
```

![image-20230502184610132](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502184610132.png)

```
从 .class 文件中反编译的 java 代码可以看出
```

![image-20230502184704273](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230502184704273.png)

```
自动生成了一个构造方法，指定参数为 name，且当 name 不为 null 的时候抛出异常
```

## 如何配置 SpringBoot的日志格式

### .properties 中

```
要逐步配置Spring Boot的日志格式，请按照以下说明操作：

1. 查找或创建application.properties文件：

Spring Boot的默认日志配置可以在`application.properties`或`application.yml`文件中找到。如果你还没有这些文件，请在项目的`src/main/resources`目录下创建一个。

2. 设置日志级别：

在`application.properties`文件中，你可以设置不同包和类的日志级别。例如，要将某个包的日志级别设置为DEBUG，可以添加以下内容：

​```properties
logging.level.com.example.package=DEBUG
​```

3. 配置日志格式：

要配置日志格式，请在`application.properties`文件中添加以下内容：

​```properties
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} - %level [%thread] %logger{36} - %msg%n
​```

其中，`%d`表示日期和时间，`%level`表示日志级别，`%thread`表示线程名，`%logger`表示记录器名（通常是类名），`%msg`表示日志消息，`%n`表示换行符。

4. 自定义日志文件：

如果你想将日志输出到文件，可以在`application.properties`文件中添加以下内容：

​```properties
logging.file.name=my_log_file.log
​```

此处的`my_log_file.log`表示你希望使用的日志文件名。你还可以使用`logging.file.path`属性指定日志文件的路径。

5. 保存并重启应用：

保存更改后，重新启动应用以使配置生效。现在，你的日志应该按照所设置的格式显示。

注意：如果你使用的是`application.yml`文件，配置的语法将略有不同，但基本思路相同。
```

### .yml 中

```
当然可以，下面是使用`application.yml`文件来配置Spring Boot日志格式的逐步说明：

1. 查找或创建application.yml文件：

在项目的`src/main/resources`目录下查找`application.yml`文件。如果没有，请创建一个。

2. 设置日志级别：

在`application.yml`文件中，你可以设置不同包和类的日志级别。例如，要将某个包的日志级别设置为DEBUG，可以添加以下内容：

​```yaml
logging:
  level:
    com.example.package: DEBUG
​```

3. 配置日志格式：

要配置日志格式，请在`application.yml`文件中添加以下内容：

​```yaml
logging:
  pattern:
    console: '%d{yyyy-MM-dd HH:mm:ss} - %level [%thread] %logger{36} - %msg%n'
​```

其中，`%d`表示日期和时间，`%level`表示日志级别，`%thread`表示线程名，`%logger`表示记录器名（通常是类名），`%msg`表示日志消息，`%n`表示换行符。

4. 自定义日志文件：

如果你想将日志输出到文件，可以在`application.yml`文件中添加以下内容：

​```yaml
logging:
  file:
    name: my_log_file.log
​```

此处的`my_log_file.log`表示你希望使用的日志文件名。你还可以使用`path`属性指定日志文件的路径，如下所示：

​```yaml
logging:
  file:
    path: /path/to/your/log/directory
    name: my_log_file.log
​```

5. 保存并重启应用：

保存更改后，重新启动应用以使配置生效。现在，你的日志应该按照所设置的格式显示。
```

```
要按照你指定的格式`[时间 | 级别 | 调用方法:行号] 日志内容`配置日志，可以在`application.yml`文件中添加以下内容：

​```yaml
logging:
  pattern:
    console: '[%d{yyyy-MM-dd HH:mm:ss} | %level | %M:%L] %msg%n'
​```

其中：
- `%d{yyyy-MM-dd HH:mm:ss}`表示日期和时间；
- `%level`表示日志级别；
- `%M`表示调用方法名；
- `%L`表示源代码行号；
- `%msg`表示日志消息；
- `%n`表示换行符。

请注意，`%M`可能会影响性能，因为它需要通过堆栈跟踪来获取调用方法名。因此，在生产环境中谨慎使用。
```

