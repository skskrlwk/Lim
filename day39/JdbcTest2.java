package jdbc.day1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JdbcTest2 {

	public static void main(String[] args) {
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			   // >>>> 1.오라클 드라이버 로딩 <<<<
				/*
				 	=== 오라클 드라이버의 역할 ===
				 	1). OracleDriver 를 메모리에 로딩시켜준다.
				 	2). OracleDriver 객체를 생성해준다.
				 	3). OracleDriver 객체를 DriverManager에 등록시켜준다.
				 		--> DriverManager 는 여러 드라이버들은 Vector에 저장하여 관리해주는 클래스이다.
				 */
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				// >>>> 2. 어떤 오라클 DB 서버와 연결 <<<<
				// 특정 오라클 서버와 연결을 해주는 객체가 Connection 클래스 객체이다.
				// Connection 클래스 객체를 생성해주는 명령어는 아래와 같다.
				
				Scanner sc = new Scanner(System.in);
				System.out.print("연결할 오라클 서버에 IP 주소 : ");
				String host = sc.nextLine();
				
				System.out.print("오라클 사용자명 : ");
				String username = sc.nextLine();
				
				System.out.print("오라클 암호 : ");
				String passwd = sc.nextLine();
				
				String url = "jdbc:oracle:thin:@"+ host +":1521:xe"; // localhost 로도 가능
				conn = DriverManager.getConnection(url, username, passwd);
				
				// >>> 3. 위에서 생성한(얻어온) Connection 객체인 conn(자바와 오라클서버를 연결시켜주는 통로[길]라고 보자.)을 사용하여 
				//		  sql문(쿼리문, 편지라고 생각하자)을 전송해주는 객체가 필요하다. SQL을 전송해주는 객체를 우편배달부 라고 생각하자.
				//		    이러한 우편배달부에 해당하는 클래스 객체가 Statement 객체이다.
				//	            이러한 Statement 클래스 객체를 얻어오는(생성하는) 명령어는 아래와 같이한다.
				stmt = conn.createStatement();
				
				/// >>> 4. SQL문(쿼리문, 편지)을 작성한다.
				System.out.print("작성자명: ");
				String writername = sc.nextLine();
				
				System.out.print("메모내용 : ");
				String msg = sc.nextLine();
				
				String sql = " insert into tbl_memo (no, name, msg) "
							+ " values(seq_memo.nextval, '"+ writername + "', '"+ msg +"') "; 
				// 5. 작성된 SQL문(쿼리문, 편지)을 우편배달부에 해당하는
				//    Statement 객체 stmt 을 사용하여 오라클서버로 전송해서 실행시키도록 한다.
				//    이떄 실행해야 할 SQL문이  DML(insert, update, delete, merge) 문 이거나 
				//    DDL(create, alter, drop, truncate) 문 이면
				//    이것을 실행시켜주는 메소드가 executeUpdate(sql문) 이다.
				//    executeUpdate(sql문) 메소드의 리턴값은 int 타입이다.
				System.out.println(sql);
				int cnt = stmt.executeUpdate(sql); // 변경(insert, update, delete)의 행의 수를 리턴시켜준다.
				
				System.out.println("cnt : " + cnt);
				
				sc.close();
			} catch (ClassNotFoundException e) {
				System.out.println("오라클 드라이버 로딩 실패 ojdbc6.jar 파일 이 손상되었습니다.");
				e.printStackTrace();
				
			} catch(SQLException e) {
				System.out.println("오라클 서버와 연결실패 또는 sql구문 오류발생!!");
				e.printStackTrace();
				
			} finally {
				// 6.오라클 서버와 연결해서 사용하였던 자원을 반납하기
					try {
						if(stmt != null)
							stmt.close();
					
						if(conn != null)
							conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}	
			}
		
		
	}// end of main()-------------------------------------------------------------------

}
