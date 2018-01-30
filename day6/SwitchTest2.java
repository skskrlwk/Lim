package my.day6.quiz;

import java.util.Scanner;

import my.util.MyUtil;

public class SwitchTest2 {

	public static void menu() {
		System.out.println("-------- Menu --------");
		System.out.println("1. 가정용(liter 당 50원)");
		System.out.println("2. 상업용(liter 당 45원)");
		System.out.println("3. 공업용(liter 당 30원)");
		System.out.println("4. 종료");
		System.out.println("----------------------");
		System.out.print(">> 메뉴번호를 선택하세요 => ");
		
	//	System.exit(0);  // 숫자 0은 정상적인 프로그램 종료
	//	System.exit(3);  // 숫자 0을 제외한 나머지 숫자는 비정상적인 프로그램 종료
	
	} // end of void menu()-------------------------------
	
	
	public void execute(int menuno, int useLiter) {
		
		int usePrice = 0;
		String title = "";
		
		switch (menuno) {
			case 1:
				title = "=== 가정용 고지서 ===";
				usePrice = useLiter * 50;
				break;
				
			case 2:
				title = "=== 상업용 고지서 ===";
				usePrice = useLiter * 45;
				break;	
				
			case 3:
				title = "=== 공업용 고지서 ===";
				usePrice = useLiter * 30;
				break;	
		}
		
        int tax = (int)(usePrice * 0.05);  // 세금
        
        System.out.println("\n"+title);
        System.out.println("사용량: " + MyUtil.getCommaNumber(useLiter) +"리터");
        System.out.println("사용요금: " + MyUtil.getCommaNumber(usePrice) +"원");
        System.out.println("수도세금: " + MyUtil.getCommaNumber(tax) +"원");
        System.out.println("총수도요금: " + MyUtil.getCommaNumber((usePrice+tax)) +"원\n");
		
	}// end of void execute()-----------------------------
	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int menuno = 0;
		
		for(;true;) {
			SwitchTest2.menu();
			
			String str = "";
			
			try {
				 menuno = Integer.parseInt(sc.nextLine());
				 if( menuno == 4) break; //for문을 빠져나간다
				 
				 switch (menuno) {
					case 1:
					case 2:
					case 3:
						str = "선택하신 메뉴번호는 " + menuno + "번 입니다.";
						System.out.println(str);
						break; // switch 문을 빠져나간다.
			
					default:
						str = ">>메뉴번호는 1,2,3,4 만 가능합니다.\n";
						System.out.println(str);
						continue;  
				}// end of switch----------------
				
				System.out.print("물사용량을 입력하세요 => ");
				int useLiter = Integer.parseInt(sc.nextLine());
				
				SwitchTest2 obj = new SwitchTest2();
				obj.execute(menuno, useLiter); 
				 
			} catch (NumberFormatException e) {
				System.out.println(">> 숫자만 입력하세요!!\n");
				continue; 
			}

		}// end of for--------------------------
		
		System.out.println(">>> 안녕히계세요~~^^");
		
		sc.close();
		
	}// end of main()----------------------------------

}
