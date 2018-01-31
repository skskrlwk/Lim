package my.day8;

import my.util.MyUtil;

public class ArrayTest2 {
	
	public static void analyzeString(String passwd) {
		
		int countUpper = 0,countLower = 0,countNumber = 0,countSpecial = 0;
		char chrArr[] = passwd.toCharArray();
		
		for(char ch : chrArr) {
			
			if('A'<=ch && ch<='Z')
				countUpper++;
			else if('a'<=ch && ch<='z')
				countLower++;
			else if('0'<=ch && ch<='9')
				countNumber++;
			else
				countSpecial++;
						
		}//end of for---------------------------------------------
		
		System.out.println("대문자 : " + countUpper );
		System.out.println("소문자 : " + countLower );
		System.out.println("숫자 : " + countNumber );
		System.out.println("특수문자 : " + countSpecial );
				
	}// end of analyzeString(String passwd)-----------------------
	
	
	public static void searchFristName(String[] strArr,char name) {
		int flag = 0; 
		
		for(int i=0; i<strArr.length; i++) {
			char ch = strArr[i].charAt(0);
			
			if(name == ch) {
				flag = 1;
				System.out.print(strArr[i]+" ");
			}
		
		}
		if(flag == 0)
			System.out.println(name+"씨 성이 없습니다.");
	}// end of searchFristName(String myfriend,char name)
	
	public static void searchLastName(String[] strArr, char lname) {
				
			int flag = 0; 
			
			for(int i=0; i<strArr.length; i++) {
				
				char ch = strArr[i].charAt(strArr[i].length()-1); 
				
				if(lname == ch) {
					flag = 1;
					System.out.print(strArr[i]+" ");
				}
			
			}//end of for------------------------------------------
			if(flag == 0)
				System.out.println("'"+lname+"' 마지막 이름이 없습니다.");
				
		}// end of searchLastName(String[] strArr, char lname)
	
	public static void searchName(String[] strArr, char name) {
		
		int flag = 0;
	
		/*for(int i=0; i<strArr.length; i++) {
			char[] ch = strArr[i].toCharArray();
			for(char a : ch)
				if(name == a) {
					flag = 1;
					System.out.println(strArr[i]);
				}
		}*/
		
		
		for(int i=0; i < strArr.length; i++) {
			char[] ch = strArr[i].toCharArray();
			for(int j=0; j < ch.length; j++) {
				
				if(ch[j] == name) {
					System.out.print(strArr[i]+ " ");
					flag = 1;
					break;
				}
			}
			
			
		}// end of for--------------------------------
		if(flag == 0)
			System.out.println(name+"를 가진 이름이 없습니다.");
		
		
		
	}// end of searchName(String[] strArrr, char name)----------------------------
			
				
	

	public static void main(String[] args) {
		
		String[] myfriend = {"김수민","이유림","김수한무거북이와두루미","서묘음","김동현","문김정","김유정","이혜림","이림"};
		
		System.out.println(myfriend[2]);
		
		System.out.println("\n");
		
		char[] chrArr = myfriend[2].toCharArray();
		
		System.out.println(chrArr[2]); //한
		
		System.out.println("\n");
		
		for(char ch : chrArr) {
			System.out.println(ch);
		}
		
		/*
	 	영문대문자 : 1개
	 	영문소문자 : 4개
	 	숫자 : 4개
	 	특수문자 : 1개
		 */
		
		String passwd = "qwerA1234$";
		ArrayTest2 obj = new ArrayTest2();
		obj.analyzeString(passwd);
		
		System.out.println("\n========================");
		
		String[] passwordArr = {"abCd123$!","superman","qwer1","123456789","asdf0070#","qwer1234"};
		
		/*
		  	암호는 7글자 이상으로서 영문자,숫자,특수문자가 혼합되어져야 한다.
		  	배열 passwordArr에 저장되어 있는 것 중에서 암호로 사용가능한 것만 출력하세요. 
		*/
		
		
		for(String pw: passwordArr){
			
			if(MyUtil.passwdCheck(pw))
				System.out.println(pw);
		}// end of for----------------------
		/*
		   == 사용가능한 암호 ==  
		   abCd123$!
		   asdf0070#
		*/
		
		System.out.println("\n===========================\n");
		System.out.println("== Strinbg 배열 myfriend 에 저장되어진 데이터 출력 ===");
		
		for(int i = 0; i<myfriend.length; i++) {
			String comma = (i < myfriend.length-1)?" ,":"";
			System.out.print(myfriend[i]+ comma);
		}
		
		System.out.println("\n===========================\n");
		
		System.out.println("\n");
		 char ch1 = "대한민국".charAt(2); //
		 System.out.println(ch1);
		 
		for(int i = 0; i<myfriend.length; i++) {
			String comma = (i < myfriend.length-1)?" ,":"";
			char ch2 = myfriend[i].charAt(0); 
			System.out.print(ch2 +  comma);
		}
		
		System.out.println("\n");
		
		//김씨만 출력
		for(int i=0; i<myfriend.length; i++) {
			if(myfriend[i].charAt(0) == '김') 
				System.out.println(myfriend[i]);
		}
		System.out.println("\n===========================\n");
		// 찾고자하는 성씨 출력하기
		obj.searchFristName(myfriend, '김');
		System.out.println("");
		obj.searchFristName(myfriend, '이');
		System.out.println("");
		obj.searchFristName(myfriend, '최');
		System.out.println("");
		
		// 찾고자하는 마지막 글자에 해당하는 이름 출력하기
		obj.searchLastName(myfriend, '니');
		System.out.println("");
		// == 이름중에  '김'자들어있는 사람 출력하기
		obj.searchName(myfriend,'김');
		obj.searchName(myfriend,'강');
		String aa = "1q2w3e4r";
		
		
		
		
		
	}// end of main()------------------------------------

} // end of class ArrayTest2//////////////////////////////
