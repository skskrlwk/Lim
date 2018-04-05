
//// *** 주민번호가 공식에 맞는지 검사해서 맞으면1, 틀리면 0 을 리턴 *** ////
function funChkJumin(jubun) {
	// 9203271234567
	
	if(jubun.length != 13){
		return 0;
	}
	
	// 9*2 + 2*3 + 0*4 + 3*5 + 2*6 + 7*7 + 1*8 + 2*9 + 3*2 + 4*3 + 5*4 + 6*5
	var sum = 0; // 누적용
	
	for(var i=1; i<jubun.length; i++){
		// 923271234567
		if(i<=8){
			sum += parseInt(jubun.substring((i-1), i)) * (i+1); 
		
		}else{
			sum += parseInt(jubun.substring((i-1), i)) * (i-7); 
		}
	}
	
	var result = sum % 11; // sum 을 11로 나눈 나머지
	result = 11 - result;
	result %= 10; 
	
	if(result == parseInt( jubun.substring(12,13)) )
		return 1;
	else
		return 0;
	
		
}// 

////////////////////////////////////////////////
// ** 금액에 세자리마다 콤마를 제거해서 숫자로 리턴해주는 함수 생성하기** //
function delComma(str) {
	var money = 0;
	/*
	 	1,234,567,890
	  	str.substring(0, 콤마가 나오는 인덱스위치);
	  	str.substring(0,1); ==> "1"
	  	str.substring(1+1, 13); ==> "234,567,890"
	  	"1" + "234,567,890" ==> "1234,567,890"
	  	
	  	str.substring(0, 콤마가 나오는 인덱스위치);
	  	str.substring(0,4); ==> "1234"
	  	str.substring(4+1, 12); ==> "567,890"
	  	"1234" + "234,567,890" ==> "1234567,890"
	  	
	  	str.substring(0, 콤마가 나오는 인덱스위치);
	  	str.substring(0,7); ==> "1234567"
	  	str.substring(7+1, 12); ==> "890"
	  	"1234567" + "890" ==> "1234567890"
	  	
	  	첫번째 콤마가 나오는 인덱스위치가 없으면 종료!!
	  	
	 */
	while(true){
		
		var index = str.indexOf(","); 
		/*
		문자열개체.indexOf("검색될부분문자열", 검색을 시작할 인덱스값);
		--> 검색을 시작할 인덱스값을 생략하면 문자열의 처음부터 검색을 시작한다.
		
		 문자열 str에서 최초로  "," 가 나오는 인덱스 위치값을 알려준다.
		 만약에 ","가 없으면 -1을 리턴시켜준다
		*/
		
		var len = str.length; // 문자열 길이를 구한다.
	
		// 제거해야할 콤마가 더이상 없으면 while을 빠져나간다.
		if(index == -1){
			money = parseInt(str);
			break;
		}
		
		str = str.substring(0, index) + str.substring(index+1, len);
		
	}// end of while--------------------------
	
	
	
	return money;
}

// ** 숫자로만 되어진 금액을 세자리마다 콤마를 추가해서 리턴해주는 함수 생성하기 ** 

function addComma(num){
	
	var str = String(num);
	var len = str.length;
	var result ="";
	
	if(len <= 3){
		// 3자리 이하인경우
		result = str;
	}else{
		// 3자리 보다 큰 경우
		
		for(var i=len-1, cnt=1; i>=0; i--,cnt++){
			result = str.substring(i, i+1) + result;
			
			if(cnt%3 == 0) {
				// 3의 배수가 되면 콤마를 더 붙여준다.
				result = "," + result;
			}
			
		}// end of for-------------------
		
		// 만약에 입력받은 num 이 123456 이라면 for문을 빠져나왔을때
		// result 의값은 ,123,456 이 될것이다.
		// 맨앞에, 가 있다라면 ,를 제거해서 return 시켜주면 된다.
		if(result.indexOf(",") == 0) {
			// 첫번째, 를 제거하고서 끝까지 가져온다
			result = result.substring(1); 
		}
		
		
	}
	return result;
	
}


