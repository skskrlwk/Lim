package jdbc.day1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcTest1 {

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
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; // localhost 로도 가능
			conn = DriverManager.getConnection(url, "myorauser", "eclass");
			
			// >>> 3. 위에서 생성한(얻어온) Connection 객체인 conn(자바와 오라클서버를 연결시켜주는 통로[길]라고 보자.)을 사용하여 
			//		  sql문(쿼리문, 편지라고 생각하자)을 전송해주는 객체가 필요하다. SQL을 전송해주는 객체를 우편배달부 라고 생각하자.
			//		    이러한 우편배달부에 해당하는 클래스 객체가 Statement 객체이다.
			//	            이러한 Statement 클래스 객체를 얻어오는(생성하는) 명령어는 아래와 같이한다.
			stmt = conn.createStatement();
			
			/// >>> 4. SQL문(쿼리문, 편지)을 작성한다.
			String sql1 = "create table tbl_memo"
					  + " (no number(4), name varchar2(20), msg varchar2(100))";// sql문에서 마지막에  ; 를 찍으면 오류!!!
			
			String sql2 = " create sequence seq_memo " // " " 안에 처음과 끝에 여백주기
					+ " start with 1 "
					+ " increment by 1 "
					+ " nomaxvalue "
					+ " nominvalue "
					+ " nocycle "
					+ " nocache ";
			
			String sql3 = " insert into tbl_memo(no, name, msg) "
						+ " values(seq_memo.nextval, '이순신', '안녕하세요? 이순신입니다.')";
			
			// 5. 작성된 SQL문(쿼리문, 편지)을 우편배달부에 해당하는
			//    Statement 객체 stmt 을 사용하여 오라클서버로 전송해서 실행시키도록 한다.
			
			boolean isSQL1 = stmt.execute(sql1); // 리턴타입 boolean
			boolean isSQL2 = stmt.execute(sql2);
			boolean isSQL3 = stmt.execute(sql3);
			/*
			  	stmt.execute(sql문); 을 실행하면 리턴값은 true 아니면 false가 나온다.
			  	파라미터로 들어가는 sql문이 select 문이 아닌 DDL(create, alter, drop)
			  	이거나 DML(insert, update, delete) 이라면 sql문이 오라클 서버에서 
			  	성공했다라고 하더라도 리턴되는 값은 false 를 리턴시켜준다.
			  	파라미터로 들어가는 sql문이 select 문일때만 true를 리턴시켜 준다.
			 */
			System.out.println("isSQL1 : " + isSQL1); // false
			System.out.println("isSQL2 : " + isSQL2); // false
			System.out.println("isSQL3 : " + isSQL3); // false
			
			
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		
		
		

	}// end of main()--------------------------------

}
