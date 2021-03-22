package classTable;

import javax.swing.*;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-21
 */
public class KCB {
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        JTable table = new JTable(new KCBData());
        JScrollPane pane = new JScrollPane(table);
        frame.add(pane);
        frame.pack();
        // 关闭窗口->结束程序
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
