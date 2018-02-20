/*
  	 ==== Thread.sleep(밀리초) 메소드  ====
	  
	   스레드는 기본적으로 우선순위 방식으로 실행이 되기 때문에 ,
	   우선순위가 낮은 스레드는 만약에 최악의 경우 running 되지 못하고 항상 runnable 상태로 있을수도 있게 된다.
	   이런 상태를 기아,굶주림(starvation)상태라고 한다.
	   이러한 최악의 굶주림 상태를 방지하기 위해서 우선순위가 낮은 스레드에게도 실행될 수 있는 기회를 주어야 한다.
	   이런 경우 우선순위가 높은 스레드가 우선순위가 낮은 스레드에게 실행권을 주는 방법이
	   Thread.sleep(밀리초) 메소드를 사용하는 것이다.
	   인자값에 지정된 밀리초 시간 동안 실행중인 스레드는 block 이 되어지게 하는 것이다.
	   이 밀리초 시간동안 우선순위가 낮은 스레드가 실행하도록 하는 것이다.
	   그러므로 스레드로 작동할 클래스 생성시 run() 메소드 오버라이딩에서
	   sleep(밀리초)메소드는 일반적으로 항상 기입을 해주는 것을 원칙으로 한다.       
		
 */

package my.day20.sub1;

public class Sleep1 implements Runnable{
	
	private String name;
	private int age;

	public Sleep1() {}
	
	public Sleep1(String name, int age) {
		
		this.name = name;
		if(age < 0) {
			this.age = 1;
		}else {
			this.age = age;
		}
	}
	
	private void showInfo() {
	
		for(int i=0; i<5; i++) {
			if(i == 0) {
				System.out.println("===== *** Sleep1 *** ======");
			}
			
			System.out.println("안녕하세요? " + age + "세 " + name + "님~~~");
		}
	}// end of showInfo()------------------------------------------
	
	@Override
	public void run() {
		
		try {
			showInfo();
			Thread.sleep(500); // 500밀리초(0.5초) 동안만 스레드가 block 하도록한다.
			showInfo();
			
		} catch (InterruptedException e) {
			// 만약에 스레드가 시스템 내부적으로 sleep 하지 못하는 오류가 발생할때 생기는 Exception이다.
			e.printStackTrace();
			return; // run()메소드를 종료한다.
		}
		
	}
}
