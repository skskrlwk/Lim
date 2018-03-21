package jdbc.day1;

import java.sql.*;
import java.util.Scanner;

import jdbc.util.MyConnectionType;
import oracle.jdbc.internal.OracleTypes;
import oracle.jdbc.oracore.OracleType;

public class JdbcTest6 {

	static Connection conn = null;
	static CallableStatement cstmt = null; // 오라클의 프로시저를 호출해주는 우편 배달부 에 해당한다고 보면 된다.
	static ResultSet rs = null;
	
	static {
		
		try {
			// >>> 1. 오라클 드라이버 로딩 하기 <<<
			Class.forName(MyConnectionType.getDriver());
			// >>> 2. 어떤 오라클 서버와 연결하기 <<<
			Scanner sc = new Scanner(System.in);
			
			do {
				System.out.print("▷ 연결할 오라클 서버 선택 [1.내꺼 / 2.누나꺼 / 3.형꺼] =>");
				String no = sc.nextLine();
				if("1".equals(no)) {
					conn = DriverManager.getConnection(MyConnectionType.getMyUrl(), MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
					
				}else if("2".equals(no)) {
					conn = DriverManager.getConnection(MyConnectionType.getLeeUrl(), MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
					
				}else if("3".equals(no)) {
					conn = DriverManager.getConnection(MyConnectionType.getBroUrl(), MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
					
				}else {
					System.out.println(">>> 1,2,3 중에서만 선택하세요");
				}
			} while (true);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	} // === static 초기화 블럭 끝 ============
	
	// == 자원 반납하기
	static void close() {
		try {
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
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
	
	// == title() 메소드
	public static void title() {
		System.out.println("----------------------------------------");
		System.out.println("글번호 \t 글쓴이 \t 글내용");
		System.out.println("----------------------------------------");
	}
	
	public static void main(String[] args) {
		
		JdbcTest6 obj = new JdbcTest6();
		Scanner sc = new Scanner(System.in);
		String menuno;
		do {
			// == 메뉴 == 보여주기
			System.out.println("");
			menu();
		
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
				System.out.println("오류코드 : " +  e.getErrorCode());
				e.printStackTrace();
			}
			
			
		} while ( !("7".equals(menuno)) );	
		
		
	}// end of main()------------------------------


	// ==== 메소드호출 메뉴번호1. 전체선택 ====
	void selectAllMemo() throws SQLException {
		// >>> 3. CallableStatement 객체(우편배달부)를 생성 <<<
		// Connection 객체인 conn 을 사용하여 prepareCall() 메소드를 호출하면 
		// CallableStatement 객체(우편배달부)가 생성된다.
		cstmt = conn.prepareCall("{call pcd_selectAllMemo(?) }"); // 프로시저를 사용하면 보안과 속도 측면에서 좋다.
		
		/*
		  	-------- Stored Procedure 생성하기 ---------
			create or replace procedure pcd_selectAllMemo
			(o_data OUT SYS_REFCURSOR)
			is 
			
			begin
			  open o_data for
			  select no, name, msg
			  from tbl_memo;
			 
			end pcd_selectAllMemo;
		 */
		
		// 프로시저의 OUT 로 되어진 파라미터에 저장되어진 값을 자바에서 꺼내오려면
		// cstmt.registerOutParameter() 메소드를 사용한다.
		/*
		  	==> registerOutParameter() 메소드는?
		  	public void registerOutParameter(int parameterIndex, int sqlType) throws SQLException
		  	: 프로시저를 실행하여 받아온 값을 JDBC타입(자바에서 인식하는 타입)으로 등록시켜주는 메소드이다.
		  	    오라클의 Out mode 변수에 저장되어 있는 값들(오라클 타입)을 읽어서   JDBC타입(자바에서 인식하는 타입)으로 변경하는 과정을 거쳐야만 한다.
		  	    대표적인 sqltype을 알아보면  NULL, FLOAT, INTEGER, VARCHAR, DATE, CLOB, BLOB 등이 있다.
		 */
		cstmt.registerOutParameter(1, OracleTypes.CURSOR);
		cstmt.executeUpdate(); // 프로시저의 실행은 cstmt.executeUpdate(); 또는 cstmt.execute(); 이다.
		
		// 지금의 프로시저의 실행된 결과는 첫번째 파라미터(OUT mode)에 저장되어진다.
		// 그러므로 첫번째 파라미터에 저장되어진 결과물은 꺼내온다.
		rs = (ResultSet)cstmt.getObject(1); // 여기서 숫자 1은 프로시저의 파라미터 순서를 말한다.
											// 즉, 첫번째 파라미터에 저장된 정보를 꺼내오는 리턴타입은 Object이다.
											// 여기서는 1번째 파라미터는 CURSOR 로 되어진 OUT 모드이며 select 되어진 결과물이다.
											// 그러므로 Object 타입으로 리턴된 것을 ResultSet 타입으로 casting(강제형변환)시켜야 한다.
		
		int cnt = 0;
		
		while(rs.next()) {
			cnt ++;
			
			if(cnt == 1) {
				title();
			}
			
			int no = rs.getInt("no");
			String name = rs.getString(2);
			String msg = rs.getString("msg");
			System.out.println(no + " \t " + name + " \t " + msg);
		}// end of while----------------------------------------
		
	}// end of void selectAllMemo()-------------------------
	
	
	// 메뉴번호2. 글검색어 조회
	void searchMemoByWord(Scanner sc) throws SQLException {
		
		System.out.println("▷ 글검색어 입력 => ");
		String word = sc.nextLine();
		
		cstmt= conn.prepareCall("{call pcd_searchMemoByWord(?,?)}");
		/*
		   create or replace procedure pcd_searchMemoByWord
		   (p_word IN varchar2,
			o_data OUT SYS_REFCURSOR)
			is
			
			begin
			  open o_data for
			  select no, name, msg
			  from tbl_memo
			  where msg like '%' || p_word || '%' ;
			end pcd_searchMemoByWord;
		 */
		cstmt.setString(1, word); // 오라클의 IN mode 에 들어갈 값
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();
		
		rs = (ResultSet)cstmt.getObject(2);
		
		int cnt = 0;
		
		while (rs.next()) {
			
			cnt ++;
			if(cnt == 1) {
				title();
			}
			
			int no = rs.getInt(1);
			String name = rs.getString(2);
			String msg = rs.getString(3);
			
			System.out.println(no + " \t " + name + " \t " + msg);
		}
		
		if(cnt == 0) {
			System.out.println("검색하진 '" + word + "' 에 해당하는 데이터는 없습니다.");
		}
		
	}// end of searchMemoByWord(Scanner sc)
	

	// 메뉴번호 3. 글번호 조회
	private void searchNoByWord(Scanner sc) {
		System.out.println("▷ 검색할 글번호 => ");
		String strno = sc.nextLine();
		try {
			
			cstmt = conn.prepareCall("{call pcd_searchNoByWord(?,?,?,?)}");
			/* 
			create or replace procedure pcd_searchNoByWord
			(p_no IN tbl_memo.no%type,
			 o_no OUT tbl_memo.no%type,
			 o_name OUT tbl_memo.name%type,
			 o_msg OUT tbl_memo.msg%type)
			is
			
			begin
			  select no, name, msg
			    into o_no, o_name, o_msg
			  from tbl_memo
			  where no = p_no;
			
			end;
		 */
		
			cstmt.setString(1, strno);
			cstmt.registerOutParameter(2, OracleTypes.INTEGER);
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
			cstmt.registerOutParameter(4, OracleTypes.VARCHAR);
		
			cstmt.execute(); // 프로시저 실행하기
			
			title();
			int no = cstmt.getInt(2);
			String name = cstmt.getString(3);
			String msg = cstmt.getString(4);
			
			System.out.println(no + " \t " + name + " \t " + msg);
			
		} catch (SQLException e) {
			if(e.getErrorCode() == 1403) {
				// 오류코드 번호 1403 은 프로시저를 수행한 후 select 결과물이 없으면 발생하는 오류
				// 오라클에서는 프로시저를 수행한 후 select 되어진 결과물이 없으면 오류이다.
				System.out.println("입력하신 글번호 "+ strno +"는 존재하지 않습니다.");
			}
		}
		
	}// end of searchNoByWord(Scanner sc)---------------------------------------
	
	// 메뉴번호 4. 글쓰기
	void insertMemo(Scanner sc) {
	
		do {
			System.out.print("\n ▷작성자명 : ");
			String name = sc.nextLine();
			
			System.out.print("▷ 글내용 :");
			String msg = sc.nextLine();
			
			try {
				cstmt = conn.prepareCall("{call pcd_insertMemo(?,?)}");
				
				cstmt.setString(1, name);
				cstmt.setString(2, msg);
				
				int n= cstmt.executeUpdate();
				if(n == 1) {
					System.out.println(">>> 글쓰기 성공!! <<<");
					break;
				}
				
			} catch (SQLException e) {
				if(e.getErrorCode() == 1400) {
					// 오류번호 1400은 NOT NULL 제약 위배시 바생하는 오라클 오류번호이다.
					System.out.println("작성자명과 글내용은 필수 입력사항입니다.");
				}
				
			}
			
		} while (true);
		
	}// end of insertMemo(Scanner sc)------------------------------------
	
	// 메뉴번호 5. 글내용변경
	void updateMemo(Scanner sc) {
	
		do {
			System.out.print("변경하고싶은 글번호 : ");
			String strno = sc.nextLine();
			try {
				cstmt = conn.prepareCall("{call pcd_searchNoByWord(?,?,?,?)}");
				cstmt.setString(1, strno);
				cstmt.registerOutParameter(2, OracleTypes.INTEGER);
				cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
				cstmt.registerOutParameter(4, OracleTypes.VARCHAR);
				cstmt.execute();
				
				int no = cstmt.getInt(2);
				String name =cstmt.getString(3);
				String msg = cstmt.getString(4);
				
				System.out.println("변경하실 정보");
				System.out.println(no + " \t " + name + " \t " + msg);
				
				System.out.print("변경할 이름 : ");
				String strname = sc.nextLine();
				
				System.out.print("변경할 내용 : ");
				String strmsg = sc.nextLine();
				
				cstmt = conn.prepareCall("{call pcd_updateMemo(?,?,?)}");
				cstmt.setString(1, strno);
				cstmt.setString(2, strname);
				cstmt.setString(3, strmsg);
				
				int n = cstmt.executeUpdate();
				if(n == 1) {
					System.out.println("수정이 완료되었습니다.");
					break;
				}
				
			} catch (SQLException e) {
				if(e.getErrorCode() == 1403) {
					System.out.println("변경하실 글번호가 없습니다.");
					
				}else if(e.getErrorCode() == 1407) {
					System.out.println("이름과 내용을 필수입력사항입니다.");
				}
			}
			
		} while (true);
		
		
	}// end of updateMemo(Scanner sc)--------------------------
	
	void deleteMemo(Scanner sc) {
		
		System.out.print("삭제하려는 글번호 : ");
		String strno = sc.nextLine();
		
		try {
			cstmt = conn.prepareCall("{call pcd_searchNoByWord(?,?,?,?)}");
			cstmt.setString(1, strno);
			cstmt.registerOutParameter(2, OracleTypes.INTEGER);
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
			cstmt.registerOutParameter(4, OracleTypes.VARCHAR);
			cstmt.execute();
			
			title();
			int no = cstmt.getInt(2);
			String name = cstmt.getString(3);
			String msg =cstmt.getString(4);
			System.out.println(no + " \t " + name + " \t " + msg);
			
			System.out.print("위정보를 삭제하시겠습니까? [1.예 / 2.아니요]");
			String cho = sc.nextLine();
			
			if(cho.equals("1")) {
				
				cstmt = conn.prepareCall("{call pcd_deleteMemo(?)}");
				cstmt.setString(1,strno);
				int n = cstmt.executeUpdate();
				
				if(n == 1) {
					System.out.println("삭제되었습니다.");
				}
				
			}else {
				System.out.println("취소되었습니다");
			}
			
			
		} catch (SQLException e) {
			if(e.getErrorCode() == 1403) {
				System.out.println("삭제하실 글번호가 없습니다.");
			}
			//e.printStackTrace();
		}
		
		
	}
	
	

}
