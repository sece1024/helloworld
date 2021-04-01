package equal;

/**
 * @author sece
 * @version 1.0
 * @since 2021-04-01
 */
public class DateTest01 {
    public static void main(String[] args) {
//        showDateTest();

//        Date d = new Date(4,1,2021);
//        showDate(d);

        // 时间比较
        equalTest(new Date(4,1,2020),new Date(4,2,2020));
    }


    // 显示日期
    public static void showDate(Date d){ // 显示时间
        System.out.println(d);

    }
    public static void showDateTest(){
        StackTraceElement traceElement = ((new Exception().getStackTrace()))[0]; // 0是当前类的方法，1是调用者的方法
//        System.out.println("MethodName: "+traceElement.getMethodName()+
//                "\nFile Name: "+traceElement.getFileName()+
//                "\nLine Number: "+traceElement.getLineNumber());
        System.out.println("Call "+traceElement.getMethodName()+"()");
        Date d1 = new Date(4,1,2021);
        System.out.println(d1);
    }
    // 判断两个日期是否相同
    public static void equalTest(Date d1,Date d2){
        showDate(d1);
        showDate(d2);

        System.out.println(d1.equals(d2));
    }

}
