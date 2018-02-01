package my.day8.quiz;

import java.util.Scanner;

public class ArrayQuiz {
	static ArrayQuiz obj = new ArrayQuiz();
	
	public static void menu() {
		String[] namesArr = {"이규호","김종성","윤찬영","조원영","임규하","김규호","이종성","임규성"};
		
		Scanner sc = new Scanner(System.in);
		String ch = "";
		outer:
		for(;true;) {
			try {
				System.out.println("--->> 메뉴 <<----");
				System.out.println("1. 성찾기");
				System.out.println("2. 이름검색");
				System.out.println("3. 종료");
				System.out.print("메뉴 입력 ==> ");
				int num = Integer.parseInt(sc.nextLine());
				
				switch (num) {
				case 1:
					System.out.print("검색하실 성을 입력하세요 ==> ");
					char usersc = sc.nextLine().charAt(0);
					obj.searchFirst(namesArr,usersc);
					
					abc:
					for(;true;) {
						System.out.print("계속 하시겠습니까??(y,n) => ");
						ch = sc.nextLine();
						
						if(ch.equals("Y") || ch.equals("y"))
							continue outer;
						else if(ch.equals("N") || ch.equals("n")) {
							System.out.println("안녕히가세요~~~~");
							return;
						}
						else {
							System.out.println("다시입력하세요!!!!");
							continue abc;
						}
					}
					
					
				case 2:
					System.out.println("검색하실 이름을 입력해주세요 ==>");
					String sname = sc.nextLine();
					String result = obj.searchName(namesArr, sname);
					String[] resultarr = result.split(",");
					for(String arr: resultarr) { 
						System.out.println(arr);
					}
					abc:
						for(;true;) {
							System.out.print("계속 하시겠습니까??(y,n) => ");
							ch = sc.nextLine();
							
							if(ch.equals("Y") || ch.equals("y"))
								continue outer;
							else if(ch.equals("N") || ch.equals("n")) {
								System.out.println("안녕히가세요~~~~");
								return;
							}
							else {
								System.out.println("다시입력하세요!!!!");
								continue abc;
							}
						}
					
				case 3:
					System.out.println("종료하였습니다 안녕히가세요~~~~~");
					return;
					

				default:
					System.out.println("1,2,3번중에서만 선택이 가능합니다.");
					continue outer;
				}
				
			} catch (NumberFormatException e) {
				System.out.println("숫자만 입력 가능합니다.");
				
			}
		}// end of for-----------------------------
		
				
	}// end of menu()--------------------
	
	public static void searchFirst(String[] namesArr, char usersc) {
		
		int flag = 0;
		for(int i=0; i<namesArr.length; i++) {
			char name = namesArr[i].charAt(0);
			if(name == usersc) {
				flag =1;
				System.out.println(namesArr[i]);
			}
				
		}//end of  for--------------------
		
		if(flag == 0)
			System.out.println("입력하신 '"+ usersc +"'의 성이 없습니다");
		
	}// end of searchFirst(String[] namesArr, char usersc)
	
	public static String searchName(String[] namesArr, String sname) {
		String result = "";
		int flag = 0;
		for(int i=0; i<namesArr.length; i++) {
			for(int j=0; j<namesArr[i].length()-sname.length()+1; j++) {
				String name = namesArr[i].substring(j, j+sname.length());
				if(name.equals(sname)) {
					flag = 1;
					result += namesArr[i]+",";
					break;
					
				}
			}// end of 내부 for-----------------------------
		}// end of 외부 for---------------------------------
		
		result = result.substring(0,result.length());
		
		if(flag == 0) {
			result = "입력하신 '" +sname+ "' 을가진 사람이 없습니다.";
		}
		
		
		return result;
	}// end of searchName(String[] namesArr, String sname)

	public static void main(String[] args) {
		
		obj.menu();
		
		
		
	}// end of main()------------------------

}// end of class ArrayQuiz//////////////////////

/*
 	1. String[] namesArr 을 생성합니다.
 	2. namesArr = "이규호,김종성,윤찬영,조원영,임규하,김규호,이종성, 임규성"을 입력합니다.
 	
 	프로그램을 실행 하면
 	--->> 메뉴 <<----
 	1.성 찾기
 	2.이름검색 
 	3.종료
 	
 	>> 메뉴번호 입력 => 1
 	>> 검색하실 성 입력 => 김
 	김종성
 	김규호
 	계속하실래요?(Y/N) => y
 	
 	--->> 메뉴 <<----
 	1.성 찾기
 	2.이름검색
 	3.종료
 	
 	>> 메뉴번호 입력 => 2
 	>> 검색하실 글자 입력 => 규호
 	이규호
 	김규호
 	계속하실래요?(Y/N) => y
 	
 	--->> 메뉴 <<----
 	1.성 찾기
 	2.이름검색
 	3.종료
 	
 	>> 메뉴번호 입력 => 2
 	>> 검색하실 글자 입력 => 규
 	이규호
 	임규하
 	김규호
 	임규성
 	계속하실래요?(Y/N) => y
 	
 	--->> 메뉴 <<----
 	1.성 찾기
 	2.이름검색
 	3.종료
 	>> 메뉴번호 입력 => 3
 	>> 프로그램종료!! 안녕히 가세요~~
 */
