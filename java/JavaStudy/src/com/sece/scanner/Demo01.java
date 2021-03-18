package com.sece.scanner;
import java.util.Scanner;
/**
 * @author sece
 * @version 1.0
 * @since 2020-02-04
 */
public class Demo01 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("使用nextLine方法接受：");

        if(scanner.hasNextLine()){
            String str = scanner.nextLine();
            System.out.println("输出内容为："+str);

        }
        scanner.close();// 记得关闭
    }
}
