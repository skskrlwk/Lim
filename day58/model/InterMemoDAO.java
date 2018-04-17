package memo.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import member.model.MemberVO;

public interface InterMemoDAO {

	// *** 메모쓰기 추상 메소드 *** //
	int memoInsert(MemoVO memovo) throws SQLException;
	
	// *** 유져아이디로 회원 1명 정보를 알려주는 추상 메소드 *** //
	MemberVO getMember(String str_userid) throws SQLException;
	
	// *** Memo를 보여주는 추상 메소드 *** //
	List<HashMap<String, String>> getAllMemo() throws SQLException;
	
}
