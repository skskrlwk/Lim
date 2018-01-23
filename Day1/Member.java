public class Member
{
	String userid;
	String passwd;
	String name;
	int age;
	double height;

	public Member(){}

	public Member(String userid, String passwd, String name, int age, double height){
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
		this.height = height;
	
	}
	//메소드 정의
	public void infoPrint(){
	
		System.out.println("아이디 : " + userid + ", 패스워드 : " + passwd + ", 이름 : " + name + ", 나이 : " + age + ", 신장 : " + height);

	}

}  
