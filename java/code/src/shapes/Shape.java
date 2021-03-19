package shapes;

import java.awt.Graphics;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-19
 */
// 抽象类
public abstract class Shape {
    public abstract void draw(Graphics g);  // 抽象类不用接花括号
    public abstract void move(Graphics g);
    public static void main(String[] args) {
        //Shape s = new Shape();    // 抽象类不能被实例化

    }
}
