package test;

import java.util.Scanner;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-19
 */
/*
题目内容：
    对数字求特征值是常用的编码算法，奇偶特征是一种简单的特征值。
对于一个整数，从个位开始对每一位数字编号，个位是1号，十位是2号，
以此类推。这个整数在第n位上的数字记作x，如果x和n的奇偶性相同，则记下一个1，否则记下一个0。
按照整数的顺序把对应位的表示奇偶性的0和1都记录下来，就形成了一个二进制数字。
比如，对于342315，这个二进制数字就是001101。
按照二进制位值将1的位的位值加起来就得到了结果13。

    你的程序要读入一个非负整数，整数的范围是[0,100000]，
然后按照上述算法计算出表示奇偶性的那个二进制数字，输出它对应的十进制值。

    提示：将整数从右向左分解，数位每次加1，而二进制值每次乘2。

    输入格式:
    一个非负整数，整数的范围是[0,1000000]。

    输出格式：
    一个整数，表示计算结果。

    输入样例：
    342315

    输出样例：
    13
*/
public class NumFeatures {
    // 输入一个数字，将其转化为数为：342315 -> 654321
    public static int test1(int n){
        int out = 0;
        int count = 1;
        for(int i=n;i>0;i /= 10){
            out += Math.pow(10,count-1)*count;
            count++;
        }
        return out;
    }
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        //System.out.println(test1(n));
    }
}
