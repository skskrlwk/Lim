/*
 	>>>> FileReader / FileWriter
 
 	-- 노드스트림 : 파일과 연결
 	-- 2byte 기반 문자 스트림
 */

package io.day2;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class FileReaderFileWriterTest {

	public static void main(String[] args) {
	
		String filename = "c:/Iotestdata/이규호교수님만세.txt";
		
		try {
			FileWriter fwriter = new FileWriter(filename);
			
			
			for(int i=1; i<=100; i++) {
				fwriter.write("줄번호 : " + i + " 만수무강하세요~~~\r\n");
				fwriter.flush();
			}
			
		System.out.println(filename + "파일을 확인하세요");
		System.out.println("\n==================================================----\n");
		
		FileReader freader = new FileReader(filename);
		/*
		  	2byte 기반으로 되어진 데이터를 읽어와서 모니터에 출력하기 위해선 System.out 을 사용해야한다
		  	그런데 System.out 은 1byte 기반이므로 바로 사용할 수 없다.
		  	그래서 1byte 기반인 출력노드스트림을 2byte 기반의 출력노드스트림으로 변경해 준다.
		  	
		  	InputStreamReader ==> 1byte 기반의 입력 스트림을 2byte 기반의 입력스트림으로 변경해주는 것.
		  	OutputStreamReader ==> 1byte 기반의 출력 스트림을 2byte 기반의 출력스트림으로 변경해주는 것.
		  	
		 */
		OutputStreamWriter ostwriter = new OutputStreamWriter(System.out);
		char[] dataArr = new char[256];
		int inputlength = 0;
		while((inputlength = freader.read(dataArr)) != -1) {
		
			ostwriter.write(dataArr, 0, inputlength);
			ostwriter.flush();
		}
		
		
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}

}
