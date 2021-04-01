《Head First Java 》——my study notes



[TOC]


# Head First Java

1. Slow down. The more you understand, the less you have to memorize.

   *学而不思则惘，将阅读和思考结合，遇到书上的习题别直接去翻答案，想象现在真的有人在问你这个问题。强迫你的大脑去思考，学习和记忆会更深刻。*

2. Do the exercises. Write your own notes.

   *有现成的，但别想着偷懒，不要只用眼睛看，拿起你的笔。大量证据表明学习过程中的身体的互动能帮助你更好地学习。*

3. Read the “There are No Dumb Questions”

   *这意味着所有的内容，它们不是可选的边栏信息，而是核心内容的一部分！有时问题比答案更重要。*

4. Don’t do all your reading in one place.

   *起立，伸展，到处走走，换把椅子,换个房间。这能让你的大脑感受到一些东西，并且避免你学习时过于依赖一个特殊地点。*

5. Make this the last thing you read before bed. Or at least the last challenging thing.

   *学习的一部分，尤其是将内容转换成长期记忆，发生在你放下书以后。你的大脑需要一些时间处理这个过程。如果你的在这段时间放进去一点东西，那么它很有可能被迅速遗忘。*

6. Drink water. Lots of it.

   *多喝水，即使你现在没那么渴，缺水会影响大脑的认知功能。*

7. Talk about it. Out loud.

   *说话会激活大脑的另一个部分，如果你在试图搞懂什么，或者提高最终能记住某事的概率，那就大声说出来。更好的做法是对其他人说。这样你会学得很快，很有可能你会突然理解某个书上看到过的知识点。*

8. Listen to your brain.

   *注意你的大脑是否过载。如果你发现自己开始跳过某些内容或者忘记刚刚才度过的东西，那就休息一下吧。一旦你过了某个临界点，强迫自己往脑袋里塞更多东西并不会让你学得更快，反而很有可能对你造成损伤。*

9. Feel something!

   *让你的大脑知道这件事重要，沉浸到故事中，在图片上标记你的字幕。为一个坏笑话而呻吟也好过无动于衷*

10. Type and run the code.

    *亲手将范例中的代码敲一遍运行一下，试着在试验中改写或者优化代码。*

# Java基础

1. 代码复制是设计不良的表现
2. 减少硬编码

## Code-Hello

```Java
public class Hello{
	public static void main(String[] args){
		System.out.println("Hello,World!");
	}
}
```

## Run

1. cmd	

   `javac Hello.java`

   produce a file named *Hello.class*

   `java Hello`



## 注释

1. 单行

   `//`

2. 多行

   `/**/`

3. 文档

   ```java
   /**(此处有两个星号)
   * @sece discription
   * @Author hgx
   */
   ```

   

## 标识符

* 以字母, "$", 或者"_"开始
* 大小写敏感
* 可以使用中文，但不建议使用中文或拼音命名

## 关键字

> String不是关键字，是类

1. class
2. public
3. if
4. for
5. while
6. final //常量



## 数据类型

> 强类型语言：要求变量的使用要严格符合规定，所有变量都必须先定义后使用;



> JDK7中有一个新特性，数字可以用下划线分隔，但不会将下划线输出

Java的数据类型分2大类

1. primitive type：基本类型
   * 数值类型
     * 整数
       * byte
       * short
       * int
       * long
     * 浮点
       * float(数字后面需要加`F`)
       * double
     * 字符串
   * boolean类型：true or false
2. reference type：引用类型
   * 类
   * 接口
   * 数组

**强制类型转换**

*使用"(数据类型)"可以强制转换类型，但是存在内存溢出或者精度问题*

*如果容量是由高到低，java会自动转换数据类型，比如int转double*

注意：

*不能对布尔类型进行转换，或者将对象类型转换为不相干的类型。*









**整数扩展**

