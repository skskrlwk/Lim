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
		
		
	}// end of boolean idDuplicateCheck(String userid)---------------------

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
		
		
	}// end of List<ZipcodeVO> getZipcode(String dong)-------------------------

	
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
		
		
	}// end of int registerMember(MemberVO mvo)-----------------------
	
	
	
	
	
	

}
