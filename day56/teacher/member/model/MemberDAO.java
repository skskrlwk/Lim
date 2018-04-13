package member.model;

import java.sql.*;
import java.util.*;

import jdbc.util.DBConnection;

public class MemberDAO implements InterMemberDAO {

	static Connection conn = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	static {
		try {
			conn = DBConnection.getConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
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
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}// end of close()---------------------------
	
	
	// *** 중복 ID 여부를 체크하는 메소드 생성하기 *** //
	@Override
	public boolean idDuplicateCheck(String userid)
		throws SQLException {
		
		try {
			String sql = "SELECT COUNT(*) AS CNT "
					  + " FROM jsp_member "
					  + " WHERE userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int cnt = rs.getInt("CNT");
			
			if(cnt == 0) // ID중복이 아닌 경우
			   return true; 
			
			else //	ID가 중복인 경우
			   return false;	
		} finally {
			close();
		}
		
	}// end of idDuplicateCheck(String userid)--------------


	// *** 우편번호 찾기 메소드 생성하기 *** // 
	@Override
	public List<ZipcodeVO> getZipcode(String dong) 
		throws SQLException {
		
		List<ZipcodeVO> zipcodeList = null;
		
		try {
			String sql = "SELECT post1, " 
					+"  post2, " 
					+"  sido " 
					+"  || ' ' " 
					+"  || gugun " 
					+"  || ' ' " 
					+"  || dong " 
					+"  || ' ' " 
					+"  || bunji AS ADDRESS " 
					+"FROM jsp_tblpost " 
					+"WHERE dong LIKE '%' " 
					+"  || ? " 
					+"  || '%' " 
					+"ORDER BY post1, post2 "; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dong);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt++;
				if(cnt==1)
					zipcodeList = new ArrayList<ZipcodeVO>(); 
				
				String post1 = rs.getString("POST1");
				String post2 = rs.getString("POST2");
				String address = rs.getString("ADDRESS");
				
				ZipcodeVO zipvo = new ZipcodeVO(post1, post2, address); 
				zipcodeList.add(zipvo);
			}
			
		} finally {
			close();
		}
		
