package my.day5;

import java.util.Scanner;

public class SwitchTest2 {
	
	static int a, n;
	static int menuno;
	static String str1; 
	static Scanner sc = new Scanner(System.in);
	
	public static void menu() {
		System.out.println("------- Menu -------");
		System.out.println("1. 가정용(liter당 50원)");
		System.out.println("2. 상업용(liter당 45원)");
		System.out.println("3. 공업용(liter당 30원)");
		System.out.println("--------------------");
		System.out.print(">> 메뉴번호를 선택하세요 => ");
		
	}
	
	public static void money() {
		
		switch (menuno) {
			case 1:
				
				System.out.println("물 사용량을 입력하세요");
				try {
					n = Integer.parseInt(sc.nextLine());
					break;
					
				} catch (NumberFormatException e) {
					System.out.println("숫자만 입력이 가능합니다.");
					return;
				}
				
			case 2:
				
				System.out.println("물 사용량을 입력하세요");
				try {
					n = Integer.parseInt(sc.nextLine());
					break;
					
				} catch (NumberFormatException e) {
					System.out.println("숫자만 입력이 가능합니다.");
					return;
				}
			case 3:
			
				System.out.println("물 사용량을 입력하세요");
				try {
					n = Integer.parseInt(sc.nextLine());
					break;
					
				} catch (NumberFormatException e) {
					System.out.println("숫자만 입력이 가능합니다.");
					return;
				}
			
			default:
				System.out.println("1,2,3중에서 선택이 가능합니다");
				return;
				
			
			
		}
		SwitchTest2.show();
		
	}

	public static void show() {
		
		
		if(menuno == 1) {
			
			str1 = "----가정용 고지서----"+
					"\n사용량 : " + n + "리터" + 
					"\n사용요금 : " + n*50 + "원" +
					"\n세금 : " + (int)(n*50)*0.05 + "원" +
					"\n총금액 : " + (int)((n*50)+((n*50)*0.05)) + "원";
			
			
		}else if(menuno == 2) {
			str1 = "----상업용 고지서----"+
					"\n사용량 : " + n + "리터" + 
					"\n사용요금 : " + n*45 + "원" +
					"\n세금 : " + (int)(n*45)*0.05 + "원" +
					"\n총금액 : " + (int)((n*45)+((n*45)*0.05)) + "원";
		}else if(menuno == 3) {
			str1 = "----공업용 고지서----"+
					"\n사용량 : " + n + "리터" + 
					"\n사용요금 : " + n*50 + "원" +
					"\n세금 : " + (int)((n*30)/100*5) + "원" +
					"\n총금액 : " + (int)((n*30)+((n*30)*0.05)) + "원";
		}
		System.out.println(str1);
	}
	public static void main(String[] args) {
				
		SwitchTest2.menu();
		
		
		try {
			menuno = Integer.parseInt(sc.nextLine());
			SwitchTest2.money();
			
			
		} catch (Exception e) {
			System.out.println(">>숫자만 입력하세요!!\n프로그램 종료~~");
			return; //프로그램을 종료.
		}
		
		
		
		
		String str = "";
		
		/*if(menuno >= 1 || menuno <= 3 )
			str = "선택하신 메뉴 번호는  " + menuno +"입니다.";
		else
			str = "메뉴번호는 1,2,3 만 가능합니다.";
		System.out.println(str);*/
		
		/*str = (menuno >= 1 || menuno <= 3)?"선택하신 메뉴 번호는  " + menuno +"입니다.":"메뉴번호는 1,2,3 만 가능합니다.";
		System.out.println(str);*/
	   		
		/*switch (menuno) {
			case 1:
			case 2:
			case 3:  // 1or2or3
				str = "선택하신 메뉴 번호는 " + menuno +"입니다.";
				break;
			
			default:
				str = "메뉴번호는 1,2,3 만 가능합니다.";
				break;
		}*/
		
		

	}

	private static void menuno(int menuno2) {
		// TODO Auto-generated method stub
		
	}

}
