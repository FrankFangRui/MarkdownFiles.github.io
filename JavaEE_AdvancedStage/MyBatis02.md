## MyBatis 添加操作

### 1.在接口中声明方法

![image-20230508142750166](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508142750166.png)

![image-20230508142842420](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508142842420.png)

```
接口中声明的方法里的参数是 对象  （传递一个对象）
```

### 2. 在 xxx.xml 中提供实现

 ![image-20230508154825326](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508154825326.png)

![image-20230508145955094](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508145955094.png)

```
注意是从对象类中的属性获取的，属性名字要对应，跟数据库的名字不一定要对应，但是和类中属性名称一定要对应！
```



```
values中赋值使用的是对象中的属性
注意：对应的不是数据库的字段，而是程序类中的属性
```

![image-20230508145821762](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508145821762.png)

### 添加并返回用户的 自增ID

```
UserMapper 接口当中 设置addGetId(Userinfo userinfo)方法,传入对象引用
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508164304460.png" alt="image-20230508164304460" style="zoom:67%;" />

```
UserMapper.xml 当中实现 SQL 语句， id 要和 接口当中的方法名对上
userGeneratedKeys 表明要使用key(默认为 false)
keyProperty 即key指的是表中的 id
```

![image-20230508164657288](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508164657288.png)

![image-20230508164459328](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508164459328.png)

```
在测试类当中测试结果是否实现
```

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508164748695.png" alt="image-20230508164748695" style="zoom:50%;" />

```
在add(){}中，可以看出并set属性的时候，并没有set userinfo 的Id属性，如果不添加 useGeneratedKeys="true" keyProperty="id" 在 select标签当中，就无法通过getId()查找到 id 这个值，显示查找到的 id 为 0， 但是在数据库中是id是存在且递增的，因为在创建表的时候就设定好了
```

![image-20230508165736795](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508165736795.png)

![image-20230508165550454](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508165550454.png)

```
userMapper.addGetId(userinfo) 返回受影响的行数，表示成功添加一个 userinfo
userinfo.getId() 来得到插入的用户的 id （MyBatis自动赋值）
```

![image-20230508164925756](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508164925756.png)

### 修改用户  id

```
1. 接口声明方法
```

![image-20230508170130684](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508170130684.png)

```
2. XML 中实现方法
```

![image-20230508170049034](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508170049034.png)

### 删除用户 id

```
经过前两个 增 ，删 操作，可以很容易得到 操作的步骤
1. 在接口中通过定义方法并传送对象引用来 声明 要操作的 行为（增删改）
2. 然后在 .xml 文件中通过标签进行 SQL 语句的实现
3. 最后可以通过 SpringBoot的单元测试来进行 增删改 的测试
```

1.

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508175350109.png" alt="image-20230508175350109" style="zoom: 50%;" />

2.

![image-20230508175412000](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508175412000.png)

3.

![image-20230508175422827](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508175422827.png)

4. 控制台返回 日志

   ![image-20230508175642829](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508175642829.png)

### 用@Transactional 注解标注类或方法能防止增删改操作真实执行

![image-20230508181449204](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508181449204.png)

![image-20230508181458938](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508181458938.png)

![image-20230508181510728](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508181510728.png)

### 开启 MyBatis SQL日志打印

![image-20230508175854198](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508175854198.png)

```
打印日志默认打印 debug 级别，将ssm_demo文件夹下的文件设置为 debug 级别的文件
# 开启 mybatis sql 日志打印 打印 debug 级别
mybatis.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl
logging.level.com.example.ssm_demo=debug
```

## 



