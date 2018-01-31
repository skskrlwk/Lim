package my.day7.quiz;

import java.util.Scanner;

import my.util.MyUtil;

public class NumberBingo {
	static int count = 1;
	
	public void bingo(int userNum, int Num) {
		
		if(userNum < Num) {
			System.out.println("입력하신 '"+userNum+"' 보다 큽니다.");
			count++;
			
		}else if(userNum > Num) {
			System.out.println("입력하신 '"+userNum+"' 보다 작습니다.");
			count++;
			
		}else {
			System.out.println("빙고~~~ "+count+"번만에 맞추었습니다.");
		}
	}// end of bingo(int userNum, int Num)-------------------------------------
		
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		NumberBingo obj = new NumberBingo();
		int Num = MyUtil.random(1, 100);
		
		for(;true;) {
			
			try {
				System.out.print("1부터 100사이의 정수를 입력하세요 => ");
				int userNum = Integer.parseInt(sc.nextLine());
				
				if(userNum >100 || userNum < 1 ) {
					System.out.println("1과 100사이의 정수만 입력 가능합니다!!! ");
					continue;
				}
				obj.bingo(userNum, Num);
				if(userNum == Num)
					break;
			} catch (NumberFormatException e) {
				System.out.println("숫자만 입력하세요!!!");
			}
			
		}//end of for---------------------------
		
		System.out.println(MyUtil.getNowTime());
		sc.close();
	}//end of main()------------------------------
	

}//end of class NumberBingo/////////////////////////////////////


/*
 	컴퓨터가 1~100사이의 랜덤한 숫자를 가진다.
 	예> 59
 	1부터 100 사이의 정수를 입력하세요 => 80
 	>>80보다 작습니다.
 	1부터 100 사이의 정수를 입력하세요 => 40
 	>>40보다 큽니다.
 	1부터 100 사이의 정수를 입력하세요 => 53
 	>>53보다 큽니다.
 	1부터 100 사이의 정수를 입력하세요 => 60
 	>>60보다 작습니다.
 	1부터 100 사이의 정수를 입력하세요 => 59
 	>> 빙고~~ 5번만에 맞추었습니다.
 */
