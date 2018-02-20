/*
 	     ==== *** 스레드의 5가지 상태 *** ====
    1) new 
       	스레드 객체를 생성한 상태를 의미한다.
    	Thread 클래스를 상속받은 클래스나, Runnable 인터페이스를 구현현 클래스를 new 한 상태(객체생성)를 말한다.
    
    2) runnable
       	생성된 스레드에 start()메소드를 호출한 상태이다.
       	이것은 스레드가 실제로 실행된것은 아니며 단지 실행되기 위해 준비단계에 들어간 상태를 말한다.
           
    3) running
    	runnable 상태의 스레드를 JVM의 스케줄러에 의해서 running 상태로 이동하여
       	실제로 스레드가 동작하는 상태를 말하는 것으로 run()메소드가 실행되고 있는 상태이다.
     
    4) block
       running 되고 있던 스레드가 run() 메소드를 모두 끝마치지 못하고 중간에 중지되어 있는 상태이다.
       	스레드가 block 되어지는 시기는 입출력이나 인터럽트 요청이 발생되면 스레드는 자동적으로 block 되어진다.
       	왜냐하면 입출력 작업이 다른 어떤 작업보다 먼저 수행되어야 할 작업이기에 
       	먼저 실행중인 다른 스레드를 block 시키고 입출력 작업을 먼저 해주기 때문이다.
       	또한 개발자가 프로그래밍 소스에서 sleep(), yield(), join() 메소드를 요청하도록 해두면
       	스레드는 block 되어진다.
       
    5) dead
       running 되고 있던 스레드가 run()메소드를 모두 처리하여 스레드가 제거된 상태를 말한다.
       
  
  	 === *** Main 스레드 *** ===
  	 시작점(String point) 역할을 담당하는 main 메소드를 실행시키는 것도 스레드가 담당한다.
  	 스레드는 우선순이 (priority)를  가지며 1 부터 10 까지를 가진다.
  	 우선순위(priority)의 숫자 값이 클수록 running 될 수 있는 가능성이 높아진다.
  	 
  	
  	 
 */
package my.day20.sub1;

public class MainThread {

	public static void main(String[] args) {
		
		Thread thr = Thread.currentThread(); //현재 실행중인 스레드 객체를 얻어온다.
		System.out.println("현재 실행중인 스레드명 : " + thr.getName());// 스레드의 이름을 얻어온다.
		//현재 실행중인 스레드명 : main
		
		// 스레디의 우선순위를 얻어온다.
		System.out.println("현재 실행중인 스레드의 우선순위 : " + thr.getPriority());
		// 현재 실행중인 스레드의 우선순위 : 5
		
		System.out.println("스레드가 가질 수 있는 우선순위 최대값 : " + Thread.MAX_PRIORITY); // 10
		System.out.println("스레드가 가질 수 있는 우선순위 최대값 : " + Thread.MIN_PRIORITY); // 1
		System.out.println("스레드가 가질 수 있는 우선순위 기본값 : " + Thread.NORM_PRIORITY); // 5

	}

}
