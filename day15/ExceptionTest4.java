package my.day17;

public class ExceptionTest4 {

	public static void main(String[] args) {
		
		try {
			for(int i=0; i<5; i++) {
				int result = 50/(3-i);
				System.out.println("reslut => 50/" + (3-i) + " = " + result);
			}
			
		}catch(ArithmeticException e) {
			System.out.println("분모는 0으로 나눌수 없습니다.");
			return; // finally 를 실행하고서 종료한다.
		//	System.exit(0); // finally 를 실행하지 않고 종료한다.
		/*
		 	System.exit(0); ==> 정상 종료
		 	System.exit(1); ==> 비정상종료(0이 아닌 숫자 모두해당)
		 	예를 들어 예외처리할때 catch 절에 에러문구 발생후 
		 		System.exit(1); 이라고 해놓으면
		 		형태가 정상종료인지, 비정상종료인지 구분하기가 좋다.
		 	그렇다고 해서 System.exit(0); 으로 쓰면 안된다거나 하는 것이 아니지만 	관습적으로, 또 규정에 따라 그렇게 사용하고 있다.
		 	다른 숫자를 써도 에러발생 X
 		 */
		}finally {
			// finally 에 쓰인 명력은  try{} 의 부분을 실행하고서 오류발생 여부와 관계없이 무조건 실행해주는 것이다.
			System.out.println("반드시 출력해야하는 내용");
		}
		System.out.println("프로그램 종료");
		
	}

}
