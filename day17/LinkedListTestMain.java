
/*
  	=== LinkedList ===
  	
  	1. 출력시 저장된 순서대로 나온다.
  	2. 중복된 데이터를 저장할 수 있다.
  	3. 데이터를 읽어오는 속도는 LinkedList 가 ArrayList 보다 상대적으로 느리다.
  	4. 순차적으로 데이터를 추가/삭제하는 경우에는 LinkedList 가 ArrayList 보다 상대적으로 느리다.
  	5. 일반적으로 데이터 추가/삭제는 데이터 중간마다 발생하므로 이러한 경우에는  LinkedList 가 ArrayList 보다 상대적으로 빠르다.
  	6. 결과값은 ArrayList 를 사용하든지 LinkedList 를 사용하든지 동일한 결과값을 가진다.
  	7. LinkedList 보다는 ArrayList를 사용하도록 하자.
  	
 */


package my.day19;


import java.util.LinkedList;
import java.util.List;

public class LinkedListTestMain {
	
	public static void main(String[] args) {
			
			// Member 클래스의 객체를 저장할 수 있는 ArrayList 객체 memberList 를 생성하시요
			List<Member> memberList = new LinkedList<Member>();
			
			// Member 클래스의 객체 6개 생성 MemberList에 저장하세요.
			
			memberList.add(new Member("youjs", "qwer", "유재석", 45, "서울시 강남구 역삼동"));
			memberList.add(new Member("eom", "qwer", "엄정화", 40, "서울시 강동구 천호동"));
			memberList.add(new Member("kanghd", "qwer", "강호동", 30, "경기도 군포시"));
			
			Member mem1 = new Member("lee", "qwer", "이순신", 25, "서울시 강서구 화곡동");
			Member mem2 = mem1;
			memberList.add(mem1);
			memberList.add(mem2);
			
			memberList.add(new Member("kimth", "qwer", "김태희", 28, "경기도 수원시"));
			// 김태희 객체를 맨 뒤에 추가함.
			for(int i=0; i<memberList.size(); i++) {
				System.out.println(memberList.get(i).showInfo());
			}
			
			
			memberList.add(new Member("kimys", "qwer", "김유신", 38, "서울시 강남구"));
			
			for(Member mem : memberList) {
				String info = mem.showInfo();
				System.out.println(info);
			}
			    System.out.println("\n ==== 객체를 특정 인덱스 위치에 추가하기 ====\n");
			
			// 인덱스 번호 1위치에 추가함
			memberList.add(1, new Member("seolh", "qwer", "설현", 22, "서울시 강북구"));
			for(Member mem : memberList) {
				String info = mem.showInfo();
				System.out.println(info);
			}
			
			System.out.println("\n ==== 객체를 특정 인덱스 위치에 있는 값이랑 교체하기 ====\n");
			// 인덱스 번호 1번에있던 기존 객체("설현")를 제거하고 그 위치에 새로운 객체가 들어감
			memberList.set(1, new Member("suji", "qwer", "수지", 22, "경기도 용인시 수지구"));
			for(Member mem : memberList) {
				String info = mem.showInfo();
				System.out.println(info);
			}
			
			System.out.println("\n ==== 특정 객체를 삭제하기 ====\n");
			// 인덱스 번호 1번에있던 기존 객체("설현")를 제거하고 그 위치에 새로운 객체가 들어감
			memberList.remove(1);
			for(Member mem : memberList) {
				String info = mem.showInfo();
				System.out.println(info);
			}
			
			System.out.println("------------------------------------------------------------");
				
			
			System.out.println("\n ==== 모든 객체를 삭제하기 ====\n");
			memberList.clear();
			for(Member mem : memberList) {
				String info = mem.showInfo();
				System.out.println(info);
			}
			
			
		}

}
