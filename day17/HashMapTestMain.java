/*
 	==== Map 계열 ====
 	1. HashMap 과 Hashtable, Properties 이 있다.
 	2. Map 계열은 List 계열(Vector, ArrayList, LinkedList)처럼 index가 사용되어 저장되는 것이 아니라,
 	   Map 계열은 key값과 value값 쌍으로 사용되어 저장하는데 
 	      데이터 저장시 사용되는 메소드는 put(String key, Object value) 메소드를 사용한다.
 	      이때 key값은 반드시 고유한 값을 가져야 한고, value값은  중복된값이 들어와도 상관없다
 	3. Map 계열에 저장된 key값들은 순서와 관계없어 저장된다.
 	4. Map 계엘어 저장된 value 값을  꺼내오려면 key를 이용해서 가져오는데
 	   value값의 추출은 get(String key)
 	 '

 */

package my.day19;


import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class HashMapTestMain {

	public static void main(String[] args) {
		
		System.out.println("\n================HashSet=======================\n");
		
		// Member 클래스의 객체를 저장할 수 있는 HashMap 객체 memberMap 를 생성하시요
		Map<String, Member> map = new HashMap<String, Member>();
		
		// Member 클래스의 객체 6개 생성 MemberList에 저장하세요.
		
		map.put("youjs", new Member("youjs", "qwer", "유재석", 45, "서울시 강남구 역삼동"));
		map.put("eom", new Member("eom", "qwer", "엄정화", 40, "서울시 강동구 천호동"));
		map.put("kanghd",new Member("kanghd", "qwer", "강호동", 30, "경기도 군포시"));
		
		map.put("lee", new Member("lee", "qwer", "이순신", 25, "서울시 강서구 화곡동"));
		map.put("lee", new Member("lee", "qwer1234", "이동국", 35, "서울시 강북구 수유동"));
				
		map.put("kimth" ,new Member("kimth", "qwer", "김태희", 28, "경기도 수원시"));

		Scanner sc = new Scanner(System.in);
		System.out.println("검색할 ID명 : ");
		String id = sc.nextLine();
		
		Member mem = map.get(id);
		if(mem != null)
			System.out.println(mem.showInfo());
		else
			System.out.println("검색하신 ID명 " + id + "가 존재하지 않습니다.");
		
		
		System.out.println("====================================\n");
		
		/*
		  	=== map 에 저장된 모든 Member 들의 정보를 출력하기 ===
		  	map 에 저장된 모든 키값들을 알고 있으면 추출이 가능하다.
		  	map 에 저장된 모든 키값들을 출력해주는 메소드 keySet() 가 있다. 
		 */
		
		Set<String> keysets = map.keySet();
		for(String key: keysets) {
			Member mem1 = map.get(key);
			System.out.println(mem1.showInfo());
		}
		
		System.out.println("\n====== values() 메소드를 사용하여 map에 저장된 모든 value값 출력하기");
		Collection<Member> collect = map.values();
		/*
		  	HashMap객체명.values() 메소드는 
		  	HashMap객체명에  저장된 value 값만 뽑아주는 메소드이다.
		  	Collection 타입 단독으로는 사용이 불가하며,
		  	iterator() 메소드를 사용하여 Iterator 타입으로 변경해야만 사용가능하다.
		 */
		Iterator<Member> itMember = collect.iterator();
		while(itMember.hasNext()) {
			Member member = itMember.next();
			System.out.println(member.showInfo());
		}
		
		sc.close();
	}

}
