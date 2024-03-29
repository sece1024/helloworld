package equal;

/**
 * @author sece
 * @version 1.0
 * @since 2021-04-01
 */
public class Date {
    // 不可变
    private final int month;
    private final int day;
    private final int year;

    public Date(int m, int d, int y){
        month = m;
        day = d;
        year = y;
    }

    public int getMonth(){
        return month;
    }
    public int getDay(){
        return day;
    }
    public int getYear(){
        return year;
    }
    public String toString(){
        return getYear()+"-"+getMonth()+"-"+getDay();
    }
    public boolean equals(Object x){
        if(this == x) return true;
        if(x == null) return false;
        if(this.getClass() != x.getClass()) return false;
        Date that = (Date)x;
        if(this.day != that.day) return false;
        if(this.month != that.month) return false;
        if(this.year != that.year) return false;

        return true;
    }
//    public void testChangeValueDay(int i){day = i;}

}
