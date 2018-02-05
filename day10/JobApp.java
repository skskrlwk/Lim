/*
 	*** *** 구인 구직관련 프로그래밍을 만들어보자 *** ===
 		1. 부품(요소) ---> 구직자, 구인자
 		2. 추상화작업
 			1) 구직화 --> 속성(맴버변수), 기능(메소드)
 			2) 구직화 --> 속성(맴버변수), 기능(메소드)
 			3) 구직화 --> 속성(맴버변수), 기능(메소드)
 */

package my.day10;

import java.util.Scanner;

import my.util.MyUtil;

public class JobApp {
	
	Gujikja[] gugikjaArr = new Gujikja[10];
	static int gujikjaCount = 0;
		
	public static void menu() {
		
		System.out.println(" ==== Menu ====");
		System.out.println("1. 구직자등록");
		System.out.println("2. 회사정보등록");
		System.out.println("3. 구인등록");
		System.out.println("4. 모든 구직자정보 출력");
		System.out.println("5. 모든 구인정보 출력");
		System.out.println("6. 구직자 ID 검색");
		System.out.println("7. 구인회사 ID 검색");
		System.out.println("8. 특정 업종 구인정보 출력");
		System.out.println("9. 특정 조건 구직자정보 출력");
		System.out.println("10. 특정 구직자 삭제하기");
		System.out.println("11. 특정 구직자 데이터 변경하기");
		System.out.println("12. 종료");
		System.out.println("==============================");
		System.out.print("메뉴번호를 선택하세여 == > ");
		
	}// end of menu--------------------------------------

	
	public boolean userIdDuplicateCheck(String userid) {
		boolean isUse = false;
		int flag = 0;
		
		for(int i=0;i< gujikjaCount; i++) {
			if(gugikjaArr[i] == null)
				continue;
			
			String existUserid = gugikjaArr[i].userid;
			if(existUserid.equals(userid)) {//중복된 아이디 값확인
				flag = 1;
				break;
			}
		}//end of for---------------------------------------
		if(flag == 0) {
			isUse = true;
		}
		return isUse;
	}
	
	// 메뉴번호 1. 구직자 등록을 해주는 메소드 생성하기 
	public void registerGujikja(Scanner sc) {
		
		Gujikja gugikja = new Gujikja();
				
		do {
			System.out.print("아이디 => ");
			String userid = sc.nextLine();
			
			boolean inUseridUse = userIdDuplicateCheck(userid); // 아이디 중복 확인 메소드 (중복일경우 false 중복이 아닌경우 true를 리턴해준다)
			if(inUseridUse) { 
				gugikja.userid = userid;
				break;
			}else {
				System.out.println("이미 사용중인 사용자 ID입니다.");	
			}
				
		} while (true);
		
		do {
			System.out.print("암호 => ");
			String passwd = sc.nextLine();
			
			if(MyUtil.passwdCheck(passwd)) {
				gugikja.passwd = passwd;
				break;
			}else {
				System.out.println("패스워드는 7글자 이상의 영문자 숫자 특수문자가 포함되어야 합니다");
			}
			
		} while (true);
		
		
		
		System.out.print("성명 => ");
		gugikja.name = sc.nextLine();
		do {
			try {
				System.out.print("나이 => ");
				int age = Integer.parseInt(sc.nextLine());
				if(age > 0) {
					gugikja.age = age;
					break;
				}else {
					System.out.println("나이는 0보다 커야 합니다.");
					continue;
				}
					
			} catch (NumberFormatException e) {
				System.out.println(">> 나이는 정수만 입력가능합니다.");
			}
			
		} while (true);
		
		System.out.print("성별(1.남 / 2.여) => ");
		gugikja.gender = sc.nextLine().equals("1")?"남":"여";
		
		System.out.print("주소 => ");
		gugikja.address = sc.nextLine();
		
		System.out.println("학력(1.대졸이상 / 2.초대졸 / 3.고졸 / 4.고졸미만) => ");
		switch (sc.nextLine()) {
			case "1":
				gugikja.school = "대졸이상";
				break;
			case "2":
				gugikja.school = "초대졸";
				break;
	
			case "3":
				gugikja.school = "고졸";
				break;
	
			default:
				gugikja.school = "고졸미만";
				break;
		}// end of switch
		
		System.out.print("휴대폰 번호 => ");
		gugikja.mobile = sc.nextLine();
		
		System.out.print("희망직종 => ");
		gugikja.hopejob = sc.nextLine();
		
		do {
			try {
				System.out.println("희망연봉 => ");
				int hopemoney = Integer.parseInt(sc.nextLine());
				if(hopemoney > 0) {
					gugikja.hopemoney = hopemoney;
					break;
				}else {
					System.out.println("급여는 0보다 커야 합니다.");
					continue;
				}
					
			} catch (NumberFormatException e) {
				System.out.println(">> 급여는 정수만 입력가능합니다.");
			}
			
		} while (true);
		System.out.println("\n"+gugikja.showGujikja()+"\n");
		System.out.print("\n>>위 정보를 등록 하시겠습니까??[1.예 2.아니요]");
		if(sc.nextLine().equals("1")) {
			saveGujikja(gugikja);
			
		}
		
	}// end of registerGujikja(Scanner sc)-----------------------------
	
