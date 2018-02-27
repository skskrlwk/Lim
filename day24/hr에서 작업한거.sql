insert into tbl_user(userid, passwd, name, addr)
values('dusk', 'qwer1234', '�μ���', '����� ������');

insert into tbl_user(userid, passwd, name, addr)
values('seck', 'qwer1234', '������', '����� ���ϱ�');

commit;
-- tbl_user ���̺� �����ϴ� ������ ���� �����ϱ�
update tbl_user set name = '�̼���', addr = '��⵵ ������';

select *
from tbl_user;

Rollback;

update tbl_user set name = '�̼���', addr = '��⵵ ������'
where userid = 'dusk';

commit;

-- tbl_user ���̺� �ִ� ��� ����� �����Ѵ�.
delete from tbl_user
where userid = 'dusk';

select *
from employees;

-- employees ���̺��� �� �μ���ȣ���� �����ϴ� ���� ID���� ����ϼ���
select department_id, job_id
from employees;

-- select �Ǿ��� ��������� ���� ������� �ߺ��Ǿ� ���´ٸ�
-- �ߺ��� ���� �����ϰ� 1���� ���̰� ������ distinct�� ����Ѵ�.
select distinct department_id, job_id
from employees;

-- select �Ǿ��� ������� ����(sort)�Ϸ��� order by ���� �̿��Ѵ�
select distinct department_id, job_id
from employees
order by department_id asc; -- �������� ����

select distinct department_id, job_id
from employees
order by department_id desc; -- �������� ����

select distinct department_id, job_id
from employees
order by department_id; -- �������� ����(asc �� ��������)

-- *** �񱳿����� *** --

/* employees ���̺��� �μ���ȣ�� 50���� �μ��� �ٹ��ϴ�
  ������� �μ���ȣ, �����ȣ, �����, ������ ��Ÿ������
*/
select department_id as "�μ���ȣ" , employee_id, first_name||' '||last_name as "�̸�" ,
      nvl(salary + (salary * commission_pct), salary) as "����"
from employees
where department_id = 50
order by "����" desc; -- ���� �÷��� �������� ����

select department_id as "�μ���ȣ" , employee_id, first_name||' '||last_name as "�̸�" ,
      nvl(salary + (salary * commission_pct), salary) as "����"
from employees
where department_id = 50
order by 4 desc; -- 4���� �ķ��� �������� ����

/*
  employees ���̺��� �μ���ȣ�� 50���� �ٹ��ϴ� ������� ������ ����鿡 ���ؼ�
  �μ���ȣ, �����ȣ, �����, ������ ��Ÿ������.
*/
select department_id as "�μ���ȣ" , employee_id, first_name||' '||last_name as "�̸�" ,
      nvl(salary + (salary * commission_pct), salary) as "����"
from employees
where department_id != 50 
order by 1;

select *
from employees
where department_id is null; -- null�� �������� �ʴ� ���̹Ƿ� �񱳴���� �ɼ��� ����.
                             -- department_id == null �δ� �񱳰� �ȵ�
                             -- �׷��� is�� ����ؾ��ϰ�, �񱳿����ڸ� ����Ϸ���
                             -- nvl()�Լ��� ���ؼ� �����ش�

select department_id,nvl(department_id, -99999), first_name, last_name
from employees;

desc employees; -- ��ȸ�ϰ����ϴ� ���� null���� Ȯ��

select department_id, first_name, last_name
from employees
where nvl(department_id, -9999) = -9999;

select department_id as "�μ���ȣ" , employee_id, first_name||' '||last_name as "�̸�" ,
      nvl(salary + (salary * commission_pct), salary) as "����"
from employees
where nvl(department_id, -9999) != 50  
order by 1;

select department_id as "�μ���ȣ" , employee_id, first_name||' '||last_name as "�̸�" ,
      nvl(salary + (salary * commission_pct), salary) as "����"
from employees
where nvl(department_id, -9999) <> 50 -- !=�̶� �����ǹ� 
order by 1;

select department_id as "�μ���ȣ" , employee_id, first_name||' '||last_name as "�̸�" ,
      nvl(salary + (salary * commission_pct), salary) as "����"
from employees
where nvl(department_id, -9999) ^= 50 -- !=�̶� �����ǹ� 
order by 1;


select department_id as "�μ���ȣ" , employee_id, first_name||' '||last_name as "�̸�" ,
      nvl(salary + (salary * commission_pct), salary) as "����"
from employees
where not nvl(department_id, -9999) = 50 
order by 1;

select *
from employees
where not department_id is null; -- department_id �� null���� �ƴ� ������ ����

select *
from employees
where department_id is not null; 

/*
  ����Ŭ�� ���̺� ����� �����Ͱ��� ���ؼ��� ��,�ҹ��ڸ� �����Ѵ�.
  ���ڿ� �Լ��߿� ��,�ҹ��ڸ� �������ִ� upper(),lower(),initcap() �� �ִ�.
  emplyees ���̺��� ��(first_name)�� 'John' �� �����
  �����ȣ, �����, �⺻�޿��� ������ �����ϼ���
*/

select employee_id, first_name || ' ' || last_name, salary
from employees
where first_name = 'John'; -- �����Ͱ��� ��ҹ��� ����


select first_name, upper(first_name), lower(first_name)
from employees;

select street_address, upper(street_address), lower(street_address),
        initcap(street_address) -- initcap() �ܾ �������� ù��° ���ڸ� �빮�� �������� �ҹ���   
from locations;

select 'seOUl cITy', upper('seOUl cITy'), lower('seOUl cITy'), initcap('seOUl cITy')
from dual;

select employee_id, first_name || ' ' || last_name, salary
from employees
where lower(first_name) = lower('jOhn');

