package my.day7;

public class WhileTest {

/*
 	=== while 문 형식 ===
 	변수의 초기화;
 	
 	while(조건식) {
 		조건식이 참(ture)이라면 반복해서 실행할 명령문 계속해서 실행하고,;
 		조건식이 거짓(false)이라면 {} 이부분을 빠져나간다.
 		
 		반복해서 실행할 명령문;
 		증감식;
 	
 	}
 */
	
	public static void main(String[] args) {
		
		int i = 0;
		while(i<5) {
			System.out.println((i+1)+". 안녕자바~~");
			i++;
		}
		
		System.out.println("");
		
		i=0;
		while(i++ < 5) { //비교를 한후 증가
			
			System.out.println(i +". Hello Java~~");
		}
		
		System.out.println("");
		
		System.out.println("\n === 3단 === ");
		i= 1;
		while(i<10) {
			System.out.println("3 * "+ i + " = " +3*i);
			i++;
		}
		
		System.out.println("");
		
		i = 0;
		while(i++<9) {
			System.out.println("3 * "+ i + " = " +3*i);
			
		}
		
		System.out.println();
		
		//3단 짝수의 곱만 출력
		i = 0;
		while(i++ < 9) {
			if(i%2 != 0)
				continue;
			else
				System.out.println("3 * "+ i + " = " +3*i);
			
		}
		
		System.out.println("");
		System.out.println("\n ==== 3단(6부터는 제외) =====");
		i = 0;
		while(i++ < 9) {
			if(i==6)
				break;
			System.out.println("3 * "+ i + " = " +3*i);
			
		}
		System.out.println("=======구구단=======");
		int row=1,col=2;
		while(row < 10) {
			while(col < 10) {
				String tab = (col==9)?"\n":"\t";
				System.out.print(col + "*" + row + "=" + (col*row) + tab );
				col++;
			}// end of 내부 while-----------------------
			col=2;
			row++;
		}// end of 외부 while-------------------------
			
		
		System.out.println("\n ==========구구단(3단과 7단은 제외)================");
		
		row=1;
		col=2;
		while(row < 10) {
			while(col < 10) {
				if(col==3 || col==7) {
					col++;
				}else {
					String tab = (col==9)?"\n":"\t";
					System.out.print(col + "*" + row + "=" + (col*row) + tab );
					col++;
				}
			}// end of 내부 while-----------------------
			col=2;
			row++;
		}// end of 외부 while-------------------------
		
		System.out.println("");
		
		/*
		 	501호	502호	503호	505호
		 	301호	302호	303호	305호
		 	201호	202호	203호	205호
		 	101호	102호	103호	105호
		 */
		int floor=5, no=1;
		while(!(floor<1)) { //floor <1 일떄 빠져나간다, while(!(조건식)) --> 조건식일떄 빠져나간다.
			while(!(no>5)) { //
				String tab = (no==5)?"\n":"\t";
				
				if(floor != 4 && no != 4)
					System.out.print(floor+"0"+no+"호"+tab);
				no++;
			}
			no = 1;
			floor--;
		}
		
		/*floor = 5;
		no = 1;
		while(floor > 0) {
			if(floor != 4) {
				while(no < 6) {
					if(no != 4) {
						String tab = (no==5)?"\n":"\t";
						System.out.print(floor+"0"+no+"호"+tab);
						no++;
						}
					else
						no++;
				}
			}// end of 내부while---------------------------
			no=1;
			floor--;
		}// end of 외부while--------------------------------
*/		
	}// end of main()-----------------------------------

}// end of class WhileTest /////////////////////
