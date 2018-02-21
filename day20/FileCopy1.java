/*
  	 === 파일(c:\iotestdata\Tulips.jpg)을 읽어다가
  	 	  파일(c:\iotestdata2\Tylips.jpg)에 기록(출력)
  	 
  	 1. 데이터 소스 : 파일로 부터 입력받음[노드스트림 : FileInputStream]
  	 2. 데이터 목적지 : 결과를 특정 파일에 출력함[노드스트림 : FileOutputStream]
  	 
 */

package io.day1;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class FileCopy1 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("복사할 원본파일명(절대경로) 입력 =>");
		String sourceFileName = sc.nextLine();

		System.out.print("목정 파일명(절대경로) 입력 =>");
		String targetFileName = sc.nextLine();
		
		System.out.println("소스 파일 : " + sourceFileName);
		System.out.println("목적 파일 : " + targetFileName);
		
		try {
			FileInputStream fist = new FileInputStream(sourceFileName);
			FileOutputStream fost = new FileOutputStream(targetFileName);
			
			int input = 0;
			int countbyte = 0;
			while((input = fist.read()) != -1) {
				
				fost.write(input); // 파일에 쓰기
				fost.flush();
				
				countbyte++;
				System.out.println("\n" + countbyte + "byte 복사중...");
				
			}// end of while-------------------------------------------------
			System.out.println("\n 복사완료!! 총 " + countbyte + "byte 복사됨.");
			fost.close();
			fist.close();
		
			
		} catch (FileNotFoundException e) {
			System.out.println("파일이 없습니다.");
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		sc.close();
		
	}// end of main()--------------------------

}
