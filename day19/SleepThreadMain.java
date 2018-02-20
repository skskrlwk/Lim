package my.day20.sub1;

public class SleepThreadMain {

	public static void main(String[] args) {
	
		Sleep1 sleep1 = new Sleep1("이순신", 25);
		Thread thr1 =new Thread(sleep1);
		
		Sleep2 sleep2 = new Sleep2("엄정화",88);
		Thread thr2 = new Thread(sleep2);
	
		System.out.println("스레드 thr1 의 우선순위  : "+ thr1.getPriority());
		System.out.println("스레드 thr2 의 우선순위  :" + thr2.getPriority());
		
		thr1.setPriority(7);
		thr2.setPriority(3);
		
		System.out.println("\n");
		thr1.start();
		thr2.start();
		
		
		
		
	}
	

}
