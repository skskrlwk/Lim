package my.day18;

import java.util.Iterator;

public class OuterMain {

	public static void main(String[] args) {
	
		// Outer 클래스의 인스턴스 변수 a를 출력
		Outer ot = new Outer();
		System.out.println("Outer클래스의 변수 a : " + ot.a);
		
		// Outer 클래스의 내부클래스의 인스턴스변수 c 출력과  innerMethod() 메소드를 호출 
		Outer.Inner otinner = ot.new Inner();
		System.out.println("Outer 클래스의 내부 클래스 Inner의 인스턴스변수 c : " + otinner.c);
		otinner.innerMethod();
		new Outer().new Inner().innerMethod();
		
		System.out.println("");
		// 또는
		Outer.Inner otinner2 = new Outer().new Inner();
		System.out.println("Outer 클래스의 내부 클래스 Inner의 인스턴스변수 c : " + otinner2.c);
		otinner2.innerMethod();
		new Outer().new Inner().innerMethod();
		
		System.out.println("----------------------------------------------");
		// Outer 클래스의 클래스 변수b를 출력
		// Outer 클래스의 내부클래스의 클래스변수 d 출력과 staticInner_instanceMethod()메소드와 staticInner_staticMethod() 메소드를 호출 
		System.out.println("Outer 클래스의 클래스변수 b : " + Outer.b);
		
		Outer.StaticInner staticinner = new Outer.StaticInner();
		System.out.println("Outer.StaticInner 클래스의 인스턴스 변수 d : " + staticinner.d);
		System.out.println("Outer.StaticInner 클래스의 클래스 변수 e : " + Outer.StaticInner.e );
		staticinner.staticInner_instanceMethod();
		new Outer.StaticInner().staticInner_instanceMethod();
		
		Outer.StaticInner.staticInner_staticMethod(); 
		
		System.out.println("--------------------------------------------------------");
		ot.test();

		
	}

}
