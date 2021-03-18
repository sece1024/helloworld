package com.sece.scanner;
import java.util.Scanner;
/**
 * @author sece
 * @version 1.0
 * @since 2020-02-04
 */
public class Demo02 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("输入一个整数");
        if(sc.hasNextInt()){
            int a = sc.nextInt();
            System.out.println("a="+a);
        }

        System.out.print("输入一个小数");
        if(sc.hasNextFloat()){
            float f = sc.nextFloat();
            System.out.println("f="+f);
        }

        sc.close();
    }
}
