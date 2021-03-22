package exception;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class ArrayIndex2 {
    public static void f(){
        int[] a = new int[10];
        a[10] = 99;
        System.out.println("hello");
    }

    public static void main(String[] args){
        try{
            f();
        }catch (ArrayIndexOutOfBoundsException e){
            System.out.println(e.getMessage());
            // 直接输出e相当于打印e.toString
            System.out.println(e.toString());
            System.out.println("caught");
            // 打印调用轨迹
            e.printStackTrace();
        }
        System.out.println("main");
    }
}
