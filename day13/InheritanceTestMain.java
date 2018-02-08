package my.day13;

import my.day13.sub.Man;
import my.day13.sub.Woman;

public class InheritanceTestMain {

	public static void main(String[] args) {
		
		Man man = new Man();
		man.name = "이순신";
		man.height = 178.9F;
		man.setWeight(75);
		man.goarmyday = "2013-01-02";
		
		Woman woman = new Woman();
		woman.name = "박보영";
		woman.height = 165.7F;
		woman.setWeight(-1);
		woman.childbirthday = "2018-11-22";
		
		man.showInfo();
		man.printGoarmyday();
		System.out.println("--------------------------------");
		
		System.out.println("man => " + man);
		 //my.day13.sub.Man@70dea4e
		/*	1.성명 : 이순신
		>> 2.신장 : 178.9cm
		>> 3.체중 : 75kg
		>> 4.입대일자 : 2013-01-02*/
		System.out.println("woan => " + woman);
		
		System.out.println("\n======================================\n");
		/*
		man.smile(3); // 사람이 3번 웃습니다.
		woman.smile(2); // 사람이 2번 웃습니다
		*/
		man.smile(3); // 남자가 3번 웃습니다.
					  // 하하하 하하하 하하하
		woman.smile(2); // 사람이 2번 웃습니다

		System.out.println("\n======================================\n");
		
		Man man2 = new Man("슈퍼맨" ,198.5F, 97, "2018-05-01");
		System.out.println("man2 => " + man2);
		
		Woman woman2 = new Woman("원더우먼",  175.7F, 56,"2018-12-01");
		woman2.printInfo();
		
	}

}
