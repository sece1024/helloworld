package io;

import java.io.IOException;
//import java.util.Scanner;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class Main {
    public static void main(String[] args) {
        //Scanner in = new Scanner(System.in);

        byte[] buffer = new byte[1024];
        // 读取的字节长度
        int len;
        try {
            len = System.in.read(buffer);
            // 将缓存区中的字节转换成字符串
            String s = new String(buffer,0,len);
            System.out.println("读到了"+len+"个字节");
            System.out.println(s);
            System.out.println("s的长度是："+s.length());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
