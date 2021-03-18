import java.util.Scanner;
public class wendu{
	public static void main(String[] args){
		//System.out.println("Hello,world!");
		Scanner in = new Scanner(System.in);
		int f = in.nextInt();
		System.out.println((int)((f-32)*5.0/9));;
	}
}