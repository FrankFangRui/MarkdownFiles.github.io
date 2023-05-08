# MyBatis 查询操作

## 1. 参数占位符 #{} ${}

```
通过一个查询操作来展示两种占位符的区别
```

```
#{}：预编译处理。
${}：字符直接替换。
```

```
当着两个占位符在处理 Integer 类型的数据的时候不会出现错误
而当处理 String 类型的数据的时候  ${}就会出现错误
```

![image-20230508200845938](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508200845938.png)

![image-20230508200911243](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508200911243.png)

![image-20230508200941710](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508200941710.png)

```
出现错误：
```

![image-20230508201004145](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508201004145.png)

```
看报错信息，可以看出是SQL语法错误
select id from userinfo where username = 张三
这里的SQL语句中字符串没有''修饰，所以报错
可以看出 ${} 直接将 占位符 替换成了 字符串 中的文字，而不带 ''（直接替换）
```

```
当换成#{} 占位符 之后，程序成功启动
```

![image-20230508201320987](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230508201320987.png)

```
通过日志可以看出 程序 像 JDBC 一样 先将 #{} 占位符 替换成了 ？，再判断 ？ 的类型（String) 然后将 '张三',替换 ？ ，最终SQL语句为 select id from userinfo where username = '张三',成功执行
```

```
当 要替代的字符 是关键字的时候（即插入到SQL语句当中不需要''的时候） #{} 也会出错，误将关键字变成字符串导致出错
select * from userinfo order by #{id desc};
-> select * from userinfo order by id 'desc';

此时用到${} 就直接替换，而不会出现将关键字变成字符串 
-> select * from userinfo order by id desc;
```

