package my.day20.sub1;

public class Sleep2 implements Runnable {

	private String name;
	private int point;
	private String grade;
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		
		if(point < 0) {
			this.point = 0;
		}else {
			this.point = point;	
		}
		
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		if(point>100) {
			grade = "열매";
		}else if(point >= 70) {
			grade = "잎새";
		}else if(point >= 30 ) {
			grade = "가지";
		}else if (point >= 0) {
			grade = "뿌리";
		}
		
	}

	public Sleep2() {}
	
	public Sleep2(String name, int point) {
		
		this.name = name;
		if(point < 0) {
			this.point = 0;
		}else {
			this.point = point;	
		}
		
		if(point>100) {
			grade = "열매";
		}else if(point >= 70) {
			grade = "잎새";
		}else if(point >= 30 ) {
			grade = "가지";
		}else if (point >= 0) {
			grade = "뿌리";
		}
		
		this.grade = grade;
	}

	private void showInfo() {
		
		for(int i=0; i<5; i++) {
			if(i == 0) {
				System.out.println("===== *** Sleep1 *** ======");
			}
			
			System.out.println("환영합니다. " + name + "님~~~ 포인트 " + point + "점 등급 : " + grade );
		}
 	}// end of showInfo()------------------------------------------

	@Override
	public void run() {
		
		try {
			Thread.sleep(500); // 500밀리초(0.5초) 동안만 스레드가 block 하도록한다.
					
		} catch (InterruptedException e) {
			// 만약에 스레드가 시스템 내부적으로 sleep 하지 못하는 오류가 발생할때 생기는 Exception이다.
			e.printStackTrace();
			return; // run()메소드를 종료한다.
		}
		
		showInfo();
	}

}