		return zipcodeList;
		
	}// end of List<ZipcodeVO> getZipcode(String dong)------------


	// *** 회원가입(insert)하기 메소드 생성하기 *** // 
	@Override
	public int registerMember(MemberVO mvo) 
		throws SQLException {
		
		int result = 0;
		
		try {
			String sql = " insert into jsp_member(idx, name, userid, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status) " 
					+ " values(seq_jsp_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default) "; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mvo.getName());
			pstmt.setString(2, mvo.getUserid());
			pstmt.setString(3, mvo.getPwd());
			pstmt.setString(4, mvo.getEmail());
			pstmt.setString(5, mvo.getHp1());
			pstmt.setString(6, mvo.getHp2());
			pstmt.setString(7, mvo.getHp3());
			pstmt.setString(8, mvo.getPost1());
			pstmt.setString(9, mvo.getPost2());
			pstmt.setString(10, mvo.getAddr1());
			pstmt.setString(11, mvo.getAddr2());
			
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return result;
	}// end of registerMember(MemberVO mvo)-----------


	// *** 페이징처리를 안한 전체회원을 보여주는 메소드 생성하기 *** // 
	@Override
	public List<MemberVO> getAllMember() 
		throws SQLException {
		
		List<MemberVO> memberList = null;
		
		try {
			String sql = "SELECT idx, " 
					+"  userid, " 
					+"  name, " 
					+"  pwd, " 
					+"  email, " 
					+"  hp1, " 
					+"  hp2, " 
					+"  hp3, " 
					+"  post1, " 
					+"  post2, " 
					+"  addr1, " 
					+"  addr2 , " 
					+"  TO_CHAR(registerday, 'yyyy-mm-dd') AS registerday , " 
					+"  status " 
					+"FROM jsp_member " 
					+"WHERE status = 1 " 
					+"ORDER BY idx DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int cnt  = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1)
					memberList = new ArrayList<MemberVO>();
				
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
				
				MemberVO mvo = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status);
				
				memberList.add(mvo);
				
			}// end of while-----------------
			
			
		} finally {
			close();
		}
		
		return memberList;
	}// end of getAllMember()----------------


	// *** 페이징처리를 위한 사용가능한(탈퇴안한사람) 전체회원갯수를 알려주는 메소드 생성하기 *** //
	@Override
	public int getTotalCount() 
		throws SQLException {

		int result = 0;
		
		try {
			String sql = " select count(*) AS CNT "
					   + " from jsp_member "
					   + " where status = 1 ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt("CNT");
			
		} finally {
			close();
		}
		
		return result;	
		
	}// end of getTotalCount()--------------------


	@Override
	public List<MemberVO> getAllMember(int currentShowPageNo, int sizePerPage) 
		throws SQLException {
		
		List<MemberVO> memberList = null;
		
		try {
			String sql = " select RNO, idx, name, userid, pwd, email "
					   + "      , hp1, hp2, hp3, post1, post2, addr1, addr2 "
			           + "      , registerday, status "
		               + " from " 
			           + " ( "
			           + "  select  rownum as RNO, idx, name, userid, pwd, email "
			           + "        , hp1, hp2, hp3, post1, post2, addr1, addr2 " 
			           + "        , registerday, status "
			           + "  from " 
			           + "  ( "
			           + "   select idx, name, userid, pwd, email " 
			           + "        , hp1, hp2, hp3, post1, post2, addr1, addr2 " 
			           + "        , registerday, status " 
			           + "   from jsp_member " 
			           + "   where status = 1 "
			           + "   order by idx desc "
			           + "  ) V "
			           + " ) T "
			           + " where T.RNO between ? and ? "; 
			          // 1페이지 ==> where T.RNO between 1 and 10
			          // 2페이지 ==> where T.RNO between 11 and 20
			          // 3페이지 ==> where T.RNO between 21 and 30 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) );  // 공식
			pstmt.setInt(2, (currentShowPageNo*sizePerPage) );  // 공식
			
			rs = pstmt.executeQuery();
			
			int cnt  = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1)
					memberList = new ArrayList<MemberVO>();
				
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
				
				MemberVO mvo = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status);
				
				memberList.add(mvo);
				
			}// end of while-----------------
			
		} finally {
			close();
		}
		
		return memberList;		
		
	}// end of getAllMember(int currentShowPageNo, int sizePerPage)--------


	// *** 회원을 삭제(update 로 처리)해주는 메소드 생성하기 *** //
	@Override
	public int deleteMember(String idx) 
		throws SQLException {
		
		int result = 0;
		
		try {
			String sql = " update jsp_member set status = 0 "
					   + " where idx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}// end of deleteMember(String idx)-------------


	// *** 회원 1명에 대한 정보를 보여주는 메소드 생성하기 *** //
	@Override
	public MemberVO getMemberOneByIdx(String stridx) 
		throws SQLException {
		
		MemberVO mvo = null;
		
		try {
			String sql = "select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2 "
		              +	"      , to_char(registerday, 'yyyy-mm-dd') as registerday "
					  +	"      , status "
		              +	" from jsp_member "
					  + " where idx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stridx);
			
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
				
				mvo = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status);	
			}
			
		} finally {
			close();
		}
		
		return mvo;
	}// end of getMemberOneByIdx(String idx)-------------


	// *** 회원정보 수정해주는 메소드 생성하기 *** //
	@Override
	public int updateMember(MemberVO mvo) 
		throws SQLException {
		
		int result = 0;
		
		try {
			String sql = "update jsp_member set name = ? "
					+ "                       , pwd = ? "
					+ "                       , email = ? "
					+ "                       , hp1 = ? "
					+ "                       , hp2 = ? "
					+ "                       , hp3 = ? "
					+ "                       , post1 = ? "
					+ "                       , post2 = ? "
					+ "                       , addr1 = ? "
					+ "                       , addr2 = ? "
					+ "   where idx = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getName());
			pstmt.setString(2, mvo.getPwd());
			pstmt.setString(3, mvo.getEmail());
			pstmt.setString(4, mvo.getHp1());
			pstmt.setString(5, mvo.getHp2());
			pstmt.setString(6, mvo.getHp3());
			pstmt.setString(7, mvo.getPost1());
			pstmt.setString(8, mvo.getPost2());
			pstmt.setString(9, mvo.getAddr1());
			pstmt.setString(10, mvo.getAddr2());
			pstmt.setInt(11, mvo.getIdx());
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}// end of updateMember(MemberVO mvo)-----------


	// *** 페이징 처리한 검색어 및 날짜구간 검색된 회원 목록 가져오기 메소드 생성하기  *** //
	@Override
	public List<MemberVO> getSearchMember(int currentShowPageNo, int sizePerPage, String searchType, String searchWord, String period) 
		throws SQLException {
		
		List<MemberVO> memberList = null;
		
		try {
			String sql = " select RNO, idx, name, userid, pwd, email "
					   + "      , hp1, hp2, hp3, post1, post2, addr1, addr2 "
			           + "      , registerday, status "
		               + " from " 
			           + " ( "
			           + "  select  rownum as RNO, idx, name, userid, pwd, email "
			           + "        , hp1, hp2, hp3, post1, post2, addr1, addr2 " 
			           + "        , registerday, status "
			           + "  from " 
			           + "  ( "
			           + "   select idx, name, userid, pwd, email " 
			           + "        , hp1, hp2, hp3, post1, post2, addr1, addr2 " 
			           + "        , registerday, status " 
			           + "   from jsp_member " 
			           + "   where status = 1 "
			           + "         and "+ searchType + " like '%'|| ? ||'%' ";
			
			      switch (period) {
					case "3":
						sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 3 ";
						break;
						
					case "10":
						sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 10 ";
						break;
						
					case "30":
						sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 30 ";
						break;
						
					case "60":
						sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 60 ";
						break;	
						
					default:
						break;
					} 
					  
			      sql += "   order by idx desc "
			           + "  ) V "
			           + " ) T "
			           + " where T.RNO between ? and ? "; 
			          // 1페이지 ==> where T.RNO between 1 and 10
			          // 2페이지 ==> where T.RNO between 11 and 20
			          // 3페이지 ==> where T.RNO between 21 and 30 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) );  // 공식
			pstmt.setInt(3, (currentShowPageNo*sizePerPage) );  // 공식
			
			rs = pstmt.executeQuery();
			
			int cnt  = 0;
			while(rs.next()) {
				cnt++;
				
				if(cnt==1)
					memberList = new ArrayList<MemberVO>();
				
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
				
				MemberVO mvo = new MemberVO(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status);
				
				memberList.add(mvo);
				
			}// end of while-----------------
			
		} finally {
			close();
		}
		
		return memberList;				

	}// end of getSearchMember(int currentShowPageNo, int sizePerPage, String searchType, String searchWord, String period)---------------


	// *** 페이징처리를 위한 사용가능한(탈퇴안한사람) 검색된 회원갯수를 알려주는 메소드 생성하기 *** //
	@Override
	public int getTotalCount(String searchType, String searchWord, String period) 
		throws SQLException {

		int result = 0;
		
		try {
			String sql = " select count(*) AS CNT "
					   + " from jsp_member "
					   + " where status = 1 "
					   + " and "+ searchType + " like '%'|| ? || '%' "; 
			
			switch (period) {
				case "3":
					sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 3 ";
					break;
					
				case "10":
					sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 10 ";
					break;
					
				case "30":
					sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 30 ";
					break;
					
				case "60":
					sql += " and to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 60 ";
					break;	
					
				default:
					break;
			}
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt("CNT");
			
		} finally {
			close();
		}
		
		return result;			
		
	}// end of getTotalCount(String searchType, String searchWord, String period)----------------- 
	
	

}
