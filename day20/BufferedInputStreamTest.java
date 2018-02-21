/*
 	=== BufferedInputStream 와 BufferedOutputStream ===
 	
 	-- 1byte 기반 스트림.
 	-- 필터스트림(보조스트림)은 단독으로 사용할 수 없고, 반드시 노드스트림에 장착되어 사용되는 것이다.
 	      노드스트림에 장착하여 사용하면 단독으로 노드스트림을 사용할때 보다 빠르다.
 	   
 	--  데이터를 매번 1byte 마다  읽고, 쓰고 하면 입.출력에 너무 많은 시간이 소요된다.
 		그래서 쓰는 작업없이 메모리 버퍼에 데이터를 한번에 읽기만 하여 모아두고, 그내용을 한번에 쓴다.
 		BufferedInputStream 와 BufferedOutputStream 의 기본 버퍼 크기는 512byte 이다
 		
 	
 	[예제]
 	필터스트림 을 이용해서 키보드로 부터 입력받고,
 	입력받은 그 내용을 모니터(콘솔화면)에 출력하고, 또한 동시에 파일에도 출력해본다  
 	
 	>> 데이터 소스 :  키보드(System.in --> 노드스트림)
 	            + 필터스트림으로 BufferedInputStream 을 사용한다.
 	            
 	>> 목적지 : 모니터(system.out --> 노드스트림)
 	   		+ 필터스트림으로 BufferedOutputStream 을 사용한다.
 	   		
 	   		    파일(FileOutputStream --> 노드스트림)
 	   		+ 필터스트림으로 BuffedOutputStream 을 사용한다.   
 */


package io.day1;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class BufferedInputStreamTest {

	public static void main(String[] args) {
		
		BufferedInputStream bist = new BufferedInputStream(System.in, 1024);
		// 노드스트림인  System.in 에 필터스트림을 장착함. 용량은 1024 byte
		
		BufferedOutputStream bost = new BufferedOutputStream(System.out, 1024);
		// 노드스트림인  System.out 에 필터스트림을 장착함. 용량은 1024 byte
		String filename = "c:/iotestdata/seoul.txt";
		
		FileOutputStream fost;
		try {
			fost = new FileOutputStream(filename);
			BufferedOutputStream bost2 = new BufferedOutputStream(fost, 1024);
			
			byte[] dataArr = new byte[64];
			int inputlengthbyte = 0;
			int countbyte = 0;
			
			while( (inputlengthbyte = bist.read(dataArr)) != -1 ) {
				
				bost.write(dataArr, 0, inputlengthbyte);
				bost.flush(); // 출력버퍼에 임시로 보관되어 스트림으로 출력될때까지 대기중인 데이터를 스트림으로내보
				/*
				  	읽어들이는 데이터가 bist 에 1024 byte 만큼 쌓일떄 까지
				  	계속 읽어들이다가 1024 byte 만큼 쌓이면 더 이상 읽어들이지 않고
				  	모니터에 한번에 출력한다.
				 */
				bost2.write(dataArr, 0, inputlengthbyte);
				bost2.flush();
				/*
				  	읽어들이는 데이터가 bist2 에 1024 byte 만큼 쌓일떄 까지
				  	계속 읽어들이다가 1024 byte 만큼 쌓이면 더 이상 읽어들이지 않고
				  	파일에에 한번에 출력한다.
				 */
				countbyte += inputlengthbyte;
			
				
			}// end of while------------------------------------------s
			
			System.out.println("-----------------------------------------------");
			System.out.println("총  " + countbyte + "bytes 읽고" + filename + "파일에 씀");
			System.out.println("-----------------------------------------------");
			
			bost2.close();// 필터스트림 닫음
			bost.close();
			
			bist.close();// 노드스트림 닫음
			
		} catch (FileNotFoundException e) {
			System.out.println("파일이 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
