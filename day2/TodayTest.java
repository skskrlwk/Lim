import java.util.*;
public class TodayTest
{
	public static void main(String[] args) 
	{
	
		 // --- ����ð� ��Ÿ���� --- //
		 Date now = new Date();
		 System.out.println("����ð� : " + now);

		 System.out.println("");

		 String today = String.format("%tF %tT" , now ,now);
		 System.out.println("����ð� : " + today);


		 /*
			<����>
			��¥ Ÿ�� fomat            ����
			----------------------------------------------------
			   %tF	     	��¥�� yyyy-mm-dd �������� �������ִ� ��
			   %tT          ��¥�� �ð��� HH:MM:SS �������� �������ִ� ��.
			   %tP          ����, ���ĸ� ���
			   %tA          ���ϸ� ���
			   %tY          4�ڸ� �⵵�� ���.
			   %tB          ���� �̸�(January,....)cnffur
			   %tm          ���� 01,02,03~11,12 �� ���
			   %td          �ϼ��� 1~31�� ���
			   %te          %td�� ������
			   %tk			�ð��� 0~23���� ���
			   %tl          �ð��� 1~12���� ���
			   %tM			���� 00~59���� ���
			   %tS			�ʸ� 00~59���� ���
			   %tZ			Ÿ������ ���
			   
		 */
	}
}
