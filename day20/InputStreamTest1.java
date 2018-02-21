/*
     >>>>> System.in :
              부모클래스가 추상클래스 InputStream(기본 입력 스트림) 타입인 것으로서 
              접속점(빨대)이 키보드인 입력 스트림이다.
              
     -- Node(접속점)가 키보드인 입력스트림이다.
     -- 1 byte 기반 스트림이다.
     -- 주요메소드 :
           public int read() throws IOException
           ==> 1byte 씩 데이터를 읽어서
               1byte 씩 반환하고
                           입력받은 키보드가 Ctrl+C(윈도우), Ctrl+D(유닉스,리눅스)
                           이라면 -1 을 반환해주는 메소드이다.
               read() 메소드의 리턴타입은 byte 가 아니라 int 이다.
                           데이터 입력의 끝을 나타내는 것으로 -1 을 사용하는데
               Ctrl+C(윈도우), Ctrl+D(유닉스,리눅스)을 사용하면 된다.
                           또한 IOException 이 발생할수도 있으므로 반드시 예외처리를 꼭 해주어야 한다.              
                           그래서 현재 우리는 윈도우를 사용하고 있으므로 InputStream 작업을 
                           강제로 종료하려면  Ctrl+C(윈도우) 하면 된다.
     
     
     >>>>> System.out :
                    부모클래스가 추상클래스인 OutputStream(기본 출력 스트림) 타입인 것으로서
                    접속점(빨대)이 콘솔화면(모니터)인 출력 스트림(PrintStream)이다.
                    
       -- Node(접속점)가 콘솔화면(모니터)인 출력스트림이다.
       -- 1byte 기반 스트림이다.
       -- 주요 메소드 : println(String str),
                    print(String str),
                    write(int b)             
 */

package io.day1;

import java.io.IOException;

public class InputStreamTest1 {

	public static void main(String[] args) throws IOException {
		int input = 0;
		int countbyte = 0;
		
		
		while(true) {
			input = System.in.read();// 키보드로 부터 입력을 받는다.
			
			countbyte++;
			System.out.println("input =>" + input);
			if((char)input == 'X' || (char)input == 'x') {
				System.out.println("종료합니다");
				break;
			}
		}
		System.out.println("입력받은 byte 수 : " + countbyte);
		

	}// end of main()-------------------------------------------------

}
