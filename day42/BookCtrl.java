package jdbc.day4;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class BookCtrl {
	
	Scanner sc = new Scanner(System.in);
	
	// *** 일반사용자로 로그인 했을시 화면에 보여줄 내용 ***
	public void display_user(BookDAO dao, String userid, int adultCheck) throws SQLException {
		List<BookDTO> bdto = null;
		List<HashMap<String, String>> listbook = null;
		HashMap<String, String> userInfo = dao.selectUserName(userid);
		System.out.println("\n === " + userInfo.get("name") +"님 (" + userInfo.get("email") + ") 환영합니다. ===");
		String menuno; 
		
		do {
			bookmenu();
			menuno = sc.nextLine();
			if(!menuno.trim().isEmpty()) {
				
				switch (menuno) {
					case "1":
						listbook = dao.bookShow();
						if(listbook != null) {
							System.out.println("--------------------------------------------");
							System.out.println("카테고리번호 \t 카테고리명 \t 종류");
							System.out.println("--------------------------------------------");
							
							for(HashMap<String, String> map : listbook ) {
								String str = map.get("CATEGORYNO")+ " \t " +map.get("CATEGORYNAME") + " \t " + map.get("CNT");
								System.out.println(str);
							}
							
						}else {
							System.out.println("도서 카테고리가 없습니다.");
						}
						break;
						
					case "2" :
						break;
						
					case "3":
						try {
							System.out.print("▶ 조회할 카테고리 번호 : ");
							String num = sc.nextLine();
							listbook = dao.selectBookInfo(num, adultCheck);
							
							if(listbook != null) {
								System.out.println("----------------------------------------------------------");
								System.out.println("신간구간 \t 도서코드 \t 도서명 \t 출판일자 \t 총권수 \t 비치권수 \t 대여권수");
								System.out.println("----------------------------------------------------------");
								
								for(HashMap<String, String> map : listbook) {
									String str = map.get("OLDNEW") + "\t" + map.get("BOOKCODE")  +map.get("BOOKNAME") + " \t " 
											+ map.get("PUBLISHDAY") + "\t" + map.get("TOTALCNT") + "\t" + map.get("EXISTSCNT")
											+ "\t" + map.get("RENTINGCNT");
									System.out.println(str);
								}
								
							}else {
								System.out.println(num + "카테고리는 존재하지 않습니다.");
							}
							break;
							
						} catch (SQLException e) {
							if(e.getErrorCode() == 1722) {
								System.out.println(">>> 숫자로 입력하세요");
							}
						}
						break;
						
					case "5":
						System.out.println();
						
						break;
	
					default:
						break;
				}
				
			}else {
				System.out.println("메뉴번호를 입력해주세요");
			}
			
		} while (!"5".equals(menuno));
		
		
	}
	
	// ** 관리자로 로그인 했을시 화면에 보여줄 내용 
	public void display_amdin(BookDAO dao, String userid) throws SQLException {
		
		List<HashMap<String, String>> listbook = null;
		System.out.println("\n ==== 관리자님 환영합니다 . ====");
		String menuno; 
		do {
			adminMenu();
			menuno = sc.nextLine();
			if (!menuno.trim().isEmpty()) {
				
				switch (menuno) {
					case "1":
						listbook = dao.bookShow();
						if(listbook != null) {
							System.out.println("--------------------------------------------");
							System.out.println("카테고리번호 \t 카테고리명 \t 종류");
							System.out.println("--------------------------------------------");
							
							for(HashMap<String, String> map : listbook ) {
								String str = map.get("CATEGORYNO")+ " \t " +map.get("CATEGORYNAME") + " \t " + map.get("CNT");
								System.out.println(str);
							}
							
						}else {
							System.out.println("도서 카테고리가 없습니다.");
						}
						break;
						
					case "2" : 
						List<BookDTO> listBookDTO = new ArrayList<BookDTO>();
						String yn = null;
						
						do {
							System.out.print("▷ 도서코드 => ");
							String bookcode = sc.nextLine();
							
							System.out.print("▷ 카테고리번호 => ");
							String fk_categoryno = sc.nextLine();
							
							System.out.print("▷ 도서명 => ");
							String bookname = sc.nextLine();
							
							System.out.print("▷ 출판일자 => ");
							String publishday = sc.nextLine();
							
							BookDTO book = new BookDTO();
							book.setBookcode(bookcode);
							book.setCategoryno(Integer.parseInt(fk_categoryno));
							book.setBookname(bookname);
							book.setPublishday(publishday);
							listBookDTO.add(book);
							
							System.out.print("▶ 계속해서 신규도서 입력하시겠습니까? [Y/N] =>  ");
							yn = sc.nextLine();
							
							if("N".equalsIgnoreCase(yn)) {
								break;
							}
							
						} while (true);
						
						int n = dao.insertBook(listBookDTO);
						if(n == 1) {
							System.out.println(">>> 신규도서 입력성공 !!!");
							
						}else {
							System.out.println(">>> 신규도서 입력 실패 !!!");
						}
						break;
					
					case "3" :
						
						try {
							System.out.print("▶ 조회할 카테고리 번호 : ");
							String num = sc.nextLine();
							listbook = dao.selectBookInfo(num, 1);
							
							if(listbook != null) {
								System.out.println("--------------------------------------------");
								System.out.println("신간구간 \t 도서명 \t 출판일자");
								System.out.println("--------------------------------------------");
								
								for(HashMap<String, String> map : listbook) {
									String str = map.get("OLDNEW") + "\t" + map.get("BOOKNAME") + " \t " + map.get("PUBLISHDAY");
									System.out.println(str);
								}
								
							}else {
								System.out.println(num + "카테고리는 존재하지 않습니다.");
							}
							break;
							
						} catch (SQLException e) {
							if(e.getErrorCode() == 1722) {
								System.out.println(">>> 숫자로 입력하세요");
							}
						}
						break;
						
					case "4":
						String bookno, bookcnt;
						
						try {
							do {
								System.out.print("▶ 도서코드 입력 =>");
								bookno = sc.nextLine();
								if(!bookno.trim().isEmpty()) {
									break;
								}else {
									System.out.println(">>> 도서코드를 입력해주세요.");
								}
								
							} while (true);
							
							do {
								System.out.print("▶ 권수 => ");
								bookcnt = sc.nextLine();
								if(!bookcnt.trim().isEmpty()) {
									break;
								}else {
									System.out.println(">>> 도서코드를 입력해주세요.");
								}
								
							} while (true);
										
							n = dao.insertRentBook(bookno, bookcnt);
							
							if(n == 1) {
								System.out.println(">>> 렌트도서 " + bookno + bookcnt + "권 등록완료");
							}else {
								System.out.println(">>> 도서권수는 0권이상이여야 합니다");
							}
							
						}catch (SQLException e) {
							if(e.getErrorCode() == 2291) {
								System.out.println("도서명을 다시 입력해주세요");
							}
						}catch (Exception e) {
							System.out.println("도서권수를 숫자로 입력해주세요");
						}
						
						break;
						

					case "7" :
			
						try {
							listbook = dao.overdueBook();
							if(listbook != null) {
								
								System.out.println("------------ 연체된 미반납 도서 목록 -------------");
								System.out.println("유저아이디 \t\t 도서코드 \t 책이름 \t 연체날짜");
								
								for(HashMap<String, String> map : listbook) {
									String str = map.get("FK_USERID") + "\t" + map.get("RENTBOOKNO") +'\t'+ map.get("BOOKNAME") + "\t" + map.get("DAY");
									System.out.println(str);
								}
								break;
							}else {
								System.out.println("연체된 미반납 도서가 없습니다.");
							}
							
						}catch (SQLException e) {
							
							if(e.getErrorCode() == 942) {
								System.out.println("대출한 도서내역이 없습니다.");
							}
						}
						
						
						break;
						
					case "8" :
						String username = null;
						
						do {
							System.out.print("▶ 조회하실 아이디 : ");
							username = sc.nextLine();
							
							if(!username.trim().isEmpty()) {
								listbook = dao.searchUser(username);
			
								if(listbook != null) {
									
									for(HashMap<String, String> map : listbook) {
										System.out.println("--------------------"+ username +"님의 정보 ---------------------");
										
										System.out.println("이름 \t 생일 \t 이메일 \t 전화번호 \t 주소 ");
										String str = map.get("NAME") + "\t" + map.get("BIRTHDAY") + "\t" + map.get("EMAIL") + "\t" 
												+ map.get("TEL") + "\t" + map.get("ADDRESS");
										
										System.out.println(str);
										
										System.out.println("포인트 \t 코인 \t 대여한 권수 \t 미반납 권수 \t 연채료");
										String str1 = map.get("POINT") + "\t" + map.get("COIN") + "\t" + map.get("RENTTOTAL") + "\t"
												+ map.get("MIBANNAPCNT") + "\t" + map.get("DELAYMONEY");
										System.out.println(str1);
									}
									
									break;
								}else {
									System.out.println("입력하신 " + username + "아이디는 존재하지 않습니다.");
									break;
									
								}
							}else {
								System.out.println(">>> 아이디를 입력해주세요");
							}
									
							} while (true);
							
						break;
						
					case "9":
						System.out.println();
						
						break;
						
					default:
						break;
				}
				
				
			}else {
				System.out.println("메뉴번호를 입력해주세요");
			}
		} while (!"5".equals(menuno));
		
		
	}// end of display_amdin(BookDAO dao, String userid) -------------------------------

	
	public void bookmenu() {
		System.out.println("\n ===========> 도서대여 메뉴 <============= ");
		System.out.println("1.도서 카테고리 조회  2.나의 도서대출 정보 \n"
						 + "3.도서정보 조회 \n5.종료(돌아가기)");
		System.out.println("=======================================");
		System.out.print("▷ 메뉴번호 선택 => ");
		
	}
	
	public void adminMenu() {
		
		System.out.println("\n ===========> 도서대여 메뉴 <============= ");
		System.out.println("1.도서 카테고리 조회  2. 신규도서 입력 \n"
						 + "3.도서정보조회  4.렌트도서 입력\n"
						 + "5.전체대출조회 미완 6.유저대출 조회 미완(id로 검색)\n"
						 + "7.연체된 도서 조회 8.유저 정보 조회 (id로 검색)\n"
						 + "9.종료(돌아가기)");
		System.out.println("=======================================");
		System.out.print("▷ 메뉴번호 선택 => ");
	}
	
	
	
}
