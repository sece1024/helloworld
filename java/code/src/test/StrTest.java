package test;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-18
 */
public class StrTest {
    public static void main(String[] args){
        int[] int_a = new int[10];      // 整型数组，每个单元存放的是数，初始化为0
        String[] str_a = new String[10];// 字符串型数组，每个单元存放的是指向一个字符串的指针，初始化为null（并不是字符串null）


        System.out.println(int_a[0]);
        System.out.println(str_a[0]);
        System.out.println(str_a[0]+": this is a null");
        System.out.println(int_a.length);
        //System.out.println(str_a[0].length());// java.lang.NullPointerException
    }
}
