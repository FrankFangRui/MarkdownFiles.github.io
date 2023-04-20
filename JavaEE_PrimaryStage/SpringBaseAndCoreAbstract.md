## 传统开发中的问题 

​      传统开发中代码的耦合性太大，如果需要需改一个特性（轮胎的尺寸），就需要修改一连串的代码，效率很低

## 新旧方式的比较

旧方式：

如果要给轮胎增加一个新的特性，来更改轮胎的尺寸就要更改一连串不同类上的方法

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420201024112.png" alt="image-20230420201024112" style="zoom:50%;" />

这个修改的权限在于程序员手中

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420201204846.png" alt="image-20230420201204846" style="zoom:50%;" />

新方式：

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420201251876.png" alt="image-20230420201251876" style="zoom:50%;" />

新方式直接传送类，不用修改一系列代码，但是修改轮胎尺寸的权限不在于程序员，而是谁把参数传送给 Bottom(Tire tire) ，tire 的生命周期不由程序员决定，而是由什么时候传送给Bottom(Tire tire) 决定，这就是控制反转（Inversion Of Control)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420202129682.png" alt="image-20230420202129682" style="zoom:50%;" />

当需要更改参数的时候，只需要修改 Tire 类的代码，其他类的代码不需要改变，成功降低了代码的耦合性，当 tire 修改的时候，只需要修改 Tire 类，而其他类不需要修改

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420202921763.png" alt="image-20230420202921763" style="zoom:50%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420202930784.png" alt="image-20230420202930784" style="zoom:50%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230420203042855.png" alt="image-20230420203042855" style="zoom:50%;" />

## 什么是 IOC （Inversion Of Control)

```
控制反转，就是在有一系列的类当中，A类引用B类，B类引用C类，然后在引用的时候，直接在这个类当中 new 这个要引用的类，在这种情况下如果C类的构造方法发生改变的话，就要同时修改ABC三个类当中的构造方法，导致代码耦合性高，而控制反转就是 在AB类中直接传入构建好的类，而不是直接new一个类，这个时候要修改传送的 C类的值的时候，就只需要修改 C类的构造方法就可以了
```

 