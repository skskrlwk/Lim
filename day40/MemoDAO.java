package jdbc.day3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import jdbc.util.MyConnectionType;

public class MemoDAO {

	/*
	 	===== DAO(Database Access Object) =====
	 	--> 데이터베이스에 접근하는 객체
	 */
	static Connection conn = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	// ========== static 초기화 블럭 시작 ================
	static {
		try {
			// 1. 오라클 드라이버로딩
			Class.forName( MyConnectionType.getDriver() );
			
			// 2. 오라클 DB 서버와 연결하기.
			Scanner sc = new Scanner(System.in);
			do {
				System.out.print("▷ 연결할 오라클 서버 선택(1.내꺼 / 2. 누나꺼 / 3. 형꺼) => ");
				String no =  sc.nextLine();
				
				if("1".equals(no)) {
					conn = DriverManager.getConnection(MyConnectionType.getMyUrl(),MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
					
				}else if("2".equals(no)){
					conn = DriverManager.getConnection(MyConnectionType.getLeeUrl(),MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
					
				}else if("3".equals(no)){
					conn = DriverManager.getConnection(MyConnectionType.getBroUrl(),MyConnectionType.getUser(), MyConnectionType.getPasswd());
					break;
				}else{
					System.out.println("==> 1또는 2만 선택하세요!!");
					continue;
				}
				
			} while (true);
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // *** static 초기화 블럭 끝 
	
	
	static void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}// end of close() --------------------------------------------------


	// ==== 전체 선택 ===
	public List<MemoDTO> selectAllMemo() throws SQLException {
		
		// >> 3. SQL문(쿼리문, 편지) 작성하기 <<
		String sql = "SELECT Rno, " 
				+"  no, " 
				+"  name, " 
				+"  msg " 
				+"FROM " 
				+"  (SELECT rownum AS RNO, " 
				+"    v.no, " 
				+"    v.name, " 
				+"    v.msg " 
				+"  FROM " 
				+"    ( SELECT no, name, msg FROM tbl_memo ORDER BY 1 " 
				+"    )V " 
				+"  )T " 
				+"ORDER BY rno DESC";
		
		// >> 4. PreparedStatement 객체 생성 <<
		pstmt = conn.prepareStatement(sql);
		
		//>> 5. SQL 구문 실행하기
		rs = pstmt.executeQuery();
		
		List<MemoDTO> memoList = null;
		int cnt = 0;		
		
		while(rs.next()) {
			cnt ++;
			
			if(cnt == 1) {
				memoList = new ArrayList<MemoDTO>();
			}
			
			MemoDTO dto = new MemoDTO();
			dto.setRno(rs.getInt("rno"));
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setMsg(rs.getString("msg"));
			
			memoList.add(dto);
		}
		
		return memoList;
	}// end of selectAllMemo()----------------------------------
	
	// === 글내용 찾기 ===
	public List<MemoDTO> searchMemoByWord(String searchword) throws SQLException{
		
		// >> 3. SQL문(쿼리문, 편지) 작성하기 <<
		String sql = "SELECT rno, no, name, msg "
				+ " FROM view_memo "
				+ " WHERE msg LIKE ? ";
		
		// >> 4. PreparedStatement 객체 생성 <<
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+ searchword +"%");
		
		//>> 5. SQL 구문 실행하기
		rs = pstmt.executeQuery();
		
		List<MemoDTO> memoList = null;
		int cnt = 0;		
		
		while(rs.next()) {
			cnt ++;
			
			if(cnt == 1) {
				memoList = new ArrayList<MemoDTO>();
			}
			
			MemoDTO dto = new MemoDTO(rs.getInt("rno"), rs.getInt("no"), rs.getString("name"), rs.getString("msg"));
			memoList.add(dto);
		}
		
		return memoList;
	}// end of searchMemoByWord(String searchword)---------------------------------------
	
	// === 글번호 검색 ===
	public MemoDTO searchNoByWord(String no) throws SQLException{
		
		MemoDTO memo = null;
		
		String sql = "SELECT rno, no, name, msg "
				+ " FROM view_memo "
				+ " WHERE rno = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		
		rs = pstmt.executeQuery();
	
		
		while(rs.next()) {	
			
			memo = new MemoDTO(rs.getInt("rno"), rs.getInt("no"), rs.getString("name"), rs.getString("msg"));
		
		}
		
		return memo;
		
	}// end of searchNoByWord(String searchword)----------------------------
	
	// === 글쓰기 ====
	public int insertMemo(String name, String msg) throws SQLException {
		
		String sql = "insert into tbl_memo(no, name, msg) "
					+ " values(seq_memo.nextval, ?, ?) ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, msg);
		
		int n = pstmt.executeUpdate();
		
		
		return n;
	}//end of insertMemo(String name, String msg)
	
	// === 글수정 ===
	public int updateMemo(String no, String name, String msg) throws SQLException {
		
		String sql = "UPDATE tbl_memo " 
				+" SET name = ?, " 
				+"  msg    = ? " 
				+" WHERE no = ( SELECT no "
				+ 			 " FROM view_memo "
				+ 			 " WHERE rno = ? )";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, msg);
		pstmt.setString(3, no);
		
		int n = pstmt.executeUpdate();
		return n;
	}// end of updateMemo(int no, String name, String msg)
	

	// ===== 글삭제 ======
	public int deleteMemo(String no) throws SQLException {
		
		String sql = "DELETE FROM tbl_memo"
				+ " WHERE no = ( SELECT no "
				+ 			   " FROM view_memo"
				+ 			   " WHERE rno = ? )"  ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		
		int n = pstmt.executeUpdate();
		
		return n;
		
	}// end of deleteMemo(String no)
	
	
	// 최근 몇일 이내 작성된 글을 보여주는 것
	public List<MemoDTO> selectByDate(int day) throws SQLException{
		List<MemoDTO> list = null;
		String sql = "SELECT rno, "
				+ " no, " 
				+ " name, " 
				+ " msg, " 
				+ " writeday " 
				+" FROM view_memo " 
				+" WHERE to_date( TO_CHAR(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd' ) - to_date(substr(writeday, 1, 10), 'yyyy-mm-dd') <= ? " 
				+" ORDER BY no DESC";
 
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, day);
		rs = pstmt.executeQuery();
		
		int cnt = 0;
		while(rs.next()) {
			cnt ++;
			if(cnt == 1){
				list = new ArrayList<MemoDTO>();
			}
			
			MemoDTO mdto = new MemoDTO(rs.getInt("rno"), rs.getString("name"), rs.getString("msg"), rs.getString("writeday"));
			list.add(mdto);
		}
		return list;
	}// end of selectByDate(int num) ----------------------------
	
	
	// 사용자가 원하는 날짜를 검색하는 것.
	public List<MemoDTO> selectByDate(String startday, String endday) throws SQLException{
		List<MemoDTO> list = null;
		
		String sql = "SELECT rno, "
				  +"  no, " 
				  +"  name, " 
				  +"  msg, " 
				  +"  TO_CHAR(writeday, 'yyyy-mm-dd') AS writeday " 
				  +   "FROM tbl_memo " 
				  +   "WHERE substr(writeday, 1, 10) BETWEEN ? AND ? " 
				  +   "ORDER BY no DESC";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, startday);
		pstmt.setString(2, endday);
		
		rs = pstmt.executeQuery();
		int cnt = 0;
		while(rs.next()) {
			cnt ++;
			
			if(cnt == 1) {
				list = new ArrayList<MemoDTO>();
			}
			MemoDTO mdto = new MemoDTO(rs.getInt("rno"), rs.getString("name"), rs.getString("msg"), rs.getString("writeday"));
			list.add(mdto);
		}
		
		return list;
		
	}// end of selectByDate(int startday, int endday)
	
	
}
