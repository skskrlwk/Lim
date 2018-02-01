package my.day8;

public class ArrayTest5 {
	
	
	
	public static void main(String[] args) {
		
		Student[] studentArr = {new Student("kh0001","한석규",91,92,93), 
								new Student("kh0002","두석규",81,82,83),
								new Student("kh0003","세석규",50,60,40), 
								new Student("kh0004","네석규",88,77,66),
								new Student("kh0005","오석규",20,40,30),
								new Student("kh0006","육석규",81,100,92)};
		
		Student.failStudent(studentArr);
		
		System.out.println("\n============================\n");
		
		Student[] afterStudentArr = Student.veryGoodStudent(studentArr);
		for(int i=0; i<afterStudentArr.length; i++) {
			System.out.println(afterStudentArr[i].getExecute());
		}
			
		
	}// end of main()-------------------------------

}// end of class ArrayTest5///////////////////////////////////
