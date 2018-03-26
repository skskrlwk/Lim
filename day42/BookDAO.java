package jdbc.day4;

import java.sql.*;
import java.util.*;

import jdbc.util.MyConnectionType;

	public class BookDAO {
		
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
	} // *** static 초기화 블럭 끝  -------------------------------------

	static void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}// end of close() --------------------------------------------------
	
	// === 관리자 로그인 처리 ===
	public int adminLogin(String userid, String passwd) throws SQLException {
		
		String sql = "SELECT COUNT(*) AS cnt " 
				+"FROM tbl_admin " 
				+"WHERE userid = ? " 
				+"AND passwd   = ? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, passwd);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		int cnt = rs.getInt("cnt");
		
		return cnt;
	}// end of adminLogin(String userid, String passwd)-------------------------------------------------

	// === 일반사용자 로그인 처리 ===
	public int normalLogin(String userid, String passwd) throws SQLException {
		
		String sql = "SELECT " 
				+"  CASE " 
				+"    WHEN extract(YEAR FROM sysdate) - to_number( SUBSTR(birthday, 1, 4) ) < 20 " 
				+"    THEN 0 " 
				+"    ELSE 1 " 
				+"  END AS ADULTCHECK " 
				+"FROM tbl_member A " 
				+"JOIN tbl_member_detail B " 
				+"ON A.userid  = B.fk_userid " 
				+"WHERE userid = ? " 
				+"AND passwd   = ? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, passwd);
		
		rs = pstmt.executeQuery();
		
		int adultCheck = -1;
		
		if(rs.next()) {
			adultCheck = rs.getInt("ADULTCHECK"); 
		}
		
		
		
		return adultCheck; // 0(미성년자) or 1(성인) or -1 로그인실패
	}// end of normalLogin(String userid, String passwd)
	
	// === 아이디 중복 확인 ===
	public boolean useridDuplicate(String userid) throws SQLException {
		
		String sql = "SELECT COUNT(*) AS cnt " 
				+"FROM tbl_member " 
				+"WHERE userid = ? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		
		rs.next();
		int cnt = rs.getInt("cnt");
		
		if(cnt == 1) {
			return false;
		}else {
			return true;
		}
		
	}
	
	// === 회원가입 ====
	public int memberRegister(UserDTO user) throws SQLException {
		
		String sql = "insert into tbl_member (userid, passwd, name) "
				+ " values (?,?,?) ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUserid());
		pstmt.setString(2, user.getPasswd());
		pstmt.setString(3, user.getName());
		
		
		
		// *********** 수동커밋으로 전환  *****************
		conn.setAutoCommit(false);
		int n = pstmt.executeUpdate();
		
		int m = 0;
		if(n == 1) {
			sql = "insert into tbl_member_detail (fk_userid, birthday, email, tel, address) "
				+ " values (?, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getBirthday());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getTel());
			pstmt.setString(5, user.getAddress());
			
			m = pstmt.executeUpdate();
			
			if(m == 1) {
				conn.commit();
			}else
				conn.rollback();
		}
		// ****** 자동 커밋으로 전환
		conn.setAutoCommit(true);
 		return m;
	}
	
	// *** 일반 사용자로 로그인시 화면에 해당 사용자의 이름과  email을 출력하기 위한 용도
	public HashMap<String, String> selectUserName(String userid) throws SQLException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		String sql = "SELECT name, email, userid " 
				+" FROM tbl_member_detail A join tbl_member B "
				+ " ON A.fk_userid = B.userid " 
				+" WHERE fk_userid = ? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		map.put("name", rs.getString("name"));
		map.put("email",rs.getString("email"));
		map.put(userid, rs.getString("userid"));
		
		return map ;
	}
	
	// === 도서 카테고리 조회 ===
	public List<HashMap<String, String>> bookShow() throws SQLException {
		
		List<HashMap<String, String>> list = null;
		
		String sql = "SELECT A.categoryno, " 
				+"  A.categoryname, " 
				+"  B.cnt " 
				+"FROM tbl_bookcategory A " 
				+"JOIN " 
				+"  (SELECT fk_categoryno, COUNT(*) AS cnt FROM tbl_book GROUP BY fk_categoryno " 
				+"  )B " 
				+"ON A.categoryno = B.fk_categoryno " 
				+"ORDER BY 1";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int cnt = 0;
		while(rs.next()) {
			cnt ++; 
			if(cnt == 1) {
				list = new ArrayList<HashMap<String, String>>();
				
			}
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("CATEGORYNO", String.valueOf(rs.getInt("CATEGORYNO")) ); // String.valueOf() 문자형으로 변경
			map.put("CATEGORYNAME", rs.getString("CATEGORYNAME"));
			map.put("CNT", String.valueOf(rs.getInt("CNT")));
			/*
			bdto.setCategoryno(rs.getInt("categoryno"));
			bdto.setCategoryname(rs.getString("categoryname"));
			*/
			list.add(map);
			
		}
		return list;
		
	}// end of bookShow()----------------------------------------------
	
	// === 신규도서 입력 ===
	public int insertBook(List<BookDTO> listBookDTO) throws SQLException {
		
		// 수동커밋으로 전환
		conn.setAutoCommit(false);
		
		int cnt = 0;
		
		for(int i=0; i<listBookDTO.size(); i++) {
			BookDTO book = listBookDTO.get(i);
			String sql = " insert into tbl_book(bookcode, fk_categoryno, bookname, publishday) "
					+ " values(?, ?, ?, to_date(?, 'yyyy-mm-dd'))";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBookcode());
			pstmt.setInt(2, book.getCategoryno());
			pstmt.setString(3, book.getBookname());
			pstmt.setString(4, book.getPublishday()); // 문자열을 to_date()를 이용하여 날짜형식으로 변경해준다.
		
			int n = pstmt.executeUpdate();
			if(n == 1)	cnt ++;
		}
		
		int result = 0;
		if(cnt == listBookDTO.size()) {
			conn.commit();
			result = 1;
		}else {
			conn.rollback();
			result = 0;
		}
		
		// 오토커밋 전환
		conn.setAutoCommit(true);
		return result;
	}// end of insertBook(List<BookDTO> listBookDTO)---------------------------------
	
	// == 도서 정보 조회(성인으로 로그인 하면 모든 정보 조회, 미성년자로 로그인하면 성인물 제외) ==
	public List<HashMap<String, String>> selectBookInfo(String num, int adultCheck) throws SQLException {
		List<HashMap<String, String>> list = null;
		
		String sql = "SELECT A.OLDNEW, " 
				+"  A.BOOKCODE, " 
				+"  A.BOOKNAME, " 
				+"  A.PUBLISHDAY, " 
				+"  B.TOTALCNT, " 
				+"  B.EXISTSCNT, " 
				+"  B.RENTINGCNT " 
				+"FROM " 
				+"  (SELECT " 
				+"    CASE " 
				+"      WHEN months_between(to_date(TO_CHAR(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), publishday) < 6 " 
				+"      THEN '[신간]' " 
				+"      ELSE '[구간]' " 
				+"    END AS OLDNEW, " 
				+"    bookcode, " 
				+"    bookname, " 
				+"    TO_CHAR(publishday, 'yyyy-mm-dd') AS publishday " 
				+"  FROM tbl_book " 
				+"  WHERE fk_categoryno = ? ";
		
		if(adultCheck == 0) { // adultCheck가 1이면 성인 / 0이면 미성년자.
			sql +=  " and ADULT != 1  " ;
		}
		
		sql +=	"  ) A " 
				+"JOIN " 
				+"  (SELECT fk_bookcode, " 
				+"    COUNT(*) AS TOTALCNT, " 
				+"    SUM( " 
				+"    CASE rentyn " 
				+"      WHEN 1 " 
				+"      THEN 1 " 
				+"      ELSE 0 " 
				+"    END) AS EXISTSCNT, " 
				+"    SUM( " 
				+"    CASE rentyn " 
				+"      WHEN 0 " 
				+"      THEN 1 " 
				+"      ELSE 0 " 
				+"    END) AS RENTINGCNT " 
				+"  FROM tbl_rentbook " 
				+"  GROUP BY fk_bookcode " 
				+"  ORDER BY 1 " 
				+"  ) B " 
				+"ON A.bookcode = B.fk_bookcode " 
				+"ORDER BY 2";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();

		int cnt = 0;
		
		while(rs.next()) {
			cnt ++;
			
			if(cnt == 1) {
				list = new ArrayList<HashMap<String, String>>();
			}
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("OLDNEW", rs.getString("OLDNEW"));
			map.put("BOOKCODE", rs.getString("BOOKCODE"));
			map.put("BOOKNAME", rs.getString("BOOKNAME"));
			map.put("PUBLISHDAY", rs.getString("PUBLISHDAY"));
			map.put("TOTALCNT", rs.getString("TOTALCNT"));
			map.put("EXISTSCNT", rs.getString("EXISTSCNT"));
			map.put("RENTINGCNT", rs.getString("RENTINGCNT"));
						
			list.add(map);
			
		}
		return list;
		
		
	}// end of categorySearch()------------------------------------------
	
	
	public int insertRentBook(String bookno, String bookcnt) throws SQLException {
		
		conn.setAutoCommit(false);
		int n =0, cnt =0, result = 0;
		
		for(int i=0; i< Integer.parseInt(bookcnt); i++) {
			
			String sql = "insert into tbl_rentbook(rentbookno, fk_bookcode) " + 
					" values (seq_rentbook.nextval, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookno);
			n = pstmt.executeUpdate();
			
			if(n==1) cnt++;
			
		}
		
		if(cnt == Integer.parseInt(bookcnt)) {
			conn.commit();
			result = 1;
		}else {
			conn.rollback();
			result = 0;
		}
		conn.setAutoCommit(true);
		
		return result;
	}
	
	// === 유저 정보 조회 ===
	public List<HashMap<String, String>> searchUser (String username) throws SQLException{
		
		List<HashMap<String, String>> list = null;
		
		String sql = "SELECT fk_userid, " 
				+"  name , " 
				+"  birthday, " 
				+"  email, " 
				+"  tel, " 
				+"  address, " 
				+"  point, " 
				+"  coin, " 
				+"  renttotal, " 
				+"  mibannapcnt, " 
				+"  delaymoney " 
				+"FROM tbl_member A " 
				+"JOIN tbl_member_detail B " 
				+"ON A.userid     = B.fk_userid " 
				+"WHERE B.fk_userid = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, username);
		
		rs = pstmt.executeQuery();
		int cnt = 0;
		
		while(rs.next()) {
			
			cnt ++;
			
			if(cnt == 1) {
				list = new ArrayList<HashMap<String, String>>();
			}
	
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("FK_USERID", rs.getString("FK_USERID"));
			map.put("NAME", rs.getString("NAME"));
			map.put("BIRTHDAY", rs.getString("BIRTHDAY"));
			map.put("EMAIL", rs.getString("EMAIL"));
			map.put("TEL", rs.getString("TEL"));
			map.put("ADDRESS", rs.getString("ADDRESS"));
			map.put("POINT", String.valueOf(rs.getInt("point")));
			map.put("COIN", String.valueOf(rs.getInt("COIN")));
			map.put("RENTTOTAL", String.valueOf(rs.getInt("RENTTOTAL")));
			map.put("MIBANNAPCNT", String.valueOf(rs.getInt("MIBANNAPCNT")));
			map.put("DELAYMONEY", String.valueOf(rs.getInt("DELAYMONEY")));
			
			list.add(map);
			
		}
		
		return list;
	}
	
	// === 연체 도서 확인
	public List<HashMap<String, String>> overdueBook() throws SQLException{
		List<HashMap<String, String>> list = null;
		
		String sql = "SELECT fk_userid, " 
				+"  bookname,"
				+" rentbookno, " 
				+"  to_date( TO_CHAR(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(TO_CHAR(B.rent_date, 'yyyy-mm-dd'), 'yyyy-mm-dd' ) - 13 AS DAY " 
				+"FROM tbl_rentbook A " 
				+"JOIN tbl_rentlist B " 
				+"ON A.rentbookno = B.fk_rentbookno " 
				+"JOIN tbl_book C " 
				+"ON B.fk_bookcode                                                                                                           = C.bookcode " 
				+"WHERE to_date( TO_CHAR(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(TO_CHAR(B.rent_date, 'yyyy-mm-dd'), 'yyyy-mm-dd' ) >= " 
				+"  (SELECT rent_range FROM setting_opt )" ;
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int cnt = 0;
		while(rs.next()) {
			
			cnt ++;
			
			if(cnt == 1) {
				list = new ArrayList<HashMap<String, String>>();
			}
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("FK_USERID", rs.getString("FK_USERID"));
			map.put("BOOKNAME", rs.getString("BOOKNAME"));
			map.put("RENTBOOKNO", rs.getString("RENTBOOKNO"));
			map.put("DAY", String.valueOf(rs.getInt("DAY")));
			list.add(map);
			
		}
		
		return list;
		
	}
	
}
