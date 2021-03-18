package com.sece.struct;
import java.util.Scanner;
/**
 * @author sece
 * @version 1.0
 * @since 2020-02-04
 */
public class ForDemo {
    public static void main(String[] args){
        int [] a = {10,20,30,40,50};

        //增强for循环
        for(int x:a){
            System.out.println(x);
        }
        System.out.println("===========");
        //快捷方式：5.for
        for (int i = 0; i < 5; i++) {
            System.out.println(a[i]);
        }
    }
}
