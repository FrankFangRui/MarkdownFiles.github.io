## 1.面向对象的三大特性

### 1.封装

​       封装是指将对象的属性和行为包装在一起，隐藏对象的内部细节，仅向外部提供必要的接口来与对象进行交互。这样可以保证对象的内部状态不会被外部直接访问或修改，从而提高程序的安全性和可维护性。

```java
public class Person {
 private String name;
 private int age;
 
 public void setName(String name) {
 this.name = name;
 }
 
 public String getName() {
 return name;
 }
 
 public void setAge(int age) {
 this.age = age;
 }
 
 public int getAge() {
 return age;
 }
}

```



### 2.继承

​      让某个类型的对象获得另一个类型的对象的属性和方法。它允许子类继承父类的属性和方法，从而避免重复编写代码，提高代码的复用性和可维护性。

```text
class Car {
 private int numberOfWheels;
 private String color;
 private String brand;

 public void accelerate() {
 // 加速代码
 }

 public void brake() {
 // 刹车代码
 }
}

class Sedan extends Car {
 private int numberOfDoors;
 private int trunkCapacity;

 public void parkAutomatically() {
 // 自动泊车代码
 }
}
```

在上面的示例代码中，Sedan类继承了Car类，并在其基础上添加了numberOfDoors和trunkCapacity属性，以及parkAutomatically()方法。由于Sedan类继承了Car类的属性和方法，因此不需要再次定义numberOfWheels、color、brand、accelerate()和brake()，从而避免了重复编写代码的麻烦。

### 3.多态

​       同一个方法在不同的对象上会产生不同的行为。通俗地说，就是不同的对象对同一个方法会有不同的实现。多态存在的3个条件：1）继承；2）重写；3）父类引用指向子类对象。

```java
// 定义一个抽象类Animal
abstract class Animal {
 public abstract void makeSound();
}

// 定义Dog类，继承Animal类
class Dog extends Animal {
 public void makeSound() {
 System.out.println("汪汪汪！");
 }
}

// 定义Cat类，继承Animal类
class Cat extends Animal {
 public void makeSound() {
 System.out.println("喵喵喵！");
 }
}

// 测试多态
public class TestPolymorphism {
 public static void main(String[] args) {
 Animal animal1 = new Dog(); // 创建一个Dog对象
 Animal animal2 = new Cat(); // 创建一个Cat对象
        animal1.makeSound(); // 调用Dog类的makeSound()方法
        animal2.makeSound(); // 调用Cat类的makeSound()方法
 }
}
```

