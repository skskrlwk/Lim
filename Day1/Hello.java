// 1�� �ּ���

/*
   ������
   �ּ���
*/

/**
   ����ȭ �ּ�
   ==> javadoc �� �̿��Ͽ� API ������ ���鋚 ����Ѵ�.

*/

// ==== **** CLASS(Ŭ����)�� ���� *** =====

/*
	CLASS(Ŭ����)�� ��� ���ø����̼� ���۽� �ʿ��� ���赵�� �̶�� ��������.

	1. ��Ű�� ����
	   ==> ��Ű���� Ŭ������ ����Ǿ��� ���丮 ��ζ�� ���� �ȴ�.

	   package ��Ű����; ==> �̶� ��Ű������ �ݵ�� �ҹ��ڷ� �����ؾ� �Ѵ�.

	   ��> package my.com;
	2. import ��
	   
	   ��> import ��Ű����.Ŭ������;

		  import java.lang.String;
		  import java.lang.System;
		  improt java.lang.*;

	3. Ŭ���� ����

	4. �������ϱ�

	5. ����
*/
import java.util.*;

import java.lang.*;
//lang�� ���� �������� �ʾƵ� �̹� ���� �Ǿ��ִ�.

public class Hello
{
	public static void main(String[] args) 
	{
		System.out.println("Hello java");
		System.out.println("�ȳ��ϼ���? �ݰ����ϴ�.~~~~^^");
		//System.out �� �����(�ܼ�ȭ��)�� ���Ѵ�
		
		//���� ��¥�� ��Ÿ�����
		/* Date date = new Date();
		   System.out.println(date);
		*/

		System.out.print("Hi java");
		System.out.print("������ �սô�.");
		System.out.println("\n���� �ڹٸ� �����մϴ�.");
		// \n�� ���� �ٲ��� ���Ѵ�.



		System.out.println(new Date());
	}
}


