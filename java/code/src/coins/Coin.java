package coins;

import java.util.HashMap;
import java.util.Scanner;
/**
 * @author sece
 * @version 1.0
 * @since 2021-03-18
 */
//Hash表实现
public class Coin {
    // <>中的参数为对象
    private HashMap<Integer, String> coinnames = new HashMap<Integer, String>();

    public Coin(){  // 构造器
        coinnames.put(1,"penny");
        coinnames.put(10,"dime");
        coinnames.put(25,"quarter");
        coinnames.put(50,"half-dollar");
        // 相同键值会覆盖
        //coinnames.put(50,"5毛");
        //System.out.println(coinnames);
    }
    public String getName(int amount){
        return coinnames.get(amount);
    }
    public  void print(){
        for(Integer i:coinnames.keySet()){
            String s = coinnames.get(i);
            System.out.println(s);

        }
    }

    public static void main(String[] args) {
        Coin c = new Coin();
        Scanner in = new Scanner(System.in);
        int i = in.nextInt();
        System.out.println(c.getName(i));
        c.print();
    }
}
