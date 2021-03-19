package test;

import java.util.Scanner;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-19
 */
/*
* 题目内容：
* 你的程序要读入一系列正整数数据，输入-1表示输入结束，-1本身不是输入的数据。
* 程序输出读到的数据中的奇数和偶数的个数。
*
* 输入样例：
* 9 3 4 2 5 7 －1
*
* 输出样例：
* 4 2
* */
public class RaadNum {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int ji_count = 0;
        int ou_count = 0;

        while(true){
            int i = in.nextInt();
            if(i == -1){
                break;
            }else{
                if(i%2==0){
                    ou_count++;
                }else {
                    ji_count++;
                }
            }
        }
        System.out.printf("%d %d",ji_count,ou_count);
    }
}
