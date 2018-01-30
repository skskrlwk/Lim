package my.day7;

import java.util.Random;

import my.util.MyUtil;

public class RandomTest {

	public static void main(String[] args) {
		
		Random rnd = new Random();
		System.out.println("1부터 10까지 중 랜덤한 수 : ");
		int rndnum = rnd.nextInt(10) + 1; 
					//0부터 9까지 랜덤한수
		
		System.out.println(rndnum);
		
		System.out.println("\n13부터 18까지 중 랜덤 한 수");
		//min 부터 max사의의 랜덤한 정수를 얻으면
		//rnd.nextInt(max - min + 1) + min;
		//rnd.nextInt(6)+13;
		System.out.println(MyUtil.random(13, 18));
	}

}
