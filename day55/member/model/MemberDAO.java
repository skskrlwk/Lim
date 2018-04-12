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
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// *** 사용한 자원을 반납하는 close() 메소드 생성하기 ***
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
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}// end of close()---------------------------
	
	// *** 중복 아이디 여부를 체크하는 메소드 *** //
	@Override
	public boolean idDuplicateCheck(String userid) throws SQLException {
	
		try {
			
			String sql = "SELECT COUNT(*) AS CNT FROM jsp_member WHERE userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			rs.next();
			int cnt = rs.getInt("CNT");
			
			if(cnt == 0) { // ID중복이 아닌 경우
				return true;
			}else { // ID 중복인 경우
				return false;
			}
			
		} finally {
			close();
		}
		
		
	}// end of idDuplicateCheck(String userid)---------------------

	// *** 우편번호 찾기 메소드 *** //
	@Override
	public List<ZipcodeVO> getZipcode(String dong) throws SQLException {
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
						+"ORDER BY post1, " 
						+"  post2";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dong);
			
			rs = pstmt.executeQuery();
			int cnt = 0;
			
			while(rs.next()) {
				cnt ++;
				
				if(cnt == 1) {
					zipcodeList = new ArrayList<ZipcodeVO>();
				}
				
				String post1 =rs.getString("POST1");
				String post2 = rs.getString("POST2");
				String address = rs.getString("ADDRESS");
				
				ZipcodeVO zipvo = new ZipcodeVO(post1, post2, address);
				zipcodeList.add(zipvo);
				
			}
			
		} finally {
			close();
		}
		
		return zipcodeList;
		
		
	}// end of getZipcode(String dong)-------------------------

	
	// *** 회원 가입하기 메소드 *** //
	@Override
	public int registerMember(MemberVO mvo) throws SQLException {
		
		int result = 0;
		
		try {
			String sql = " insert into jsp_member(idx, name, userid, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status) "
					+ " values(seq_jsp_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getName() );
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
		
		
	}// end of registerMember(MemberVO mvo)-----------------------

	
	// ** 페이징처리를 안한 사용가능한(탈퇴안한사람) 전체 회원수를 알려주는 메소드 ** //
	@Override
	public List<MemberVO> getAllMember() throws SQLException {
		
		List<MemberVO> memberlist = null;
		
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
						+"  addr2, " 
						+"  TO_CHAR(registerday, 'yyyy-mm-dd') AS registerday, " 
						+"  status " 
						+"FROM jsp_member " 
						+"WHERE status = 1 " 
						+"ORDER BY idx DESC";

			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			
			while(rs.next()) {
				cnt++;
				
				if(cnt ==1) {
					memberlist = new ArrayList<MemberVO>();
				}
				
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
				
				memberlist.add(mvo);
				
			}
			
		} finally {
			close();
		}
		
		
		return memberlist;
	}// end of getAllMember()------------------------------------

	
	// ** 페이징처리를 위한 사용가능한(탈퇴안한사람) 전체 회원수를 알려주는 메소드 ** //
	@Override
	public int getTotalCount() throws SQLException {
		
		int result = 0;
		
		try {
			String sql = " SELECT COUNT(*) AS cnt "
					+	 " FROM jsp_member "
						+" WHERE status = 1";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt("cnt");
			
		} finally {
			close();
		}
		
		
		return result;
		
	}// end of getTotalCount()-----------------------------------

	
	// *** 페이징처리를 한 전체회원을 보여주는 메소드 *** //
	@Override
	public List<MemberVO> getAllMember(int currentShowPageNo, int sizePerPage) throws SQLException {
		
		List<MemberVO> memberlist = null;
		
		try {
			String sql = " select RNO ,idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status "  
					   + " from "  
					   + " ( "  
					   + "  select rownum as RNO ,idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status "  
					   + "  from "  
					   + "  ( "  
					   + "  select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, "  
					   + "         to_char(registerday, 'yyyy-mm-dd') as registerday, "  
					   + "         status "  
					   + "  from jsp_member "  
					   + "  where status = 1 " 
					   + "  order by idx desc "  
					   + "  )V "  
					   + " )T "  
					   + " where T.rno between ? and ? "; 
					  // 1페이지 => where T.rno between 1 and 10
					  // 2페이지 => where T.rno between 11 and 20

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage-1) );
			pstmt.setInt(2, (currentShowPageNo*sizePerPage) );
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			
			while(rs.next()) {
				cnt++;
				
				if(cnt ==1) {
					memberlist = new ArrayList<MemberVO>();
				}
				
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
				
				memberlist.add(mvo);
				
			}
			
		} finally {
			close();
		}
		
		
		return memberlist;
	
	
	}//end of getAllMember(int currentShowPageNo)----------------------------------

	
	// *** 회원 삭제(update 로 처리) 해주는 메소드 ***
	@Override
	public int deleteMember(String idx) throws SQLException {
		int result = 0;
		
		try {
			String sql = "UPDATE jsp_member SET status = 0 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			close();
		}
		return result;
	}// end of deleteMember(int seq)---------------------------------

	
	// *** 회원의 정보를 알려주는  메소드 ***
	@Override
	public MemberVO getMember(String str_idx) throws SQLException {
		MemberVO vo = null;
		try {
			String sql = "SELECT idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, " 
					+"  TO_CHAR(registerday, 'yyyy-mm-dd') AS registerday, status " 
					+"FROM jsp_member " 
					+"WHERE idx = ? ";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str_idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			
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
		
		} finally {
			close();
		}
		
		return vo;
		
	}// end of getMember(String str_idx)--------------------------------------

	// *** 회원의 정보를 수정해주는  메소드 ***
	@Override
	public int updateMember(MemberVO mvo) throws SQLException {
		int result = 0;
		
		try {
			String sql = " update jsp_member set name = ?, pwd = ?, email = ?, hp1 = ?, hp2 = ?, hp3 = ?, post1 = ?, post2 = ?, addr1 = ?, addr2 = ? "
					+ " where idx=? ";
			
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
		
	}// end of updateMember(MemberVO mvo)---------------------------
	
	

}
