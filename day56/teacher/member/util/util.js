
// ** 주민번호가 공식에 맞는지 검사해서 맞으면 1, 틀리면 0 을 리턴해주는 함수생성 ** //
function funChkJumin(jubun) {
	// 9203271234567
	
	if(jubun.length != 13) {
		return 0;
	}
	
	// 9*2 + 2*3 + 0*4 + 3*5 + 2*6 + 7*7 + 1*8 + 2*9 + 3*2 + 4*3 + 5*4 + 6*5
	var sum = 0; // 누적용
	
	for(var i=1; i<jubun.length; i++) {
		// 9203271234567
		if(i<=8) {
			sum += parseInt(jubun.substring((i-1), i)) * (i+1);
		/*
			   문자열.substring(시작인덱스, 종료인덱스);
			   문자열 인덱스는 0 부터 시작함.
			   시작인덱스 부터 시작하여 종료인덱스 바로 앞 인덱스까지만 추출함. 
			   
			  parseInt(문자열) ==> 문자열 값을 정수로 변환.   
		*/
		}
		else {
			sum += parseInt(jubun.substring((i-1), i)) * (i-7); 
		}
			
	}// end of for ------------------- 12번 반복
	
	var result = sum%11;  // sum 을 11로 나눈 나머지
	result = 11 - result;
	result %= 10;         // result = result % 10; 와 같은 말이다.
	
	if(result == parseInt(jubun.substring(12,13)) )
		return 1;
	else
		return 0;
	
}

/////////////////////////////////////////////////////////////

// ** 금액에서 세자리마다 콤마를 제거해서 숫자로 리턴해주는 함수 생성하기 ** //
function delComma(str) {
	         // 1,234,567,890    length => 13  
	      /*
	          str.substring(0, 첫번째 콤마가 나오는 인덱스위치);
	          str.substring(0, 1);  ==>  "1"  
	          str.substring(1+1, 13); ==> "234,567,890"
	          "1" + "234,567,890" ==> "1234,567,890" <== str  length ==> 12 
	          
	          str.substring(0, 첫번째 콤마가 나오는 인덱스위치);
	          str.substring(0, 4); ==> "1234" 
	          str.substring(4+1, 12); ==> "567,890"
	          "1234" + "567,890"  ==> "1234567,890"  <== str  length ==> 11
	          
	          str.substring(0, 첫번째 콤마가 나오는 인덱스위치);
	          str.substring(0, 7); ==> "1234567" 
	          str.substring(7+1, 11); ==> "890"      
	          "1234567" + "890"   ==> "1234567890"  <== str  length ==> 10
	          
	                   첫번째 콤마가 나오는 인덱스위치가 없으면 종료!!
	       */
	var money = 0;
	
	while(true) {
		
		var index = str.indexOf(",");
		// 문자열 str 에서 최초로 "," 가 나오는 인덱스 위치값을 알려준다.
		// 만약에 "," 가 없으면 -1 을 리턴시켜준다.
		/*
		    문자열개체.indexOf("검색될부분문자열", 검색을시작할시작인덱스값);
		    --> 검색을시작할시작인덱스값을 생략하면 문자열의 처음부터 검색을 시작한다.
		    ==> 반환값은 문자열개체 안에서 검색될부분문자열이 처음 나오는 문자 위치 시작점을 반환한다. 
		              검색될부분문자열이 없을 경우 -1 을 반환한다.   
		 */
		
		// 제거해야할 콤마가 더이상 없으면 while 을 빠져나간다.
		if(index == -1) {
			money = parseInt(str);
			break;
		}
		
		var len = str.length;
		// 문자열 str의 길이를 구한다.
		
		str = str.substring(0, index) + str.substring(index+1, len);
		
	}// end of while-------------------
	
	return money;
 // return 1234567890;
}


/////////////////////////////////////////////////////////////////

// ** 숫자로만 되어진 금액을 세자리마다 콤마를 추가해서 리턴해주는 함수 생성하기 ** //
function addComma(num) {
	          // 1234567890 
	
	// 입력받은 숫자를 문자열로 변환시킨다.
	var str = String(num);
	var len = str.length;
	var result = "";
	
	if(len <= 3) {
		// 3자리 이하인 경우
		result = str;
	}
	else {
		// 3자리 보다 큰 경우
		// "1234567890"   ==> len : 10
		for(var i=len-1, cnt=1; i>=0; i--, cnt++) {
			result = str.substring(i,i+1) + result; // "0"
			                                        // "9"+"0"
			                                        // ","+"8"+"9"+"0"
			                                        // "7"+","+"8"+"9"+"0"
			if(cnt%3==0) {
				// 3의 배수가 되면 콤마를 더 붙여준다.
				result = "," + result;
			}
		}// end of for-------------------
		
		// 만약에 입력받은 num 이 123456 이라면 위에서 for문을 빠져나왔을때
		// result 의 값은 ,123,456 이 될것이다.
		// 맨앞에 , 가 있다라면 , 를 제거해서 return 시켜주면 된다.
		if(result.indexOf(",") == 0) {
			result = result.substring(1);
			// 첫번째 , 를 제거하고서 끝까지 가져온다.
		}
		
	}
	
	return result;
//	return "1,234,567,890";
} 