```Java
 public static void main(String[] args){
        /*
        整数扩展：
            进制（前缀）： 二进制：0b  十进制：无   八进制：0   十六进制：0x
         */
        int i1 = 0b10;
        int i2 = 10;
        int i3 = 010;
        int i4 = 0x10;
        System.out.println(i1);
        System.out.println(i2);
        System.out.println(i3);
        System.out.println(i4);
    }
```

**输出**

> 2
> 10
> 8
> 16

**浮点数扩展**

*因为float和double都有精度损失问题（有舍入误差，比较时最好完全使用浮点数），银行数据要用大数类表示(BigDecimal)*



### 转义字符

```Java
        char c = '\u0061';
        System.out.println(c);
// 输出：a
```

### 变量

* 每个变量都有类型

* 必须是合法标识符

* 变量定义必须以分号结束

* 为了可读性，最好一行声明一个变量



### 常量

* 赋值后不再改变
* 一般用大写字母命名

*使用时加修饰符：*

`static final`或者`final static`

### 命名规则

>  变量、方法、类的名字都要做到见名知意

| 类成员变量 | 首字母小写和驼峰规则 | monthSalary |
| ---------- | -------------------- | ----------- |
| 类名       | 首字母大写和驼峰规则 | GoodMan     |
| 方法       | 首字母小写和驼峰规则 | runRun()    |



## 运算符

> Ctrl + D复制当前行到下一行



**位移运算**

```java

int a = 2;
System.out.println(a<<3);
//输出是二进制数（10）右移3位得到（10000）
//out:16
```

**三元运算符**

```java
//x?y:z
//如果x=true， 则结果为y， 否则结果为z
```

## 包机制

> 包名一般是域名的倒置，
>
> 如"com.baidu.www"

**导入方法**

```java
package package1;
import package1;
```



## JavaDoc

