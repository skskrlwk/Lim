package my.day19;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class EmployeeMain {

	public static void main(String[] args) {
		
		// 검색어 : 부서번호
		// 예> 조회할 부서번호 : 10 
		// 	   10번 부서에  근무하는 사원들만 출력
		
		HashMap<String, List<Employee>> map = new HashMap<String, List<Employee>>();
		 
		List<Employee> list_10 = new ArrayList<Employee>();
		list_10.add(new Employee("10", "kh0001", "한석규", "부장"));
		list_10.add(new Employee("10", "kh0002", "두석규", "과장"));
		list_10.add(new Employee("10", "kh0003", "세석규", "대리"));
		
		List<Employee> list_20 = new ArrayList<Employee>();
		list_20.add(new Employee("20", "kh0004", "일지매", "부장"));
		list_20.add(new Employee("20", "kh0005", "이지매", "과장"));
		list_20.add(new Employee("20", "kh0006", "삼지매", "대리"));
		
		List<Employee> list_30 = new ArrayList<Employee>();
		list_30.add(new Employee("30", "kh0007", "일미자", "부장"));
		list_30.add(new Employee("30", "kh0008", "이미자", "과장"));
		list_30.add(new Employee("30", "kh0009", "삼미자", "대리"));
		
		map.put("10", list_10);
		map.put("20", list_20);
		map.put("30", list_30);
		
		Scanner sc = new Scanner(System.in);
		System.out.print(">>> 조회할 부서번호 : ");
		String deptno = sc.next();
		List<Employee> empList = map.get(deptno);
		
		if(empList != null) {
			for(Employee emp : empList) {
				System.out.println("▷사원번호 : " + emp.sawoncode + ", 사원명 : " + emp.name);
			}
			System.out.println("----------------------------");
			System.out.print(">>> 조회할 사원번호 ");
			String sawoncode = sc.next();
			int flag = 0;
			for(int i=0; i<empList.size(); i++) {
				if(empList.get(i).sawoncode.equals(sawoncode)) {
					flag = 1;
					System.out.println(empList.get(i));
					break;
				}
			}
			if(flag == 0)
				System.out.println(">>> 조회하시려는 사원번호 " + sawoncode + "은 존재하지 않습니다.");
		}else {
			System.out.println(">>> 조회하시려는 부서번호 " + deptno + "는 존재하지 않습니다.");
			
			
		}
			
		
		
		
		

	}

}
