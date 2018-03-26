package jdbc.day4;

import java.util.*;
import java.awt.print.Book;
import java.sql.*;

public class BookMain {

	// ==== 로그인 메뉴 === //
	public static void menu_login() {
		System.out.println("=========== >> 도서대여 LogIN << ===========");
		System.out.println("1.일반사용자 / 2.관리자 / 3.회원가입 / 4.프로그램종료");
		System.out.println("=========================================");
		
	}// end of menu_login()---------------------------------------
	
	public static Map<String, Object> login(Scanner sc, String type, BookDAO dao) throws SQLException {
			
		String userid = null;
		String passwd = null;
		Map<String, Object> map = new HashMap<String, Object>();

				
		do {
			System.out.print("▷ ID : ");
			userid = sc.nextLine();
			
			if(!userid.trim().isEmpty()) {
				break;
			}else {
				System.out.println("ID를 입력해주세요 !!");
			}
			
		} while (true);
		
		do {
			System.out.print("▷ 암호 : ");
			passwd = sc.nextLine();
			
			if(!passwd.trim().isEmpty()) {
				break;
			}else {
				System.out.println("패스워드를 입력하세요");
			}
			
		} while (true);
		
		int n = 0; // 로그인 성공여부  1성공, 0 실패
		String msg = null;
		
		if("normal".equals(type)) {
			// 일반사용자 로그인
			n = dao.normalLogin(userid, passwd);
			
			if(n == -1) {
				System.out.println(">>> 로그인 실패 <<<");
				map.put("n", 0);
				
			}else if(n == 0) { // 미성년자 로그인
				map.put("n", 1);
				map.put("userid", userid);
				map.put("adultCheck", 0);
				
			}else if(n == 1) {
				map.put("n", 1);
				map.put("userid", userid);
				map.put("adultCheck", 1);
			}
			
			msg = ">>> 일반 사용자로 로그인 성공!! <<<";
		
		}else if("admin".equals(type)) {
			// 관리자 로그인
			n = dao.adminLogin(userid, passwd);
			msg = ">>> 관리자로 로그인 성공!! <<<";
	
			if(n==1) {
				map.put("n", 1);
				System.out.println(">>> 관리자로 로그인 성공!! <<<");
			}
			else {
				map.put("n", 0);
				System.out.println(">>> 관리자로 로그인 실패!! <<<");
			}
			
		}
		
		
		return map;
	}// end of login(Scanner sc)------------------------------------
	
	public static void main(String[] args) throws SQLException {
		
		BookDAO dao = new BookDAO();
		Scanner sc = new Scanner(System.in);
		
		BookMain.menu_login();
		String menuno = null;
		Map<String, Object> map = null;
		int n = 0;
		do {
			
			System.out.print("▷ 로그인 종류 선택 => ");
			menuno = sc.nextLine();
			try {
				switch (menuno) {
					case "1":
						map = BookMain.login(sc, "normal", dao);
						n = (Integer)map.get("n"); 
						break;
						
					case "2":
					    map = BookMain.login(sc, "admin", dao);
						n = (Integer)map.get("n"); 
						break;
		
					case "3" :
						UserCtrl usctrl = new UserCtrl();
						int result = usctrl.memberRegister(dao, sc);
						
						if(result == 1) {
							System.out.println(">>> 회원가입 성공!! <<<");
							
						}else {
							System.out.println(">>> 회원가입 실패!! <<<");
						}
						
						BookMain.menu_login();
						
						break;
						
					case "4" :
						dao.close();
						System.out.println(">>> 프로그램 종료합니다.~~~~~");
						break;
					
					default:
						System.out.println(">>> 메뉴번호를 올바르게 선택하세요");
						break;
				}
				
			}catch (Exception e) {
				
				e.printStackTrace();
			}
			
		} while (!"4".equals(menuno) && !(n == 1) ); 
				// 거짓 && 거짓 ==> 거짓(반복문 탈출)
				// 거짓 && 참 ==> 참 (반복문 탈출)
				// 참  && 참 ==> 거짓(반복문 수행)
		
		if(!"4".equals(menuno)) {
			BookCtrl bkctrl = new BookCtrl();
			
			if("1".equals(menuno)) {
				// 일반 사용자로 로그인
				try {
					bkctrl.display_user(dao, (String)map.get("userid"), (int)map.get("adultCheck"));
					
				} catch (SQLException e) {
					
					if(e.getErrorCode() == 1722) {
						System.out.println(">>> 숫자로 입력하세요");
					}
					e.printStackTrace();
				}
				
			}else if("2".equals(menuno)) {
				// 관리자로 로그인 
				try {
					bkctrl.display_amdin(dao, (String)map.get("userid"));
					BookMain.menu_login();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				
			}
			
		}
		

	}// end of main()-----------------------------------

}
