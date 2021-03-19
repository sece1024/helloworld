package test;

import java.util.Scanner;

/**
 * @author sece
 * @version 1.0
 * @since 2021-03-19
 */
public class StrSplit {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String line= in.nextLine();
        String[] str_split = line.split(" ");
        for(String word:str_split)
            System.out.println(word);

    }
}
