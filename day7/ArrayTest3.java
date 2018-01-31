package my.day8;

import my.util.MyUtil;

public class ArrayTest3 {
		
	
	public static void main(String[] args) {
	
		String str = "대한민국서울시종로구KH정보교육원";
		String substr = str.substring(4, 7);// str의 시작인덱스번호 4부터  마지막인덱스번호7 앞까지 추출하는 것. 
		System.out.println(substr);
		
		System.out.println("\n========================================\n");
		
		str = "KH정보교육원";
		// KH		kH정
		// H정		H정보
		// 정보		정보교
		// 보교		보교육
		// 교육		교육원
		// 육원		5개
		// 6개		== 7-3+1
		// == 7-2+1
		
		for(int i =0; i<str.length()-1; i++) {
			substr = str.substring(i,i+2);
			System.out.println(substr);
			
		}
		for(int i=0; i<str.length()-2; i++) {
			substr = str.substring(i,i+3);
			System.out.println(substr);
			
		}
		
		System.out.println("\n===========\n");
		// 아래의 strArr 에서 "교육" 이라는 문자열이 들어있는 것을 추출하려고 한다.
		String[] strArr = {"KH정보교육원","서울교육대학교","서울시종로구","훈련교육대","경기도수원시"};
		int flag = 0;
		for(int i=0; i<strArr.length; i++) {
					
			for(int j=0; j<strArr[i].length()-1; j++) {
				
				substr = strArr[i].substring(j, j+2);
				if(substr.equals("교육")) {
					flag = 1;
					System.out.println(strArr[i]);
					break;
				}
			}// end of 내부 for-------------------------------
			
		}// end of  외부for------------------------------
	
		if(flag == 0)
			System.out.println("없습니다");
		
		System.out.println("\n===================================\n");
		
		String names = "손성민,김민석,김남준,강민경,박병국";
		String[] namesarr =names.split(",");// ,를 기준으로 String[] 으로 나눈다.
		for(int i=0; i<namesarr.length; i++) {
			System.out.println((i+1)+". "+namesarr[i] );
		}
		System.out.println("\n===================================\n");
		
		String result = MyUtil.searchWord(strArr,"교육");
		System.out.println(result);
		
		String[] resultArr = result.split(",");// ,를 기준으로 String[] 으로 나눈다.
		for(String s : resultArr) {
			System.out.println(s);
		}
		System.out.println("\n===================================\n");
		
		result = MyUtil.searchWord(strArr,"교육원");
		System.out.println(result);
			
	
	}// end of main()-----------------------------

}// end of class ArrayTest3//////////////////////////////////////////
