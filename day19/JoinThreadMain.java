/*
    ====== join() 메소드 ======
    
    -- 여러개의 스레드가 실행중인 멀티스레드 환경에서는 어떤 스레드가 먼저 실행되고 끝날지를 예측할 수 없다.
       오로지 JVM 스케줄러에 따라서 실행이 결정되기 때문이다.
       만약에 스레드의 실행순서를 정해주고 싶다라면 join() 메소드를 사용하면 된다.
    "A" 라는 어떤 스레드를 실행하고 이어서 "B" 라는 다른 스레드를 실행할 경우,
    "A" 스레드의 join() 메소드를 호출하게 되면, "A" 스레드가 종료하기 전까지 "B" 스레드는 block 되어진다.
       즉, "A" 스레드가 끝나야만 "B" 스레드가 실행되어진다. 

    join() 메소드는 해당 스레드가 작동할 경우 끝날때까지 기다려주고 끝난후에 다음 명령문을 실행한다. 
      만약에, "A" 라는 스레드를 start() 메소드로 작동시키고 join() 메소드가 없으면 
   "A" 스레드에서 개발자가 원하는 코딩의 결과값을 제대로 얻어오지 못할 수도 있다. 
      그 이유는 다음과 같다. 
      메인메소드(main스레드)에서 "A" 라는 이름의 스레드를 start() 메소드로 작동시킨다.
      그러면 "A" 스레드에서는 코딩된 값대로 계산에 들어갈 것이다. 
      그런데 "A" 스레드에서 미처 계산을 완료하기도 전에 메인메소드(main스레드)에서는 
      다음줄의 명령문을 실행해 버릴 수도 있기 때문이다. 
      뭔가 분리되어 움직이는 것 같다. 프로그램은 우리가 지시한 명령 즉 작업스케줄 대로 움직일 뿐이지만, 
      스레드를 사용하면 이처럼 동시다발적으로 일어나는듯한 현상(?)이 발생한다.   
   main스레드 따로 우리가 만든 "A" 스레드 따로 움직일수 있는데 이것을 제어해주는것이 join() 메소드이다 라고 생각하면 이해가 쉬울 것이다.

   >>> join( ) 메소드는 아래와 같이 세가지 타입이 있다.

	   void join( )           - 스레드가 종료할때까지(죽을때까지) 기다린다
	   void join(long millis) - 스레드를 1/1000초만큼 기다린다
	   void join(long millis, int nanos) - 스레드를 (1/1000)+(1/100000000)초만큼 기다린다

      지금은 프로그램이 짧으니까 join(long millis)메소드와 join(long millis, int nanos)메소드는 
      쓸일이 없겠지만 방대한 프로그램일 경우 기다리는 시간까지 제어가 가능하다. 
      뭔가 하라고 지시를 했는데 시간내에 지시사항을 완료하지 못할 경우 다음사항을 진행하게 만드는 기능으로 써먹을수 있다. 
      이런 기능이 없다면 평생 기다리는 일이 생길지도 모르니까 말이다.
*/

package my.day20.sub1;

public class JoinThreadMain {

	public static void main(String[] args) {
		
		Join1 join1 = new Join1();
		join1.setId("leess");
		join1.setPasswd("qwer1234");
		
		Join2 join2 = new Join2();
		join2.setName("이순신");
		join2.setEmail("leess@naver.com");
		
		Join3 join3 = new Join3();
		join3.setTel("010-234-5678");
		join3.setAddr("서울시 종로구 대일빌딩");
		
		Thread thr1 = new Thread(join1); 
		Thread thr2 = new Thread(join2);
		Thread thr3 = new Thread(join3);
		// 결과값 순서가 항상 다름
		

		
		try {
			
			thr2.start();
			thr2.join(1000); // thr2 스레드가 join() 메소드를 호출했음으로
						// thr2 스레드가 종료될때 까지 현재 실행중인 다른 스레드는 block 된다.
			thr1.start();
			thr1.join(1000);	
			
			thr3.start();
			thr3.join(1000);
			
		}catch (InterruptedException e) { // 만약 스레드가 시스템 내부적으로 join 하지 못하는 오류가 발생할경우 일어나는 익셉션이다.
			e.printStackTrace();
		}
		

		
	}

}
