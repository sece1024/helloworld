package com.sece.method;

/**
 * @author sece
 * @version 1.0
 * @since 2020-02-04
 */
public class demo01 {
    public static void main(String[] args) {
        demo01 t = new demo01();
        t.test(1,2,3);
    }
    public void test(int...i){
        System.out.println(i[0]);
        System.out.println(i[1]
        );
    }
}
