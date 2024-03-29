package io;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-23
 */
public class FileStreamDemo {

    public static void main(String[] args) {
        System.out.println("hello,world");
        byte[] buf = new byte[10];
        for (int i=0;i<buf.length;i++) {
            buf[i] = (byte) i;
        }
        try{
            FileOutputStream out = new FileOutputStream("a.dat");
            out.write(buf);
            out.close();
        }catch (FileNotFoundException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
