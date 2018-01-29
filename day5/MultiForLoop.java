package my.day6;

public class MultiForLoop {

	public static void main(String[] args) {
		
		for(int i=0; i<20; i++) {
			System.out.print((i+1)+ " ");
		}
		System.out.println("\n");
		String str = "";
		
		for(int i=0; i<20; i++) {
			str = ((i+1)%5 == 0)?"\n":" ";
			System.out.print((i+1)+str);
		}
		
		System.out.println("\n");
		
		for(int i=0; i<4; i++) {	//행
			for(int j=0; j<5; j++) {	//열
				System.out.print("*");
			}
			System.out.println("");
		}
		
		for(int i=0; i<12; i++) {
			str = ((i+1)%3 == 0?"\n":"");
			System.out.print("#" + str);
		}
		
		/*for(int i=0; i<4; i++) {			
			for(int j=0; j<3; j++) {	
				System.out.print("#");
			}
			System.out.println("");
		}*/
	
		System.out.println("");
		
		int n = 0;
		for(int i=0; i<4; i++) {
			for(int j=0; j<5; j++) {
				System.out.print(++n + " ");
			}
			System.out.println("");
		}
		
		/*for(int i=0; i<4; i++) {
			for(int j=0; j<5; j++) {
				System.out.print(((i*5)+j+1)+" ");
			}
			System.out.println("");
		}*/
		System.out.println("");
		
		for(int i=0; i<4; i++) {
			for(int j=0; j<5; j++) {
				System.out.print(n-- + " ");
			}
			System.out.println("");
		}
		
		System.out.println("");
		int a = 1;
		for(int i=0; i<3; i++) {
			for(int j=0; j<5; j++,a+=2) {
				System.out.print(a+" ");
			}
			System.out.println("");
		
		}
		System.out.println("");
		
		/*for(int i=0,m=1; i<15;i++, m+=2) { 
			str = ((i+1)%5 == 0?"\n":" ");
			System.out.print(m+str);
		}*/
	}
	
}
