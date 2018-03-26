package jdbc.day4;

import java.sql.SQLException;
import java.util.Scanner;

public class UserCtrl {
	
	// ===== 회원가입 ======
	public int memberRegister(BookDAO dao, Scanner sc) throws SQLException {
		
		String userid, passwd, name, birthday, email, tel, address;
		
		do {
			System.out.print("▷ 사용자ID : ");
			userid = sc.nextLine();
			
			if(!userid.trim().isEmpty()) {
				// *** 중복 아이디 검사
				boolean isUseUserid = dao.useridDuplicate(userid); // 사용자 ID가 중복된 것이 있다라면 false 리턴 없다면 true
				
				if(isUseUserid) {
					break;
				}else {
					System.out.println("아이디가 중복되었습니다.");
				}
				
			}else {
				System.out.println(">>> 사용자 ID를 입력하세요");
			}
			
		} while (true);
		
		do {
			System.out.print("▷ 암호 : ");
			passwd = sc.nextLine();
			
			if(!passwd.trim().isEmpty()) {
				break;
			}else {
				System.out.println(">>> 암호를 입력하세요");
			}
			
		} while (true);
		
		do {
			System.out.print("▷ 성명 : ");
			name = sc.nextLine();
			
			if(!name.trim().isEmpty()) {
				break;
			}else {
				System.out.println(">>> 성명을 입력하세요");
			}
			
		} while (true);
		
		do {
			System.out.print("▷ 생년월일 [yyyy-mm-dd] : ");
			birthday = sc.nextLine();
			
			if(!birthday.trim().isEmpty()) {
				break;
			}else {
				System.out.println(">>> 생년월일[yyyy-mm-dd]를 입력하세요");
			}
			
		} while (true);
		
		do {
			System.out.print("▷ 이메일 : ");
			email = sc.nextLine();
			
			if(!email.trim().isEmpty()) {
				break;
			}else {
				System.out.println(">>> 이메일을 입력하세요");
			}
			
		} while (true);
		
		do {
			System.out.print("▷ 전화번호 : ");
			tel = sc.nextLine();
			
			if(!tel.trim().isEmpty()) {
				break;
			}else {
				System.out.println(">>> 전화번호를 입력하세요");
			}
			
		} while (true);
		
		do {
			System.out.print("▷ 주소 : ");
			address = sc.nextLine();
			
			if(!address.trim().isEmpty()) {
				break;
			}else {
				System.out.println(">>> 주소를 입력하세요");
			}
			
		} while (true);
		
		UserDTO user = new UserDTO();
		user.setUserid(userid);
		user.setPasswd(passwd);
		user.setName(name);
		user.setBirthday(birthday);
		user.setEmail(email);
		user.setTel(tel);
		user.setAddress(address);

		int n = dao.memberRegister(user); // 회원가입
		
		return n;
	}// end of memberRegister(BookDAO dao, Scanner sc)
	
	
}
