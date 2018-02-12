/*
 	==== *** 사용자 정의 예외절 만들기 *** ====
 	1. Exception 클래스를 상속받는다.
 	2. 생성자를 구성해서 예외메시지를 등록해주면 된다.
 */

package my.day17;

public class UserExceptionIDFail extends Exception{

	// 기본생성자
	public UserExceptionIDFail() {
		super("ID명에 NULL은 불가합니다.");
	}
	
	// 파라미터가 있는 생성자
	public UserExceptionIDFail(String errorMsg) {
		super(errorMsg);
	}
	
	
}
