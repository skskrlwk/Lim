package my.day9;

import java.util.Scanner;

public class HouseTrade {
	
	static House[] house = new House[5];
	
	public static void showInfo(int num, int cnum) {
		
		switch (num) {
			case 1:
				for(int i=0; i < house.length; i++) {
					if(house[i].hname.equals("매매") && house[i].housenum == cnum) {
						house[i].showInfo();
					}
					
				}
				break;
			case 2:
				for(int i=0; i < house.length; i++) {
					if(house[i].hname.equals("전세") && house[i].housenum == cnum) {
						house[i].showInfo();
					}
					
				}
				break;
			case 3:
				for(int i=0; i < house.length; i++) {
					if(house[i].hname.equals("월세") && house[i].housenum == cnum) {
						house[i].showInfo();
					}
					
				}
				break;
	
			default:
				break;
		}
		
			
		
	}
	
		
	
	public void show() {
		
		HouseTrade obj = new HouseTrade();

		Scanner sc =  new Scanner(System.in);
	
		Owner owner1 = new Owner("김길동", "경기도 의정부시", "010-1111-1111");
		Owner owner2 = new Owner("이길동", "경기도 안산시", "010-2222-2222");
		Owner owner3 = new Owner("나길동", "부산광역시 ", "010-3333-3333");
		Owner owner4 = new Owner("김길동", "대전광역시", "010-4444-4444");
		Owner owner5 = new Owner("김길동", "인천광역시", "010-5555-5555");
		
		house[0] = new House(4, "서울특별시 강서구", owner1, 'S', 14000, "매매",1);
		house[1] = new House(6, "서울특별시 강남구", owner2, 'W', 20000, "매매",2);
		house[2] = new House(2, "강원도 인제", owner3, 'N', 8000, "전세",3);
		house[3] = new House(10, "경기도 파주시", owner4, 'E', 9000, "전세",4);
		house[4] = new House(8, "전북", owner5, 'E', 700, "월세",5);
		int[] abc = new int[5];
	
			try {
				outer:
				for(;true;) {
					System.out.println("    ====> 메뉴 <====");
					System.out.println("1. 매매주택 조회 \n2. 전세주택 조회\n3. 월세주택 조회\n4. 종료");
					System.out.print(">> 번호를 선택하세요 >> ");
					int num = Integer.parseInt(sc.nextLine());
					
					if(num == 1) {
						for(int i=0; i<house.length; i++) {
							if(house[i].hname.equals("매매")) {
								System.out.println(house[i].housenum + ", " + house[i].address + ", "+ house[i].price);
							}
						}
						System.out.println("조회하고자하는 매물을  선택해주세요 => ");
						int cnum = Integer.parseInt(sc.nextLine());
						showInfo(num,cnum);
						System.out.print(">>계속 하시겠습니까??? Y,N >>");
						String chrchoice = sc.nextLine();
						if(chrchoice.equals("Y")|| chrchoice.equals("y")) {
							continue outer;
						}else {
							System.out.println("프로그램 종료~~~~");
							return ;
						}
					}else if(num == 2) {
						for(int i=0; i<house.length; i++) {
							if(house[i].hname.equals("전세"))
								System.out.println(house[i].housenum + ", " + house[i].address + ", "+ house[i].price);
						}
						System.out.println("조회하고자하는 매물을  선택해주세요 => ");
						int cnum = Integer.parseInt(sc.nextLine());
						showInfo(num,cnum);
						System.out.print(">>계속 하시겠습니까??? Y,N >>");
						String chrchoice = sc.nextLine();
						if(chrchoice.equals("Y")|| chrchoice.equals("y")) {
							continue outer;
						}else {
							System.out.println("프로그램 종료~~~~");
							return ;
						}
						
					}else if(num == 3) {
						for(int i=0; i<house.length; i++) {
							if(house[i].hname.equals("월세"))
								System.out.println(house[i].housenum + ", " + house[i].address + ", "+ house[i].price);
						}
						System.out.println("조회하고자하는 매물을  선택해주세요 => ");
						int cnum = Integer.parseInt(sc.nextLine());
						showInfo(num,cnum);
						System.out.print(">>계속 하시겠습니까??? Y,N >>");
						String chrchoice = sc.nextLine();
						if(chrchoice.equals("Y")|| chrchoice.equals("y")) {
							continue outer;
						}else {
							System.out.println("프로그램 종료~~~~");
							return ;
						}
					}else {
						System.out.println("프로그램 종료~~~~");
						return;
					}
					
					
				}
					
				
				}catch (NumberFormatException e) {
					System.out.println("정수만 입력가능합니다.");
					show();
					
					
				}//end of try-------------------------
	}// end of menu()----------------------------
}
