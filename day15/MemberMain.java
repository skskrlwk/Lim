package my.day17;

public class MemberMain {

	public static void main(String[] args) {
		
		Member member1 = new Member();
		try {
			member1.setId("superman");
			member1.setPasswd("abcd1234");
					
		} catch (UserExceptionIDFail e) {
			//오류 메세지와 잘못된 줄도 알려준다
			e.printStackTrace();
			
		} catch (UserExceptionPasswdFail e) {
			e.printStackTrace();
		}

		System.out.println("member1 의 정보 ID : " + member1.getId() + " Passwd : " + member1.getPasswd());
		
		System.out.println("----------------------------------------------------------");
		
		Member member2 = new Member();
		try {
			member2.setId("adminstrator");
			member2.setPasswd("abcd1234");
					
		} catch (UserExceptionIDFail e) {
			e.printStackTrace();
			
		} catch (UserExceptionPasswdFail e) {
			e.printStackTrace();
		}

		System.out.println("member2 의 정보 ID : " + member2.getId() + " Passwd : " + member2.getPasswd());
		
		System.out.println("----------------------------------------------------------");
		
		Member member3 = new Member();
		try {
			member3.setId("batman");
			member3.setPasswd("abc4");
					
		} catch (UserExceptionIDFail e) {
			// 오류메세지만 출력
			String errmsg = e.getMessage();
			System.out.println(errmsg);
		} catch (UserExceptionPasswdFail e) {
			String errmsg = e.getMessage();
			System.out.println(errmsg);
		}

		System.out.println("member3 의 정보 ID : " + member3.getId() + " Passwd : " + member3.getPasswd());
		
		
	}
	
}
