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
