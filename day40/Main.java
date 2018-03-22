package jdbc.day3;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class Main {
	
	public static void menu() {
		System.out.println("============== Menu ==============");
		System.out.println(" 1.전체조회  2.글검색어조회  3.글번호조회 \r\n"
						 + " 4.글쓰기   5.글내용변경  6.글삭제 \r\n"
						 + " 7.날짜범위 검색 	8.프로그램종료 ");
		System.out.println("==================================");
		
	}// end of menu()------------------------------------------------

	// == title() 메소드
	public static void title() {
		System.out.println("----------------------------------------");
		System.out.println("글번호 \t 글쓴이 \t 글내용");
		System.out.println("----------------------------------------");
		
	}// end of title()-------------------------------
	
	
	public static void main(String[] args) {
		
		MemoDAO dao = new MemoDAO();
		Scanner sc = new Scanner(System.in);
		String menuno ;
		List<MemoDTO> list = null;
		
		do {
			Main.menu();
			
			System.out.print("▷ 메뉴번호 선택 => ");
			menuno = sc.nextLine();
			
			try {
				switch (menuno) {
					case "1":
						list = dao.selectAllMemo();
						
						if(list != null) {
							Main.title();
							for(MemoDTO mdto: list) {
								String row = mdto.getRno() + /*" \t "+ mdto.getNo() + */ " \t " + mdto.getName() + " \t "
										        + mdto.getMsg();
								System.out.println(row);
							}
						}else {
							System.out.println(">>> 데이터가 존재하지 않습니다.");
						}
						break;
						
					case "2":
						do {
							System.out.print("▷ 글검색어 입력 => ");
							String searchword = sc.nextLine();
					//		boolean bool = searchword.trim().isEmpty(); // 값이 없을때만 true
					//		System.out.println(bool);
							
							if(searchword.trim().isEmpty()) {
								System.out.println(">> 글색어를 입력하세요!! <<");
																
							}else {
								list = dao.searchMemoByWord(searchword);
								if(list != null) {
									Main.title();
									for(MemoDTO mdto: list) {
								//		String row = mdto.getNo() + " \t " + mdto.getName() + " \t " + mdto.getMsg() + "\r\n"; 
										String row = mdto.getRno() + " \t " + mdto.getName() + " \t "
										        + mdto.getMsg() + "\r\n";
										System.out.println(row);
									}
									
								}else {
									System.out.println(">>>검색어 하신 "+ searchword +"는 존재하지 않습니다.");
								}
								break;
							}
							
						} while (true);
						
						break;	
						
					case "3":
						MemoDTO mdto = null;
						do {
							System.out.print("▷  글번호 입력 => ");
							String no = sc.nextLine();
							
							if(no.trim().isEmpty()) {
								System.out.println(">> 글번호를 입력하세요!! <<");
																
							}else {
								mdto = dao.searchNoByWord(no);
								
								if( mdto != null ) {
									System.out.println("");
									Main.title();
							//		System.out.println(mdto.getNo() + " \t " + mdto.getName() + " \t " + mdto.getMsg() + "\r\n");
									System.out.println(mdto.getRno() + " \t " + mdto.getName() + " \t " + mdto.getMsg() + "\r\n");
									
								}else {
									System.out.println(">>> 존재하지 않는 글번호 입니다." + "\r\n");
								}
								break;
							}
							
						} while (true);
						
						break;
						
					case "4":
						String name = null;
						do {
							System.out.print("▷ 작성자명 => ");
							 name = sc.nextLine();
							
							if( !name.trim().isEmpty()) {
								break;
							}else {
								System.out.println(">> 작성자명을 입력하세요");
							}
							
						} while (true);
						
						String msg = null;
						do {
							System.out.print("▷ 글내용 => ");
							 msg = sc.nextLine();
							
							if( !msg.trim().isEmpty() ) {
								break;
							}else {
								System.out.println(">> 글내용을 입력하세요");
							}
						} while (true);
						
						int n = dao.insertMemo(name, msg);
						
						if(n == 1) {
							System.out.println(">> 글쓰기 성공 !!");
						}else {
							System.out.println(">> 글쓰기 실패 !!");
						}
						break;
						
					case "5":
						mdto = null;
						String no;
						do {
							System.out.print("▷ 수정할 글번호 입력 = >");
							no = sc.nextLine();
							if(!no.trim().isEmpty()) {
								mdto = dao.searchNoByWord(no);
								
								if(mdto !=null) {
									System.out.println("------------------------");
									System.out.println("1. 글번호 : " + mdto.getRno());
									System.out.println("2. 작성자 : " + mdto.getName());
									System.out.println("3. 글내용 : " + mdto.getMsg());
									System.out.println("------------------------");
									
									System.out.println("\n >>>> 변경 시작 <<<<");
									
									System.out.println("▷ 작성자 : ");
									name = sc.nextLine();
									
									System.out.print("▷ 글내용 : ");
									msg = sc.nextLine();
									
									n = dao.updateMemo(no, name, msg);
									if(n == 1) {
										System.out.println(">> 데이터 변경 성공 !!");
									}else {
										System.out.println(">> 데이터 변경 실패 !!");
									}
									
								}else {
									System.out.println(">>> 존재하지 않는 글번호입니다.");
								}
								
								break;
								
							}else {
								System.out.println("수정할 글번호를 입력하세요!!");
							}
						} while (true);
						
						break;
						
					case "6":
						mdto = null;
						do {
							System.out.print("▷ 삭제하실 글번호 : ");
							no = sc.nextLine();
							
							if(!no.trim().isEmpty()) {
								break;
							}else {
								System.out.println("삭제하실 글번호를 입력해주세요");
							}
							
						} while(true);
						
						mdto = dao.searchNoByWord(no);
						if(mdto != null) {
							System.out.println("------------------------");
							System.out.println("1. 글번호 : " + mdto.getRno());
							System.out.println("2. 작성자 : " + mdto.getName());
							System.out.println("3. 글내용 : " + mdto.getMsg());
							System.out.println("------------------------");
							
							System.out.print("\r\n 삭하시겠습니까? [1.네 / 2.아니요] => " );
							String cho = sc.nextLine();
							
							if("1".equals(cho)) {
								n = dao.deleteMemo(no);
								
								if(n == 1) {
									System.out.println(">> 글삭제 성공!!");
								}else {
									System.out.println(">> 글삭제 실패 !!");
								}
								
							}else {
								System.out.println("글삭제를 취소하셨습니다.");
							}
							
							
						}else {
							System.out.println("삭제할 글번호가 존재하지 않습니다.");
						}
						
						break;
						
					case "7":
						Main.searchDateMenu(sc, dao);
						menuno = "아무숫자";
						break;
						
						
					case "8":
						MemoDAO.close();
						System.out.println(">>> 프로그램 종료~");
						break;
		
					default:
						System.out.println(">>> 메뉴에 없는 번호입니다. 다시 선택하세요");
						break;
				}

			}catch (Exception e) {
				e.printStackTrace();
			}
			
		} while (!menuno.equals("7") && !menuno.equals("8") );
	

	}// end of main()----------------------------------------------
	

	// 날짜 범위 검색
	public static void searchDateMenu(Scanner sc, MemoDAO dao) throws SQLException { // 메인에서 try catch를 해주기떄문에 
		
		String menuno = null;
		List<MemoDTO> list = null;
		do {
			
			System.out.println("============== Menu ==============");
			System.out.println(" 1.최근 30일 이내  2.최근 10일 이내  3.날짜구간 검색  4.종료");
			System.out.println("==================================");
			
			System.out.print("▷ 메뉴번호 선택 => ");
			menuno = sc.nextLine();
			
			switch (menuno) {
				case "1":
					list = dao.selectByDate(30);
					if(list != null) {
						Main.title();
						for(MemoDTO ndto: list) {
							String row = ndto.getNo() + "\t" + ndto.getName() + "\t" + ndto.getMsg() + "\t" + ndto.getWriteday();
							System.out.println(row);
						}
					}else {
						System.out.println(">> 최근 30일 이내의 데이터가 존재하지 않습니다.");
					}
					break;

				case "2":
					list = dao.selectByDate(10);
					if(list != null) {
						Main.title();
						for(MemoDTO mdto: list) {
							String row = mdto.getNo() + "\t" + mdto.getName() + "\t" + mdto.getMsg() + "\t" + mdto.getWriteday();
							System.out.println(row);
						}
					}else {
						System.out.println(">> 최근 30일 이내의 데이터가 존재하지 않습니다.");
					}
					break;
					
				case "3":
					String startday = null;
					do {
						System.out.print("▶ 시작날짜[yyyy-mm-dd] => ");
						startday = sc.nextLine();
						
						if(!startday.trim().isEmpty()) {
							break;
						}else {
							System.out.println("시작날짜를 입력해주세요");
						}
					} while (true);
					
					String endday = null;					
					do {
						System.out.print("▶ 종료날짜[yyyy-mm-dd] => ");
						endday = sc.nextLine();
						
						if(!endday.trim().isEmpty()) {
							break;
						}else {
							System.out.println("시작날짜를 입력해주세요");
						}
					} while (true);
					
					list = dao.selectByDate(startday, endday);
					if(list != null) {
						Main.title();
						for(MemoDTO mdto :list) {
							String row = mdto.getNo() + "\t" + mdto.getName() + "\t" + mdto.getMsg() + "\t" + mdto.getWriteday();
							System.out.println(row);
						}
					}else {
						System.out.println(">>> 검색하신 날짜구간에 존재하는 데이터는 없습니다.!!");
					}
					
					break;
					
				case "4":
					System.out.println(">> 종료~~!");
					break;
					
				default:
					System.out.println(">>> 멘번호에 없는 번호입니다. 다시 선택하여 주새요");
					break;
			}
		} while (!menuno.equals("4"));
		
		return; // 원래 실행했던곳으로 간다. 
		
		
	}// end of searchDateMenu()------------------------------------------------

	
}
