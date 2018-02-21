package io.day1;

import java.io.IOException;

public class InputStreamTest3 {

	public static void main(String[] args) throws IOException {
		
		byte[] dataArr = new byte[6];
		
		int countbyte = 0;
		
		int inputlengthbyte = 0;
		
		while((inputlengthbyte = System.in.read(dataArr)) != -1) {
			
			// 입력한 데이터가 "대한민국서울시강남구" + "엔터" 이라면
			// 카보드로 부터 배열 dataArr 크기(6byte)만큼 읽어서
			// 배열 dataArr 에 저장시키고, 이어서 읽어드린 크기를 변수 inputlengthbyte
			// 반복문의 첫번째 일때 dataArr에는 "대한민" 이 들어가 있다.
			System.out.write(dataArr, 0, inputlengthbyte);
			countbyte += inputlengthbyte;
			// 배열 dataArr 에 저장된 데이터에서 시작점이 0번째 index 부터(처음부터)
			
			System.out.flush();
		}
		System.out.println(" 총:  "+ (countbyte - 2) + "byte 입력함");

	}

}
