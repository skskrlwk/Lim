
/*
 	1 2 3 4 5 6 7 8 9 ...... 45
 	
 	| 5 | 10 | 0
 	---- ---- ---- ---- ---- 
 	첫번째 공 : 5 
 	두번쨰 공 : 10
 	세번쨰 공 : 5
 	네번쨰 공 : 
 	다섯번쨰 공 : 
 	여섯번쨰 공 :  
 	
 	
 */

package my.day8;

import java.util.Random;

public class Lotto {

	public static void main(String[] args) {
		
		Random rnd = new Random();
		int[] ball = new int[45];
		int idx = 0;
		int[] temp = new int[5];
		String comma = "";
		
		for(int i=0;i < ball.length; i++){
			ball[i] = i+1; //초기치로 1번공 45번공 까지 준비
			
		}
		
		for(int i = 0; i < temp.length; i++) {
			temp[i] = -1;
			// 공을 꺼내어 오면 거내온 공의 방번호(idx 번호)를 담아두는 곳으로 사용
			// 꺼내온 공의 방번호(idx)가 0값이 들어올수 있으므로
			// 초기치는 방번호(idx 번호)로 사용하지 않는 -1로 모두(5개) 초기화함.
		}
		outer:
		for(int i=0; i<6; i++) { // 공을 꺼내는 작업을 6번 박복
		  //int rndnum = rnd.netInt(max - min +1) + min;
			idx = rnd.nextInt(45);
			//0 ~ 44 까지의 난수를 발생
			for(int j=0; j<temp.length; j++) {
				if(temp[j] == idx) { // 이미 뽑은 방번호를 또 뽑았다면 다시한번 방번호를 뽑을 기회를 부여한다.
					i--;			
					continue outer;
				}
			}// end of 내부 for---------------------------
			comma = (i<5)?", ":"\n";
			System.out.print(ball[idx] + comma);
			if(i<5) //출력이기 때문에 담아줄필요가 없다.
				temp[i] = idx;
			
		}// end of 외부 for ---------------------------
		System.out.println("1등 로또 당첨번호 입니다.");

		
		
		
	}//end of main()---------------------------

}//end of class Lotto//////////////////////////
