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
	
	// *** 페이징 처리전 Memo를 보여주는 추상 메소드 *** //
	List<HashMap<String, String>> getAllMemo() throws SQLException;
	
	// *** 페이지 처리전 Memo를 보여주는 추상 메소드 *** //
	List<MemoVO> getAllMemoVO() throws SQLException;
	
	// *** 전체 페이지 갯수 알아오는 추상 메소드 *** //
	int getTotalCountMemo() throws SQLException;
	
	// *** 전체 페이지 갯수 알아오는 추상 메소드 *** //
	int getTotalCountMemoVO() throws SQLException;
	
	// *** 페이징 처리한 데이터 조회 추상 메소드 *** //
	List<HashMap<String, String>> getAllMemo(int sizePerPage, int currentShowPageNo) throws SQLException;
	
	// *** 페이징 처리한 데이터 조회 추상 메소드 *** //
	List<MemoVO> getAllMemoVO(int sizePerPage, int currentShowPageNo) throws SQLException;
	
	// *** 메모를 삭제(update)하는 추상 메소드 *** ///
	int deleteMemo(String str) throws SQLException;
	
	// *** 메모를 복구(update)하는 추상 메소드 *** ///
	int RollBackMemo(String str) throws SQLException;
}
