package my.day17;

public class MethodThrowsMain {

	public static void main(String[] args) {
		
		MethodThrows student = new MethodThrows();
		student.setHakbun("kh0001");
		student.setName("홍길동");
		try {
			student.setHakjum("ㅎㅇ");
		}catch (NumberFormatException e) {
			System.out.println(">>> 숫자로 되어진 문자열만 가능합니다.");
		}
		
		System.out.println("학번 : " + student.getHakbun());
		System.out.println("성명 : " + student.getName());
		System.out.println("학점 : " + student.getHakjum());

	}

}
