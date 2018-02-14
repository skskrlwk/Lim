package my.day19;

public class Employee {

	String deptno;		// 부서번호
	String sawoncode;	// 사원코드번호
	String name;		// 사원명
	String jik;			// 직급
	
	public Employee() {}
	
	public Employee(String deptno, String sawoncode, String name, String jik) {
		super();
		this.deptno = deptno;
		this.sawoncode = sawoncode;
		this.name = name;
		this.jik = jik;
	}
	
	@Override
	public String toString() {
		String result = "▷사원번호 : " + sawoncode + "\n" +
						"▷부서번호 : " + deptno + "\n" +
						"▷사원명 : " + name + "\n" +
						"▷직급 : " + jik + "\n";
		
		return result;
	}
	
}
