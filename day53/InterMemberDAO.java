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
	
	
	
	
	
}
