[TOC]



# 汇编

```
1 byte = 8 bit
1 KB = 1024 byte
1 MB = 1024 KB
1 GB = 1024 MB
```

```
1 KB = 2^10 byte
1 MB = 2^20 byte
1 GB = 2^30 byte
```



a 32 bit computer has 32 address lines, so it can mostly find addresses:


$$
2^{32} bit = 2^2\times2^{10}\times2^{10}KB=2^2\times2^{10}MB=2^2GB= 4GB
$$
*Tips: The minist memory is 8 bit = 1 byte*



* address line -> CUP's  capability of find address
* data line -> how much data once transform
* control line -> the ability of CUP control other part

## debug

**DosBox的debug指令**

* r：查看或改变CPU寄存器的内容
  * 单个`r`是查看，`r xx`查看指定寄存器内容，在出现`:`后输入值
* d：查看某段内存内容，或者`d` + `段地址:偏移地址`
  * 单个`d`显示debug预设地址处的内容
* e：改变内存内容，`e 段地址:偏移地址 写入数据`或者`e:偏移地址  "字符串"`向内存写入字符串的十六进制

* u：将机器指令翻译成汇编指令
  * 单个`u`会将CPU中CS:IP指向的内存内容翻译成汇编指令
* t：CPU执行一条机器指令(CS:IP指向的指令)

* a：以汇编指令的格式在内存中写入机器指令
  * `a 段地址:偏移地址`按下<kbd>enter</kbd>键后，输入汇编指令，不想输入时，再次按<kbd>enter</kbd>退出
* q：退出debug

## 寄存器

* AX = AH + AL
  * `AX`是2字节(8位)寄存器，它由`AH`和`AL`两个8位寄存器(高8位和低8位)组成
* BX = BH + BL
* CX = CH + CL
* DX = DH + DL

`000 000 ~ 1111 1111` = `00 ~ FF` = `0 ~ 255` 



`8086`CPU有16根数据线，数据线的宽度决定了一次能够读取多长的数据

```assembly
debug
a;输入指令模式
mov ax,5;寄存器ax中放入5
mov ax,0;
mov al,5;寄存器ax的低8位al中放入5
;双回车结束指令输入
t;输入t执行指令

a
mov ax,4e20;寄存器ax中存入16位数据4e20
mov bx,ax;ax中数据赋予寄存器bx
mov ch,bl;cx的高8位ch给bx的低8位bl
mov cl,bh;
mov dl,bh;
mov ax,dx;

```

> 数据与寄存器之间要保证一致性，8位寄存器或8位数据给8位寄存器，16位寄存器或16位数据给16位寄存器，

## 习题

### T-1

**最多使用4条debug中的`mov,add,ax,bx......`指令编程计算2的4次方**

*我的思路：*

`0000 0010 - > 1 0000` = ``

```assembly
mov ax,2
mov bx,4
add bx,bx
add bx,bx
;目前致知道mov和add两个语法，没有头绪

```



**解答：**

*编程计算2的4次方，题目的意思是目前只知道2*

`2+2 = 4; 4+4 = 8; 8+8 = 16`

```assembly
mov ax,2
add ax,ax
add ax,ax
add ax,ax
```



# English Study

[voc](www.21voa.com)

听说读写

1. 读
2. 听
3. 听和写
4. 说

中译英