	//메뉴 번호4. 모든 구직자 정보 출력
	public void showAllGujikja() {
		
		if(gujikjaCount == 0) {
			System.out.println("가입된 구직자가 업습니다");	
		}else {
			for(int i=0; i<gujikjaCount; i++) {
				if(gugikjaArr[i] != null)
				System.out.println(gugikjaArr[i].showGujikja());
				System.out.println("\n");;
			}
		}
		
		
		
	}// end of showAllGujikja()
	
	public void showGujikjaIdSearch(Scanner sc) {
		
		if(gujikjaCount == 0) {
			System.out.println(">> 가입된 구직자가 없으므로 조회가불가합니다.");
		}else {
			int flag = 0;
			System.out.print("검색하실 아이디를 입력해주세요 : ");
			String searchUserid = sc.nextLine();
			for(int i=0; i<gujikjaCount; i++) {
				
				String existUserid = gugikjaArr[i].userid;
				if(existUserid.equals(searchUserid)) {
					flag = 1;
					System.out.println(gugikjaArr[i].showGujikja());
					break;
				}
				
				
			}//end of for--------------------------------
			if(flag == 0) {
				System.out.println("검색하려는 사용자 ID'"+searchUserid+"'는 존재하지 않습니다.");
			}
			
		}
		
		
	}// end of showGujikjaIdSearch(Scanner sc)---------------------------
	
	// 메뉴번호 10. 특정 구직자 삭제해주는 메소드
	public void deleteGujikja(Scanner sc) {
		System.out.println(">>삭제하려는 사용자 ID값을 입력해주세요");
		String userid = sc.nextLine();
		if(gujikjaCount == 0) {
			System.out.println(">> 가입된 구직자가 없으므로 삭제불가합니다.");
		}else {
			int flag = 0;
			for(int i = 0; i<gujikjaCount; i++) {
				if(gugikjaArr[i].userid.equals(userid)) {
					flag = 1;
					gugikjaArr[i] = null;
					
					break;
				}
					
			}//end of for-----------------------
			if(flag == 1) {
				System.out.println(">>>> 사용자 ID '"+userid+"' 삭제성공.");
				
			}else {
				System.out.println(">>> 사용자 ID "+ userid + "은 존재하지 않음으로 삭제하지 못했습니다");
			}
				
		}
		
		
		
	}// end of deleteGujikja(Scanner sc)------------------------------

	public void saveGujikja(Gujikja gujikja) {
		
		if(gujikjaCount >= gugikjaArr.length) {
			System.out.println("정원이 마감되었습니다. ");
		}else {
			int flag = 0;
			
			if(gujikjaCount > 0) {
				for(int i=0; i<gujikjaCount; i++) {
					if(gugikjaArr[i] == null) {
						gugikjaArr[i] = gujikja;
						flag = 1;
						break;
					}
				}
			}
			if(flag == 0) {
				gugikjaArr[gujikjaCount] = gujikja;
				System.out.println(gujikjaCount+1 + "명 등록[마감정원 : " + gugikjaArr.length + "명");
				gujikjaCount++;
								
			}
			
		}
			
	}// end of saveGujikja(Gujikja gujikja)
	

	public static void main(String[] args) {
		
		String menuNo = "";
		Scanner sc = new Scanner(System.in);
		JobApp jobapp = new JobApp();
		do {
			JobApp.menu();
			
			menuNo = sc.nextLine();
			
			switch (menuNo) {
				case "1": //구직자 등록
					jobapp.registerGujikja(sc);
					break;
				case "2": //회사정보등록
					
					break;
				case "3": //구인등록
					
					break;
				case "4": // 모든 구직자정보 출력
					jobapp.showAllGujikja();
					break;
				case "5": // 모든 구인정보 출력
					
					break;
				case "6": // 구직자 ID 검색
					jobapp.showGujikjaIdSearch(sc);
					break;
				case "7": // 구인회사 ID 검색
					
					break;
				case "8": // 특정 업종 구인정보 출력
					
					break;
				case "9": // 특정 조건 구직자 정보 출력
					
					break;
				case "10": // 특정 구직자 삭제하기
					jobapp.deleteGujikja(sc);
					
					break;
				case "11": // 특정 구직자 데이터변경하기
					
					break;				
					
	
				default:
					System.out.println("존재하지 않는 메뉴번호 입니다. 다시 선택하세요!!!");
					break;
			}// end of switch---------------------------------
			
		}while(!(menuNo.equals("12")));

		System.out.println(">>> 안녕히 가세요 \n" + MyUtil.getNowTime());
		sc.close();
	}// end of main------------------------------------------

}
