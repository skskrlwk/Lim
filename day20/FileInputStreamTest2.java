package io.day1;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

public class FileInputStreamTest2 {

	public static void main(String[] args) {
		
		byte[] dataArr = new byte[1024];
		System.out.print("읽을 파일의 이름(절대경로)을 입력 >> ");
		Scanner sc = new Scanner(System.in);
		String filename = sc.nextLine();
		int inputlengthbyte = 0;
		int countbyte = 0;
		
		try {
			FileInputStream fist = new FileInputStream(filename);
			while( (inputlengthbyte = fist.read(dataArr)) != -1) {
				// 읽어온 내용물을 dataAr에 저장시켜둔다.
				System.out.write(dataArr, 0, inputlengthbyte);
				System.out.flush();
				countbyte += inputlengthbyte;
			}
			fist.close();
			System.out.println("\r\n --------------------------------------------------");
			System.out.println("총" + countbyte + "bytes");
		} catch (FileNotFoundException e) {
			System.out.println(filename +"파일이 존재하지 않습니다");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		
	}// end of main()-------------------------------

}
