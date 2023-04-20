## HTML 格式

![image-20230324103745777](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324103745777.png)

![image-20230324103814889](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324103814889.png)

![image-20230324104104050](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324104104050.png)

![image-20230324104236258](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324104236258.png)

### 注释 ctrl + /

![image-20230324104324366](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324104324366.png)

### 设置实时保存

![image-20230324104351551](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324104351551.png)

### 标题标签  \<h1>\</h1>

![image-20230324104418252](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324104418252.png)

```
<h1>一级标签</h1>
```

### 段落标签 p

![image-20230324104721952](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324104721952.png)

```
<p> </p> 
p 标签中的内容独占一行，在编辑器中看有换行是因为屏幕显示不下的问题
```

### 加粗，倾斜，删除线，下划线

![image-20230324104956315](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230324104956315.png)

## 元素的显示模式

```
前言：一个内容在浏览器中显示，它的颜色，大小决定了它显示的样子，而它处在的位置，更是决定了观看者的感受
```

![image-20230326160857116](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326160857116.png)

![image-20230326160911311](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326160911311.png)

![image-20230326160921069](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326160921069.png)

```
在 style 中加入设置边框，这样就改变了浏览器默认样式
* {
    outline: 0;
    padding: 0;
    margin: 0;
    border: 0;
  }
```

![image-20230326161012934](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326161012934.png)

![image-20230326161022729](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326161022729.png)

#### 块级元素

![image-20230326152859218](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326152859218.png)

```html
可以通过以下代码来清晰地理解这些特点

 <style>
    .demo1 .child {
    /* 不写 width, 默认和父元素一样宽 */
    /* 不写 height, 默认为 0 (看不到了) */
    height: 200px;
    background-color: red;
    }
</style>
    <div class="demo1">  
        <div class="child">
            child1
            </div>
            <div class="child">
            child2
        </div>
</div>
```

![image-20230326153333750](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326153333750.png)

**body就像一个气球一样，往里面放东西，气球不断被挤大**

```
body 大小由所包含的元素的高度决定 
因为代码 body 中包含 两个 child,而 child 有设置高度宽度，所以 body 的宽度 就是一个 child，高度就是两个 child
```

```
更改CSS中 child 高度宽度之后
```

![image-20230326153718761](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326153718761.png)

![image-20230326153732391](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326153732391.png)

```
当没有设定 child 的宽度，宽度就是默认的浏览器的宽度
```

![image-20230326153843405](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326153843405.png)

高度就是 div 中的文字的高度



```html
<style>
    .demo1 .parent {
    width: 500px;
    height: 500px;
    background-color: green;
    }
    .demo1 .child {
    /* 不写 width, 默认和父元素一样宽 */
    /* 不写 height, 默认为 0 (看不到了) */
    height:200px;
    background-color: red;
    }
</style>
    <div class="demo1">  
        <div class="parent">
            <div class="child">
                child1
                </div>
                <div class="child">
                child2
            </div>
    </div>
</div>
```



```
宽度默认是父类宽度的 100%
```

```
body 的大小
```

![image-20230326154341043](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326154341043.png)

```
demo1 的大小（和body一样大小）
```

![image-20230326154413020](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326154413020.png)

![image-20230326154808204](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326154808204.png)

![image-20230326154905244](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326154905244.png)

![image-20230326154914713](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326154914713.png)

```
child1 的宽度由父类型 parent 决定，高度由它自己设置,如果没有设置高度，则高度是字符的高度
```

![image-20230326155024705](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326155024705.png)

![image-20230326155038316](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326155038316.png)



**直接把气球吹到最大，然后往里面放元素**

![image-20230326155620823](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326155620823.png)

```
此时 body 的大小和浏览器的窗口大小一样，放大浏览器的大小，body也跟着变化
```

![image-20230326155727642](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326155727642.png)

![image-20230326155747351](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326155747351.png)

```
此时 demo1 的大小就是 sytle 中设置的大小，如果没有设置大小，将会随着 body 变化而变化
```

![image-20230326155908670](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326155908670.png)

```
有设置高度，没有设置宽度，所以宽度就和上面的 body 的宽度一样
```



![image-20230326155351375](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326155351375.png)



#### 行内元素/内联元素

![image-20230326160041167](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326160041167.png)

```html
<style>
   .demo2 span {
    width: 200px;
    height: 200px;
    background-color: red;
    }
</style>
<div class="demo2">
    <span>child1</span>
    <span>child2</span>
    <span>child3</span>
</div>
```

![image-20230326161202638](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326161202638.png)

```
代码中设置了 span 的宽度高度，但是在浏览器显示的时候没有变化
宽度就是字的内容的长度，高度是字体高度
```

![image-20230326161756165](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326161756165.png)

![image-20230326161805973](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326161805973.png)

![image-20230326161813103](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326161813103.png)

```
body demo2 span 的高度一样，等于字体高度
div 没有设置宽度和 body 的宽度一样
span 宽度等于字的内容的长度
```

![image-20230326161954011](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326161954011.png)

#### 块级元素 和 行内元素的区别

![image-20230326162023906](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162023906.png)

