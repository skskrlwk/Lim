package io.day1;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class FileCopy4Buffered {

	public static void main(String[] args) {
						
		Scanner sc = new Scanner(System.in);
		System.out.print("복사할 원본파일명(절대경로) 입력 =>");
		String sourceFileName = sc.nextLine();

		System.out.print("목정 파일명(절대경로) 입력 =>");
		String targetFileName = sc.nextLine();
		
		
		File sourcefile = new File(sourceFileName);
		// String 타입인 souceFileName(파일경로명)이 실제 File 클래스의 객체로 되어진다.
		long fileSize = sourcefile.length(); // 파일의 크기를 알려준다.
		System.out.println("원본 파일크기 : " + fileSize + "bytes");
		
		int arraySize = 0;
		
		if(fileSize < 1024) {
			arraySize = 10;
			
		} else if(1024 <= fileSize && fileSize < 1048576 ) {
			arraySize = 1024;
			
		} else {
			arraySize = 1048576;
		}
		try {
			
			
			FileInputStream fist = new FileInputStream(sourcefile);
			BufferedInputStream bist = new BufferedInputStream(fist, 1024);
			
			FileOutputStream fost = new FileOutputStream(targetFileName);
			BufferedOutputStream bost = new BufferedOutputStream(fost, 1024);
			
			byte[] byteArr = new byte[arraySize];
			int input = 0;
			int countbyte = 0;
			
			while( (input = bist.read(byteArr)) != -1  ) {
				
				bost.write(byteArr, 0, input);
				bost.flush();
				countbyte += input;
				double percent = (double)countbyte/fileSize * 100;
				System.out.println("\n" +(int) percent + "% 복사중...");
			}
			System.out.println("\n 복사완료!! 총 " + countbyte + "byte 복사됨.");
			bist.close();
			bost.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}

	}

}
