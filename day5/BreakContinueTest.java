package my.day6;

public class BreakContinueTest {

	public static void main(String[] args) {
		
		System.out.println("==1. ===============================");
		for(int i=0; i<4; i++) {
			if(i==2)
				break;// 가장 가까운 반복문을 벗어난다.
			System.out.println("i="+i);
					
			
		}
		System.out.println("==2. ===============================");
		for(int i=0; i<3; i++) {
			for(int j=0; j<4; j++) {
				if(j==2)
					break;
				System.out.print("["+i+","+j+"]");
			}
			System.out.println("");
		}
		
		System.out.println("==3. ===============================");
		/*
		  레이블(label)명을 outer 라고 하겠습니다.
		  레이블명 뒤에 : 을 붙이며 반드시 반복문 앞에 써야 합니다.
		 */
		outer://레이블명			
		for(int i=0; i<3; i++) {
			for(int j=0; j<4; j++) {
				if(j==2)
					break outer; //break 레이블명; 을 하면 레이블명이 붙은 반복문을 나간다.
				System.out.print("["+i+","+j+"]");
			}
			System.out.println("");
		}
		System.out.println("잘가라~~~~");
		
		System.out.println("==4. ===============================");
		
		String str ="";
		for(int i=0;i<10;i++) {
			if(i%2 != 0)// 홀수라면
				continue;
			str = (i<10)?",":"";//아래의 명졍줄로 내려가지 말고 반복문의 증감식으로 올라간다.
			System.out.print(i+str);
		}
		System.out.println("\n\n");
		
		//1부터 10까지의 누적의 합을 구하세요
		int sum = 0;
		for(int i=0; i<10; i++) {
			sum += (i+1);
		}
		System.out.println("1부터 10까지의 누적의 합은 = "+sum);
		
		sum = 0;
		for(int i=0; i<10; i++) {
			if((i+1)==5 || (i+1)==7)
				continue; 
			sum += (i+1);
		}
		System.out.println("5와 7을 뺀 10까지의 합 = "+sum);
		
		System.out.println("------------------------");
		/*
		   301호 		302호 	303호	305호
		   201호		202호	203호	205호
		   101호		102호	103호	105호	
		 */
		for(int i=3; i>0; i--) {
			for(int j=0; j<5; j++) {
				if((j+1) == 4)
					continue;
				String tab = ((j+1)==5)?"\n":"\t";
				System.out.print(i+"0"+(j+1)+"호"+tab);
			}
		}
		
		System.out.println("\n\n");
		/*
		   501호 		502호 	503호	505호
		   301호		302호	303호	305호
		   201호		202호	203호	205호
		   101호		102호	103호	105호	
		 */
		outer:
		for(int i=5; i>0; i--) {
			for(int j=0; j<5; j++) {
				if(i == 4)
					continue outer;
				if((j+1) == 4)
					continue;
				System.out.print(i+"0"+(j+1)+"호\t");
			}
			System.out.println("");
		}
		System.out.println("\n\n");
		
		for(int i=5; i>0; i--) {
			if(i == 4)
				continue;
			for(int j=0; j<5; j++) {
				if((j+1) == 4)
					continue;
				System.out.print(i+"0"+(j+1)+"호\t");
			}
			System.out.println("");
		}
		
		
		
		
	}//end of main()--------------------------

}//end of class BreakContinueTest////////////////////////////////////
