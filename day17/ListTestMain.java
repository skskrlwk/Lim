/*
  	==== 배열(Array)과 Collection 의 차이점 ====
  	
    1. 배열(Array)은 오로지 동일한 데이터 타입만 들어가는 저장소이다.
              동일한 데이터 타입은 primitve 타입(int, double, char, ....) 및
       reference 타입(클래스타입, String, Wrapper 클래스, 사용자가 정의한 클래스)을 말한다.
              배열은 그 크기가 한번 정해지면 크기를 변경할 수 없다.
     
    2. Collection 은 오로지 객체만 저장되는 저장소이다.
       reference 타입(클래스타입, String, Wrapper 클래스, 사용자가 정의한 클래스)이 저장됨.
             객체이라면 저장이 되기 때문에 동일하지 않은 타입이어도 된다.
       Collection 은 그 크기가 자동적으로 늘어난다. !!!!
       
*/


package my.day19;


import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

public class ListTestMain {

	
	
	public static void main(String[] args) {
		
		Vector vt = new Vector(5,3);
		// 초기용량 : 5
		// 증가치 : 3
		System.out.println("백터 vt의 용량 : " + vt.capacity());
		// 백터 vt의 용량 : 5
		System.out.println("백터 vt에 저장된 현재 크기 : " + vt.size());
		// 백터 vt에 저장된 현재 크기 : 0
		for(int i=0; i<5; i++) {
			vt.add(new Integer(i+1));
			// 백터에 요소(element) 넣기
		}
		
		System.out.println("백터 vt의 용량 : " + vt.capacity());
		// 백터 vt의 용량 : 5
		System.out.println("백터 vt에 저장된 현재 크기 : " + vt.size());
		// 백터 vt에 저장된 현재 크기 : 5
		vt.add(new Integer(6));
		
		System.out.println("백터 vt의 용량 : " + vt.capacity());
		// 백터 vt의 용량 : 8
		System.out.println("백터 vt에 저장된 현재 크기 : " + vt.size());
		// 백터 vt에 저장된 현재 크기 : 6
		
		vt.add(new Double(1.2345));
		vt.add(new String("안녕하세요?"));
		
		System.out.println("백터 vt의 용량 : " + vt.capacity());
		// 백터 vt의 용량 : 8
		System.out.println("백터 vt에 저장된 현재 크기 : " + vt.size());
		// 백터 vt에 저장된 현재 크기 : 8
		
		vt.add(new String("행복하세요"));		
		System.out.println("백터 vt의 용량 : " + vt.capacity());
		// 백터 vt의 용량 : 11
		System.out.println("백터 vt에 저장된 현재 크기 : " + vt.size());
		// 백터 vt에 저장된 현재 크기 : 9
		
		// *** === Vector에 저장된 요소 꺼내오기 === *** //
		// Object Vector 타입객체명.get(꺼내올 객체의 인덱스번호);
		Object obt = vt.get(5);
		Integer intVal = (Integer)obt;
		System.out.println("intVal = " + intVal);
		
		for(int i=0; i<vt.size(); i++) {
			Object obj= vt.get(i);
			if(obj instanceof Integer) {
				Integer ival = (Integer)obj;
				System.out.println("정수  : " + ival);
			}else if(obj instanceof Double) {
				double dval = (Double)obj;
				System.out.println("실수 : " + dval);
			}else if(obj instanceof String) {
				String sval = (String)obj;
				System.out.println("문자열 : " + sval);
			}
		}// end of for----------------------------------
		
		Vector myvt0 = new Vector();
		System.out.println("백터 myvt1 의 용량 : " + myvt0.capacity());
		// 백터 myvt0 의 용량 : 10
		System.out.println("백터 myvt1에 저장된 현재 크기 : " + myvt0.size());
		// 백터 myvt0에 저장된 현재 크기 : 0
		
		for(int i=0; i<11; i++) {
			myvt0.add(new Integer(i+1));
		}
		System.out.println("백터 myvt1 의 용량 : " + myvt0.capacity());
		// 백터 myvt0 의 용량 : 20
		System.out.println("백터 myvt1에 저장된 현재 크기 : " + myvt0.size());
		// 백터 myvt0에 저장된 현재 크기 : 11
		
		// ==== **** JDK 1.5 버전 이후 부터는 Generic 을 사용한다. *** ====
		
		Vector<Integer> myvt1 = new Vector<Integer>();
		Vector<Double> myvt2 = new Vector<Double>();
		Vector<String> myvt3 = new Vector<String>();
		
		for(int i=0; i<5; i++) {
		//	myvt1.add(new Integer(i+1));
		//  또는
			myvt1.add(i+1); // myvt1.add(int); 을하면 자동적으로 int를 new Integer로 봐꾸어 주는 것을 boxing이라고 부른다.
							// 이와같이 자동적으로 바꾸어주는 것을 auto boxing
		}
		
		
		for(int i=0; i<myvt1.size(); i++) {
			//Integer val = myvt1.get(i);
			//또는
			int val = myvt1.get(i); // 객체타입으로 되어진 데이터를 primitive타입으로 받아 올수 있게 해주는것을
								    // auto unboxing이라고 한다.
			System.out.println(val);
		}
		for(int i=0; i<myvt2.size(); i++) {
			//Double val = myvt2.get(i);
			//또는
			double val = myvt2.get(i); // 객체타입으로 되어진 데이터를 primitive타입으로 받아 올수 있게 해주는것을
									   //  auto unboxing이라고 한다.
			System.out.println(val);
		}
		for(String str : myvt3) {
			System.out.println(str);
		}
		System.out.println("\n\n");
		
		// ====*** ArrayList ***====
		
		ArrayList arrList = new ArrayList();
		
		for(int i=0; i<5; i++) {
			arrList.add(i+1);
		}
		
		for(int i=0; i<5; i++) {
			arrList.add(i+11.0);
		}
		
		for(int i=0; i<5; i++) {
			arrList.add("김길동"+(i+1));
		}
		for(int i=0; i<arrList.size(); i++) {
			Object object = arrList.get(i);
			if(object instanceof Integer) {
				int val = (Integer)object;
				System.out.println("정수 : " + val);
				
			}else if(object instanceof Double) {
				double val = (Double)object;
				System.out.println("실수 : " + val);
				
			}else if(object instanceof String) {
				String val = (String)object;
				System.out.println("문자열 : " + val);
			}
		}
		
		System.out.println("\n========================================");
	/*
		ArrayList arrlist1 = new ArrayList<Integer>();
		ArrayList arrlist2 = new ArrayList<Double>();
		ArrayList arrlist3 = new ArrayList<String>();
	*/
		//또는
		List<Integer> arrList1 = new ArrayList<Integer>();
		List<Double> arrList2 = new ArrayList<Double>();
		List<String> arrList3 = new ArrayList<String>();
		
		for(int i=0; i<5; i++) {
			arrList1.add(i+1);
		}
		
		for(int i=0; i<5; i++) {
			arrList2.add(i+11.0);
		}
		
		for(int i=0; i<5; i++) {
			arrList3.add("이순신"+(i+1));
		}
		
		for(int i=0; i<arrList1.size(); i++) {
			int val = arrList1.get(i);
			System.out.println(val);
		}
		
		for(Double db : arrList2) {
			System.out.println(db);
		}
		
		for(String st : arrList3) {
			System.out.println(st);
		}
		
		System.out.println("\n======================================");
		
		List<String> cityList = new ArrayList<String>(); //중복된값 허용
		cityList.add("seoul");
		cityList.add("BUSAN");
		cityList.add("Suwon");
		cityList.add("inCheOn");
		cityList.add("gunpo");
		cityList.add("Suwon");
		
		/*
		  	▷검색하실 도시명 : suwon
		  	>> 검색한 도시명 suwon 은 3번쨰로 저장되어 있습니다.
		  	>> 저장된 도시명은 Suwon 입니다. 
		  	
		  	▷검색하실 도시명 : bucheon
		  	>> 검색한 도시명 bucheon 은 업습니다.
		 */
		Scanner sc = new Scanner(System.in);
		System.out.print("▷검색하실 도시명 : "); // SuWon, sUWOn, suwon
		String city = sc.nextLine();
		
		String cityname = city.toLowerCase(); // 소문자로 변경
	//	city.toUpperCase(); // 대문자로 변경
		int flag = 0;
		
		for(int i=0; i<cityList.size(); i++) {
			String str = cityList.get(i).toLowerCase();
			if(str.equals(cityname)) {
				flag =1;
				System.out.println(">>>검색한 도시명 " + city + "은" + (i+1) +"번째 저장되어있습니다." );
				System.out.println(">>>저장된 도시명은 " + cityList.get(i) + "입니다");
									
			}
			
		}
		if(flag == 0)
		System.out.println(">>>검색한 도시명 " + city + "은" + "없습니다." );
		sc.close();
	}

}
