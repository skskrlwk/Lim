package io.day2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class BufferedReaderBufferedWriterTest {

	public static void main(String[] args) throws IOException{
		
		InputStreamReader istReader = new InputStreamReader(System.in);
		// 키보드에서 입력하는 것은 1byte 기반인데 이것을 2byte 기반으로 변경한다.
		BufferedReader bufReader = new BufferedReader(istReader, 1024);
		// 필터스트림
		
		OutputStreamWriter ostWriter = new OutputStreamWriter(System.out);
		// 모니터에 출력하는 것은 1byte 기반인데 이것을 2byte 기반으로 변경한다.
		BufferedWriter bufWriter = new BufferedWriter(ostWriter, 1024);
		// 필터스트림
		
		bufWriter.write("내용을 입력하세요 => ");
		bufWriter.flush();
		String str = "";
		
		while( (str = bufReader.readLine()) != null) {
			/*
			  	readLine() 메소드를 사용하면 읽어들이는 단위가 1줄 단위로 읽어들인다.
			  	여기서 1줄의 끝은 엔터(\r\n)이므로 엔터전까지 읽어들인다.
			  	중요한 것은 엔터전까지 읽어들이므로 엔터는 읽지 않는다.
			 */
			bufWriter.write(str);
		//	bufWriter.write("\r\n");
			bufWriter.newLine();  // 줄봐꿈
			bufWriter.flush();
			
		}
		
		bufWriter.close();
		ostWriter.close();
		bufReader.close();
		istReader.close();
	}

	
}
