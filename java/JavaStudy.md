《Head First Java 》——my study notes



[TOC]
---

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



# Head First Java



# Java基础

## Code

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

# 流程控制

1. 顺序

2. 选择

3. 循环


# 方法

## 命令行传参

```java
//args.Length 数组长度
for(int i=0;i<args.length;i++){
    System.out.println("args["+i+"]:"+args[i]);
}
```



