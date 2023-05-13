## 扩展类

```
在VO扩展类当中，继承了父类的属性与方法（包含toString())，而父类的toString() 方法中不包含子类的属性，所以需要重写toString()
```

![image-20230512094706357](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512094706357.png)

```
通过两种方法排查
```

![image-20230512094849885](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512094849885.png)

![image-20230512095005617](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512095005617.png)

```
第一种通过 debug 看articleinfoVO参数
第二种看打印的时候的输出的内容
```

![image-20230512095357777](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512095357777.png)

```
debug 中输入 aricleinfoVO.getTitle() 来查询title，看看是否有这个值，结果是有这个值，说明这个值是存在的，那么问题就是在输出上
```

![image-20230512095603886](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512095603886.png)

```
当重写 toString()之后的输出：
```

![image-20230512095639191](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512095639191.png)

## Serializable 接口

![image-20230512101114539](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512101114539.png)

![image-20230512101104458](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512101104458.png)

这个类`ArticleinfoVO`实现`Serializable`接口，意味着它的实例（对象）可以被转化为字节流，以便在网络传输、持久化存储或者其他需要将对象状态进行保存与恢复的场合使用。

在一些具体的场景中，`Serializable`接口的作用可能如下：

1. **对象的持久化**：有时，你可能需要将`ArticleinfoVO`对象的状态保存下来，以便在稍后的某个时间点重新获取。例如，你可能需要将对象保存到磁盘，或者存储到数据库中。通过实现`Serializable`接口，你可以将对象转化为一种格式，可以被存储和恢复。

2. **在网络中发送对象**：如果你正在编写一个网络应用，你可能需要将`ArticleinfoVO`对象从一台机器发送到另一台机器。通过实现`Serializable`接口，你可以将对象转化为字节流，然后通过网络发送。在接收端，你可以再将这个字节流转化回对象。

3. **在JVMs之间传递对象**：在复杂的系统中，你可能需要在运行在不同机器上的多个Java虚拟机（JVM）之间传递对象。这种情况经常出现在分布式系统和并行计算中。通过实现`Serializable`接口，你可以在JVMs之间传递对象。

4. **在缓存中存储对象**：在需要高性能的系统中，你可能会使用缓存来存储`ArticleinfoVO`对象，以便快速地访问这些对象。为了将对象存储在缓存中，你可能需要将对象序列化。

   ```
   在 Redis 中需要缓存，如果没有实现这个接口就会报错，实体类建议都写上
   ```

这就是为什么这个类要实现`Serializable`接口的原因。然而，序列化并不总是必要的，也并不总是最佳的解决方案。例如，序列化可能导致性能问题，因为序列化和反序列化可能是资源密集型的。此外，序列化可能导致安全问题，因为序列化数据可能被修改或者被未经授权的人员访问。因此，在决定是否要使用序列化时，你应该根据你的具体需求和环境进行考虑。

## 动态 SQL

动态 sql 是Mybatis的强大特性之一，能够完成不同条件下不同的 sql 拼接。

```
在注册用户填写信息的时候，有必填信息，有非必填信息，不确定填写人在非必填信息中填写了哪些信息，这时候就使用动态 SQL 来判断填写人是否填写了，填写了就在 SQL 中insert的时候加入这个字段，不填写就不加入
```

### if 标签

```
语法：
<if test="参数名!=null">    //传递的是一个对象属性，直接属性名，不用对象.属性, 如果""内为true,就执行 if 标签里的内容，为 false 就不执行
  ...
</if>
```

```
Mysql 中 ‘’ 和 NULL 不同
```

![image-20230512103352876](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512103352876.png)

### trim 标签

```xml
    <!--    suffixOverrides 末尾有 , 则去除，如果没有则不去除
            在 “” 内写属性名不需要#，在if标签内写对象属性要加上 #-->
    <insert id="add3">
        insert into userinfo
        <trim prefix="(" suffix=")" suffixOverrides=",">

            <if test="username!=null">
                username,
            </if>
            <if test="password!=null">
                password,
            </if>
            <if test="photo!=null">
                photo
            </if>
        </trim>
        values
        <trim prefix="(" suffix=")" suffixOverrides=",">

            <if test="username!=null">
                #{username},
            </if>
            <if test="password!=null">
                #{password},
            </if >
            <if test="photo!=null">
                #{photo},
            </if>
        </trim>
    </insert>
```

prefix 在标签内 最前面添加内容

suffix 在标签内 最后面添加内容

suffixOverrides 在标签内 如果最后有这个内容，则去除，否则没效果

### where 标签

1.通常 where 标签要配合 if 标签一起使用

2.where 标签会删除最前面的 and 关键字（注意不会删除最后面的）

3.where 标签中如果没有内容，那么它也不会生成 where sql 关键字

```
当 password 为 null，那么语句就变成 ...where username=? and
and 后面没有内容了
```

![image-20230512153034606](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512153034606.png)

![image-20230512154437186](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512154437186.png)

```
从上面的格式可以看出，当username不为null的时候，会自动删除前面的 and 
```

![image-20230512154534247](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512154534247.png)

`` 标签是一个特殊的动态 SQL 标签，它用于生成 WHERE 子句。`` 标签的特点是，如果它包含的子元素（例如 ``）生成了有效的 SQL，那么它会自动添加 "WHERE" 关键字，并且自动处理任何多余的 "AND" 或 "OR"。例如：

```
xmlCopy code<select id="findUsers" resultType="User">
  SELECT * FROM users
  <where>
    <if test="username != null">
      username = #{username}
    </if>
    <if test="email != null">
      AND email = #{email}
    </if>
  </where>
</select>
```

在这个例子中，如果 `username` 参数为 null，但 `email` 参数不为 null，那么生成的 SQL 语句将是 `SELECT * FROM users WHERE email = ?`。请注意，即使我们在 `` 标签中包含了 "AND"，`` 标签也会自动移除它。

![image-20230512154754879](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512154754879.png)



通过<trim>替换<where>

![image-20230512160902900](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512160902900.png)



### set 标签

![image-20230512170019171](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512170019171.png)

```
1. 通常配合 if 标签使用
2. set 标签会像 if 标签一样去除最后一个英文逗号
<trim prefix="set" suffixOverrides=","> 可以替换 set标签
```

### foreach 标签

![image-20230512200620254](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512200620254.png)

![image-20230512200709639](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512200709639.png)

![image-20230512200810955](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230512200810955.png)

```
collection 等于 传递给dels 函数的集合
item 等于集合中的每个元素
separator 是分隔每个元素的分隔符
```

