/*
 	==== *** Polymorphsim(다형성) *** ====
 	--> 자식클래스로 생성된 객체는 부모클래스의 타입으로 받을 수 있다. 이것을 다형성이라 한다.
 */


package my.day13;

import my.day13.sub.Man;
import my.day13.sub.Woman;

public class PolymorphsimMain {
	
	public static void main(String[] args) {
		
		Human[] hmArr = new Human[5];
		
		Human hm = new Human("인간",178.5F, 62);
		Man man = new Man("남자군", 180.F, 81, "2018-03-02");
		Woman woman = new Woman("여자양", 167.5F, 52, "2018-12-01");
		
		Human hmman = new Man("남운도", 189.1f, 71, "2018-05-05");
		Human hmwoan = new Woman("여수지", 157.5F, 48, "2018-11-30");
		
		hmArr[0] = hm;
		hmArr[1] = man;
		hmArr[2] = woman;
		hmArr[3] = hmman;
		hmArr[4] = hmwoan;
		
		
		for(int i=0; i<hmArr.length; i++) {
			if(hmArr[i] instanceof Man) {  // Human 배열속에 저장된 hmArr[i] 객체가 Man 클래스의 객체입니까?
				((Man)hmArr[i]).showInfo();
				System.out.println("");
			}
			else if(hmArr[i] instanceof Woman) {
				((Woman)hmArr[i]).showInfo();
				System.out.println("");
			}
			else {
				hmArr[i].showInfo();
				System.out.println("");
			}
		}// end of for------------------------------------------
		
	}

}
