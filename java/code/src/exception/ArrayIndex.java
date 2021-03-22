package exception;

import java.util.Scanner;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class ArrayIndex {
    public static void main(String[] args) {
        int[] a = new int[10];
        int index;
        Scanner in = new Scanner(System.in);
        index = in.nextInt();

        // 异常处理
        try{
            a[index] = 10;
            System.out.println("hello!");
        }catch (ArrayIndexOutOfBoundsException e){
            System.out.println("Caught!");
        }

    }
}
