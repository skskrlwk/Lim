/*
  	=== HashSet
  	1. 출력시 저장된 순서가 유지되지 않는다.
  	2. 중복된 데이터를 저장할 수 없다.
  	      그러므로 Collection 내의 중복된 요소들을 저장하지 않고자 할떄 많이 사용된다.
  	
  	=== LinkedHashSet
  	1. 출력시 저장된 순서가 유지된다.
  	2. 중복된 데이터를 저장할 수 없다.
  	      그러므로 Collection 내의 중복된 요소들을 저장하지 않고자 할떄 많이 사용된다.
  	
 */

package my.day19;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Scanner;
import java.util.Set;

public class HashSetTestMain {

	public static void main(String[] args) {
		
		System.out.println("\n================HashSet=======================\n");
		
		// Member 클래스의 객체를 저장할 수 있는 HashSet 객체 memberSet 를 생성하시요
		Set<Member> memberSet = new HashSet<Member>();
		
		// Member 클래스의 객체 6개 생성 MemberList에 저장하세요.
		
		memberSet.add(new Member("youjs", "qwer", "유재석", 45, "서울시 강남구 역삼동"));
		memberSet.add(new Member("eom", "qwer", "엄정화", 40, "서울시 강동구 천호동"));
		memberSet.add(new Member("kanghd", "qwer", "강호동", 30, "경기도 군포시"));
		
		Member mem1 = new Member("lee", "qwer", "이순신", 25, "서울시 강서구 화곡동");
		Member mem2 = mem1;
		memberSet.add(mem1);
		memberSet.add(mem2);
		
		memberSet.add(new Member("kimth", "qwer", "김태희", 28, "경기도 수원시"));
		
		Iterator<Member> it = memberSet.iterator();
		
		while(it.hasNext()) { 
			Member member = it.next();
			System.out.println(member.showInfo());
		}
		
		System.out.println("\n============================\n");
		
		it = memberSet.iterator();
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print(">>> 삭제할 아이디 => ");
		String id = sc.nextLine();
		
		while(it.hasNext()) {
			Member member = it.next();
			if(member.getId().equals(id)) {
				memberSet.remove(member);
				break;
			}
				
				
		}
		System.out.println("\n ===== 삭제후 남은 데이터 정보확인 ====== \n");
		it = memberSet.iterator();
		
		while(it.hasNext()) {
			Member member = it.next();
			System.out.println(member.showInfo());
		}
		
		System.out.println("\n================LinkedHashSet=======================\n");
		
		
		Set<Member> memberSet2 = new LinkedHashSet<Member>();
		
		// Member 클래스의 객체 6개 생성 MemberList에 저장하세요.
		
		memberSet2.add(new Member("youjs", "qwer", "유재석", 45, "서울시 강남구 역삼동"));
		memberSet2.add(new Member("eom", "qwer", "엄정화", 40, "서울시 강동구 천호동"));
		memberSet2.add(new Member("kanghd", "qwer", "강호동", 30, "경기도 군포시"));
		
		Member mem3 = new Member("lee", "qwer", "이순신", 25, "서울시 강서구 화곡동");
		Member mem4 = mem3;
		memberSet2.add(mem3);
		memberSet2.add(mem4);
		
		memberSet.add(new Member("kimth", "qwer", "김태희", 28, "경기도 수원시"));
		
		Iterator<Member> it2 = memberSet2.iterator();
		
		while(it2.hasNext()) { 
			Member member = it2.next();
			System.out.println(member.showInfo());
		}
		
		System.out.println("\n============================\n");
		
		it = memberSet.iterator();
		
		System.out.print(">>> 삭제할 아이디 => ");
		id = sc.nextLine();
		
		while(it2.hasNext()) {
			Member member = it2.next();
			if(member.getId().equals(id)) {
				memberSet.remove(member);
				break;
			}
				
				
		}
		System.out.println("\n ===== 삭제후 남은 데이터 정보확인 ====== \n");
		it2 = memberSet.iterator();
		
		while(it2.hasNext()) {
			Member member = it2.next();
			System.out.println(member.showInfo());
		}
					
					
					
					
	}

}