[Java8官方文档](https://docs.oracle.com/javase/8/docs/api/)

**加在自己写的类中**

```java
/**
*@author
*@param name
*@return
*@throws
*/
```

* 在IDEA 中生成JavaDoc文档

  1. 打开Tools-Generate JavaDoc

  2. Output directory 选择输出文件夹

  3. 填入命令参数`-encoding UFT-8 -charset UTF-8`

     

* 在Settings-File and Code Templates-Files-Class中填入注释

  ```java
  /**
   * @author sece
   * @version 1.0
   * @since 2020-02-04
   */
  ```

  *此后新加类都会带有这个注释*

## 流程控制

1. 顺序

2. 选择

3. 循环


## 方法

### 命令行传参

```java
//args.Length 数组长度
for(int i=0;i<args.length;i++){
    System.out.println("args["+i+"]:"+args[i]);
}
```



## 类

### 向上造型

> 造型cast：
>
> 子类对象可以赋值给父类的变量（Java中不存在对象对对象赋值）
>
> 父类对象不能赋值给子类的变量

```java
Vechicle v;
Car c = new Car();
v = c; // ok
c = v; // error
// 造型
c = (Car)v; // 只有当v这个变量实际管理的是Car才行
```



**造型**

* 用括号围起类型放在值的前面(`c = (Car)v`);
* 对象本身并没有发生任何变化，所以不是“类型转换”;
* 运行时有检查这样的转换是否合理的机质(`ClassCastException`)。

> 造型是把对象v当作另一类对象来看待，但没有对c进行改造，而类型转换是会进行改造的，比如浮点数转换成整型会抛弃小数部分。







### Object类

> 所有的类都是继承自Object的



#### Object类的函数

1. toString()
2. equals()
### 多态

> 函数调用的绑定

* 当通过对象变量调用函数的时候，调用哪个函数这件事情叫做绑定。
  * 静态绑定：根据变量的声明类型来决定
  * 动态绑定：根据变量的动态类型来决定(Java中大多数是这种)
* 在成员函数中调用其他成员函数也是通过this这个对象变量来调用的



> 覆盖(override)

* 子类和父类中存在名称和参数表完全相同的函数，这一对函数够成覆盖关系。
* 通过父类的变量调用存在覆盖关系的函数时，会调用变量当时所管理的对象所属的类的函数。



### 封装



## String

### 特性

1. 赋值后不可变

   * 可以缓存hash值
   * String Pool 的需要
     * 字符串常量池(String Pool)保存所有字符串字面量，这些字面量在编译时期就确定。String的intern()方法在运行过程将字符串添加到String Pool中，如果String Pool中已存在一个字符串和该字符串相等(使用`equals()`方法确定)，那么就会返回String Pool中字符串的引用；否则就会在String Pool中添加一个新的字符串，并返回这个新字符串的引用。

   
   ```java
   /* 
   如果String Pool中还没有"abc"字符串，那么使用这种方法会创建两个字符串对象；
   1. "abc"属于字符串字面量，因此编译时期会在String Pool中创建一个字符串对象，指向"abc"这个字符串字面量。
   2. 使用new的方式会在堆中创建一个字符串对象。
   */
   String s = new String("abc")
   ```
   
2. 因为不可变，所以是线程安全的



### 方法

`String.split()`:字符串分隔



# 进阶

## 框架

## 抽象

> 抽象类(`abstract class`)——表达一种概念，这个类不能够产生实体对象
>
> 抽象函数——表达概念，无法实现具体代码

* 修饰符：`abstract`
* 有抽象函数的类一定是抽象类
* 抽象类不能制造对象，但是可以定义变量
  * 任何继承了抽象类的非抽象类的对象可以付给这个变量



**实现抽象函数**

* 继承自抽象类的子类必须覆盖父类中的抽象函数*(使用 `@Override`)*
  * 否则自己成为抽象类

**两种抽象**

1. 与具体相对
2. 与细节相对

### 细胞自动机

> 初始化时，以一定概率复活网格内的细胞
>
> 细胞八邻域内的细胞数量`n<2 | n >3`时该细胞死亡，恰好`n==3`时存活



1. 数据与表现分离

2. 责任驱动的设计
   * 将程序要实现的功能分配到合适的类/对象中

3. 网格化



## 接口

> * 接口是纯抽象类
>   * 所有成员函数都是抽象函数
>   * 所有成员变量都是`public static final`
> * 接口规定了长什么样，但是不管里面有什么



**实现接口**

* 类用extends，接口用implements
* 类可以实现很多接口
* 接口可以继承接口，但不能继承类
* 接口不能实现接口



### 面向接口的编程方式

* 设计程序时先定义接口，再实现类
* 任何需要在函数间传入传出的一定是接口而不是具体的类
* 是Java成功的关键之一，因为极适合多人同时写一个大程序
* 也是Java被批评的要点之一，因为代码量膨胀起来很快



### 反转控制

​	JButton中有ActionListener接口接受消息，有addActionListener方法添加ActionListener对象，按钮知道自己被按下以后，能通过Override的actionPerformed函数实现动作。

```java
btn.addActionListener(new ActionListener(){ // ActionListener是接口
    @Override
    public void actionPerformed(ActionEvent e){ // 匿名类
        System.out.println("已经按下！");
    }
});
```

#### 注入反转

* 由按钮公布一个收听者接口和一对注册/注销函数
* 你的代码实现那个接口，将收听者对象注册在按钮上
* 一旦按钮被按下，就会反过来调用你的收听者对象的某个函数

#### 匿名类

* 在`new`对象的时候给出的类的定义形成了匿名类
* 匿名类可以继承某类，也可以实现某接口
* Swing的消息机质广泛使用匿名类

#### 内部类

* 定义在别的类内部、函数内部的类
* 内部类能直接访问外部的全部资源
  * 包括任何私有的成员
  * 外部是函数时，只能访问那个函数里final的变量

​	*提前在内部定义一个类继承ActionListener接口*

```java
private class MyLisntenr inplements ActionListener{
    @Override
    public void actionPerformed(ActionEvent e){
        System.out.println("已经按下！");
    }
}
btn.addListener(new myListener);
```



### 狐狸和兔子

> 1. 狐狸和兔子都有年龄
> 2. 年龄到了一定上限会自然死亡
> 3. 狐狸可以随机决定在周围的兔子中吃一个
> 4. 狐狸和兔子可以随机决定生一个小的，放在旁边的空的格子里
> 5. 如果不吃也不生，可以随机向旁边的空格子移动一步



## swing

### JTable

* 用`JTable`类可以以表格的形式显示和编辑数据。但`JTable`类的对象并不储存数据，它只是数据的表现。

> 数据与容器分离

```java
package classTable;

import javax.swing.*;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class KCB {
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        JTable table = new JTable(new KCBData());
        JScrollPane pane = new JScrollPane(table);
        frame.add(pane);
        frame.pack();
        // 关闭窗口->结束程序
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}

```

```java
package classTable;

import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class KCBData implements TableModel {
    private String[] title={
            "周一","周二","周三","周四","周五","周六","周日",
    };
    private String[][] data = new String[8][7];
    public KCBData(){
        for(int i=0;i< data.length;i++){
            for(int j=0;j<data[i].length;j++){
                data[i][j] = "";
            }
        }
    }
    @Override
    public int getRowCount() {
        return 8;
    }

    @Override
    public int getColumnCount() {
        return 7;
    }

    @Override
    public String getColumnName(int columnIndex) {
        return title[columnIndex];
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return String.class;
    }

    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return true;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        return data[rowIndex][columnIndex];
    }

    @Override
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        data[rowIndex][columnIndex] = (String)aValue;

    }

    @Override
    public void addTableModelListener(TableModelListener l) {

    }

    @Override
    public void removeTableModelListener(TableModelListener l) {

    }
}
```

### MVC

* 数据、表现和控制三者分离，各负其责
  * M = Model(模型)
  * V = View(表现)
  * C = Control(控制)
* 模型：保存和维护数据，提供接口让外部修改数据，通知表现需要刷新
* 表现：从模型获得数据，根据数据画出表现
* 控制：从用户得到输入，根据输入调整数据



> 用户控制和表现没有直接关系，用户修改数据，View根据数据重新决定表现。



## 异常

* `try...catch`
* `throw`



### 异常声明

* 如果你的函数可能抛出异常，就必须在函数头部加以声明

  `void f() throws TooBig, TooSmall, DivZero{//...}`

  `void f(){..}`

* 可以声明并不会真的抛出的异常

* 如果调用一个声明会抛出异常的函数，那么必须

  * 把函数的调用放在`try`块中，并设置`catch`来捕捉所有可能抛出的异常；
  * 或者，声明自己会抛出无法处理的异常

**异常声明的继承关系**

* 当覆盖一个函数的时候，子类不能声明抛出比父类的版本更多的异常
* 在子类的构造函数中，必须声明父类可能抛出的全部异常

### 异常捕捉示例

```java
package exception;

import java.util.Scanner;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class ArrayIndex {
    public static void main(String[] args) {
        int[] a = new int[10];
        int index;
        Scanner in = new Scanner(System.in);
        index = in.nextInt();
        
        // 异常处理
        try{
            a[index] = 10;
            System.out.println("hello!");
        }catch (ArrayIndexOutOfBoundsException e){
            System.out.println("Caught!");
        }
    }
}

```



### 异常捕捉机制

```java
package exception;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class ArrayIndex2 {
    public static void f(){
        int[] a = new int[10];
        a[10] = 99;
        System.out.println("hello");
    }
    
    public static void main(String[] args){
        try{
            f();
        }catch (ArrayIndexOutOfBoundsException e){
            System.out.println("caught");
        }
        System.out.println("main");
    }
}

// caught
// main
```





* 有异常 -> 所处是`try` -> 有`catch`匹配 -> 继续下面的语句
  * 								​									没有`catch`匹配 -> 退出到外层 -> 再次进行异常判断
  * 								所处不是`try` -> 所处是函数 -> 返回调用者 -> 再次进行异常判断
  * 								 						​                            所处不是函数 -> 退出到外层  -> 再次进行异常判断



### 捕捉之后

```java
package exception;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class ArrayIndex2 {
    public static void f(){
        int[] a = new int[10];
        a[10] = 99;
        System.out.println("hello");
    }

    public static void main(String[] args){
        try{
            f();
        }catch (ArrayIndexOutOfBoundsException e){
            System.out.println(e.getMessage());
            // 直接输出e相当于打印e.toString
            System.out.println(e.toString());
            System.out.println("caught");
            // 打印调用轨迹
            e.printStackTrace();
        }
        System.out.println("main");
    }
}
/*
10
java.lang.ArrayIndexOutOfBoundsException: 10
caught
main
java.lang.ArrayIndexOutOfBoundsException: 10
	at exception.ArrayIndex2.f(ArrayIndex2.java:11)
	at exception.ArrayIndex2.main(ArrayIndex2.java:17)
*/
```



## 流

> 流是输入输出的方式

* 一维，单方向



**流的基础类**

1. InputStream
2. OutputStream



### 流过滤器

> 以一个介质流对象为基础层层构建过滤器流，最终形成的流对象能在数据的输入输出过程中，逐层使用过滤器流的方式来读写数据

```java
package io;

import java.io.*;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-23
 */
// 从文件a.dat中读取数据
public class ReadDemo01 {
    public static void main(String[] args) {

        try{
            DataOutputStream out = new DataOutputStream(
                    new BufferedOutputStream(
                            new FileOutputStream("a.dat"))); // 流过滤器
            int i = 123456; // 十六进制数
            out.writeInt(i);
            out.close();

            DataInputStream in = new DataInputStream(
                    new BufferedInputStream(
                            new FileInputStream("a.dat")));
            int j = in.readInt();
            System.out.println(j);
            in.close();
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }

        // System.out.println(i);



    }
}

```

### 文件流

* `FileInputStream`
* `FileOutputStream`
* 对文件作读写操作
* 实际工程中已经较少使用
  * 更常使用的是以在内存数据或通信数据上建立的流，如数据库的二进制数据读写或网络端口通信
  * 具体的文件读写有更专业的类，比如配置文件和日志文件



### 阻塞/非阻塞

* `read()`函数是阻塞的，在读到所需的内容之前会停下来等

  * 使用`read()`的更“高级”的函数，如`nextInt()`, `readLine()`都是这样
  * 所以常用单独的线程来做`socket`读的等待，或使用`nio`的`channel`选择机制

* 对于`socket`，可以设置`SO`时间

  `setSOTimeout(int timeOut)`



### 对象串行化

* `ObjectInputStream`类
  * `readObject()`
* `ObjectOutputStream`类
  * `writeObject()`
* `Serializable`接口



# 知识点笔记

## 关于调试

### StackTraceElement

#### 方法

1. `getMethodName()`	获取方法名
2. `getFileName()`        获取文件名
3. `getLineNumber()`    获取行号



简述：`StackTrace`用栈的形式保存方法的调用信息

* `StackTraceElement`数组是`StackTrace`中的内容



使用示例`\Code\src\eual.DateTest01.showDate()`：

```java
StackTraceElement traceElement = ((new Exception().getStackTrace()))[0]; // 0是当前类的方法，1是调用者的方法
        System.out.println(traceElement.getMethodName());
```

输出：`showDate`

*将0改为1则输出调用者 `main`*

---

### 契约式设计

#### 异常(Exception)

> 一般用于处理不受我们控制的不可预见的错误



#### 断言(Assertion)

> 验证我们在代码中做出的一些假设



## 关于内存管理

### 垃圾回收

> Java的一个特点就是它不允许修改引用的策略。这种策略使Java能够高效自动地回收垃圾。



#### 简述

* 内存被声明以后，因为某些原因不需要再使用了，这样的内存被称为垃圾，或者孤儿；
  * 比如声明了对象a和b，令`a=b`后，a和b指向同一内存空间，而a原先指向的内存将无法被引用，这种对象就叫做“孤儿”



##### 









