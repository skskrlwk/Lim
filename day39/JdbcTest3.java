package jdbc.day1;

import java.sql.*;
import java.util.Scanner;

public class JdbcTest3 {
	
	
	public static void title() {
		System.out.println("----------------------------------------");
		System.out.println("글번호 \t 글쓴이 \t 글내용");
		System.out.println("----------------------------------------");
	}
	

	public static void main(String[] args) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 1. 오라클 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 오라클 DB 서버와 연결
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			conn = DriverManager.getConnection(url, "myorauser", "eclass");
			
			// 3. Statment 객체(우편배달부)를 생성
			stmt = conn.createStatement();
			
			// 4. SQL문 작성
			String sql = " select * " + 
						 " from tbl_memo";
			
			// 5. 작성된 SQL 실행
			// 현재 SQL 문은 select 문이므로 실행시키는 메소드는 executeQuery(sql)이다.
			// select 되어진 결과물의 리턴타입은 ResultSet 이다.
			// ResultSet 인터페이스에 담긴 결과물(select 되어진 결과물)을 처리해주는 것.
			// next() 메소드  : 커서를 다음으로 옮기며 처리한다, fisrt() 메소드 : 커서를 처음으로 옮긴다.
			// last() 메소드 : 커서를 맨 마지막으로 옮긴다.
			// 데이터 읽기는 gerInt(), getLong(), getFloat(), getDouble(), getString() 등의 메소드를 사용한다.
			rs = stmt.executeQuery(sql);
			
			int cnt = 0; // select 되어진 행의 수를 누적시키는 용도.
			
			while(rs.next()) { // rs.next() 메소드는 리턴타입이 boolean인데 읽어올 행이 있으면 true 없으면 false를 리턴.
				cnt++;
				if(cnt == 1) {
					JdbcTest3.title();
					
					
				}
				int no = rs.getInt("no"); // 컬럼 이름 또는 위치값(1부터시작) 을 넣어준다.
				String name = rs.getString("name");
				String msg = rs.getString(3);
				
				System.out.println(no + " \t " + name + " \t " + msg);
			}// end of while() ------------------------------------------
			
			if(cnt == 0) {
				System.out.println(">>>> 데이터가 존재하지 않습니다.");
			}else {
				System.out.println("추출된 데이터 수 : " + cnt);
			}
			
			if(rs != null) rs.close();
			
			Scanner sc= new Scanner(System.in);
			System.out.print("\n\n 글내용 검색어: ");
			String searchWord = sc.nextLine();
			
			sql += " where msg like '%' ||'" + searchWord + "'|| '%' "
				   + " order by no desc ";
			
			rs = stmt.executeQuery(sql);
			
			cnt = 0;
			while(rs.next()) {
				
				cnt++;
				if(cnt == 1) {
					JdbcTest3.title();
					
				}
				int no = rs.getInt(1); // 컬럼 이름 또는 위치값(1부터시작) 을 넣어준다.
				String name = rs.getString(2);
				String msg = rs.getString(3);
				
				System.out.println(no + " \t " + name + " \t " + msg);
			}// end of while() ------------------------------------------
			
			if(cnt == 0) {
				System.out.println(">>>> 데이터가 존재하지 않습니다.");
				
			}else {
				System.out.println("검색된 데이터 개수 : " + cnt);
			}
			
			sc.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
			// 6. 오라클 서버와 연결해서 사용하였던 자원을 반납하기.
			try {
				if(rs != null)	rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	}// end of main()--------------------------------------

}
