package jdbc.day1;

import java.sql.*;
import java.util.Scanner;

import jdbc.util.MyConnectionType;

public class JdbcTest5 {
	
	static Connection conn = null;
//	static Statement stmt = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
/*
	 ========= Statement 와 PreparedStatement ===========
	 위 두개의 가장 큰 차이점은 캐시 사용 유무이다.
	 이들은 쿼리문장(SQL문)을 분석( [== 파싱 parsing] 문법검사, 인덱스 사용유무 )
	 컴파일 후 실행된다.
	 Statement 는 매번 쿼리문장(SQL문)을 수행할때 마다 모든 단계를 파싱(parsing)을 하지만
	 PreparedStatement 는 처음 한번만 모든 단계를 파싱(parsing)을 수행한 후 캐시에 담아 재사용 한다.
	 그러므로 동일한 쿼리문장(SQL문)을 수행시 PreparedStatement 가 DB 에 훨씬 적은 부하를 주어
	 성능이 좋아진다. 그리고 Statement 보다는 PreparedStatement 가 보안상 더 좋다.
 */
	
	// *** static 초기화 블럭 시작
	static {
		try {
			// 1. 오라클 드라이버로딩
			Class.forName( MyConnectionType.getDriver() );
			
			// 2. 오라클 DB 서버와 연결하기.
			Scanner sc = new Scanner(System.in);
			do {
				System.out.print("▷ 연결할 오라클 서버 선택(1.내꺼 / 2. 누나꺼 / 3. 형꺼) => ");
				String no =  sc.nextLine();
				
				if("1".equals(no)) {
					conn = DriverManager.getConnection(MyConnectionType.getMyUrl(),MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
					
				}else if("2".equals(no)){
					conn = DriverManager.getConnection(MyConnectionType.getLeeUrl(),MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
					
				}else if("3".equals(no)){
					conn = DriverManager.getConnection(MyConnectionType.getBroUrl(),MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
				}else{
					System.out.println("==> 1또는 2만 선택하세요!!");
					continue;
				}
				
			} while (true);
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // *** static 초기화 블럭 끝 
	
	// == 자원 반납하기
	static void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}// end of close() --------------------------------------------------
	
	public static void menu() {
		System.out.println("============== Menu ==============");
		System.out.println(" 1.전체조회  2.글검색어조회  3.글번호조회 \r\n"
						 + " 4.글쓰기   5.글내용변경  6.글삭제 \r\n"
						 + " 7.종료 ");
		System.out.println("==================================");
		
	}

	public static void main(String[] args) {
		
		JdbcTest5 obj = new JdbcTest5();
		Scanner sc = new Scanner(System.in);
		String menuno = "";
		
		do {
			// == 메뉴 == 보여주기
			System.out.println("");
			JdbcTest5.menu();
			
			System.out.print("▷ 메뉴번호 ==> ");
			menuno = sc.nextLine();
			try {
				switch (menuno) {
				case "1":
					obj.selectAllMemo();
					
					break;
					
				case "2":
					obj.searchMemoByWord(sc);
					break;
					
				case "3":
					obj.searchNoByWord(sc);
					break;
					
				case "4":
					obj.insertMemo(sc);
					break;
					
				case "5":
					obj.updateMemo(sc);
					break;
					
				case "6":
					obj.deleteMemo(sc);
					break;
					
				case "7":
					sc.close();
					close();
					break;
					
				default:
					System.out.println(">>> 메뉴번호는 1~7 까지 입니다.");
					break;
			}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		} while ( !("7".equals(menuno)) );		

	}// end of main()----------------------------------------

	// == title() 메소드
	public static void title() {
		System.out.println("----------------------------------------");
		System.out.println("글번호 \t 글쓴이 \t 글내용");
		System.out.println("----------------------------------------");
	}
	
	// === 메뉴번호 1. 전체선택 ====
	void selectAllMemo() throws SQLException {
		// 3. SQL문(쿼리문) 작성하기.
		String sql = " select * "
				 +	 " from tbl_memo "
				 +   " order by no desc ";
		
		// 4. PreparedStatment 객체 생성
		pstmt = conn.prepareStatement(sql);
		
		// 5. pstmt 를 사용하여 SQL문 실행하기 select 문은 executeQuery() 로실행
		rs = pstmt.executeQuery();
		
		int cnt = 0;
		while(rs.next()) {
			cnt++;
			if(cnt == 1) {
				title();
			}
			int no = rs.getInt(1);
			String name = rs.getString(2);
			String msg = rs.getString(3);
			
			System.out.println(no + " \t " + name + " \t " + msg);
			

			
		}// end of while---------------------------
		
		if(cnt == 0) {
			System.out.println(">>> 데이터가 존재하지 않습니다.");
		}
		if(rs != null) rs = null;
			
		
	}// end of seelctAllMemo()-------------------------------------
	
	
	// == 메뉴번호 2. 글검색 조회 ===
	private void searchMemoByWord(Scanner sc) throws SQLException {
		
		// 3. SQL문 작성하기
		System.out.println("▷ 글검색어 입력 => ");
		String searchword = sc.nextLine();
		String sql = " select * "
				 +	 " from tbl_memo "
				 +	 " where msg like ? " // ? 사용자가 입력한 변수
				 +   " order by no desc ";
			
		// 4. PreparedStatment 객체 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+searchword+"%");  
		
		// 5. pstmt를 사용하여 SQL문 실행하기
		rs = pstmt.executeQuery();
		
		int cnt = 0;
		while(rs.next()) {
			cnt++;
			if(cnt == 1) {
				title();
			}
			int no = rs.getInt(1);
			String name = rs.getString(2);
			String msg = rs.getString(3);
			
			System.out.println(no + " \t " + name + " \t " + msg);
		}// end of while---------------------------
		
		if(cnt == 0) {
			System.out.println(">>> 데이터가 존재하지 않습니다.");
		}
		
		if(rs != null) rs = null;
	
	}// end of searchMemoByWord(Scanner sc)-------------------------------
	
	
	// 메뉴번호 3번. 글번호 조회
	void searchNoByWord(Scanner sc) throws SQLException {
		
		// 3. SQL문 작성하기
		System.out.println("▷ 글번호 입력 => ");
		String searchword = sc.nextLine();
		String sql = " select * "
				 +	 " from tbl_memo "
				 +	 " where no = ? " 
				 +   " order by no desc ";
		
		
		// 4. PreparedStatment 객체 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchword);
		
		// 5. stmt를 사용하여 SQL문 실행하기
		rs = pstmt.executeQuery();
		
		System.out.println(sql);
		int cnt = 0;
		while(rs.next()) {
			cnt++;
			if(cnt == 1) {
				title();
			}
			int no = rs.getInt(1);
			String name = rs.getString(2);
			String msg = rs.getString(3);
			
			System.out.println(no + " \t " + name + " \t " + msg);
		}// end of while---------------------------
		
		if(cnt == 0) {
			System.out.println(">>> 데이터가 존재하지 않습니다.");
		}
		
		if(rs != null) rs = null;
	}// end of searchNoByWord(Scanner sc)---------------------------------
	
	
	// 메뉴번호 4번. 글쓰기
	 void insertMemo(Scanner sc) throws SQLException {
		 
		 try {
			 
			 System.out.print("▷ 작성자명 : ");
			 String name = sc.nextLine();
			 
			 System.out.print("▷ 글내용 :");
			 String msg = sc.nextLine();
			 
			 // 3.SQL 쿼리문 작성하기
			 String sql = " insert into tbl_memo(no, name, msg) "
					 	+ " values(seq_memo.nextval, ?, ?) ";
			
			// 4. PreparedStatment 객체 생성
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, "'" + name + "'");
			 pstmt.setString(2, "'" + msg + "'");
			 
			 System.out.println(sql);
			 // PreparedStatment는 보안성이 강해서 보이지 않는다.
			
			// 5.stmt 를 사용하여 SQL문(쿼리문) 실행하기
			int n = pstmt.executeUpdate();
			
			if (n == 1) {
				System.out.println(">>> 글쓰기 성공");
				
			}else if(n == 0) {
				System.out.println(">>> 글쓰기 실패");
			}
			
		} catch (SQLIntegrityConstraintViolationException e) {
			// 오라클의 제약조건에 위배가 되었을 경우 발생하는 Exception
			System.out.println("▶에러코드 : " + e.getErrorCode() + "\r\n" +
							   "▶오류 메세지 : " + e.getMessage() );
			if(e.getErrorCode() == 1400) {
				System.out.println("▷ 글쓰기 실패 !!! 작성자명과 작성글은 필수 입력 사항입니다.!!");
			}
		}
		 
		 
		
	}// end of insertMemo(Scanner sc)
	 
	 
	void updateMemo(Scanner sc) throws SQLException {
		System.out.print("▷ 변경하고자 하는 글번호 => ");
		String strno = sc.nextLine();
		
		// 변경하고자 하는 글번호에 해당하는 행의 존재 유무를 파악하자.
		// >>> 3. SQL문 작성
		String sql = " select count(*) "
				 +	 " from tbl_memo "
				 +	 " where no = ?";
		
		// 4. PreparedStatment 객체 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, strno);
		
		// 5. stmt를 사용하여 SQL문 실행하기
		rs = pstmt.executeQuery();
		rs.next();
		int check = rs.getInt(1);
	
		if(check == 0) {
			System.out.println("존재하지 않는 글번호 이므로 글내용 변경 불가합니다.");
			
		}else {
			rs = null;
			
			sql = " select * "
			  +	  " from tbl_memo "
			  +	  " where no = ?";
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, strno);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			System.out.println("▶ 글번호 : " + rs.getInt(1));
			System.out.println("▶ 작성자 : " + rs.getString(2));
			System.out.println("▶ 글내용 : " + rs.getString(3));
			
			System.out.println("---->> 변경시작 <<-----");
			System.out.print("▷ 작성자 : ");
			String name = sc.nextLine();
			
			System.out.print("▷ 글내용 : ");
			String msg = sc.nextLine();
			
			sql = " update tbl_memo set name = ? , msg = ? "	
				+ " where no = ?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, msg);
			pstmt.setString(3, strno);
			
			int n = pstmt.executeUpdate();
			
			if(n == 1) {
				System.out.println(">> 글내용 변경 성공!!");
			}else {
				System.out.println(">> 글내용 변경 실패!!");
			}
				
			
			sql = "update from tbl_memo where no = " + strno;
		}
		
	}// end of insertMemo(Scanner sc)


	void deleteMemo(Scanner sc) throws SQLException {
	
		System.out.println(">>> 삭제 하려는 글번호 : ");
		String strno = sc.nextLine();
		
		String sql = " select count(*) "
				 +	 " from tbl_memo "
				 +	 " where no = ?";
		
		// 4. PreparedStatment 객체 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, strno);
		
		// 5. pstmt를 사용하여 SQL문 실행하기
		rs = pstmt.executeQuery();
		rs.next();
		int check = rs.getInt(1);
	
		if(check == 0) {
			System.out.println("존재하지 않는 글번호 이므로 글 삭제가 불가합니다.");
			
		}else {
			rs = null;
			
			sql = " select * "
			  +	  " from tbl_memo "
			  +	  " where no = ?" ;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("▶ 글번호 : " + JdbcTest5.rs.getInt(1));
				System.out.println("▶ 작성자 : " + JdbcTest5.rs.getString(2));
				System.out.println("▶ 글내용 : " + JdbcTest5.rs.getString(3));
								
				sql = " delete from tbl_memo "	
					+ " where no = " + strno;
				System.out.println(sql);
				
				
				int n = pstmt.executeUpdate(sql);
				
				if(n == 1) {
					System.out.println(">> 글 삭제 성공!!");
				}else {
					System.out.println(">> 글 삭제 실패!!");
				}
				
			}
			
			sql = "update from tbl_memo where no = " + strno;
		}
		
	}// end of deleteMemo(Scanner sc)

}// end of class JdbcTest5/////////////////////////////////////////
