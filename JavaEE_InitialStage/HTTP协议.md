# Http 协议

## 介绍

```
应用层里最广泛的协议之一
学习HTTP协议，主要就是学习 报文格式
HTTP协议 是 文本格式 的协议，直接就能看懂
可以通过抓包工具，来分析 HTTP 协议格式
```

![image-20230318162035160](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318162035160.png)

```
响应：
1.首行 ：版本号  状态码   状态码的描述（对状态码进行了解释说明）
2.响应报头 header:(同样也是键值对的形式)
从第二行到空行之前
3.空行： 作为 header 的结束标记
4.正文 (body)： 空行下面那一行，可以是 json 数据，也可以是 html,css,js,图片
```

![image-20230318162324074](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318162324074.png)

![image-20230318162415037](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318162415037.png)

![image-20230318162433181](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318162433181.png)

## URL

![image-20230318163000388](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163000388.png)

![image-20230318163036678](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163036678.png)

![image-20230318163107806](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163107806.png)

![image-20230318163408014](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163408014.png)

![image-20230318163444967](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163444967.png)

```
URL 重要的部分
1. IP 地址 + 端口号 【基础】
2. 带层次的路径 【开发中常用】
3. 查询字符串 【开发中常用】
```

![image-20230318163749270](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163749270.png)

![image-20230318163822480](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163822480.png)

```
取字符的16进制编码的前两位
```

![image-20230318163911216](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163911216.png)

![image-20230318163950364](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318163950364.png)

## 认识“方法”

### GET

![image-20230318164026240](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318164026240.png)

![image-20230318175028059](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318175028059.png)

![image-20230318175524494](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318175524494.png)

![image-20230318180847645](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318180847645.png)

![image-20230318175756317](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318175756317.png)

![image-20230318175834063](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318175834063.png)

![image-20230318180639305](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318180639305.png)

![image-20230318180706464](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318180706464.png)

### POST

![image-20230318181552163](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318181552163.png)

![image-20230318181602729](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318181602729.png)

![image-20230318181655648](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318181655648.png)

![image-20230318181630703](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318181630703.png)

![image-20230318182231624](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182231624.png)

![image-20230318182313876](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182313876.png)

### GET 和 POST 有什么区别

![image-20230318182352395](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182352395.png)

![image-20230318182403106](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182403106.png)

![image-20230318182459765](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182459765.png)

![image-20230318182535799](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182535799.png)

![image-20230318182820167](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182820167.png)

![image-20230318182905699](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318182905699.png)

![image-20230318183140149](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318183140149.png)

![image-20230318183953490](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318183953490.png)

![image-20230318184008384](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318184008384.png)

![image-20230318184313132](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318184313132.png)

![image-20230318184431084](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318184431084.png)

![image-20230318184738433](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318184738433.png)

![image-20230318184748385](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318184748385.png)

![image-20230318184927537](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318184927537.png)

```
HTTP协议设计这两个方法的初心，但是时间中，很多程序员没有遵守这个
```

![image-20230318185142257](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318185142257.png)

## 认识请求“报头”（header）

![image-20230318185542531](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318185542531.png)

![image-20230318185741505](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318185741505.png)

### Host

![image-20230318185826447](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318185826447.png)

![image-20230318190433641](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318190433641.png)

![image-20230318190424364](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318190424364.png)

```
Host 中IP 指目标服务器地址
URL 中IP 指中间站的IP地址
```

### Content-Length

![image-20230318190724662](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318190724662.png)

### Content-Type

![image-20230318190811199](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318190811199.png)

![image-20230318191221497](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318191221497.png)

![image-20230318191327192](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318191327192.png)

![image-20230318201330227](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201330227.png)

![image-20230318191431291](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318191431291.png)

![image-20230318192313297](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192313297.png)

![image-20230318192323423](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192323423.png)

### User-Agent(UA)

![image-20230318192354718](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192354718.png)

![image-20230318192431719](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192431719.png)

![image-20230318192841801](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192841801.png)

![image-20230318192913937](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192913937.png)

![image-20230318192929464](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192929464.png)

![image-20230318192946983](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318192946983.png)

![image-20230318193020119](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318193020119.png)

![image-20230318193114546](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318193114546.png)

### Referer

![image-20230318193139349](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318193139349.png)

![image-20230318193235872](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318193235872.png)

![image-20230318193338920](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318193338920.png)

![image-20230318193402124](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318193402124.png)

### Cookie

![image-20230318194128140](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318194128140.png)

![image-20230318194135582](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318194135582.png)

![image-20230318194155513](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318194155513.png)

![image-20230318194207405](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318194207405.png)

![image-20230318194214708](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318194214708.png)

![image-20230318194330619](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318194330619.png)

![image-20230318195031037](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318195031037.png)

![image-20230318195054663](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318195054663.png)

![image-20230318195109343](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318195109343.png)

![image-20230318195117696](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318195117696.png)

![image-20230318195149042](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318195149042.png)

![image-20230318195208119](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318195208119.png)

![image-20230318195303135](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318195303135.png)

![image-20230318200014848](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200014848.png)

![image-20230318200129916](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200129916.png)

## HTTP响应

![image-20230318200328613](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200328613.png)

### 200

![image-20230318200337576](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200337576.png)

### 404

![image-20230318200359219](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200359219.png)

![image-20230318200411441](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200411441.png)

![image-20230318200423514](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200423514.png)

![image-20230318200439968](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200439968.png)

### 403

![image-20230318200500688](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318200500688.png)

![image-20230318201051502](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201051502.png)

### 500

![image-20230318201102550](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201102550.png)

### 504

![image-20230318201112059](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201112059.png)

![image-20230318201119678](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201119678.png)

### 302

![image-20230318201137145](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201137145.png)

![image-20230318201157448](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201157448.png)

![image-20230318201242340](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201242340.png)

## 如何构造 http 请求

![image-20230318201439746](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318201439746.png)

![image-20230318202214758](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202214758.png)

![image-20230327091422352](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327091422352.png)

![image-20230327091321028](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327091321028.png)

![image-20230327093010062](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327093010062.png)

![image-20230327093022418](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327093022418.png)

![image-20230327093036221](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327093036221.png)



![image-20230318202339971](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202339971.png)

![image-20230318202346628](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202346628.png)

![image-20230318202432850](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202432850.png)

![image-20230318202439389](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202439389.png)

![image-20230318202516321](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202516321.png)

![image-20230327093551739](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230327093551739.png)

![image-20230318202540462](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202540462.png)

![image-20230318202628324](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202628324.png)

![image-20230318202642736](C:\Users\方锐\AppData\Roaming\Typora\typora-user-images\image-20230318202642736.png)