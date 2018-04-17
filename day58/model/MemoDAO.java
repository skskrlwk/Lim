package memo.model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import member.model.MemberVO;

/*
==>	아파치 톰캣이 제공하는 DBCP(DB Connection Pool)를 이용하여
  	MemoDAO 클래스를 생성한다.
 */

public class MemoDAO implements InterMemoDAO{

	private DataSource ds;
	// 객체변수 ds는 아파치 톰캣이 제공하는 DBCP(DB Connection Pool) 이다. (import javax.sql.DataSource)
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/* 
	   === MemoDAO 생성자에서 해야할 일은 === 
	   아파치 톰캣이 제공하는 DBCP(DB Connection Pool) 객체인 ds 를 빌려오는 것이다.  
	*/
	public MemoDAO() {
		try {
			Context initContext = new InitialContext(); // javax.naming 을 import한다.
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
		} catch (NamingException e) {
			e.printStackTrace(); 
		}
		
	}// end of MemoDAO()---------------------------------
	

	// *** 사용한 자원을 반납하는 close() 메소드 생성하기 *** //
	public void close() {
		try {
			
			if(rs != null) {
				rs.close();
				rs = null;
			}
			
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			
			if(conn != null) {
				conn.close();
				conn = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}// end of close()------------------------------------


	
	// *** 메모쓰기  메소드 생성하기 *** //
	@Override
	public int memoInsert(MemoVO memovo) throws SQLException {
		int result = 0;
		try {
			MemberVO membervo = getMember(memovo.getUserid());
			System.out.println("==> 확인용 membervo : " + membervo);
			
			if(membervo == null) {
				return result;
			}
			
			conn = ds.getConnection();
			// DBCP객체 ds를 통해 context.xml에서 이미 설정된 Connection 객체를 빌려오는 것이다.
			
			
			String sql = " insert into jsp_memo(idx, userid, name, msg, writedate, cip, status) "
					   + " values(jsp_memo_idx.nextval, ?, ?, ?, default, ? , default) ";
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memovo.getUserid());
			pstmt.setString(2, membervo.getName());
			pstmt.setString(3, memovo.getMsg());
			pstmt.setString(4, memovo.getCip());
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}// end of memoInsert(MemoVO memovo)----------------------------


	// *** 유져아이디로 회원 1명 정보를 알려주는  메소드 ***
	@Override
	public MemberVO getMember(String str_userid) throws SQLException {
		MemberVO vo = null;
		
		try {
			
			conn = ds.getConnection();
			// DBCP객체 ds를 통해 context.xml에서 이미 설정된 Connection 객체를 빌려오는 것이다.
			
			String sql = "SELECT idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, " 
					+"  TO_CHAR(registerday, 'yyyy-mm-dd') AS registerday, status " 
					+"FROM jsp_member " 
					+"WHERE userid = ? ";
			
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str_userid);
			rs = pstmt.executeQuery();
			
			boolean isExists = rs.next();
			
			if(isExists) {
				int idx = rs.getInt("idx");
				String userid = rs.getString("userid");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String hp1 = rs.getString("hp1");
				String hp2 = rs.getString("hp2");
				String hp3 = rs.getString("hp3");
				String post1 = rs.getString("post1");
				String post2 = rs.getString("post2");
				String addr1 = rs.getString("addr1");
				String addr2 = rs.getString("addr2");
				String registerday = rs.getString("registerday");
				int status = rs.getInt("status");
				
				vo = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status);
			}
			
		} finally {
			close();
		}
		
		return vo;
		
	}// end of getMember(String str_userid)--------------------------------------


	// *** Memo를 보여주는 메소드 *** //
	@Override
	public List<HashMap<String, String>> getAllMemo() throws SQLException {
		
		List<HashMap<String, String>> memolist = null;
		
		try {
			conn = ds.getConnection();
			// DBCP객체 ds를 통해 context.xml에서 이미 설정된 Connection 객체를 빌려오는 것이다.
			
			String sql = "SELECT A.idx, " 
						+"  A.msg, " 
						+"  TO_CHAR(A.writedate, 'yyyy-mm-dd hh24:mi:ss') AS writedate, " 
						+"  A.cip, " 
						+"  B.name, "
						+"  B.email " 
						+"FROM jsp_memo A " 
						+"JOIN jsp_member B " 
						+"ON A.userid    = B.userid " 
						+"WHERE A.status = 1 " 
						+"ORDER BY idx DESC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				
				cnt++;
				if(cnt == 1) {
					memolist = new ArrayList<HashMap<String, String>>();
				}
				
				HashMap<String, String> map = new HashMap<String,String>();
				map.put("idx", rs.getString("idx"));
				map.put("msg", rs.getString("msg"));
				map.put("writedate", rs.getString("writedate"));
				map.put("cip", rs.getString("cip"));
				map.put("name", rs.getString("name"));
				map.put("email", rs.getString("email"));
				
				memolist.add(map);
			}// end of while ---------------------------------
			
		} finally {
			close();
		}
		
		return memolist;
	}
	
}
