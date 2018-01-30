package my.day7;

import java.util.Random;
import java.util.Scanner;

import my.util.MyUtil;

public class GayBayBo {
	
	public static void gameResult(String userNo, int pcNo) {
		
		String userStr = "", pcStr="";
		if(userNo.equals("1"))
			userStr = "가위";
		else if(userNo.equals("2"))
			userStr = "바위";
		else if(userNo.equals("3"))
			userStr = "보";
		
		if(pcNo == 1)
			pcStr = "가위";
		else if(pcNo == 2)
			pcStr = "바위";
		else if(pcNo == 3)
			pcStr = "보";
		
		String gameResult = "";
		
		if((userStr.equals("가위") && pcStr.equals("보")) ||
		   (userStr.equals("바위") && pcStr.equals("가위")) || 
		   (userStr.equals("보") && pcStr.equals("바위")))
					gameResult = "사용자가 이겼습니다.";
		else if ((userStr.equals("가위") && pcStr.equals("바위")) ||
				 (userStr.equals("바위") && pcStr.equals("보")) || 
				 (userStr.equals("보") && pcStr.equals("가위")))
			
					gameResult = "컴퓨터가 이겼습니다.";
		else if	 ((userStr.equals("가위") && pcStr.equals("가위")) ||
				  (userStr.equals("바위") && pcStr.equals("바위")) || 
				  (userStr.equals("보") && pcStr.equals("보")))
			
					gameResult = "비겼습니다.";
		
		System.out.println(">> 사용자 : "+ userStr +", 컴퓨터 : "+ pcStr);
		System.out.println(">> 게임 결과는 " + gameResult);
		
	}//end of gameResult(String userNo, int pcNo)------------------------
	
	public static void menu() {
		System.out.println("=== *** 가위, 바위, 보 Game *** ===");
		System.out.println("1.가위  2.바위 3.보 9.게임종료");
		System.out.println("=================================");
		System.out.print("선택하세요 (1,2,3,9) : ");
		
		
	}// end of menu()----------------------------------------------

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		GayBayBo obj = new GayBayBo();
				
		do {
			GayBayBo.menu();
			String userNo = sc.nextLine();
			int pcNo = MyUtil.random(1, 3);
			
			switch (userNo) {
				case "1":
				case "2":					
				case "3":
					obj.gameResult(userNo, pcNo);
					break;
					
				case "9":
					System.out.println(">> 게임을 종료합니다.~~");
					break;
	
				default:
					System.out.println("메뉴에 없는 번호 입니다. 다시 선택하세요!!");
					break;
			}//end of switch-----------------------------
			
			if(userNo.equals("9"))
				break;
			
		} while (true);//end of while--------------------------
		
		System.out.println(">> 종료시각 : " + MyUtil.getNowTime());
		sc.close();
	}//end of main()----------------------------------

}//end of class GayBayBo//////////////////////////////////////////////
