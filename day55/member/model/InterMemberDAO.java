package member.model;

import java.sql.*;
import java.util.*;

public interface InterMemberDAO {

	// *** 중복 아이디 여부를 체크하는 메소드 *** //
	boolean idDuplicateCheck(String userid) throws SQLException;
	
	// *** 우편번호 찾기 추상 메소드 *** //
	List<ZipcodeVO> getZipcode(String dong) throws SQLException;
	
	// *** 회원 가입하기 추상 메소드 *** //
	int registerMember(MemberVO mvo) throws SQLException;
	
	// *** 페이징처리를 안한 전체회원을 보여주는 추상 메소드 *** //
	List<MemberVO> getAllMember() throws SQLException;
	
	// ** 페이징처리를 위한 사용가능한(탈퇴안한사람) 전체 회원수를 알려주는 추상 메소드 ** //
	int getTotalCount() throws SQLException;
	
	// *** 페이징처리를 한 전체회원을 보여주는 추상 메소드 *** //
	List<MemberVO> getAllMember(int currentShowPageNo, int sizePerPage) throws SQLException;
	
	// *** 회원을 삭제(updqte 로 처리) 해주는 추상 메소드 *** //
	int deleteMember(String idx) throws SQLException;
	
	// *** 회원의 정보를 알려주는 추상 메소드 *** //
	MemberVO getMember(String str_idx) throws SQLException;
	
	// *** 회원의 정보를 수정해주는 추상 메소드 *** //
	int updateMember(MemberVO mvo) throws SQLException;
	
}
