package io.day1;

import java.io.IOException;

public class InputStreamTest2 {

	public static void main(String[] args) throws IOException {
		
		int input = 0;
		
		while( (input = System.in.read()) != -1 ) {
			// 키보드로 Ctrl + C(강제종료)를 누르지 않으면 계속실행
			System.out.println("\r\n === 키보드로 부터 데이터 입력받기 ====");
			System.out.println("화면에 출력 [println(input)] : " + input);
			System.out.print("화면에 출력 [write(input)] : ");
			System.out.write(input);
			System.out.flush();
			/*
			  	flush란?
			  	출력버퍼에 임시로 보관되어 스트림으로 출력될때까지 대기중인 데이터를 스트림으로 내보내는것을 flush라한다
			  	write() 메소드는 flush() 메소드와 함께 사용되어야만 출력버퍼에 들어가 있던 내용이 모니터(또는 파일)에 출력된다.
			  	그런데, flush() 메소드를 사용하지 않아도 모니터(또는 파일)에 출력되는 경우라면 
			  	auto flush 가 적용되어졌기 때문이다.	
			 */
			
			System.out.println("");
			System.out.println("화면에 출력 [println((char)input)] : " + (char)input);
			
		}// end of while-----------------------------

	}

}
