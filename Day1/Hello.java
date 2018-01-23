// 1줄 주석문

/*
   여러줄
   주석문
*/

/**
   문서화 주석
   ==> javadoc 를 이용하여 API 문서를 만들떄 사용한다.

*/

// ==== **** CLASS(클래스)의 구조 *** =====

/*
	CLASS(클래스)는 어떠한 어플리케이션 제작시 필요한 설계도면 이라고 생각하자.

	1. 패키지 선언문
	   ==> 패키지란 클래스가 저장되어진 디렉토리 경로라고 보면 된다.

	   package 패키지명; ==> 이때 패키지명은 반드시 소문자로 시작해야 한다.

	   예> package my.com;
	2. import 문
	   
	   예> import 패키지명.클래스명;

		  import java.lang.String;
		  import java.lang.System;
		  improt java.lang.*;

	3. 클래스 선언문

	4. 컴파일하기

	5. 실행
*/
import java.util.*;

import java.lang.*;
//lang은 따로 선언하지 않아도 이미 선언 되어있다.

public class Hello
{
	public static void main(String[] args) 
	{
		System.out.println("Hello java");
		System.out.println("안녕하세요? 반갑습니다.~~~~^^");
		//System.out 은 모니터(콘솔화면)를 뜻한다
		
		//현재 날짜를 나타내어본다
		/* Date date = new Date();
		   System.out.println(date);
		*/

		System.out.print("Hi java");
		System.out.print("열심히 합시다.");
		System.out.println("\n나는 자바를 공부합니다.");
		// \n은 한줄 바꿈을 말한다.



		System.out.println(new Date());
	}
}


