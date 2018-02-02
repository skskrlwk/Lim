package my.day8.quiz;

import java.util.Scanner;

public class Movie {
	
	static int[][] strArr = new int[5][10];
	
	
	public static void view(int[][] strArr) {
		
		System.out.println("\r\n\r\n>>영화예매 좌석 배치도<<");
		System.out.println("");
		System.out.println("     ┌─────────────┐");
		System.out.println("     │   screen    │");
		System.out.println("     └─────────────┘");


		for(int i = 0; i<strArr.length; i++) {
			for(int j = 0; j<strArr[i].length; j++) {
				String comma = (j < strArr[i].length-1)?", ":"\n";
				if(strArr[i][j] == 0) {
					System.out.print("□"+comma);
				}else if(strArr[i][j] == 1) {
					System.out.print("■"+comma);
				}else
					System.out.print("X"+comma);
			}
		}
		System.out.println("\n");
		
	}//end of view(int[][] strArr);
	
	public static void select(int[][] strArr,char sit,int sit2) {
		
		switch (sit) {
		case 'A':
			strArr[0][sit2-1] = 1;
			break;
		case 'B':
			strArr[1][sit2-1] = 1;
			break;
		case 'C':
			if(sit2 == 1 || sit2 == 2 || sit == 7 || sit == 8) {
				System.out.println("선택할 수 없는 좌석입니다.");
				break;
			}
			strArr[2][sit2-1] = 1;
			break;
		case 'D':
			strArr[3][sit2-1] = 1;	
			break;
		case 'E':
			strArr[4][sit2-1] = 1;
			break;

		default:
			break;
		}
	}//end of select(int[][] strArr,char sit,int sit2)------------------------
	
	public static void cancle(int[][] strArr,char sit,int sit2) {
		switch (sit) {
		case 'A':
			strArr[0][sit2-1] = 0;
			break;
		case 'B':
			strArr[1][sit2-1] = 0;
			break;
		case 'C':
			if(sit2 == 1 || sit2 == 2 || sit == 7 || sit == 8) {
				System.out.println("선택할 수 없는 좌석입니다.");
				break;
			}
			strArr[2][sit2-1] = 0;
			break;
		case 'D':
			strArr[3][sit2-1] = 0;	
			break;
		case 'E':
			
			strArr[4][sit2-1] = 0;
			break;

		default:
			break;
		}
		
	}// end of cancle(int[][] strArr,char sit,int sit2)
	
	
	
	public static void main(String[] args) {
		
		Movie obj = new Movie();
		
		
		for(int i = 0; i<strArr.length; i++) {
			for(int j = 0; j<strArr[i].length; j++) {
				if((i == 2 && j == 0) || (i==2 && j ==1) || (i==2 && j ==8) || (i==2 && j ==9)  )
					strArr[i][j] = 2;
				else
					strArr[i][j] = 0;
			}
			
		}

		/*for(int i = 0; i<strtArr.length; i++) {
			for(int j = 0; j<strtArr[i].length; j++) {
				String comma = (j < strtArr[i].length-1)?", ":"\n";
				System.out.print(strtArr[i][j]+ comma);
			}
		}*/
		
		Scanner sc = new Scanner(System.in);
		outer:
		for(;true;) {
			System.out.println("=========== 예매메뉴 ==============");
			System.out.println("1. 예매좌석보기 2. 예매하기 3. 예매취소 4. 예매종료");
			String num = sc.nextLine();
			switch (num) {
			case "1":
				obj.view(strArr);
				break;
			case "2":
				
				try {
					System.out.print("예매하실 인원수 : ");
					int pnum = Integer.parseInt(sc.nextLine());
					for(int i =0; i<pnum; i++) {
						System.out.print("행입력(A~E)");
						char sit = (sc.nextLine().charAt(0));
						if('A'<=sit && sit<='E') {
							try {
								System.out.println("열(1~10)입력:");
								int sit2 = Integer.parseInt(sc.nextLine());
								obj.select(strArr,sit,sit2);
								
							}catch (Exception e) {
								System.out.println("렬입력은 숫자만 가능합니다..");
								
								continue outer;
							}				
						}
						else {
							System.out.println("A~E열사이만 선택가능합니다");
							continue outer;
						}
						
					}
					obj.view(strArr);
					
					
				} catch (Exception e) {
					System.out.println("예매인원수는 정수만 입력 가능합니다.");
					continue outer;
				}
				
				break;
			case "3":
				
				try {
					System.out.print("예매취소하실 인원수 : ");
					int pnum = Integer.parseInt(sc.nextLine());
					for(int i=0; i<pnum; i++) {
						System.out.print("행입력(A~E)");
						char sit = (sc.nextLine().charAt(0));
						if('A'<=sit && sit<='E') {
							try {
								System.out.println("열(1~10)입력:");
								int sit2 = Integer.parseInt(sc.nextLine());
								obj.cancle(strArr,sit,sit2);
								
							}catch (Exception e) {
								System.out.println("렬입력은 숫자만 가능합니다..");
								continue outer;
							}				
						}
						else {
							System.out.println("A~E열사이만 선택가능합니다");
							continue outer;
						}
						
					}
					
					obj.view(strArr);
					
					
				} catch (Exception e) {
					System.out.println("예매인원수는 정수만 입력 가능합니다.");
					continue outer;
				}
				
				break;
				
			case "4":
				System.out.println("안녕히가세요~~~~");
				return;

			default:
				continue outer;
			}
			
			
			
		}//end of for()----------------------------------
		

	}//end of main()------------------------------------

}//end of class Movie////////////////////////////////////
