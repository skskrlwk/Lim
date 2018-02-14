package my.day19.quiz;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import my.day19.Member;

public class ArrayListQuiz {
	
	static List<Member> memlist = new ArrayList<Member>();
	
	public static void setUser(List<Member> memlist, Scanner sc) {
		
	
		System.out.print("아이디를 입력해주세요 ");
		String uid = sc.nextLine();
		
		System.out.print("암호를 입력해주세요 ");
		String upasswd = sc.nextLine();
		
		System.out.print("성명를 입력해주세요 ");
		String uname = sc.nextLine();
		
		int uage;
		do {
			int flag = 0;
			try {
				System.out.print("나이를 입력해주세요 ");
				uage = Integer.parseInt(sc.nextLine());
				if(uage <= 0)
					System.out.println("나이는 0살이하가 될수 없습니다.");
				else
					flag = 1;
				if(flag == 1)
					break;
			} catch (NumberFormatException e) {
				System.out.println("나이는 정수로만 입력이 가능합니다.");
			}
			
		} while (true);
				
		System.out.print("주소를 입력해주세요 ");
		String uaddr = sc.nextLine();
		
		
		System.out.println(">> 회원 아이디 : " + uid);
		System.out.println(">> 회원 패스워드 : " + upasswd);
		System.out.println(">> 회원 이름 : " + uname);
		System.out.println(">> 회원 나이 : " + uage);
		System.out.println(">> 회원 주소 : " + uaddr);
		
		System.out.print("입력하신 정보가 맞습니까?? (Y,N) ");
		String choic = sc.nextLine().toLowerCase();
		if(choic.equals("y")) {
			memlist.add(new Member(uid, upasswd, uname, uage, uaddr));
			System.out.println("회원가입 완료!!");
			
		}else {
			System.out.println("회원가입 취소.");
		}
		
		
	}// end of setUser(List<Member> memlist, Scanner sc)-------------------------------
	
	public static void showUser(List<Member> memlist) {
		
		for(Member mem : memlist) {
			System.out.println(mem.showInfo());
			System.out.println("");
		}
	/*	
		for(int i=0; i<memlist.size(); i++) {
			System.out.println(">> 회원 '"+ memlist.get(i).getName() + "'님의 정보");
			System.out.println(">> 회원 아이디 : " + memlist.get(i).getId());
			System.out.println(">> 회원 패스워드 : " + memlist.get(i).getPassword());
			System.out.println(">> 회원 이름 : " + memlist.get(i).getName());
			System.out.println(">> 회원 나이 : " + memlist.get(i).getAge());
			System.out.println(">> 회원 주소 : " + memlist.get(i).getAddress());
			System.out.println("");
		}
	*/	
		if(memlist.size() == 0)
			System.out.println(">>가입된 회원이 없습니다.");
		else
			System.out.println("총회원수 : " + memlist.size());
		
	}// end of showUser(List<Member> memlist)----------------------------
	
	public static void searchUser(List<Member> memlist, Scanner sc) {
		
		int flag = 0;
		System.out.print("찾고자하는 Id를 검색해주세요");
		String serch = sc.nextLine();
		String lowserch = serch.toLowerCase();
		
		for(int i=0; i<memlist.size(); i++) {
			
			String lowmem = memlist.get(i).getId().toLowerCase();
			if(lowserch.equals(lowmem)) {
				flag = 1;
				System.out.println("검색된 아이디 : " + memlist.get(i).getId());
				System.out.println(memlist.get(i).showInfo());
				System.out.println("검색하신 아이디 : " + serch);
				System.out.println("");
			}
		}// end of for--------------------------
		if(flag == 0)
			System.out.println(">>검색하신 아이디 " + serch +" 가 없습니다.");
	}// end of searchUser(List<Member> memlist, Scanner sc)-----------------------------------------
	
	public static void deleteUser(List<Member> memlist, Scanner sc) {
		
		int flag = 0;
		System.out.print("삭제하고싶은 아이디를 입력해주세요");
		String delid = sc.nextLine();
		String lowdelid = delid.toLowerCase();
		
		Member a = new Member();
		for(Member mem : memlist) {
			if(mem.getId().equals(lowdelid)) {
				flag = 1;
				a = mem;
				System.out.println("검색된 아이디 : " + mem.getId());
				System.out.println(mem.showInfo());
			}
		}
		System.out.print("삭제 하시겠습니까?(Y,N)"); 		//안에서 삭제를 사용하면 java.util.ConcurrentModificationException 에러 발생(객체가 1개있을때 오류발생)
		String choic = sc.nextLine().toLowerCase();
		if(choic.equals("y")) {
			memlist.remove(a);
			System.out.println("삭제하였습니다.");
		
		}else {
			System.out.println("취소하였습니다.");
		}
		
		
		/*for(int i=0; i<memlist.size(); i++) {
			String memid = memlist.get(i).getId().toLowerCase();
			if(memid.equals(lowdelid)) {
				flag = 1;
				System.out.println("검색된 아이디 : " + memlist.get(i).getId());
				memlist.get(i).showInfo();
				
				System.out.print("삭제 하시겠습니까?(Y,N)");
				String choic = sc.nextLine().toLowerCase();
				if(choic.equals("y")) {
					memlist.remove(i);
					System.out.println("삭제하였습니다.");
				}
			}
		}*/
		
		if(flag == 0)
			System.out.println("삭제할 아이디가 존재하지 않습니다");
		
	}// end of deleteUser(List<Member> memlist, Scanner sc)

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int flag = 0;
		do {
			
			try {
				System.out.println("=====>>> 메뉴 <<<=====");
				System.out.println("1. 회원가입");
				System.out.println("2. 회원 전체조회");
				System.out.println("3. ID로 특정회원 검색");
				System.out.println("4. 특정회원 삭제하기");
				System.out.println("5. 종료");
				int usc = Integer.parseInt(sc.nextLine());
				
				switch (usc) {
				
					case 1:
						setUser(memlist, sc);
						break;
					case 2:
						showUser(memlist);
						break;
					case 3:
						searchUser(memlist, sc);
						break;
					case 4:
						deleteUser(memlist, sc);
						break;
	
					default:
						
						break;
					
				}
				
				if(flag == 1) {
					System.out.println("프로그램 종료 ");
					return;
				}
				
			}catch (NumberFormatException e) {
				System.out.println("숫자만 입력 가능합니다");
			}
			
		} while (!(flag == 1));
		
		
		
	}

}
/*
 	=====>> 메뉴 <<=====
 	1. 회원가입
 	2. 회원전체 조회
 	3. ID로 특정회원 검색
 	4. 특정회원 삭제하기
 	5. 종료
 */ 
