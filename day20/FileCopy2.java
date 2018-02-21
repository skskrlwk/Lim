package io.day1;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class FileCopy2 {

	public static void main(String[] args) {
		
		byte[] byteArr = new byte[1024];
		Scanner sc = new Scanner(System.in);
		System.out.print("복사할 원본파일명(절대경로) 입력 =>");
		String sourceFileName = sc.nextLine();

		System.out.print("목정 파일명(절대경로) 입력 =>");
		String targetFileName = sc.nextLine();
		
		try {
			FileInputStream fist = new FileInputStream(sourceFileName);
			FileOutputStream fost = new FileOutputStream(targetFileName);
			
			int input = 0;
			int countbyte = 0;
			
			while( (input = fist.read(byteArr)) != -1  ) {
				
				fost.write(byteArr, 0, input);
				fost.flush();
				countbyte += input;
				System.out.println("\n" + countbyte + "byte 복사중...");
			}
			System.out.println("\n 복사완료!! 총 " + countbyte + "byte 복사됨.");
			fost.close();
			fist.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO: handle exception
		}
		
		

	}

}