#### 改变显示模式

![image-20230326162113148](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162113148.png)

![image-20230326162247291](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162247291.png)

![image-20230326162308337](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162308337.png)

```
行内元素垂直方向不能设置距离，块级元素可以设置四个方向的内外边距
```

### 盒模型

```
在 style 中设置 div 的 background—color:red 是将 border 以内的东西（包括padding,content）的部分全部都设置为红色，不是只设置 content 的背景为红色
```

![image-20230326162430084](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162430084.png)

![image-20230326162447986](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162447986.png)

#### 边框

![image-20230326162518682](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162518682.png)

![image-20230326162727757](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162727757.png)

![image-20230326162741883](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162741883.png)

![image-20230326162919800](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326162919800.png)

![image-20230326163045095](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326163045095.png)

```
边框会增大 div 的大小，在  style 中设置 
box-sizing：border-box，可以让边框包含在设置的长宽之内，不会让格子变大
```

![image-20230326163530238](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326163530238.png)

```
关于层叠性 就近原则生效的问题
因为一般 style 放在 head 当中，会有这种就近生效的感觉
其实就是style中后执行的语句会覆盖掉之前执行的语句的内容
```

![image-20230326164634917](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326164634917.png)

![image-20230326164651951](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326164651951.png)

#### 内边距

![image-20230326165051729](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326165051729.png)

![image-20230326165226260](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326165226260.png)

```html
<style>
    div {
        width: 500px;
        height: 250px;
        padding-top: 50px;
        padding-left: 30px;
    }
</style>
<div>
    盒子里面的东西
</div>
```

```
加上 padding 之后，整个 div 盒子中的 content 距离 左边的距离为 30px,距离 上面的距离为 50px
```

![image-20230326165953039](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326165953039.png)

#### 外边距

![image-20230326170307670](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326170307670.png)

![image-20230326170313852](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326170313852.png)

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326170530753.png" alt="image-20230326170530753" style="zoom:67%;" />

<img src="C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326170604704.png" alt="image-20230326170604704" style="zoom:67%;" />

![image-20230326170621452](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326170621452.png)

```
整个 body 的高度 就是两个 div 的高度 加上 margin 的长度
```

![image-20230326170701152](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326170701152.png)

#### margin 与 padding 的选择

![image-20230413195257615](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230413195257615.png)

#### 块级元素水平居中

![image-20230326171024815](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326171024815.png)

![image-20230326171035400](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326171035400.png)

![image-20230326171108756](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326171108756.png)

![image-20230326171125864](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326171125864.png)

![image-20230326171315890](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326171315890.png)

### 弹性布局

```html
<div>
    <span>11111</span>
    <span>22222</span>
    <span>33333</span>
    </div>
<style>
    div {
        width: 100%;
        height: 150px;
        background-color: red;
    }
    div>span {
        background-color: green;
        width: 100px;
    }
</style>
```

![image-20230326172642915](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326172642915.png)

![image-20230326173143480](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173143480.png)

![image-20230326172656390](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326172656390.png)

![image-20230326173152672](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173152672.png)

![image-20230326173401106](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173401106.png)

![image-20230326173413980](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173413980.png)

![image-20230326173434200](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173434200.png)

![image-20230326173743585](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173743585.png)

#### 常用属性

##### justify-content

![image-20230326173841385](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173841385.png)

![image-20230326173847595](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326173847595.png)

```html
<div>
<span>1</span>
<span>2</span>
<span>3</span>
<span>4</span>
<span>5</span>
</div>
<style>
div {
width: 100%;
height: 150px;
background-color: red;
display: flex;
}
div span {
width: 100px;
height: 100px;
background-color: green;
}
</style>
```

![image-20230326174559666](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326174559666.png)

![image-20230326174609062](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326174609062.png)

##### align-items

![image-20230326174713808](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326174713808.png)

![image-20230326174757981](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326174757981.png)

```html
<div>
<span>1</span>
<span>2</span>
<span>3</span>
</div>
<style>
div {
width: 500px;
height: 500px;
background-color: green;
display: flex;
justify-content: space-around;
}
div span {
width: 150px;
background-color: red;
}
</style>
```

![image-20230326175731041](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326175731041.png)

```
justify-content 控制水平方向的排布
align-items 控制垂直方向的排布
```

```html
<div>
<span>1</span>
<span>2</span>
<span>3</span>
</div>
<style>
div {
width: 500px;
height: 500px;
background-color: green;
display: flex;
justify-content: space-around;
align-items: center;
    }
div span {
width: 150px;
height: 100px;
background-color: red;
}
</style>
```

![image-20230326175906028](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326175906028.png)

![image-20230326175917043](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326175917043.png)

![image-20230326180710807](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326180710807.png)

![image-20230326180718863](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326180718863.png)

![image-20230326180725744](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230326180725744.png)

![image-20230407142715149](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230407142715149.png)

![image-20230407143103119](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230407143103119.png)

##### align-items 和 align-content 的区别

[(23条消息) align-items和align-content的区别_码飞_CC的博客-CSDN博客](https://blog.csdn.net/cc18868876837/article/details/88138057)