-- employees ���̺��� �˻���� ������ 'jOHn sEo'�� �˻����� ���
-- �����ȣ, ��, �̸�, �⺻�޿��� ����ϼ���.

select Employee_Id, First_Name, Last_Name, Salary
from employees
where upper(first_name || ' ' || Last_Name) = upper('jOHn sEo');

-- *** or, and , not, in �����ڿ� ���ؼ� �˾ƺ���. *** --

/*
  employees ���̺��� �μ���ȣ�� 30, 60, 90�� �μ���
  �ٹ��ϴ� ����鿡 ���ؼ� �����ȣ, �����, ����(����*12), �μ���ȣ�� ���
*/
select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where Department_Id = 30 or Department_Id = 60 or Department_Id = 90;

select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where Department_Id in(30,60,90); -- Department_Id = 30 or Department_Id = 60 or Department_Id = 90; �� �������

/*
  employees ���̺��� �μ���ȣ�� 30, 60, 90�� �μ���
  �ٹ����� �ʴ� ����鿡 ���ؼ� �����ȣ, �����, ����(����*12), �μ���ȣ�� ���
*/
select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where nvl(department_id,-9999) != 30 and nvl(department_id,-9999) != 60 and nvl(department_id,-9999) != 90
order by 4;

select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where not nvl(Department_Id,-9999) in(30,60,90)
order by 4;

select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where nvl(Department_Id,-9999) not in(30,60,90)
order by 4;

/*
  employees ���̺��� �μ���ȣ�� 30, 60, 90�� �μ���
  �ٹ����� �ʴ� ����鿡 ���ؼ� �����ȣ, �����, ����(����*12), �μ���ȣ�� ������������ ��������
  ������ ������������ �����Ͽ� ���
*/

select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where nvl(department_id, -9999) not in (30,60,90)
order by 4, 3 desc;

-- *** and, or, not �������� �켱���� *** ---
-- and, or, not �����ڰ� ȥ��Ǿ����� �켱������ �����µ� not > and > or �� ���Ǹ� ���󰣴�.
-- �켱������ �־ �ֿ켱�� () �̴�.

/*
    employees ���̺��� �μ���ȣ�� 30, 50, 60�� �μ���
    �ٹ��ϴ� ������߿� ������ 20000 �̻� 60000 ������
    ����鸸 �����ȣ, �����, ����(����*12), �μ���ȣ�� ���
    �μ���ȣ���� �������� ������ �� ������ ������������ �����Ͽ� ����ϼ���.
*/
select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where department_id = 30 or department_id = 50 or department_id = 60
      and 20000 <= nvl(salary + (salary * commission_pct),salary) *12
      and nvl(salary + (salary * commission_pct), salary)*12 <= 60000
order by 4 , 3 desc; -- and �����ڰ� �켱������ ���� �̻��ϰ� ���´�.

select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where (department_id = 30 or department_id = 50 or department_id = 60)
      and 20000 <= nvl(salary + (salary * commission_pct),salary) *12
      and nvl(salary + (salary * commission_pct), salary)*12 <= 60000
order by 4 , 3 desc; 

select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where nvl(department_id, -9999) in (30,50,60) and 20000 <= nvl(salary + (salary * commission_pct),salary) *12
      and nvl(salary + (salary * commission_pct), salary)*12 <= 60000
order by 4 , 3 desc;

-- ������ ��Ÿ�����ִ� �����ڰ� �ִ�.
-- A(�̻�) ���� B(����) ����  => between A and B

select employee_id as "�����ȣ", First_Name || ' ' || Last_Name as "�����",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "����", Department_Id as "�μ���ȣ"
from employees
where nvl(department_id, -9999) in (30,50,60) and 
      nvl(salary + (salary * commission_pct),salary) * 12 between 20000 and 60000
order by 4 , 3 desc;

-- in ���ٴ� or �� , between ���ٴ� <= �� ����� ���� ����(�ӵ� ����)

---- **** like ������ **** ----
select *
from employees
where department_id = 80;

select *
from employees
where department_id like 80;

update employees set first_name = 'J'
where employee_id = 100;

commit;

-- employees ���̺��� first_name �� ���� ù���ڰ�
-- 'J'�� �����ϴ� ����鸸 ��� ������ ��Ÿ������.
select *
from employees
where first_name like 'J%'; -- first_name�� ���� J�ν����ϴ� ���� ���

select *
from employees
where first_name like '%s';

select *
from employees
where first_name like '%s';

select *
from employees
where first_name like '%e%e%';

/*
    like �����ڿ� �Բ� ����ϴ� _�� �ƹ����� 1���� ���Ѵ�.
    like �����ڿ� �Բ� ����ϴ� %�� ���ڰ� �ֵ��� ������
    
*/
select first_name, last_name, department_id
from employees
where last_name like 'F_e%';

-- [����] employees ���̺��� ������ ���ڸ� �����ȣ, �����, �ֹι�ȣ�� ��Ÿ������

select employee_id as "�����ȣ", first_name ||' ' ||last_name as "�����", jubun as "�ֹι�ȣ"
from employees
where jubun like '______2%' or jubun like '______4%' ;

create table tbl_watch(watchname varchar2(30), bigo varchar2(200));

insert into tbl_watch values('�ݽð�', '���� 99.99% ���� ��޽ð�');
insert into tbl_watch values('���ð�', '�������� 99.99�� ȹ�� ��޽ð�');

-- tbl_watch ���̺��� bigo �÷��� 99.99% ��� ���ڰ� ����ִ� �ุ �����ϼ���.
select *
from tbl_watch
where bigo like '%99.99%%'; -- %�� ���ڿ��� �ν��� ����.

select *
from tbl_watch
where bigo like '%99.99\%%' escape '\'; 