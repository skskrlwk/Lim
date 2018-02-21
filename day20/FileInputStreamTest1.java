

/*
 	=== C:\iotestdata\korea.txt 파일을 읽어서
 		그 내용을 모니터(콘솔화면)에 출력하는 예제 ===
 	
 	1. 데이터 소스 : 파일로 부터 읽어들임(노드스트림 : FileInputStream)
 	2. 데이터 목적지 : 결과물을 모니터에 출력(노드스트림 : System.out)
 	
 	 >>> FileInputStream
 	 -- Node 스트림(접속점이 파일인 입력 스트림)
 	 -- 1byte 기반 스트림.
 	 
 */

package io.day1;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

public class FileInputStreamTest1 {

	public static void main(String[] args) {
		
		System.out.print("읽을 파일의 이름(절대경로)을 입력 >> ");
		Scanner sc = new Scanner(System.in);
		String filename = sc.nextLine();
		int input = 0;
		int countbyte = 0;
		try {
			FileInputStream fist = new FileInputStream(filename);
			while((input = fist.read()) != -1 ) {
				/*
				 	fist.read() 메소드는 해당 파일에서 데이터를 1byte씩 읽어서 int 타입으로 리턴해준다
				 	읽어들일 데이터가 없다면 -1을 리턴한다
				 */
				System.out.write(input);
				System.out.flush();
				countbyte++;
			}//end of while-------------------
			
			fist.close(); // 노드 스트림 닫기
			System.out.println("\r\n --------------------------------------------------");
			System.out.println("총" + countbyte + "bytes");
		} catch (FileNotFoundException e) {
			System.out.println(filename + "파일이 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}// end of main()--------------------------------

}
