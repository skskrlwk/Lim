package my.day8.quiz;

import java.util.Scanner;

public class MovieSeatReservation {

	static String[][] seatArr = new String[5][11];
	
	MovieSeatReservation() {
				
		for(int i=0; i<seatArr.length; i++) {
			for(int j=0; j<seatArr[i].length; j++) {
							
				if(j==0) {
					seatArr[i][j] = String.valueOf((char)('A'+i));
				}
				else if( (i==2 && (0<j &&j <3)) || (i==2 && j>8)) {
					seatArr[i][j] = "x";
				}
				else {
					seatArr[i][j] = "□";
				}
			
			}// end of for(내부)-----------------------------
		}// end of for(외부)-----------------------------
		
	}// end of MovieSeatReservation() 기본생성자---------------
	
	
	static void menu() {
		System.out.println("  ========== 예매메뉴 ==========");
		System.out.println("1.예매좌석보기  2.예매하기  3.예매취소  4.예매종료");
		System.out.println("");
	}// end of menu()----------------------------
	
	
	void showSeat() { 

		
		System.out.println("  1 2 3 4 5 6 7 8 9 10");
		
		String space = "";
		for(int i=0; i<seatArr.length; i++) {
			for(int j=0; j<seatArr[i].length; j++) {
				space = (j<seatArr[i].length-1)?" ":"\r\n";
				System.out.print(seatArr[i][j]+space);
			}
		}
		System.out.println("\r\n\r\n");
	}// end of showSeat()-----------------------------

	
	String reservationSeat(String row, String col){
		
		String result = "";
		
		boolean flag = false;
		
		for(int i=0; i<seatArr.length; i++) {
			if( seatArr[i][0].equals(row) ) {  // A B C D E 이외의 값을 입력한 경우 
				flag = true;
				break;
			}
		}
		
		if(!flag) {
			result = "존재하지 않는 좌석행 입니다.";
			return result;	
		}
		
		
		int rownum = row.charAt(0) - 'A';
		int colnum = Integer.parseInt(col);
		
		if( !(1<= colnum && colnum <= seatArr[rownum].length) ) {
			result = "존재하지 않는 좌석열 입니다.";
			return result;
		}
		
		
		// 입력받은 좌석행(A~E)값을 배열의 번호(0~4)로 변경하기
		char ch = 'A';
		for(int i=0; i<seatArr.length; i++) {
			if(row.equals(String.valueOf((char)(ch+i)) )) {
				rownum = i;
				break;
			}
		}
		
		if(!seatArr[rownum][colnum].equals("□")) {
			result = "예매불가 좌석입니다.";
		}
		else {
			seatArr[rownum][colnum] = "■";
			result = "좌석예매 성공!!";	
		}
		
		return result;
		
	}// end of reservationSeat(String row, String col)----------------
	

	String cancelSeat(String row, String col){
		
		String result = "";
		
		boolean flag = false;
		
		for(int i=0; i<seatArr.length; i++) {
			if( seatArr[i][0].equals(row) ) {  // A B C D E 이외의 값을 입력한 경우 
				flag = true;
				break;
			}
		}
		
		if(!flag) {
			result = "존재하지 않는 좌석행 입니다.";
			return result;	
		}
		
		
		int rownum = row.charAt(0) - 'A';
		int colnum = Integer.parseInt(col);
		
		if( !(1<= colnum && colnum <= seatArr[rownum].length) ) {
			result = "존재하지 않는 좌석열 입니다.";
			return result;
		}
		
		
		// 입력받은 좌석행(A~E)값을 배열의 번호(0~4)로 변경하기
		char ch = 'A';
		for(int i=0; i<seatArr.length; i++) {
			if(row.equals(String.valueOf((char)(ch+i)) )) {
				rownum = i;
				break;
			}
		}
		
		if(!seatArr[rownum][colnum].equals("■")) { 
			result = "취소불가 좌석입니다.";
		}
		else {
			seatArr[rownum][colnum] = "□"; 
			result = "예매취소 성공!!";	
		}
		
		return result;
		
	}// end of cancelSeat(String row, String col)----------------
	
	
	public static void main(String[] args) {
		
		MovieSeatReservation msrObj = new MovieSeatReservation();
		
		Scanner sc = new Scanner(System.in);
		int menuno = 0;
		
		do {
			MovieSeatReservation.menu();
			
			try {
				System.out.print("메뉴번호 입력 => ");
				String strmenuno = sc.nextLine();
				menuno = Integer.parseInt(strmenuno);
			} catch (NumberFormatException e) {
				System.out.println(">>> 메뉴번호는 정수만 입력해야 합니다.\r\n");
				continue;
			}
			
			switch (menuno) {
				case 1:
					msrObj.showSeat();
					break;
	
				case 2:
					int inwonsu = 0;
					try {
						System.out.print(">>> 예매 인원수 : ");
						String strinwonsu = sc.nextLine();
						inwonsu = Integer.parseInt(strinwonsu);
						
						if(inwonsu < 1) {
							System.out.println(">>> 예매인원수는 1명 이상이어야 합니다.\r\n");
							continue;
						}
					} catch (NumberFormatException e) {
						System.out.println(">>> 예매인원수는 정수만 입력해야 합니다.\r\n");
						continue;
					}
					
					System.out.println(">>> 예매하실 좌석번호 입력하세요");
					for(int i=0; i<inwonsu; i++) {
						System.out.println("==="+(i+1)+"번째 관람객 좌석 입력===");
						System.out.print("행(A~E)입력 => ");
						String row = sc.nextLine().toUpperCase();
						System.out.print("열(1~10)입력 => ");
						String col = sc.nextLine().toUpperCase();
						
						String result = msrObj.reservationSeat(row, col);
						System.out.println(result);
					}
							
					msrObj.showSeat();
					
					break;
				
					
				case 3:
					int cancelCount = 0;
					try {
						System.out.print(">>> 취소할 예매수 : ");
						String strcancelCount = sc.nextLine();
						
						cancelCount = Integer.parseInt(strcancelCount);
						
						if(cancelCount < 1) {
							System.out.println(">>> 예매취소수는 1개 이상이어야 합니다.\r\n");
							continue;
						}
					} catch (NumberFormatException e) {
						System.out.println(">>> 취소예매수는 정수만 입력해야 합니다.\r\n");
						continue;
					}
					 
					
					System.out.println(">>> 예매취소하실 좌석번호 입력하세요");
					for(int i=0; i<cancelCount; i++) {
						System.out.println("==="+(i+1)+"번째 취소 좌석 입력===");
						System.out.print("행(A~E)입력 => ");
						String row = sc.nextLine().toUpperCase();
						System.out.print("열(1~10)입력 => ");
						String col = sc.nextLine().toUpperCase();
						
						String result = msrObj.cancelSeat(row, col);
						System.out.println(result);
					}
							
					msrObj.showSeat();
					
					break;
					
				case 4:
					System.out.println("안녕히 가세요~~^^");
					break;	
					
				default:
					System.out.println("메뉴번호는 1,2,3 만 가능합니다.");
					break;
			}
			
		} while (menuno != 4);
				
		sc.close();
	}

}
