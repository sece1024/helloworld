package com.sece.struct;
import java.util.Scanner;

/**
 * @author sece
 * @version 1.0
 * @since 2020-02-04
 */
public class TriDemo {
    public static void main(String[] args) {
        //题目：打印一个n行的三角形,n为奇数
        /*
        *   o
        *  000
        * 00000
        * */
        int n = 0;
        Scanner sc = new Scanner(System.in);
        if(sc.hasNextInt()){
            n = sc.nextInt();
        }
        sc.close();
        if(n%2!=0){

            for (int i = 0; i < n; i++) {
                // 打印左侧空格
                for (int j = n; j >i; j--) {
                    System.out.print(" ");
                }
                // 打印左半边三角形
                for(int j = 1;j<=i;j++){
                    System.out.print("*");

                }
                // 打印右半边三角形
                for(int j = 1;j<i;j++){
                    System.out.print("*");

                }
                System.out.println();

            }
        }else{
            System.out.println("n必须为奇数！");
        }

    }
}
