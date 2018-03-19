show user;

select *
from tab; -- ���� ����Ŭ ������ ������ �����(������ HR) ������ ���̺��� ����� ��ȸ���ִ� ������.

/*
------  ���� �߿���!!!! -------

  ====== select ���� ó������ =======
  
  select �÷���          --- 5
  from ���̺��(���)     --- 1
  where ������           --- 2 where ���� ���ϴ� ���� �ش� ���̺��� ���ǿ� �����ϴ� ���� �޸�(RAM)�� �ε�(�ø��� ��)�ϴ� ���̴�. 
  group by ��            --- 3
  having �׷��Լ� ������  --- 4
  order by ��            --- 6

*/
select *
from departments;

/*
   column = filed = attribute = ��
   row = record = tuple =��
   table = entity = ���̺�
*/
describe departments;
desc departments;
-- departments ���̺��� �÷������� ��ȸ���ִ� ��
/*
  DEPARTMENT_ID    ==> �μ���ȣ   
  DEPARTMENT_NAME  ==> �μ��� 
  MANAGER_ID       ==> �μ����� �����ȣ   
  LOCATION_ID      ==> �μ��� ��ġ�ϴ� ������ȣ
*/
select *
from employees;

desc employees;
/*
  EMPLOYEE_ID      ==> �����ȣ
  FIRST_NAME       ==> ��
  LAST_NAME        ==> �� 
  EMAIL            ==> �̸��� 
  PHONE_NUMBER     ==> ��ȭ��ȣ 
  HIRE_DATE        ==> �Ի�����         
  JOB_ID           ==> �������̵� 
  SALARY           ==> �⺻�޿�  
  COMMISSION_PCT   ==> Ŀ�̼�(����)�ۼ�Ƽ�� 0.2 �� �⺻���� 20% 
  MANAGER_ID       ==> ���ӻ��(���)�� �����ȣ    
  DEPARTMENT_ID    ==> ������ �ٹ��ϴ� �μ���ȣ 
*/

select *
from locations; -- �μ� ��ġ�� �˷��ִ� ���̺�

select *
from countries; -- ���� ������ �˷��ִ� ���̺�

select *
from regions;  -- ��������� �˷��ִ� ���̺�

-- **** ���̺� ���� ���Ŀ� �ؾ��� ���� ���̺��� �÷��� �ּ����� �� �޾��־�� �Ѵ�. **** --

select *
from user_tab_comments;
-- ���� ����Ŭ ������ ������ �����(������ HR)�� ���� ���̺��, ��� �ּ����� �� ���� ��ȸ�ϴ� �� 

select *
from user_tab_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES ���̺� �޷��� �ּ����� ��ȸ�ϴ� ���̴�.

select *
from user_col_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES ���̺��� �ķ��� �޷��� �ּ����� ��ȸ�ϴ� ���̴�.

create table tbl_user
(userid varchar2(20) not null
,passwd varchar2(20) not null
,name varchar(20) not null
,addr varchar(100) null
,constraint PK_tbl_user_userid primary key(userid)
);

comment on table tbl_user
is 'ȸ������ ���� ���̺�' ;

comment on column tbl_user.userid
is '����� ���̵� �ʼ��Է»���';

comment on column tbl_user.passwd
is '��ȣ�� ���̴� �ּ� 8���� �̻��� ������, ����, Ư����ȣ�� ȥ�յǾ����';

select *
from user_tab_comments;

select *
from user_col_comments
where table_name = 'TBL_USER';

--- *** NULL �� ó�����ִ� �Լ� *** ---
  1. nvl
  select nvl(7,3), nvl(null,3),
         nvl('�̼���','�źϼ�'), nvl(null,'�źϼ�')

  from dual;
  2. nvl2
  select nvl2(7,3,2), nvl2(null,3,2)
  from dual;
  
  /*
    null �� �������� �ʴ� ���̹Ƿ� ��Ģ����(+,-,/,*)�� ����
    �� ����� ������ null �� �ȴ�.
  */

 select 2+3, 1+null
 from dual;
 
 select employee_id, first_name, last_name,
         salary, commission_pct,
         salary * commission_pct,
  
         nvl(salary + (salary * commission_pct), salary),
         nvl2(commission_pct, salary + (salary * commission_pct), salary)
 from employees;
  
 select employee_id �����ȣ, first_name ��, last_name �̸�,
          nvl2(commission_pct, salary + (salary * commission_pct), salary) as "�� ��"
          
 from employees;

select '�ڹ�' || 1234 || '����Ŭ' || sysdate
from dual;

select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual; -- RR/MM/DD

-- ���̺� �÷� �߰��ϱ�(employees ���̺� �ֹι�ȣ �÷��� �߰�)
alter table employees
add jubun varchar2(13);

update employees set jubun = '5710151234567'
where employee_id = 100;

update employees set jubun = '8510151234567'
where employee_id = 101;

update employees set jubun = '6510152234567'
where employee_id = 102;

update employees set jubun = '7510151234567'
where employee_id = 103;

update employees set jubun = '5710152234567'
where employee_id = 104;

update employees set jubun = '6510151234567'
where employee_id = 105;

update employees set jubun = '5809201234567'
where employee_id = 106;

update employees set jubun = '0803153234567'
where employee_id = 107;

update employees set jubun = '0712154234567'
where employee_id = 108;

update employees set jubun = '8810151234567'
where employee_id = 109;

update employees set jubun = '8908152234567'
where employee_id = 110;

update employees set jubun = '9005052234567'
where employee_id = 111;

update employees set jubun = '6610151234567'
where employee_id = 112;

update employees set jubun = '6710151234567'
where employee_id = 113;

update employees set jubun = '6709152234567'
where employee_id = 114;

update employees set jubun = '5910151234567'
where employee_id = 115;

update employees set jubun = '5710151234567'
where employee_id = 116;

update employees set jubun = '5810152234567'
where employee_id = 117;

update employees set jubun = '7810151234567'
where employee_id = 118;

update employees set jubun = '7909151234567'
where employee_id = 119;

update employees set jubun = '7702152234567'
where employee_id = 120;

update employees set jubun = '7009151234567'
where employee_id = 121;

update employees set jubun = '7111011234567'
where employee_id = 122;

update employees set jubun = '8010131234567'
where employee_id = 123;

update employees set jubun = '8110191234567'
where employee_id = 124;

update employees set jubun = '9012132234567'
where employee_id = 125;

update employees set jubun = '9406251234567'
where employee_id = 126;

update employees set jubun = '9408252234567'
where employee_id = 127;

update employees set jubun = '9204152234567'
where employee_id = 128;

update employees set jubun = '8507251234567'
where employee_id = 129;

update employees set jubun = '6511111234567'
where employee_id = 130;

update employees set jubun = '0010153234567'
where employee_id = 131;

update employees set jubun = '0005254234567'
where employee_id = 132;

update employees set jubun = '0110194234567'
where employee_id = 133;

update employees set jubun = '0412154234567'
where employee_id = 134;

update employees set jubun = '0503253234567'
where employee_id = 135;

update employees set jubun = '9510012234567'
where employee_id = 136;

update employees set jubun = '9510021234567'
where employee_id = 137;

update employees set jubun = '9610041234567'
where employee_id = 138;

update employees set jubun = '9610052234567'
where employee_id = 139;

update employees set jubun = '7310011234567'
where employee_id = 140;

update employees set jubun = '7310092234567'
where employee_id = 141;

update employees set jubun = '7510121234567'
where employee_id = 142;

update employees set jubun = '7612012234567'
where employee_id = 143;

update employees set jubun = '7710061234567'
where employee_id = 144;

update employees set jubun = '7810052234567'
where employee_id = 145;

update employees set jubun = '6810251234567'
where employee_id = 146;

update employees set jubun = '6811062234567'
where employee_id = 147;

update employees set jubun = '6712052234567'
where employee_id = 148;

update employees set jubun = '5911251234567'
where employee_id = 149;

update employees set jubun = '5910062234567'
where employee_id = 150;

update employees set jubun = '6010191234567'
where employee_id = 151;

update employees set jubun = '5712062234567'
where employee_id = 152;

update employees set jubun = '5810231234567'
where employee_id = 153;

update employees set jubun = '6011051234567'
where employee_id = 154;

update employees set jubun = '6010182234567'
where employee_id = 155;

update employees set jubun = '6110191234567'
where employee_id = 156;

update employees set jubun = '6210112234567'
where employee_id = 157;

update employees set jubun = '6311132234567'
where employee_id = 158;

update employees set jubun = '8511112234567'
where employee_id = 159;

update employees set jubun = '8710131234567'
where employee_id = 160;

update employees set jubun = '8710072234567'
where employee_id = 161;

update employees set jubun = '9010171234567'
where employee_id = 162;

update employees set jubun = '9112072234567'
where employee_id = 163;

update employees set jubun = '9110241234567'
where employee_id = 164;

update employees set jubun = '9212251234567'
where employee_id = 165;

update employees set jubun = '9310232234567'
where employee_id = 166;

update employees set jubun = '9811151234567'
where employee_id = 167;

update employees set jubun = '9810252234567'
where employee_id = 168;

update employees set jubun = '9910301234567'
where employee_id = 169;

update employees set jubun = '0910153234567'
where employee_id = 170;

update employees set jubun = '1011153234567'
where employee_id = 171;

update employees set jubun = '1006153234567'
where employee_id = 172;

update employees set jubun = '1111154234567'
where employee_id = 173;

update employees set jubun = '1209103234567'
where employee_id = 174;

update employees set jubun = '1207154234567'
where employee_id = 175;

update employees set jubun = '0906153234567'
where employee_id = 176;

update employees set jubun = '0812113234567'
where employee_id = 177;

update employees set jubun = '9810132234567'
where employee_id = 178;

update employees set jubun = '8712111234567'
where employee_id = 179;

update employees set jubun = '8310012234567'
where employee_id = 180;

update employees set jubun = '6510191234567'
where employee_id = 181;

update employees set jubun = '6510221234567'
where employee_id = 182;

update employees set jubun = '6510232234567'
where employee_id = 183;

update employees set jubun = '8512131234567'
where employee_id = 184;

update employees set jubun = '8510182234567'
where employee_id = 185;

update employees set jubun = '7510192234567'
where employee_id = 186;

update employees set jubun = '8512192234567'
where employee_id = 187;

update employees set jubun = '9511151234567'
where employee_id = 188;

update employees set jubun = '7510192234567'
where employee_id = 189;

update employees set jubun = '8510161234567'
where employee_id = 190;

update employees set jubun = '9510192234567'
where employee_id = 191;

update employees set jubun = '0510133234567'
where employee_id = 192;

update employees set jubun = '0810194234567'
where employee_id = 193;

update employees set jubun = '0910183234567'
where employee_id = 194;

update employees set jubun = '1010134234567'
where employee_id = 195;

update employees set jubun = '9510032234567'
where employee_id = 196;

update employees set jubun = '9710181234567'
where employee_id = 197;

update employees set jubun = '9810162234567'
where employee_id = 198;

update employees set jubun = '7511171234567'
where employee_id = 199;

update employees set jubun = '7810172234567'
where employee_id = 200;

update employees set jubun = '7912172234567'
where employee_id = 201;

update employees set jubun = '8611192234567'
where employee_id = 202;

update employees set jubun = '7810252234567'
where employee_id = 203;

update employees set jubun = '7803251234567'
where employee_id = 204;

update employees set jubun = '7910232234567'
where employee_id = 205;

update employees set jubun = '8010172234567'
where employee_id = 206;

commit;

select *
from employees;
 
 -- ���̺� �÷� �����ϱ�(employees ���̺� �ֹι�ȣ �÷��� ����)
alter table employees
drop column jubun;

select *
from tbl_user;
 
-- tbl_user ���̺� ������ �߰��ϱ�.
insert into tbl_user(userid, passwd, name, addr)
values('hansk', 'qwer1234', '�Ѽ���', '����� ���α�');
Rollback;
commit;
/*
DML(Data Manuplation Language) -- ������ ���۾�
==> 1. insert(�Է�)   2. update(����)    3. delete(����)
DML ���� �ٷ� ��ũ�� ������� �ʰ� �޸�(RAM)�󿡼��� ����Ǿ�����.
�׷��� ��ũ�� ����(����)�� �Ϸ��� commit; �� �ؾ��ϰ� ���࿡ ��ũ�� �������� ��������
rollback�� �Ѵ�.

�̹� commit �Ǿ��� ������ rollback; �غ��� �ҿ����.
*/

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

/*
�� ������ �Լ��� ����

1. �����Լ� 
2. �����Լ�
3. ��¥�Լ�
4. ��ȯ�Լ�
5. ��Ÿ�Լ�

----------------------------------------------

================= 1. �����Լ� =================
  1.1 lower
  1.2 upper
  1.3 initcap
  1.4 substr : ���ڿ��� Ư������ �Ǵ� ���ڿ��� �Ϻκ��� �����Ҷ� �����.
  1.5 lenth : ���ڿ� ���̸� �˷��ִ� ��.
  1.6 lengthb : ���ڿ��� byte���� �˷��ִ� ��.
  1.7 instr : � ���ڿ����� ���� ������ ��ġ�� �˷��ִ� ��.
  1.8 reverse : � ���ڿ��� �Ųٷ� �����ִ� ���̴�.
  1.9 lpad : ���ʺ��� ���ڸ� �ڸ�ä��
  1.10 rpad : �����ʺ��� ���ڸ� �ڸ�ä��
  1.11 ltrim : ���ʺ��� ���ڸ� �����ϴ� �Լ�
  1.12 rtrim : �����ʺ��� ���ڸ� �����ϴ� �Լ�
  1.13 translate 
  1.14 replace 
*/

select 'KH����������',
         substr('KH����������',3,2),
         substr('KH����������',3)
from dual;        

--1.4 substr
-- [����] employees ���̺��� ������ ���ڸ� �����ȣ, �����, �ֹι�ȣ�� ��Ÿ������

select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����", jubun as "�ֹι�ȣ" 
from employees
where substr(jubun,7,1) = 1 or substr(jubun,7,1) = 3;
1234561234567
--1.5 lenth
select length('KH����������'), length('Korea')
from dual;

--1.6 lengthb
select lengthb('KH����������'), lengthb('Korea')
from dual;

--1.7 instr

select instr('KH���������� ���������� ������ȭ��', '����', 1, 1),
      instr('KH���������� ���������� ������ȭ��', '����', 1, 2),
      instr('KH���������� ���������� ������ȭ��', '����', 4, 1),
      instr('KH���������� ���������� ������ȭ��', '����', 4, 3),
      instr('KH���������� ���������� ������ȭ��', '����', 1),
      instr('KH���������� ���������� ������ȭ��', '����', 4),
      instr('KH���������� ���������� ������ȭ��', '����', -1, 1), -- �Ųٷ� �о�´� 
      instr('KH���������� ���������� ������ȭ��', '����', -1, 2),
      instr('KH���������� ���������� ������ȭ��', '����', -4, 1),
      instr('KH���������� ���������� ������ȭ��', '����', -4, 3)
from dual;

--1.8 reverse
select 'ORACLE', reverse('ORACLE')
from dual;

select '�ѱ�', reverse('�ѱ�'), reverse(reverse('�ѱ�')) 
from dual;

create table tbl_files
(fileno number(3), --- -999~999 ���� ���� number(5) -> -99999 ~ 99999
 filepath varchar2(100));
 
 insert into tbl_files(fileno, filepath) values (1,'C:\document\resume.hwp');
 insert into tbl_files(fileno, filepath) values (2,'d:\mymusic.mp3');
 insert into tbl_files(fileno, filepath) values (3,'C:\myphoto\abc\def\face.jpg');
 
 commit;
 
 select *
 from tbl_files;
 
 /*
 -- [����] �Ʒ��� ���� �������� �ϼ���.
 ------------------------------------
  ���Ϲ�ȣ    ���ϸ�
------------------------------------ 
   1          resume.hwp
   2          mymusic.mp3
   3          face.jpg
*/

select fileno as "���Ϲ�ȣ", reverse(substr(reverse(filepath) , 1, instr(reverse(filepath),'\',1)-1)) as "���ϸ�"
from tbl_files
order by 1;

select fileno as "���Ϲ�ȣ", substr(filepath ,instr(filepath, '\', -1, 1)+1)
from tbl_files
order by 1;

-- 1.9 1.10 lpad rpad

select lpad('����������', 20, '����������'), -- 20����Ʈ
       rpad('����������', 20, '*')
from dual;

select lpad('���ѹα�',length('���ѹα�')*2*5,'���ѹα�') ,lengthb('���ѹα�')
from dual;
         
-- 1.11 1.12 ltrim rtrim

select ltrim('aabccdadsabcd', 'abcd'), -- ���ʺ��� a�Ǵ�b�Ǵ�c�Ǵ�d�������� �������Ť�
       rtrim('aabbbtddabca', 'abcd')
from dual;

select 'kH' || '                        ����           ������              ',
        'kH' || ltrim('                       ����           ������              ') -- ���������� �����ָ� �������
from dual;

1.13 translate  
 
select translate('010-3456-0987','0123456789', '�����̻�����ĥ�ȱ�')
from dual;

select *
from tbl_user;

insert into tbl_user(userid, passwd, name, addr) values ('superman' , 'qwer1234', '���۸�', '����� ���α�');
commit;

insert into tbl_user(userid, passwd, name, addr)
    values ('batman' , translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789','ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210'), '��Ʈ��', '��⵵ �����ν�');

select userid, translate(passwd,'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789')as "passwd"
from tbl_user;


select count(*)
from employees
where department_id = 50;

select count(*)
from employees
where department_id = 777;



select count(*)
from tbl_user
where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789','ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210');

-- 1.14 replace

select replace('KH���������� ��������� ���ﱳ�����б�','����', 'education')
from dual;

insert into tbl_user(userid, passwd, name , addr) values ('kimys', 'abcd', '������', '����');
insert into tbl_user(userid, passwd, name , addr) values ('leesa', 'abcd', '�̿���', '����');
insert into tbl_user(userid, passwd, name , addr) values ('yong', 'abcd', '�̿�����', '����');
insert into tbl_user(userid, passwd, name , addr) values ('park', 'abcd', '�ھƴ�', '����');
insert into tbl_user(userid, passwd, name , addr) values ('leebon', 'abcd', '�̺�', '����');
insert into tbl_user(userid, passwd, name , addr) values ('leess', 'abcd', '�̼���', '����');
commit;

select *
from tbl_user;
-- ���� ���� '��'���� ����� ���� '��'���� �����ϼ���


-- update tbl_user set name = replace(substr(name, 1,1),'��','��') || substr(name,2) where substr(name, 1,1) = '��';  

update tbl_user set name = '��'|| substr(name,2)  where name like '��%';

select *
from tbl_user;

rollback;

/*
  ========== 2.�����Լ� ==============
  
  -- 2.1 mod : �������� �����ִ� ��
  -- 2.2 round : �ݿø��� ���ִ� ��
  -- 2.3 trunc : ���� ���ִ� ��
  -- 2.4 poer : �ŵ�����
  -- 2.5 sqrt : ������
  -- 2.6 sign : ������� ����̶�� 1, 0�̶�� 0, ������� -1�� ����
  -- 2.7 ascii
  -- 2.8 sin, cos, tan, asin, acos, atan
  -- 2.9 log
*/

-- 2.1 mod

select 5/2, mod(5,2), trunc(5/2)
from dual;

-- 2.2 round

select 94.547, round(94.547) , --95
               round(94.547,0), -- 95
               round(94.547, 1), -- 94.5
               round(94.547, 2), -- 94.55
               round(94.547, -1), -- 90 
               round(94.547, -2) -- 100
from dual;

-- 2.3 trunc

select 94.547, trunc(94.547) , --94
               trunc(94.547,0), -- 94
               trunc(94.547, 1), -- 94.5
               trunc(94.547, 2), -- 94.54
               trunc(94.547, -1), -- 90 
               trunc(94.547, -2) -- 0
from dual;

create table tbl_sungjuk
(hakbun varchar2(20) not null,
 name varchar(20),
 kor number(3),
 eng number(3),
 math number(3),
 constraint PK_tbl_sungjuk_hakbun primary key(hakbun));
 
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0001' , '�Ѽ���', 100, 100, 100);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0002' , '�μ���', 80, 83, 87);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0003' , '������', 90, 91, 99);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0004' , '�׼���', 60, 50, 59);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0005' , '������', 82, 80, 80);

select *
from tbl_sungjuk;

select hakbun as "�й�", name as "�л���", kor as "����", eng as "����", math as "����",
       (kor +eng +math) as "����", round((kor +eng +math)/3) as "���",
       case(trunc(round((kor +eng +math)/3)/10)) when 10 then 'A' when 9 then 'A' when 8 then 'B'
            when 7 then 'C' when 6 then 'D' else 'F' end as ����1,
       decode(trunc(round((kor +eng +math)/3)/10),10,'A',
                                                  9,'A',
                                                  8,'B',
                                                  7,'C',
                                                  6,'D',
                                                    'F')
       
from tbl_sungjuk;



-- 2.4 power

select 2*2*2*2*2, power(2,5)
from dual;

-- 2.5 sqrt

select sqrt(4), sqrt(2), sqrt(3)
from dual;

-- 2.6 sign 

select sign(5-2), sign(5-5), sign(2-5)
from dual;

-- 2.7 ascii
select ascii('a'), ascii('a'), ascii('0'), ascii(' ')
from dual;

select chr(65), chr(97), chr(48), chr(32) 
from dual;

-- 2.8 sin, cos, tan, asin, acos, atan

select sin(90), cos(90), tan(90),
       asin(0.3), acos(0.3), atan(0.3)
from dual;

-- 2.9 log
select log(10,100)
from dual;

/*
 ================= 3. ��¥�Լ� =================
 -- ���� ����Ŭ ������ �ý����� �ð��� �˷��ִ� ��.
*/
select sysdate, current_date, -- RR/MM/DD
       localtimestamp, current_timestamp
from dual;

select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

-- 3.1
/*
  ��¥ + ���� = ��¥
  ��¥ - ���� = ��¥
  ���⼭ ������ ������ �ϼ� �̴�.
*/
select sysdate -1 as "�����ð�", sysdate as "����ð�", sysdate + 1 as "���Ͻð�"
from dual;


select to_char(sysdate -1,'yyyy-mm-dd hh24:mi:ss' ) as "�����ð�", to_char(sysdate -1,'yyyy-mm-dd hh24:mi:ss' ) as "����ð�",
               to_char(sysdate + 1, 'yyyy-mm-dd hh24:mi:ss') as "���Ͻð�" , to_char(sysdate + 1 + 2/24 + 3/(24*60) + 4/(24*60*60),'yyyy-mm-dd hh24:mi:ss')  as "1��2�ð�3��4�ʵ�"
from dual;

-- 3.2
/*
 ��¥ - ��¥ = ����(������ ������ �ϼ�)
*/
select (sysdate+2) - (sysdate+1) 
from dual;

-- 3.3 add_months
select add_months(sysdate, -2) as "2���� ��", sysdate as "����" , add_months(sysdate, 2) as "2���� ��"
from dual;
/*
 ���� ���úη� ��ÿ¾��� �� ���뿡 ��������.
 �������Ⱓ�� 21���� �����Ѵٸ�
 ù����, �������ڸ� ���Ͻð�,
 �ι���, �������ڱ��� �Ծ���� «���� �׸����� ���ϼ���
 (��, 1�� 3���� �Դ´�.)
*/

select add_Months(sysdate,21) as "��������" , (add_Months(sysdate,21) - sysdate + 1) * 3 as "�׸���"
from dual;

-- 1�� 2�ð� 3�� 4�ʸ� �ʷ� ��Ÿ���� ����
select 1*24*60*60 + 2*60*60 + 3*60 + 4
from dual;

-- 185��
select trunc(185/60) ||'��', mod(185,60) || '��'
from dual;

-- 93784�ʸ� 1�� 2�ð� 3�� 4�ʷ� ��Ÿ���� ����
select trunc(trunc(trunc(93784/60)/60)/24) || '��',mod(trunc(trunc(93784/60)/60),24) || '�ð�', mod(trunc(93784/60),60) || '��', mod(93784,60)|| '��'
from dual;

-- ����ð����� ���� ��������('2018-07-31 18:00:00') ���� ���� �Ⱓ�� �� �ð� �� �� �� ���³�����

select trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) ) || '��'
from dual;

select trunc(trunc(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60)/60)/24) || '��' ||
       mod(trunc(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60)/60),24) || '�ð�' ||
       mod(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60),60) || '��' ||
       mod(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) ),60)|| '��' as "����ñ��� ���� �Ⱓ"
from dual;

create table tbl_auction
(auction_no number,
 expire_date date
);

insert into tbl_auction(auction_no, expire_date)
       values(1, to_date('2018-02-26 20:00:00', 'yyyy-mm-dd hh24:mi:ss'));

insert into tbl_auction(auction_no, expire_date)
       values(2, to_date('2018-02-27 09:00:00', 'yyyy-mm-dd hh24:mi:ss'));

insert into tbl_auction(auction_no, expire_date)
       values(3, to_date('2018-03-01 12:00:00', 'yyyy-mm-dd hh24:mi:ss'));
 
 commit; 
 
select auction_no 
      , to_char(expire_date, 'yyyy-mm-dd hh24:mi:ss')
        as expire_date
      , trunc(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60)/24) || '�� ' ||
        mod(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60), 24) || '�ð� ' ||
        mod(trunc((trunc( (expire_date - sysdate ) * (24*60*60) ))/60), 60) || '�� ' ||
        mod((trunc( (expire_date - sysdate ) * (24*60*60) )),60) || '��' 
        as "������������Ⱓ"
 from tbl_auction;

desc employees;

select employee_id, first_name, hire_date, jubun
from employees; -

-- 3.4 extract -- ��¥���� ��, ��, ���� �������ִ� �Լ�

select sysdate,
       to_char(sysdate, 'yyyy') as "�⵵1",
       extract(year from sysdate) as "�⵵2",
       to_char(sysdate, 'mm') as "��1",
        extract(month from sysdate) as "��2",
        to_char(sysdate, 'dd') as "��1",
        extract(day from sysdate) as "��2"
from dual; -- �ڵ����� ���ڴ� �������� ���ڴ� ����������


-- employees ���̺��� �Ʒ��� ���� �������� �ϼ���.
-- �����ȣ, �����, �ֹι�ȣ, ����, ����, ���� ����

select employee_id as "�����ȣ" , first_name || ' ' || last_name as "�����",
       jubun as "�ֹι�ȣ", case when substr(jubun,7,1) in ('1' ,'3') then '��' else '��' end as "����" ,
       substr(jubun,1,2) as "���",
       extract(year from sysdate) - to_number(case  when  substr(jubun,7,1) in('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1 as "����" --to_number(����) ���ڷ� ����
from employees;

-- employees ���̺��� �Ʒ��� ���� �������� �ϼ���.
-- �����߿� ���̰� 20��� 40�븸 �����ȣ, �����, �ֹι�ȣ, ����, ����, ���� ����

/*
   ==========  VIEW(��) ��? ===============
   ���̺��� �ƴ����� select �Ǿ��� ������ ���������
   ���̺� ���� �����Ƿ� �� ������� ���̺�ó�� ���°�(�����ϴ� ��)�� ���Ѵ�.
*/
select V.*
from(
select employee_id , first_name || ' ' || last_name as "�����",
       jubun, case when substr(jubun,7,1) in ('1' ,'3') then '��' else '��' end as "GENDER" ,
       substr(jubun,1,2) as "���",
       extract(year from sysdate) - to_number(case  when  substr(jubun,7,1) in('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1 as "AGE"
from employees
) V -- inline View��� �θ���
where V.GENDER = '��' and trunc(V.AGE, -1) in ('20','40');


-- 3.5 months_between -- �γ�¥�� ���� ���̸� �˷��ִ� ��.
select months_between (add_months(sysdate,5), sysdate)
from dual;

-- 3.6 last_day(Ư����¥) 
--   --> Ư����¥�� ���Ե� �޷¿��� �� ���������� �˷��ִ� ���̴�.
select last_day(sysdate),last_day(to_date('2016-02-09'))
from dual;
/*
    [����]
    employees ���̺���
    �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, ����,
    �Ի�����, ���������� �� ��Ÿ������
    
    -- �����������̶� ����[����������������];
      �ش� ����� ���� 3������ 8���� �¾ ����� �ش��� ����(�ѱ�����)��
      63���� �Ǵ� �⵵�� 8��31�Ϸ� �ϰ�,
      �ش� ����� ���� 9������ 2���� �¾ ����� �ش��� ����(�ѱ�����)��
      63���� �Ǵ� �⵵�� 2����(2��28�� �Ǵ� 2��29�� �� �Ѵ�.
      
*/
-- ����Ǭ ���� --
select v.employee_id AS "�����ȣ", v.ename AS "�����", v.jubun AS "�ֹι�ȣ", v.age AS "���糪��",
       v.salary as "����",v.hire_date as "�Ի�⵵",
       last_day ('20' ||substr(add_Months(sysdate, (63-v.age)*12),1,2) || '-' ||
          case when v.lmonth in ('9','10','11','12','1','2') then '02-02' else '08-08' end) as "���⵵"
       
from (
select employee_id , first_name || ' ' || last_name AS ename, jubun ,
       case when substr(jubun,7,1) in ('1','3') then '����' else '����' end AS gender,
       extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) + 1 AS age,
       salary + nvl(salary*commission_pct,0) AS salary, hire_date, to_number(substr(jubun,3,2)) AS lmonth,
       63 - (extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) +1)  AS lyear
       
          
from employees
)v;

-----  �ٸ� �ڵ� ----------
select employee_id AS "�����ȣ",
       ename AS "�����",
       jubun AS "�ֹι�ȣ",
       gender AS "����",
       age AS "���糪��",
       monthsal AS "����",
       to_char(hire_date, 'yyyy-mm-dd') AS "�Ի�����",
       to_char( last_day(to_char(add_months(sysdate , (63-V.age)*12),'yyyy-') || case when to_number(substr(v.jubun,4,1)) between 3 and 8 then '08-08' else '02-02' end),'yyyy-mm-dd' ) as "���⵵"
       
from (
select employee_id ,
       first_name || ' ' || last_name AS ENAME, 
       jubun,
       case when substr(jubun,7,1) in ('1','3') then '����' else '����' end AS GENDER,
       extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) + 1 AS AGE,
       nvl(salary + (salary*commission_pct), salary) AS MONTHSAL,
       hire_date
       
from employees
)V;

/*
    
*/
select sysdate, to_char(sysdate, 'day'), to_char(sysdate, 'dy'), -- 18/02/28 , ������, ��
       to_char(sysdate ,'d'), -- 4                  '1' '2' '3' '4' '5' '6' '7'  �� �� ȭ �� �� �� �� , linux ������ ���� ǥ��
       case to_char(sysdate, 'd') when '1' then '��'
                                  when '2' then '��'
                                  when '3' then 'ȭ'
                                  when '4' then '��'
                                  when '5' then '��'
                                  when '6' then '��'
                                  when '7' then '��'
       end AS "������ ���ϸ�"
from dual;


--   number(4) -->  -9999~9999   number(4,2)  --> -99.99 ~ 99.99   number(2,2) --> -0.99 ~ 0.99   
create table tbl_loan
(gejanum  varchar2(10),
 loanmoney  number,         -- �����
 interestrate number(2,2),    -- ������      
 paymentdate  varchar2(2),         -- ���ڸ� ���� ��¥
 constraint PK_tab_loan_gejanum primary key(gejanum)
);

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-01', 5000, 0.03, '05');
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-02', 5000, 0.03, '07');
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-03', 5000, 0.03, '15');
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-04', 5000, 0.03, '00'); 
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-05', 5000, 0.03, '10'); 
commit;
  

/* ���� 1
 ���¹�ȣ    ����� ����������    �̹��޻�ȯ����
10-1234-01	5000	  0.03	    2018-02-05
10-1234-02	5000	  0.03	    2018-02-07
10-1234-03	5000	  0.03	    2018-02-15
10-1234-04	5000	  0.03	    2018-02-28
*/

select gejanum AS "���¹�ȣ",
       loanmoney AS "�����",
       interestrate AS "����������",
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS "�̹��޻�ȯ����"
from tbl_loan;

/* ���� 2
 ���¹�ȣ    ����� ����������    �̹��޻�ȯ����     �̹��� ��ȯ���ϸ�
10-1234-01	5000	  0.03	    2018-02-05            2
10-1234-02	5000	  0.03	    2018-02-07            4
10-1234-03	5000	  0.03	    2018-02-15            5
10-1234-04	5000	  0.03	    2018-02-28            4
10-1234-05	5000	  0.03	    2018-02-10	          7
*/
select gejanum AS "���¹�ȣ",
       loanmoney AS "�����",
       interestrate AS "����������",
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS "�̹��޻�ȯ����",
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(sysdate), 'yyyy/mm/dd')
                       else to_char(sysdate, 'yyyy/mm/') || paymentdate
                       end)
                       ,'d') as "�̹��� ��ȯ���ϸ�"
from tbl_loan;

/* ���� 3 (�����, �Ͽ����̸� �����ϳ� ��ȯ)
 ���¹�ȣ    ����� ����������    �̹��޻�ȯ����     �̹��� ��ȯ���ϸ�
10-1234-01	5000	  0.03	    2018-02-05            2
10-1234-02	5000	  0.03	    2018-02-07            4
10-1234-03	5000	  0.03	    2018-02-15            5
10-1234-04	5000	  0.03	    2018-02-28            4
10-1234-05	5000	  0.03	    2018-02-12	          7
*/

select gejanum AS "���¹�ȣ",
       loanmoney AS "�����",
       interestrate AS "����������",
       to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end) AS "�̹��޻�ȯ��¥"
from(
select gejanum,
       loanmoney,
       interestrate,
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS monthday,
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(sysdate), 'yyyy/mm/dd')
                       else to_char(sysdate, 'yyyy/mm/') || paymentdate
                       end)
                       ,'d') AS dayname
from tbl_loan
)v;

select gejanum AS ���¹�ȣ,
       loanmoney AS �����,
       interestrate AS ����������,
       to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end) AS �̹��޻�ȯ��¥,
       to_date(add_months(Monthday,-1)) + (case to_number(bfdayname) when 1 then 1 when 7 then 2 else 0 end) AS �����޻�ȯ����,
       ( (to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end)) 
                            -  (to_date(add_months(Monthday,-1)) + (case to_number(bfdayname) when 1 then 1 when 7 then 2 else 0 end)) ) * (loanmoney * interestrate) as ���ڱݾ�
from(

select gejanum,
       loanmoney,
       interestrate,
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS monthday,
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(sysdate), 'yyyy/mm/dd')
                       else to_char(sysdate, 'yyyy/mm/') || paymentdate
                       end)
                       ,'d') AS dayname,
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(add_months(sysdate,-1)), 'yyyy/mm/dd')
                       else to_char(add_months(sysdate,-1), 'yyyy/mm/') || paymentdate 
                       end)
                       ,'d') AS bfdayname
from tbl_loan
)v;

-- 3.7 next_day
   -- ���ƿ��� ���ϸ��� ���� �������� �˷��ִ� ��.

select sysdate,
       next_day(sysdate, '��'),
       next_day(sysdate, '��'),
       next_day(sysdate, '��')
from dual;

-- 3.8 to_yminterval, to_dsinterval
-- �����Ϸ� ���� 1�� 2���� 3�� 4�ð� 5�� 6�� �ڸ� ��Ÿ������.

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
       to_char(add_months(sysdate , 1*12+2) + 3 + 4/24 + 5/(24*60) + 6/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') ,
       to_char(sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'),'yyyy-mm-dd hh24:mi:ss' )
from dual;

select 
from dual;


-- 4. ��ȯ�Լ�
  -- 4.1 to_char -- ����, ��¥�� ����Ÿ������ ��ȯ�����ִ� ��.

select to_char(sysdate, 'yyyy') AS "�⵵",
       to_char(sysdate, 'mm') AS "��",
       to_char(sysdate, 'dd') AS "��",
       to_char(sysdate, 'hh') AS "24�ð�",
       to_char(sysdate, 'hh am') AS "12�ð�" ,
       to_char(sysdate, 'hh pm') AS "12�ð�",
       to_char(sysdate, 'mi') AS "��",
       to_char(sysdate, 'ss') AS "��",
       to_char(sysdate, 'q') AS "�б�", -- 1��~3�� : 1, 4��~6�� : 2, 7��~9�� : 3, 10��~12�� : 4
       to_char(sysdate, 'day') AS "���ϸ�",
       to_char(sysdate, 'dy') AS "���ϸ�",
       to_char(sysdate, 'd') AS "���ϸ�"
from dual;

select to_char(sysdate, 'ddd'), -- ���غ��� ���� sysdate���� ���Ϥ�����
       to_char(sysdate, 'dd'), -- ������� ������ ��
       to_char(sysdate, 'dd')
from dual;

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
       ,to_char(sysdate, 'yyyy-mm-dd') -- ����ϸ� �̾ƿ��� 0��0��-��
from dual;

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
       ,to_char(to_date(to_char(sysdate, 'yyyy-mm-dd')), 'yyyy-mm-dd hh24:mi:ss')  -- ����ϸ� �̾ƿ��� 0��0��-��
from dual;

select (sysdate - to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')) * (24*60*60),
       to_char(sysdate,'sssss') -- ���������� ������� �귯�� ��
from dual;

select 123456789
       ,to_char(123456789, '999,999,999')
       ,to_char(123456789, 'L999,999,999') -- ������ ��ȣ
       ,to_char(123456789, '$999,999,999') -- �޷�
from dual;

select employee_id,
       to_char(nvl(salary + (salary * commission_pct), salary)*12, '$9,999,999,999,999') AS YEARSAL,
       nvl(salary + (salary * commission_pct), salary)*12/13 AS YEARSAL1,
       round(nvl(salary + (salary * commission_pct), salary)*12/13, 1) AS YEARSAL2,
       to_char(round(nvl(salary + (salary * commission_pct), salary)*12/13, 1), '99999.0') AS YEARSAL3

from employees;


select round(nvl(salary + (salary * commission_pct), salary)*12/13, 1) AS YEARSAL
from employees;


desc employees;

-- 4.2 to_date -- ���ڸ� ��¥Ÿ������ ��ȯ���ִ� ��.
-- 4.3 to_number -- ���ڸ� ����Ÿ������ ��ȯ���ִ� ��.
select '2', to_number('2'), 2
from dual;

/*
 ================= 5. ��Ÿ�Լ� =================
 -- 5.1 case when then else endf
 -- 5.2 decode
*/

select case 5-2 when 4 then '5-2=4 �Դϴ�' when 1 then '5-2=1 �Դϴ�' when 3 then '5-2=3 �Դϴ�'
       else '���� ������ ����� �̤�' end
from dual;

select decode(5-2, 4, '5-2=4 �Դϴ�',
                   1, '5-2=1 �Դϴ�',
                   3, '5-2=3 �Դϴ�',
                      '���� ������ ����� �̤�') as ��� -- decode�� �ؿ� ������ ���� �������� �����Ҽ� ����.
from dual;

select case  when 4>5 then '4�� 5���� Ů�ϴ�' when 5>7 then '5�� 7���� Ů�ϴ�' when 3>2 then '3�� 2���� Ů�ϴ�'
       else '���� ������ ����� �̤�' end
from dual;


select case (select count(*)
              from tbl_user
              where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
              'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')) when 1 then '�α��� ����' else '�α��� ����' end as "�α��� ���"
from dual;

select decode((select count(*)
                 from tbl_user
                 where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')),1, '�α��� ����'
                 ,'�α��� ����') as ���
from dual;



select case( select count(*)
             from tbl_user
             where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
              'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210'))
       when 1 then '�α��� ����' else(case ( select count(*) 
                                            from tbl_user
                                            where userid = 'batman')
                               when 1 then '�н����尡 Ʋ�Ƚ��ϴ�' else '���̵� �����ϴ�.' end  )
       end as "�α��� ���"
from dual;

select decode((select count(*)
                 from tbl_user
                 where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')),1, '�α��� ����'
                 , decode(( select count(*) 
                            from tbl_user
                            where userid = 'batman'),1, '��й�ȣ�� Ʋ�Ƚ��ϴ�'
                            ,'���̵� �����ϴ�')) as ���
from dual;

select employee_id, first_name || ' ' || last_name, jubun, 
       case(substr(jubun,7,1)) when '1' then '��' when '3' then '��' else '��' end as ����1,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end as ����2,
       decode(substr(jubun,7,1),'1','��'
                               ,'3','��'
                               ,'��') as ����3
from employees;

-- 5.3 ��� rank, ���� dense_rank
select department_id AS �μ���ȣ, 
       employee_id AS �����ȣ,
       first_name || ' ' || last_name AS �����,
       salary AS �⺻�޿�,
       rank() over(order by salary desc) AS ��ü�⺻�޿����,
       dense_rank() over(order by salary desc) AS ��ü�⺻�޿�����,
       rank() over(partition by department_id
                    order by salary desc) AS �μ����޿����,
       dense_rank() over(partition by department_id
                         order by salary desc) AS �μ����⺻�޿�����
       
from employees
order by 1;

select *
from(
select department_id AS �μ���ȣ, 
       employee_id AS �����ȣ,
       first_name || ' ' || last_name AS ENAME,
       salary,
       rank() over(order by salary desc) AS RANKING
from employees
-- where rank() over(order by salary desc) <= 10;  ����!!!! where������ ���Ұ�
)v
where ranking <= 10;

-- ���� ���μ��� 1� ���--

select *
from(
select department_id AS �μ���ȣ, 
       employee_id AS �����ȣ,
       first_name || ' ' || last_name AS ENAME,
       salary,
       rank() over(order by salary desc) AS RANKING,
       rank() over(partition by department_id
                    order by salary desc) AS DEPTRANKING
from employees
-- where rank() over(order by salary desc) <= 10;  ����!!!! where������ ���Ұ�
)v
where deptranking = 1;

-- 5.4 -- greatest, lesast : �����ȼ� �߿�  ū��, ������

select greatest(10, 90, 100, 80), least(10, 90, 100, 80)
from dual;

select greatest('������', '������', '����', '��ν�'),
       least('������', '������', '����', '��ν�')
from dual;

---- *** �׷��Լ�(�����Լ�) *** ----
 -- �߿�!! �׷��Լ������� null�� ������ �����ϰ� ������ �Ѵ�.
 
1. sum -- �հ�
2. avg -- ���
3. max -- �ִ밪
4. min -- �ּҰ�
5. count -- select �Ǿ ���� ������� ���� ����
6. variance -- �л�
7. stddev -- ǥ������

select count(salary)
from employees;

select count(commission_pct) 
from employees; -- null�� �ڵ����� ����

select sum(salary)
from employees;

select sum(salary * commission_pct)
from employees; -- null�� �ڵ����� ����

select sum(salary) / count(salary) , avg(salary)
from employees;

select sum(salary * commission_pct) / count(*)
from employees; -- null�� �ڵ����� ����

select sum(nvl(salary * commission_pct, 0)) / count(nvl(salary * commission_pct, 0)),
       avg(nvl(salary * commission_pct, 0))
from employees;

/*
employees ���̺��� �μ���ȣ�� �ο����� ��Ÿ������
-----------------------
�μ���ȣ       �ο���
-----------------------
  10
  20
  30
  40
  50
*/

select department_id AS �μ���ȣ, count(*) AS �ο���
from employees
group by department_id
order by 1;

/* ����
----------------------
����      �ο���
---------------------
��
��
*/

select gender AS ����, count(*) AS �ο���
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by gender;


select case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS ����,
       count(*) AS �ο���
from employees
group by case when substr(jubun,7,1) in ('1','3') then '��' else '��' end;

/*
------------------------------------------------
    ���ɴ�             �ο���
      0
      10
      20
      30
      40
      50
      60
*/

select age AS ���ɴ�, count(*) AS �ο��� 
from(
select jubun, trunc(to_number(to_char(sysdate, 'yyyy')) - to_number(case when substr(jubun,7,1) in ('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1, -1) AS AGE
from employees
)V
group by AGE
order by 1;


select age AS ���ɴ�, count(*) AS �ο��� 
from(
select jubun, trunc(to_number(to_char(sysdate, 'yyyy')) - to_number(case when substr(jubun,7,1) in ('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1, -1) AS AGE
from employees
)V
group by AGE
order by 1;

select age AS ���ɴ�, count(*) AS �ο���
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by age
order by 1;

---------------rollup-------------------

select department_id AS �μ���ȣ,
       count(*) AS �ο���
from employees
group by rollup(department_id);


select gender AS ����, count(*) AS �ο���
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by rollup(gender);


select age AS ���ɴ�, count(*) AS �ο���
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);


select department_id,
       grouping(department_id)  -- group by ���� rollup�� ������ ���� ��밡�� 0�̸� �׷�ȭ�� �͵�, 1�̸� �׷�ȭ �ƴ� ��ü
       ,count(*)
from employees
group by rollup(department_id);

select case grouping(department_id) when 0 then nvl(to_char(department_id),'����') else '��ü' end  AS �μ���ȣ
       ,count(*) AS �ο���
from employees
group by rollup(department_id);


select case grouping(gender) when 0 then gender else '��ü' end AS ����,
       count(*) AS �ο���       
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by rollup(gender);


select case grouping(age) when 0 then to_char(age) else '��ü' end AS ���ɴ�,
       count(*) AS �ο���
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);

------------ ������� ��Ÿ������--------------

select case grouping(department_id) when 0 then nvl(to_char(department_id),'����') else '��ü' end  AS �μ���ȣ
       ,count(*) AS �ο���,
       round(count(*)/(select count(*) from employees) *100 ,1)   || '%'  AS "�ۼ�Ƽ��(%)"
from employees
group by rollup(department_id);


select case grouping(gender) when 0 then gender else '��ü' end AS ����,
       count(*) AS �ο���,
       round((count(*) / (select count(*) from employees)) *100, 1) AS "�ۼ�Ƽ��(%)"
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by rollup(gender);



select case grouping(age) when 0 then to_char(age) else '��ü' end AS ���ɴ�,
       count(*) AS �ο���,
       round((count(*) / (select count(*) from employees))*100, 1) AS "�ۼ�Ƽ��(%)"
       
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);

/*
--------------------------------------------
  �μ���ȣ        ����          �ο���
----------------------------------------------
   10            ��
   10            ��
   20
   20
   30
  
*/

select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
group by rollup(department_id, gender)
order by 1,2;

-- cube --
select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
group by cube(department_id, gender)
order by 1,2;


---> *** ��ప(rollup, cube, grouping sets) *** <---

-- 1. rollup(a,b,c) == grouping sets( (a,b,c),(a,b),(a),() )        �ڿ��� �ϳ��� ��������.
      rollup(department_id, gender) == grouping sets((department_id, gender), (department_id), () )
-- 2. cube(a,b,c) == grouping sets( (a,b,c), (a,b), (b,c), (a,c), (a) ,(b), (c), () )  
      cube(department_id, gender) == grouping sets((department_id, gender), (department_id), (gender), () )



select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
-- group by rollup(department_id, gender)
   group by grouping sets( (department_id, gender), (department_id), () )
order by 1,2;


select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
-- group by cube(department_id, gender)
   group by grouping sets((department_id, gender), (department_id), (gender), () )
order by 1,2;


select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
group by grouping sets( (department_id, gender), (gender) ) -- ���ϴ� ���� ��ȸ����
order by 1,2;


-- ����.
---------------------------------------------------------
    ���ɴ�     ����     �ο���     �ۼ�Ƽ��
---------------------------------------------------------

select nvl(to_char(age), '��ü���ɴ�') AS ���ɴ�,
       nvl(gender, '��ü����') AS ����,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' AS �ۼ�Ƽ��
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER,
       trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end),  -1) AS AGE
      
from employees
)v
group by grouping sets( (age,gender), (age), ())
order by 1;

select case grouping(age) when 0 then to_char(age) else '��ü���ɴ�' end  AS ���ɴ�,
       case grouping(gender) when 0 then gender else '��ü����' end  AS ����,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' AS �ۼ�Ƽ��
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER,
       trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end),  -1) AS AGE
      
from employees
)v
group by grouping sets( (age,gender), (age), ())
order by 1;
/* ����
----------------------------------------
    �μ���ȣ          �������հ�
-----------------------------------------
    10
    20
    30
    ��ü
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '����' end , '����') AS �μ���ȣ,
        to_char( sum(monthsal), '$999,999,999,999') AS �������հ�
from(
select department_id,
       nvl(salary +(commission_pct*salary), salary) AS MONTHSAL
from employees
)v
group by rollup(department_id)
order by 1;


select nvl(case grouping(department_id) when 0 then to_char(department_id) else '����' end , '����') AS �μ���ȣ,
        to_char( sum(nvl(salary +(commission_pct*salary), salary)), '$999,999,999,999' ) AS �������հ�
from employees
group by rollup(department_id)
order by 1;


/* ����
----------------------------------------
    �μ���ȣ         ��տ���     �ۼ�Ƽ��
-----------------------------------------
    10
    20
    30
    ��ü
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '����' end , '����') AS �μ���ȣ,
      to_char( sum(monthsal) / count(monthsal), '$999,999,999,999') AS ��տ���,
      round( (sum(monthsal) / count(monthsal) )  / ( select sum( nvl(salary +(commission_pct*salary), salary) )  from employees ) *100, 1 ) AS �ۼ�Ƽ��
from(
select department_id,
      nvl(salary +(commission_pct*salary), salary) AS MONTHSAL
from employees
)
group by grouping sets(department_id,())
order by 1;

/*
---------------------------------------------
 ��ü�����      10��̸�   10��   20��   30��
---------------------------------------------
*/

select count(*) AS ��ü�����,
       sum(case age when 0 then 1 else null end) AS "10�� �̸�",
       sum(case age when 10 then 1 else null end) AS "10��",
       sum(case age when 20 then 1 else null end) AS "20��",
       sum(case age when 30 then 1 else null end) AS "30��",
       sum(case age when 40 then 1 else null end) AS "40��",
       sum(case age when 50 then 1 else null end) AS "50��",
       sum(case age when 60 then 1 else null end) AS "60��"
from(
select trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end) +1, -1)  AS AGE
from employees
)v;

/* ����
------------------------------------------
  �μ���ȣ    ����     ����     ���ο���
------------------------------------------
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '��ü�ѿ�' end, '����') AS �μ���ȣ ,
       sum(case gender when '����' then 1 else 0 end) AS ����,
       sum(case gender when '����' then 1 else 0 end) AS ����,
       nvl(to_char(sum(case gender when '����' then 1 else null end)), 'X') AS ����,
       count(*) AS ���ο���
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '����' else '����' end AS GENDER
from employees
)v
group by rollup(department_id);

------------ having �׷��Լ� ������ -----------------
select department_id, count(*)
from employees
group by department_id
having count(*) >= 10
order by 1;
      
      
select job_id, count(*)      
from employees
group by job_id;

-- �μ���ȣ�� ������ ���� 50000 �̻��� �μ���ȣ, ������ ���� ��Ÿ������.

select department_id AS �μ���ȣ,
       to_char(sum(monthsal), '$9,999,999,999') AS ��������
from(
select department_id,
       nvl(salary + (salary * commission_pct), salary ) AS MONTHSAL
from employees
)V
group by department_id
having sum(monthsal) >= 50000
order by 1;

select department_id AS �μ���ȣ,
       to_char( sum( nvl(salary + (salary * commission_pct), salary ) ), '$9,999,999,999' ) AS ��������
from employees
group by department_id
having sum(nvl(salary + (salary * commission_pct), salary )) >= 50000
order by 1;

-------- *** ������ ���ؼ� �˾ƺ��ô� *** ----------
create table tbl_panmae
(panmaedate date,
 jepumname varchar2(20),
 panmaesu number
);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2) , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+1 , '�����', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+2 , '���ڱ�', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+3 , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1) , '������', 7 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+1 , '�����', 8 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+2 , '���ڱ�', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+3 , '���ڱ�', 5 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -4 , '��Ϲ���Ĩ', 30 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -3 , '������', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -2 , '������', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -1 , '��Ϲ���Ĩ', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '���ڱ�', 5 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '��Ϲ���Ĩ', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '������', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '���ڱ�', 10 );

commit;

select *
from tbl_panmae;

select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss'),
       panmaesu
from tbl_panmae;

/*
-- �Ʒ��� ���� �������� �ϼ���
-------------------------------
��ǰ��   �Ǹ�����   �Ǹŷ�
�����   18/01/05  	10
�����   18/01/06  	15
�����   18/01/08  	10
�����   18/02/06  	8
�����   18/03/05  	20

-------------------------------
*/
select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm-dd') AS �Ǹ�����,
       sum(panmaesu) AS �Ǹŷ�
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
order by 2;

/*
-- �Ʒ��� ���� �������� �ϼ��� 
-------------------------------
��ǰ��   �Ǹſ�   �Ǹŷ�
�����   18/01  	  35
�����   18/02    	8
�����   18/03   	20
-------------------------------
*/
select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm') AS �Ǹſ�,
       sum(panmaesu) AS �����Ǹŷ�
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm')
order by 2;

----- �������ϱ� -------
select employee_id, hire_date, salary,
       sum(salary) over (order by employee_id )
from employees;


select jepumname AS ��ǰ��,
       pmonth AS �Ǹſ�,
       monthsu AS �����Ǹŷ�,
       sum(monthsu) over(order by pmonth) AS �Ǹŷ�����
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm') AS PMONTH,
       sum(panmaesu) AS MONTHSU
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm')
)V;

/*
-------------------------------
��ǰ��   �Ǹ�����   �Ǹŷ�    �Ǹ����ں�����
�����   18/01/05  	10          10
�����   18/01/06  	15          25
�����   18/01/08  	10          35 
�����   18/02/06  	8           43
�����   18/03/05  	20          63

-------------------------------
*/
select jepumname AS ��ǰ��,
       pdate AS �Ǹ�����,
       psum AS �Ǹŷ�,
       sum(psum) over(order by pdate) AS �Ǹ����ں�����  
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd') AS PDATE,
       sum(panmaesu) AS PSUM
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
)V;

/*
-------------------------------
��ǰ��   �Ǹ�����   �Ǹŷ�    �Ǹ����ں�����
���ڱ� 	2018-01-07	20	      20
���ڱ�	  2018-02-07	10	      30
���ڱ�	  2018-02-08	5	        5
���ڱ� 	2018-03-05	15      	20
������	2018-02-05	7       	7
������	2018-03-02	15      	22
������	2018-03-03	10	      32
...
*/

select jepumname AS ��ǰ��,
       pdate AS �Ǹ�����,
       psum AS �Ǹŷ�,
       sum(psum) over(partition by jepumname order by psum) AS �Ǹ����ں�����  
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd') AS PDATE,
       sum(panmaesu) AS PSUM
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
)V;

select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm-dd')  AS �Ǹ�����,
       sum(panmaesu) AS �Ǹŷ�,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS �Ǹ����ں�����  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd');



create or replace view view_panmae -- view_pname�� ������ �����ϰ� ������ ���������ش�. 
as
select jepumname AS jepumname,
       to_char(panmaedate, 'yyyy-mm')  AS PANMAEMONTH,
       sum(panmaesu) AS panmaesu,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS TOTAL  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm');


select *
from view_panmae
where jepumname in ('���ڱ�','�����');



-- ���� ����Ŭ ������ ������ �����(������ HR) ������ ���̺��� ����� ��ȸ���ִ� ������.
select *
from tab;


--- *** Stored View ��ȸ�ϱ� *** ---
select *
from user_views;

select text
from user_views
where view_name= 'VIEW_PANMAE'; -- ��ҹ��� ������

create or replace view view_panmae -- view_pname�� ������ �����ϰ� ������ ���������ش�. 
as
select jepumname AS jepumname,
       to_char(panmaedate, 'yyyy-mm')  AS PANMAEMONTH,
       sum(panmaesu) AS MONTHTOTAL,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS NUGAE  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm');




---- ==== �м��Լ� ==== ----
-- �� ntile �Լ�
select first_name || ' ' || last_name AS ENAME
    , salary
from employees
where department_id = 50; -- 45�� ��


select first_name || ' ' || last_name AS ENAME
    , salary
from employees
where department_id = 80; -- 34�� ��


select first_name || ' ' || last_name AS ENAME
    , salary
    , ntile(4) over(order by salary desc) AS CLASS -- 45���� 4���� �η��� ������. 
    /*
    trunc(45/4) ==> 11 (������������ 1~4�� �ָ� 1�� ���� ��� ������������ �߰� �����ش�.)
    111111111111  => 1�η��� 12��
    22222222222   => 2�η��� 11��
    33333333333   => 3�η��� 11��
    44444444444   => 3�η��� 11��
    */
from employees
where department_id = 50; -- 45�� ��

 /*
    trunc(34/4) ==> 8 (������������ 1~4�� �ָ� 1�� ���� ��� ������������ �߰� �����ش�.)
    111111111  => 1�η��� 9��
    222222222   => 2�η��� 9��
    33333333   => 3�η��� 8��
    44444444   => 3�η��� 8��
    */

-- �� row_number �Լ�
-- �� rownum

create table tbl_board
(writeno number not null,        -- �۹�ȣ
 userid varchar(20) not null,    -- ����� ID
 title varchar(20) not null,     -- ���ۼ�����
 writeday date default sysdate not null,
 constraint PK_tbb_board_writeno primary key(writeno)
);

--- ������ �����ϱ� ---
create sequence seq_tbl_board
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '�̼����Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hansk', '�Ѽ��� �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hong', 'ȫ�浿 �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '�湫�� �̼���.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hongkd', '���� ȫ�浿');

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITENDAY
from tbl_board;

delete from tbl_board where writeno = 2;
delete from tbl_board where writeno = 4;

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'dusk', '�μ���');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'eom', '����ȭ');

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITENDAY
from tbl_board
order by writeno desc;

select rownum, -- �ǻ��÷�(pseudo colunm)
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY
from tbl_board
order by writeno desc;

select t.*
from 
(
select rownum AS RNO, writeno, userid, title,
       writeday
from
(
 select writeno, userid, title,
        to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY
 from tbl_board
 order by writeno 
 )V
)T
order by t.rno desc;

select row_number() over(order by writeno desc),
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss')
from tbl_board;

select row_number() over(order by writeno asc) AS RNO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY
from tbl_board
order by 1 desc;


select *
from
(
select row_number() over(order by writeno asc) AS RNO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY
from tbl_board
)V
where RNO = 3;

select *
from
(
 select rownum AS RNO, employee_id, ENAME
 from
 (
 select employee_id,
        first_name || ' ' || last_name AS ENAME 
 from employees
 order by employee_id asc
 )V
)T
order by T.RNO desc;

select *
from
(
select row_number() over(order by employee_id) AS ROWNUMBER,
       employee_id,
       first_name || ' ' || last_name AS ENAME 
from employees
)V
order by rownumber desc;


select *
from
(
select department_id,
       row_number() over(partition by department_id order by employee_id) AS ROWNUMBER,
       employee_id,
       first_name || ' ' || last_name AS ENAME 
from employees
)V
order by department_id,rownumber desc;

-- �� lag, read �Լ� (�Խ��ǿ��� ��Ϻ���� ������, ������ �ۼ��� ����)

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY
from tbl_board
order by writeno desc;

select lag(writeno, 1) over (order by writeno desc) AS BFWRITENO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 1) over (order by writeno desc) AS AFWRITENO
from tbl_board;


select lag(writeno, 2) over (order by writeno desc) AS BFWRITENO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 2) over (order by writeno desc) AS AFWRITENO
from tbl_board;

select bfwriteno, writeno, title, writeday
from
(
select lag(writeno, 1) over (order by writeno desc) AS BFWRITENO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 1) over (order by writeno desc) AS AFWRITENO
from tbl_board
)V
where writeno = 3;

---------------------------------------------------
������������ �۹�ȣ userid ������ �ۼ����� �������� ����
----------------------------------------------------

select (select title
        from tbl_board
        where writeno = v.bfwriteno) AS �������Ǳ�����,
        v.bfwriteno,
        v.writeno, v.title, v.writeday,
       (select title
        from tbl_board
        where writeno = v.afwriteno) AS �������Ǳ�����,
       v.afwriteno
from
(
select lag(writeno, 1) over (order by writeno desc) AS BFWRITENO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 1) over (order by writeno desc) AS AFWRITENO
from tbl_board
)V
where v.writeno = 3;

---- SQL (Structured Query Language) -- ����ȭ�� ���Ǿ� ------
----------------  *** ������ ����(Query) *** --------------------------
-- �� start with connect by prior �� -- (�Խ��ǿ��� �亯�� �Խ��ǿ��� ���� ����)

select level 
       employee_id,
       first_name || ' '  || last_name AS ENAME,
       job_id,
       manager_id
from employees
start with employee_id = 106
-- connect by prior employee_id = manager_id
connect by prior manager_id = employee_id;
-- connect by prior ������ ������ manager_id �÷��� ����
-- start whit employee_id �� ���ε� ���� �÷����̴�.
-- �� �����ȣ 106 ���� manager_id �÷��� ���̴�.
-- connect by prior 103 = employee_id �̴�.
-- 106 -- 103 103 -- 102  102 -- 100


select level 
       employee_id,
       first_name || ' '  || last_name AS ENAME,
       job_id,
       manager_id
from employees
start with employee_id = 100
connect by prior  employee_id = manager_id
order by level, employee_id ;


select level 
       employee_id,
       lpad(' ', (level-1)*3, ' ' ) ||  first_name || ' '  || last_name AS ENAME,
       job_id,
       manager_id
from employees
start with employee_id = 100
connect by prior  employee_id = manager_id
order by level, employee_id ;



--------------- *** Sub Query(��������) *** ----------------------

-- Sub Query(��������)��?
select �� �ӿ� �� �ٸ� select ���� ���ԵǾ��� ������
���ԵǾ��� select ���� Sub Query(��������)��� �θ���.

select ....
from ....                --> Main Query == �ܺ�����
where .... in (select ...
               from ...) --> Sub Query == ��������

-- employees ���̺��� �⺻�޿��� ���ϸ��� �����  �������� ����� ������
-- �����ȣ, �����, �⺻�޿��� ��Ÿ������

select employee_id AS �����ȣ,
       first_name || ' ' || last_name AS �����,
       salary AS �⺻�޿�
from employees
where salary = (select max(salary) from employees)
      or salary = (select min(salary) from employees);

�ְ�޿� ==> select max(salary) from employees
�����޿� ==> select min(salary) from employees
/*
    employees ���̺��� �μ���ȣ�� 60��, 80�� �μ��� �ٹ��ϴ� ������߿�
    ������ 50�� �μ� �������� '��տ���' ���� ���� ����鸸 �μ���ȣ, �����ȣ
    �����,������ ��Ÿ������
*/

select department_id AS �μ���ȣ,
       employee_id AS �����ȣ,
       ename AS �̸�,
       monthsal AS ���� 
from
(
select department_id,
       employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary*commission_pct), salary) AS MONTHSAL
from employees
where department_id = 60 or department_id = 80
)V
where monthsal > (select avg(nvl(salary + (salary*commission_pct), salary)) from employees where department_id = 50)

select department_id 
       employee_id,
       first_name || ' ' || last_name,
       nvl(salary + (salary*commission_pct), salary)
from employees
where (department_id = 60 or department_id = 80)
       and nvl(salary + (salary*commission_pct), salary) > (select avg(nvl(salary + (salary*commission_pct), salary)) from employees where department_id = 50)
       
-------- *** ANY, ALL *** ----------
 Sub Query������ ���Ǿ����� ANY �� OR �� ����ϰ�
 ALL �� AND �� ����ϴ�.
 
-- employees ���̺��� salary �� �μ���ȣ 30���� salary ������ ����鸸 �����ϼ���
              
select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary in (select salary
                from employees
                where department_id = 30)

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary = (select salary
                from employees
                where department_id = 30) -- single-row subquery returns more than one row �����߻�

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary = any(select salary
                from employees
                where department_id = 30)


-- �⺻�޿�(salary)�� ���ϲ����� ������ ��� ����鸸
-- �����ȣ, �⺻�޿��� ��Ÿ������

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary > (select min(salary) from employees)
order by 3;

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary > any(select salary from employees)
order by 3;

-- �⺻�޿��� �ְ��λ��

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary = (select max(salary) from employees);

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary >= all(select salary from employees);

---- �ְ�����λ��
select employee_id,
       first_name || ' ' || last_name,
       salary * commission_pct AS COMM
from employees
where salary * commission_pct = (select max(salary * commission_pct) from employees);

select employee_id,
       first_name || ' ' || last_name,
       salary * commission_pct AS COMM
from employees
where nvl(salary * commission_pct, 0) >= all( (select salary * commission_pct
                                               from employees
                                               where commission_pct is not null);
                                               



2100    3000
3000    2375
2375
2250
1600
1500
1050
3500
3325
3150
2400
2250                         
620


------ *** Pairwise SubQuery *** -----

/*
  employees ���̺���
  �μ���ȣ���� salary �� �ִ��� ����� �ּ��� ����� ������ 
  �μ���ȣ, �����ȣ, �����, �⺻�޿��� ��Ÿ������.
*/
select department_id, max(salary)
from employees
group by department_id;

select department_id, min(salary)
from employees
group by department_id;


select department_id, employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where (nvl(department_id, 0), salary) in (select department_id , min(salary)
                                          from employees
                                          group by department_id)
      or
      (nvl(department_id,0), salary) in (select department_id, max(salary)
                                         from employees
                                         group by department_id)
order by 1, 4; -- null���� �ȳ���

select department_id, employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where (nvl(department_id, -9999), salary) in (select nvl(department_id,-9999) , min(salary)
                                          from employees
                                          group by department_id)
      or
      (nvl(department_id,-9999), salary) in (select nvl(department_id,-9999), max(salary)
                                         from employees
                                         group by department_id)
order by 1, 4;

/*
-------- *** ���Sub Query(== ����������) ***----------
 ��� Sub Query �̶� ���� Main Query(== �ܺ�����) ���� ����
 ���̺�(��)�� �����ϴ� �÷��� Sub Query�� ������(where��, having��)��
 ���Ǿ������� ���Ѵ�.
*/

select department_id, employee_id,
       rank() over(order by salary desc) AS RANKING
from employees;

select department_id, employee_id,
       (select count(*)+1
        from employees
        where salary > E.salary ) AS RANKING
from employees E
order by E.salary desc;


select department_id, employee_id,
       rank() over(order by salary desc) AS TOTALRNAKING,
       rank() over(partition by department_id
                   order by salary desc) AS DEPTRANKING
from employees;

select department_id, employee_id,
       (select count(*)+1
        from employees
        where salary > E.salary ) AS TOTALRNAKING,
        (select count(*)+1
        from employees
        where department_id = E.department_id 
              and salary > E.salary ) AS DEPTRANKING
from employees E
order by 3,4 desc;

--- *** ������������� �̿��� UPDATE ó�� *** ---

--- ���̺� �����ϱ� ---
create table tbl_empcopy
as
select * from employees; 

select *
from tbl_empcopy;

update employee set first_name = '�ӱ���';
commit

select *
from employees;

------------- ======   *** DICTIONARY ��ȸ�ϱ� *** ======== ----------------------
select *
from dictionary;

USER_CONS_COLUMS -- ���� ����Ŭ ������ ������(HR) ���� ���� user 
ALL_CONS_COLUMNS -- �ٸ� ����ڰ� ���� �ͱ��� ���δ�.

select *
from dictionary
where table_name like 'USER_%' and  -- ���̺� �̸��߿� USER �ν����ϴ� �͵� �߿� comments���뿡 table�� ������ �� ���
      lower(comments) like '%table%';
      
select *
from USER_TABLES;      

select *
from dictionary
where table_name like 'USER_%' and 
      lower(comments) like '%database link%';
      
select *
from USER_DB_LINKS
      

---------- **** �����ͺ��̽� ��ũ �����ϱ� **** -------------
/* tnsnames.ora �� �߰�

ORATEACHER =                   -- net server name
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.50.42)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE) --������ �̸� select *from global_name; �� �˼��ִ�. 
    )
  )
*/

create database link teacherlink
connect to hr identified by eclass
using 'ORATEACHER';

select *
from employees;

select *
from employees@teacherlink;

update employees ME set first_name = (select first_name 
                                           from employees@teacherlink
                                           where employee_id = ME.employee_id); 
commit;

select *
from global_name;

--- *** �����ͺ��̽� ��ũ �����ϱ� *** ----

drop database link teacherlink;




------------------------------------------------------------------------------
             ---------- *** JOIN(����)  *** -----------
------------------------------------------------------------------------------

JOIN(����)�� ���̺�(��)�� ���̺�(��)�� ��ġ�� ���� ���ϴµ�
��(ROW)�� ��ġ�� �;� �ƴ϶�, �ó�(COLUMN)�� �÷�(COLUMN)�� ��ġ�� ���� ���Ѵ�.
�׸���, ���� �ٸ� ���̺�(��)�� ��(ROW)�� ��(ROW)�� ��ġ�� ���� UNION �����ڸ� ����ϴ� ���̴�.

A = {1,2,3} ���� 3��
B = {a,b}   ���� 2��

A �� B = { {1,a}, {1,b},
           {2,a}, {2,b},
           {3,a}, {3,b} } 
��ī��Ʈ�� => ������ �� : 3*2 = 6(��� ����� ��)
--> ��ī��Ʈ���� �����ͺ��̽������� Catersian Product ��� �θ���

INNER JOIN(= ��������)

OUTER JOIN(= �ܺ�����)

UNION
UNION ALL
INTERSECT
MINUS


select count(*)
from employees; -- 107

select *
from departments

select count(*)
from departments; -- 27

select *
from employees, departments

--> JOIN : SQL 1992 code ���(�����ͺ��̽� ������� ������ �ٸ�)��
--         SQL 1999 code ���(ANSI SQL ǥ��ȭ)

-- 1. SQL 1992 CODE ��� => ���̺�(��)�� ���̺�(��)���̿� �޸�(,)�� ����ش� ��
-- 2. SQL 1999 CODE ��� => ���̺�(��)�� ���̺�(��)���̿� ���ν� JOIN �̶�� �ܾ �־��ִ� ��.

-- 1.  SQL 1992 CODE ���
select *
from employees, departments  -- ��� ����� ��(Catersian Product) 2889

select *
from employees E, departments D
where E.department_id = D.department_id -- join ������
-- EQUI JOIN �̶� �θ���.

select *
from employees E, departments D
where E.department_id = D.department_id(+) -- left outer join �� ����

select *
from employees E, departments D
where E.department_id(+) = D.department_id -- right outer join �� ����

select *
from employees E, departments D
where E.department_id(+) = D.department_id(+) -- ����. ���Ұ�

-- 2. SQL 1999 CODE ���
select *
from employees cross join departments  -- ��� ����� ��(Catersian Product) 2889

-- inner join --
select *
from employees E inner join departments D 
on E.department_id = D.department_id; -- join ������

select *
from employees E join departments D -- inner join���� inner�� ��������
on E.department_id = D.department_id; -- join ������


-- outer join --
select *
from employees E left outer join departments D
on E.department_id = D.department_id;

select *
from employees E left join departments D -- outer join���� outer�� ��������
on E.department_id = D.department_id; 

select *
from employees E right outer join departments D
on E.department_id = D.department_id;

select *
from employees E right join departments D -- outer join���� outer�� ��������
on E.department_id = D.department_id; 

select *
from employees E full outer join departments D
on E.department_id = D.department_id; 


/*
 ���� 
-----------------------------------------------------------
 �μ���ȣ   �����ȣ   ����   ��ü��տ���    �������
-----------------------------------------------------------
*/
select department_id, employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
from employees

select trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
from employees

select department_id, employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) AS MONTHSAL,
       nvl(salary + (salary * commission_pct), salary) - V.avgmonthsal AS �������
from  employees cross join
      (select trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
       from employees) V
order by 5 desc;

/*
 ����
-----------------------------------------------------------
 �μ���ȣ        �μ���     �����ȣ     �����       ����
-----------------------------------------------------------
 departments departments  employees  employees  employees
 employees
*/

select D.department_id,
       D.department_name,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       nvl(E.salary + (E.salary * E.commission_pct), E.salary) AS MONTHSAL
from departments D right join employees E
on D.department_id = E.department_id

/*
 ���� 
------------------------------------------------------------------------
 �μ���ȣ      �μ���      �μ���տ���   �����ȣ   �����    ����  �μ��������
------------------------------------------------------------------------
*/

select V.department_id,  D.department_name, V.monthsal,
       E.employee_id, E.first_name || ' ' || E.last_name AS ENAME,
       nvl(E.salary + (E.salary * E.commission_pct), E.salary) - v.monthsal
      
from  (select department_id, trunc( avg(nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSAL
        from employees
        group by department_id
       )V     
left join departments D
on V.department_id = D.department_id 
join employees E
on nvl(D.department_id, -9999) = nvl(E.department_id, -9999) 
order by 1

------- ���� �������  SQL 1992 CODE ������� ��ȯ�ϼ��� -------------

select V.department_id,  D.department_name, V.monthsal,
       E.employee_id, E.first_name || ' ' || E.last_name AS ENAME,
       nvl(E.salary + (E.salary * E.commission_pct), E.salary) - v.monthsal
from (select department_id, trunc( avg(nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSAL
        from employees
        group by department_id
       )V , departments D, employees E
where V.department_id =  D.department_id(+) and
      nvl(D.department_id,-9999) = nvl(E.department_id,-9999) 
order by 1

-----

select department_id, trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSAL
from employees
group by department_id -- V

select V.department_id, D.department_name, V.AVGMONTHSAL
from departments D right join (select department_id,
                                      trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
                               from employees
                               group by department_id)V
on D.department_id = V.department_id -- A


select department_id,
       employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
from employees --B

select A.department_id ,A.department_name,
       B.employee_id, B.ename, A.avgmonthsal,  B.monthsal,
       B.monthsal - A.avgmonthsal  AS �μ��������
from ( select V.department_id, D.department_name, V.AVGMONTHSAL
       from departments D right join (select department_id,
                                      trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
                                      from employees
                                        group by department_id)V
       on D.department_id = V.department_id ) A 
       join (select department_id,
                    employee_id,
                    first_name || ' ' || last_name AS ENAME,
                    nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
              from employees) B
      on nvl(A.department_id, -9999) = nvl(B.department_id,-9999)       
order by 1, 5 desc       


---- **** Multi Table JOIN(���� ���̺� ����) *** ----
--> 3�� �̻��� ���̺��� ������ ���� �����ִ� ���̴�.
--------------------------------------------------------------------------
�μ���ȣ     �μ���       �μ��ּ�      �����ȣ       �����      �⺻�޿�
---------------------------------------------------------------------------
departments  dep        locations     emp           emp         emp
employees

  ���̺��              ���������÷���
----------------------------------------------
departments D           location_id   department_id
locations   L           location_id
employees   E                         department_id


select E.department_id,
       D.department_name,
       L.city || ' ' || L.street_address AS DEPTADDRESS,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       E.salary
from departments D join locations L 
on D.location_id = L.location_id
right join employees E
on D.department_id = E.department_id

--------------------------------------------------------------------------
�μ���ȣ     �μ���       ������       �μ��ּ�     �����ȣ       �����      �⺻�޿�
---------------------------------------------------------------------------
departemnt  dep         countries

  ���̺��              ���������÷���
-------------------------------------------------------------------
departments D           location_id   department_id     country_id 
locations   L           location_id
countries   C                                           country_id 
employees   E                         department_id
       

select E.department_id,
       D.department_name,
       C.country_name,
       L.city || ' ' || L.street_address AS DEPTADDRESS,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       E.salary
from departments D join locations L 
on D.location_id = L.location_id
join countries C
on L.country_id = C.country_id
right join employees E
on D.department_id = E.department_id 

select *
from countries

---------------1992 code ���-----------------------

select E.department_id,
       D.department_name,
       C.country_name,
       L.city || ' ' || L.street_address AS DEPTADDRESS,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       E.salary
from countries C, locations L, departments D , employees E
where C.country_id(+) = L.country_id and
      L.location_id = D.location_id and
      D.department_id = E.department_id
      
--------- **** NON-EQUI JOIN **** ------------
--> � �ķ��� ���� Ư�� ������ ���� �� ����ϴ� JOIN

-- �ҵ漼�� ��ǥ ���� ���̺� �����Ѵ�.
create table tbl_taxindex
(lowerincome  number, -- ������ ����
 highincome  number,  -- ������ �ִ�
 taxpercent number(2,2)  -- ���� -0.99 ~ 0.99
); 

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (1, 99999, 0.02);

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (100000, 149999, 0.05);

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (150000, 199999, 0.08);

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (200000, 10000000000000, 0.10);

commit;

select employee_id ,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL     
from employees; -- A

select *
from tbl_taxindex;

------------------------------------------------------
create table tbl_imsi
( no   number,
  name  varchar2(20),
  addr  varchar2(100)
);

insert into tbl_imsi(no, name, addr) values (1,'������','����');
insert into tbl_imsi(no, name, addr) values (1,'������','����');
insert into tbl_imsi(no, name, addr) values (1,'������','����');
insert into tbl_imsi(no, name, addr) values (2,'�̹���','���');

select rowid, no, name, addr
from tbl_imsi;

delete from tbl_imsi
where no = 1 and rowid !=  'AAAE9hAAEAAAAHbAAA'; 
---------------------------------------------

select rowid, lowerincome, highincome, taxpercent
from tbl_taxindex;

update tbl_taxindex set lowerincome = 1 , highincome = 109999 ,
                        taxpercent = 0.025
where rowid = 'AAAE9gAAEAAAAHTAAA';


update tbl_taxindex set lowerincome = 110000 , highincome = 169999 ,
                        taxpercent = 0.053
where rowid = 'AAAE9gAAEAAAAHTAAB';


update tbl_taxindex set lowerincome = 170000 , highincome = 230000 ,
                        taxpercent = 0.09
where rowid = 'AAAE9gAAEAAAAHTAAC' ;

update tbl_taxindex set lowerincome = 230001 , highincome = 10000000000000 ,
                        taxpercent = 0.15
where rowid = 'AAAE9gAAEAAAAHTAAD';

commit




--- 1992 code ---

select A.*, B.taxpercent,
       to_char(A.yearsal * B.taxpercent, '$999,999,999,999,999') AS �ҵ漼
from (select employee_id ,
             first_name || ' ' || last_name AS ENAME,
             nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL     
      from employees) A, tbl_taxindex B
where A.yearsal between B.lowerincome and B.highincome

--- 1998 code ---

select employee_id, ename, yearsal, 
       case when 1 <= yearsal and yearsal <= 99999 then 0.02 * yearsal
            when 100000 <= yearsal and yearsal <= 149999 then 0.05 * yearsal
            when 150000 <= yearsal and yearsal <= 199999 then 0.08 * yearsal
            else 0.1 * yearsal end AS �ҵ漼
from
(select employee_id ,
        first_name || ' ' || last_name AS ENAME,
        nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL     
 from employees
)V --- ���� ���ҽ� �ڵ���ü�� ����

----------------- *** �ڱ�����(self join) *** -------------------------
 
create table tbl_authorbook
(bookname   varchar2(100),
 authorname  varchar2(20),
 loyalty    number(5)
);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('���ΰ��ٴ�', '������', 1000);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('����������', '�����', 800);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('����������', '������', 500);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('�����������', '������', 2500);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('�ظ�����', '�ӱ���', 1200);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('�ظ�����', '������', 1400);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('���̾���ȭ���Ǳ���', '������', 1700);

commit;

select *
from tbl_authorbook;

------ tbl_authorbook ���� ������ ������ ���������� �����ϼ���.

-- ��������

select bookname, count(*)
from tbl_authorbook
group by bookname

select *
from tbl_authorbook
where bookname in ( select bookname
                    from tbl_authorbook
                    group by bookname
                    having count(*) > 1
                    )
                    
                    
select A1.*
from tbl_authorbook A1, tbl_authorbook A2 -- self join
where A1.bookname = A2.bookname and
      A1.authorname != A2.authorname
      
-- ��������      
---------------------------------------------------------------------
�μ���ȣ  �����ȣ  �����  �Ի�����  ���ӻ�������ȣ   ���ӻ����
 60       105      
----------------------------------------------------------------------
select *
from employees

-- 1992 code
select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 ,employees E2
where E1.manager_id = E2.employee_id(+)
order by 1,2


select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 ,employees E2
where E1.manager_id = E2.employee_id(+)
and E1.department_id in (20,50,60)
order by 1,2

-- 1998 code

select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 left join employees E2
on E1.manager_id = E2.employee_id
order by 1,2

select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 left join employees E2
on E1.manager_id = E2.employee_id
where E1.department_id in (20,50,60)
order by 1,2

-----------!!!!!!! ���� ------------------(107���� ���;���!!)
-------------------------------------------------------------------------------------------
�μ���ȣ  �μ��� �μ��ּ�  �μ����  �����ȣ  ����� ����  �ҵ漼��  �μ������������  �μ����������        
-------------------------------------------------------------------------------------------
select *
from tbl_taxindex;

select *
from employees
order by department_id;

select *
from departments;

select *
from locations;

select department_id,
       trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSALAGE
from employees
group by department_id;

------------------------------------------------------------------------

select D.department_id AS �μ���ȣ, D.department_name AS �μ���,
       L.street_address AS �μ��ּ�,
       E1.first_name || ' ' || E1.last_name AS �μ����,
       E2.employee_id AS �����ȣ,
       E2.first_name || ' ' || E2.last_name AS �����,
       nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12 AS ����,
       ( nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12 ) - V.yearsalage AS �μ������������,
       dense_rank() over(partition by E2.department_id
                         order by nvl(E2.salary + (E2.salary * E2.commission_pct),E2.salary) desc) AS �μ����⺻�޿�����,
       to_char( (nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12) * T.taxpercent, '$999,999,999,999,999') AS �ҵ漼
       
from employees E1 join departments D
on E1.employee_id = D.manager_id
right join employees E2
on D.department_id = E2.department_id
left join locations L
on L.location_id = D.location_id
join (select department_id,
             trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) *12 AS YEARSALAGE
      from employees
      group by department_id)V
on nvl(V.department_id, -9999) = nvl(D.department_id, -9999)
join tbl_taxindex T
on E2.salary between T.lowerincome and T.highincome







-------------- *** UNION / UNION ALL / INTERSECT / MINUS *** ----------------

1. UNION �� ���̺�(��)�� ���̺�(��)�� ���ļ� �����ִµ�
   �̰��� ��� ���� ��ģ ����� �����ִ� ���̴�.
   
   A = { a, x, b, e, g}
   B = { c, d, a, b, y, k, m}
   
   A �� B = {}  ==> UNION  {a,b,c,d,e,g,k,m,x,y} �ߺ�X ���� O.
                    UNION ALL  {a,x,b,e,g,c,d,a,b,y,j,m} �ߺ�O ����X
   A �� B = {} ==> INTERSECT {a,b}
   A - B = {} ==> MINUS {x,e,g}
   B - A = {} ==> MINUS {c,d,y,k,m}
   
   
select *
from tbl_panmae;

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '�����', 15);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '���ڱ�', 10);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '�����', 5);
commit;

select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) = to_char(sysdate , 'yyyy-mm' );

create table tbl_2018_02
as
select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) = to_char(add_months(sysdate,-1) , 'yyyy-mm' );

create table tbl_2018_01
as
select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) = to_char(add_months(sysdate,-2) , 'yyyy-mm' );

select *
from tbl_2018_01

select *
from tbl_2018_02

delete from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) != to_char(sysdate , 'yyyy-mm' );

select *
from tbl_panmae

-- ���̺�� �����ϱ�
rename tbl_2018_01 to tbl_panmae_2018_01;
rename tbl_2018_02 to tbl_panmae_2018_02;


--------------------------------
  ��ǰ��    �Ǹſ�     ���Ǹŷ�
--------------------------------
           2018-01
           2018-02
           2018-03

select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm') AS �Ǹſ�,
       sum(panmaesu) AS ���Ǹŷ�
from
(
select *
from tbl_panmae_2018_01
union
select *
from tbl_panmae_2018_02
union
select *
from tbl_panmae
)V
group by rollup( jepumname,to_char(panmaedate, 'yyyy-mm') )

select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm') AS �Ǹſ�,
       sum(panmaesu) AS ���Ǹŷ�
from
(
select *
from tbl_panmae_2018_02
union all
select *
from tbl_panmae_2018_01
union all
select *
from tbl_panmae
)V
group by rollup( jepumname,to_char(panmaedate, 'yyyy-mm') );


select *
from tbl_panmae_2018_02
union
select *
from tbl_panmae_2018_01
union
select *
from tbl_panmae;

insert into tbl_panmae
select *
from tbl_panmae_2018_01
where jepumname = '�����';

select *
from tbl_panmae
intersect
select *
from tbl_panmae_2018_01;

select *
from tbl_panmae
minus
select *
from tbl_panmae_2018_01;

select *
from tbl_panmae_2018_01
minus
select *
from tbl_panmae;


select *
from tbl_panmae_2018_01
union
select panmaedate AS �Ǹ�����,  -- ���Ұ� AS�� �׻� ������
       jepumname AS ��ǰ��,
       panmaesu AS �Ǹŷ�
from tbl_panmae_2018_02
union
select *
from tbl_panmae;

select panmaedate AS �Ǹ�����, 
       jepumname AS ��ǰ��,
       panmaesu AS �Ǹŷ�
from tbl_panmae_2018_01
union
select *
from tbl_panmae_2018_02
union
select *
from tbl_panmae;

select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss' ) AS �Ǹ�����, 
       jepumname AS ��ǰ��,
       panmaesu AS �Ǹŷ�
from tbl_panmae_2018_01
union
select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss'),
       jepumname ,
       panmaesu
from tbl_panmae_2018_02
union
select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss'),
       jepumname,
       panmaesu
from tbl_panmae;




--- *** ���̺� �����ϱ� *** ---
--1.  1:1 ������ ���̺� �����ϱ�

create table tbl_userlogin
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(30) not null,
 constraint PK_tbl_userlogin_userid primary key(userid)
);

create table tbl_userdetail
(userid varchar2(20) not null,
 gender number(1) not null,
 birth varchar2(10) not null,
 address varchar2(200) not null,
 tel varchar2(20),
 registerday date default sysdate, -- ���� ������ �ڵ����� sysdate ����
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- �ܷ�Ű ����
            references tbl_userlogin(userid)
            on delete cascade,   -- �θ� ���̺��� � ���� �����ϸ� �ڽ� ���̺��� �ڵ�����
                                 -- ���̺��� ���谡 1:1 �̶�� foreign key ������ on delete cascade �� ���ش�.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ) -- check ����          
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '����� ���빮��', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '����� ���α�', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;

-- ȸ��Ż��
delete from tbl_userlogin
where userid =  'superman';

rollback;

select *
from dictionary
where table_name like 'USER_%' and lower(comments) like '%sequence%'

select *
from USER_SEQUENCES;

create sequence seq_tbl_order
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table tbl_order 
(orderno varchar2(30) not null, -- ������
 userid varchar2(20) not null,
 orderday date default sysdate not null,
 constraint PK_tbl_order_orderno primary key(orderno),
 constraint FK_tbl_order_userid foreign key(userid)
            references tbl_userdetail(userid)
);

insert into tbl_order(orderno, userid, orderday)
values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);

commit

select *
from tbl_order;

-- ȸ��Ż��
delete from tbl_userlogin
where userid =  'superman'; --����

delete from tbl_userlogin
where userid =  'wonderwoman';

rollback;
---- *** ���̺� �����ϱ� *** ---
-- �ڽ� ���̺��� ���� ������ �� �θ� ���̺��� �����Ѵ�.

-- drop table tbl_userlogin -- ����

drop table tbl_order purge;
drop table tbl_userdetail purge;
drop table tbl_userlogin purge;


create table tbl_userlogin
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(30) not null,
 status number(1) default 1 not null, -- ȸ�� Ż������ üũ �÷�. 1�̸� ����, 0�̸� Ż��
 constraint PK_tbl_userlogin_userid primary key(userid),
 constraint CK_tbl_userlogin_status check( status in(0,1) )
);

create table tbl_userdetail
(userid varchar2(20) not null,
 status number(1) default 1 not null,
 gender number(1) not null,
 birth varchar2(10) not null,
 address varchar2(200) not null,
 tel varchar2(20),
 registerday date default sysdate, -- ���� ������ �ڵ����� sysdate ����
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- �ܷ�Ű ����
            references tbl_userlogin(userid)
            on delete cascade,   -- �θ� ���̺��� � ���� �����ϸ� �ڽ� ���̺��� �ڵ�����
                                 -- ���̺��� ���谡 1:1 �̶�� foreign key ������ on delete cascade �� ���ش�.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ), -- check ����
 constraint CK_tbl_userdetail_status check( status in (0,1) ) 
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '����� ���빮��', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '����� ���α�', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;
-- �α��� ó��
select count(*)
from tbl_userlogin
where status = 1 and
      userid = 'superman' and
      passwd = 'qwer1234$';

select case(select count(*)
            from tbl_userlogin
            where status = 1 and
                  userid = 'superman' and
                  passwd = 'qwer1234$' ) 
       when 1 then '�α��μ���' 
       else '�α��ν���' end AS �α��ΰ��
from dual;

-- ȸ��Ż��
update tbl_userlogin set status = 0
where userid = 'superman';

update tbl_userdetail set status = 0
where userid = 'superman';

rollback;

-- *** ��ǰī�װ� ���̺� ***
create table tbl_category 
(categoryno number(5) not null,
 categoryname varchar2(100) not null, -- ���� ������ ���� �ڵ�ȭ
 constraint PK_tbl_category_categoryno primary key(categoryno)
);

insert into tbl_category(categoryno, categoryname)
values(1, '������ǰ');

insert into tbl_category(categoryno, categoryname)
values(2, '�Ƿ�');

insert into tbl_category(categoryno, categoryname)
values(3, '����');

commit;

-- *** ��ǰ ���̺� *** --
create table tbl_product
(productcode varchar2(20) not null,
 fk_categoryno number(5) not null,
 produckname varchar2(100) not null,
 price number not null, -- �ܰ�
 releaseday date, -- ����� 
 constraint PK_tbl_product_productcode primary key(productcode),
 constraint FK_tbl_product_fk_categoryno foreign key(fk_categoryno)
            references tbl_category(categoryno)
            on delete cascade
);

insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('ss12345', 1, '�̳̽����', 700000, to_date('2017-05-01', 'yyyy-mm-dd') );


insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('jj12345', 2, 'LED ���̵� TV', 900000, to_date('2018-03-01', 'yyyy-mm-dd') );

commit;

drop sequence seq_tbl_order; -- ������ ����

create sequence seq_tbl_order
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table tbl_order 
(orderno varchar2(30) not null, -- ������
 userid varchar2(20) not null,
 orderday date default sysdate not null,
 constraint PK_tbl_order_orderno primary key(orderno),
 constraint FK_tbl_order_userid foreign key(userid)
            references tbl_userdetail(userid)
);

insert into tbl_order(orderno, userid, orderday)
values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);


select *
from tbl_order;

-- ȸ�� Ż��

update tbl_userlogin set status = 0
where userid = 'superman';

update tbl_userdetail set status = 0
where userid = 'superman';

create sequence seq_tbl_order_detail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

--  *** �ֹ��� ���̺� ***
create table tbl_order_detail
( orderdetailno number not null, -- ������ �Ϸù�ȣ
  fk_orderno varchar2(30) not null,
  fk_productcode varchar2(30) not null,
  quantity number not null,  -- �ֹ���
  price number not null, -- ������ȭ(�ܰ�)
  constraint PF_tbl_order_detail primary key(orderdetailno),
  constraint FK_tbl_order_detail_orderno foreign key (fk_orderno)
             references tbl_order(orderno)
             on delete cascade,
  constraint FK_tbl_order_detail_fk_pcode foreign key(fk_productcode)
             references tbl_product -- ��ǰ�� ������� ����� ���ƾ��ϱ� ������ on delete cascade X 
);


insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
values (seq_tbl_order_detail.nextval,
        (select max(orderno)
          from tbl_order
          where userid = 'superman'),
        'ss12345',
        2,
        (select price
          from tbl_product
          where productcode = 'ss12345'
         )
       );

insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
values (seq_tbl_order_detail.nextval,
        (select max(orderno)
          from tbl_order
          where userid = 'superman'),
        'jj12345',
        1,
        (select price
          from tbl_product
          where productcode = 'jj12345'
         )
       );
       
commit; 

select *
from tbl_order;

select *
from tbl_order_detail;

/*
------------------------------------
��ǥ  ��ǰ��   �ֹ���   �ܰ�    �ֹ���
-----------------------------------
*/

select A.orderno AS ��ǥ,
       C.produckname AS ��ǰ��, 
       B.quantity As �ֹ���,
       B.price AS �ܰ�,
       B.quantity * B.price AS �ֹ���
from tbl_order A join tbl_order_detail B
on A.orderno = B.fk_orderno
join tbl_product C
on B.fk_productcode = C.productcode
where A.userid = 'superman';

update tbl_product set price = price + (price * 0.1)
where productcode = 'ss12345';

commit;

insert into tbl_order(orderno, userid, orderday)
values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);

insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
values (seq_tbl_order_detail.nextval,
        (select max(orderno)
          from tbl_order
          where userid = 'superman'),
        'ss12345',
        2,
        (select price
          from tbl_product
          where productcode = 'ss12345'
         )
       );

create table tbl_sawon
( sano varchar2(20),
  saname varchar2(30) not null,
  jubun varchar2(13) not null,
  constraint PK_tbl_sawon_sano primary key(sano,saname)  -- Composite Primary Key(���� �����̸Ӹ�Ű)
);

drop table tbl_sawon purge;

create table tbl_sawon
( sano varchar2(20),
  saname varchar2(30),
  jubun varchar2(13) not null,
  constraint PK_tbl_sawon_sano primary key(sano),  -- Composite Primary Key(���� �����̸Ӹ�Ű)
  constraint UQ_tbl_sawon_jubun unique(jubun),
  constraint UQ_tbl_sawon_saname unique(saname)
); -- �� ���̺�� unique key ������ ������ �����ϴ�.
   -- ������ primary key ������ �ѹ��� �����ϴ�.


insert into tbl_sawon(sano, saname, jubun)
values('kh1001', '�̼���', '9003091234567');

insert into tbl_sawon(sano, saname, jubun)
values('kh1002', '�Ѽ���', '9003091234567'); -- ���� 

insert into tbl_sawon(sano,saname, jubun)
values('kh1003', '�̼���', '8703091234567'); -- ����

insert into tbl_sawon(sano, saname, jubun)
values('kh1004', null, '8703091234567'); 

insert into tbl_sawon(sano,saname, jubun)
values('kh1005', null, '7703091234567');  -- ����Ŭ�� null�� ������ ��� 
 
insert into tbl_sawon(sano,saname, jubun)
values('kh1006', '����ȭ', null);  -- ����

commit;

select *
from tbl_sawon

/*
-- *** ���������� ��ȸ *** ---
 << ���������� ���� >> 
 1. Primary Key   (P)
 2. Unique        (U)
 3. Check         (C)
 4. Foreign Key   (R)
 5. Not null      (C)
 
*/

select *
from user_constraints
where table_name = 'TBL_SAWON'

select *
from user_constraints
where table_name = 'TBL_USER'

select *
from user_cons_columns
where table_name = 'TBL_USER'

select *
from user_constraints
where table_name = 'TBL_USERDETAIL'

select *
from user_cons_columns   
where table_name = 'TBL_USERDETAIL'

-- ���������� ��ȸ�� ������ ���� JOIN �� �ؼ� ����.
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERDETAIL';

-- ** ���������� �߰� ** --
alter table tbl_userlogin
add constraint CK_tbl_userlogin_passwd check( 8 < length(passwd) and length(passwd) <= 20 );

select *
from tbl_userlogin;

update tbl_userlogin set passwd = 'abc123$'
where userid = 'superman'; -- �н����� üũ���࿡ �ɷ��� ����

update tbl_userlogin set passwd = 'abcd1234$'
where userid = 'superman'; 

commit

desc tbl_userdetail;

alter table tbl_userdetail
add constraint NN_tbl_userdetail tel not null; -- ����
/*
 ���������� �߰��� primary key, unique, check, foregin key ������ �߰���
 alter table ���̺��
 add constraint ����Ʈ����Ʈ�̸� primary key(�÷���);
 add constraint ����Ʈ����Ʈ�̸� unique(�÷���);
 add constraint ����Ʈ����Ʈ�̸� check(�÷���);
 add constraint ����Ʈ����Ʈ�̸� foreign key(�÷���);
                references �θ����̺��(�����޴� �÷Ÿ�)

���������� �߰��� not null �� �Ʒ��� ���� �Ѵ�.
alter table ���̺��
modify �÷��� not null;
*/

alter table tbl_userdetail
modify tel not null;
                
desc tbl_userdetail;

--- *** ���������� ���� *** ---
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

alter table tbl_userlogin
drop constraint ck_tbl_userlogin_passwd;

-- ** not null ������ ������ 2���� ����� �ִ�. --
alter table tbl_userlogin
drop constraint SYS_C007039 ;

alter table tbl_userlogin
modify name null;

select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

-- ** ���̺� �÷� �߰��ϱ� ** --
alter table tbl_sawon
add email varchar2(30);

desc tbl_sawon;

select *
from tbl_sawon;

-- not null ������ �ְ��� �ҋ�
alter table tbl_sawon
add email varchar2(30) not null; -- ����
-- �̹� tbl_sawon ���̺��� �����Ͱ� �� �ִ� �����ε�
-- email �÷��� �־����ڸ��� not null �� �ؾ��ϴµ� ���� �־��ټ��� ����.

alter table tbl_sawon
add email varchar2(30) default ' ' not null; 

desc tbl_sawon;

select *
from tbl_sawon;

-- ** ���̺� �÷� �����ϱ� ** --
alter table tbl_sawon
drop column email;

desc tbl_sawon;

select *
from tbl_sawon;

-- ** Ư�� ���̺� default ���� ������ �ִ��� ��ȸ�ϱ� ** --
select *
from user_tab_columns
where table_name = 'TBL_SAWON'

select *
from user_tab_columns
where table_name = 'TBL_ORDER'

-- ** default �� �����ϱ� ** --
alter table tbl_sawon
modify email default ' ';

alter table tbl_order
modify orderday default sysdate;

-- ** ���̺� �÷��� �����ϱ� ** --
alter table tbl_sawon
rename column email to mail;

select *
from tbl_sawon;

-- ** ���̺�� �����ϱ� ** --
rename tbl_sawon to tbl_emp;

select *
from tbl_emp;

rename tbl_emp to tbl_sawon;

-- �÷��� ������ Ÿ�� ũ�� �����ϱ� 

alter table tbl_sawon
modify saname varchar2(50)


create table tbl_empcopy1
as
select *
from employees

create table tbl_empcopy2
as
select *
from employees;

create table tbl_empcopy3
as
select *
from employees;

create table tbl_empcopy4
as
select *
from employees;

create table tbl_empcopy5
as
select *
from employees;

select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_EMPCOPY5';

create table tbl_mber
(id varchar2(10) not null,
 name varchar2(20) not null,
 constraint PK_tbl_mber_id primary key(id)
);

create table tbl_mber2
(id varchar2(10),
 name varchar2(20) not null,
 constraint PK_tbl_mber2_id primary key(id)
);

desc tbl_mber

/*
�̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

desc tbl_mber2

/*
�̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

insert into tbl_mber(id, name) values ('lee', '�̼���');
insert into tbl_mber2(id, name) values ('lee', '�̼���');
commit;

create table tbl_mber_copy
as
select *
from tbl_mber
where 1=2; -- ���̺� �÷������� ī���Ҷ�

create table tbl_mber2_copy
as
select *
from tbl_mber2
where 1=2;

desc tbl_mber_copy;

/*
�̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 

*/
desc tbl_mber2_copy;

/*
�̸�   ��        ����           
---- -------- ------------ 
ID            VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

-- ** ���̺� �����ϱ�(�����뿡 ������) ** --
drop table tbl_empcopy1;

drop table tbl_empcopy2;

drop table tbl_empcopy3;


select *
from tab;
-- BIN$~~~~~ �� �����°��� �����뿡 ������ ���̺�

select *
from "BIN$+cJi+3iHT5aM6ni5+MfrGA==$0";

select *
from "BIN$/j2GmVVTTniBa5hOA5+v1Q==$0"

select *
from "BIN$2GpPfldgQ1Cr31OIRRnLTA==$0"

-- ** ������ ���� ** --
select *
from user_recyclebin

-- ** �����뿡 ������ ���̺� �����ϱ� ** --
flashback table TBL_EMPCOPY1 to before drop;
flashback table TBL_EMPCOPY2 to before drop;
flashback table TBL_EMPCOPY3 to before drop;

-- ** �����뿡 ������ ���̺� �����ϱ� ** --
purge table TBL_EMPCOPY1;

-- ���̺� ������ �����뿡 ������ �ʰ� ������ �����ϱ�

drop table tbl_empcopy4 purge;

/*
--- *** Index(�ε���) *** ---
 - Index(�ε���)�� �����ϴ� ������ �˻�(select)�� �����ϱ� �����̴�.
 - Index(�ε���)�� å�� �޸鿡 ������ ����(�ε���)�� ���� �ǹ̸� ������.
 - Index(�ε���)�� �����ϸ� select �ӵ��� ��������
   DML(insert, update, delete, merge) �ӵ��� ��������. �׷��Ƿ� where ����
   ���� ���Ǿ����� �÷��� ������ �Ѵ�.
   
 - Index(�ε���)�� ���Ǿ����� �÷��� ���õ�(selectivity)�� ���� �÷��̾�� �Ѵ�!!.
   ���õ��� ���ٴ� ���� ������ ������ ���ٴ� ���̴�. ��) �ֹι�ȣ, �й�, �����ȣ �� ...
 
 << ��� >>
-----------------------------------------------------------
  �����ȣ    �����   ����    �ֹι�ȣ    �޿�    �Ի���
-----------------------------------------------------------
  number    varchar2 varchar2 varchar2 number  date

 - �ε����� ���Ǿ����� �÷��� ��ȸ��(select) �������� �ʰ� �׷��� ���Ǿ�����
   �÷��̾�� �Ѵ�. �ε����� ���Ǿ����� �÷��� �Լ��� ����Ͽ� ���� ����Ǹ�
   �ε��� ����� �Ҿ������ �����̴�.
   ��) ���� "���" ���̺��� �Ի���(date default�� sysdate) �÷��� �ε����� �־��ٸ�
       ��ȸ�� where �Ի����� = '2018-03-13 10:05:07' �̷������� �˻��� �ؾ��Ѵ�.
       �Ϲ������� where to_char(�Ի����� , 'yyyy-mm-dd') = '2018-03-13' ����
       ��ȸ�� �ϹǷ� �Ի����� �÷��� ���� �Լ��� ����Ͽ� ����ǹǷ� �ε����� ������� �ʰ�
       ���̺� Full Scan �Ͽ� �˻��Ѵ�.
       
 - �������� Primary Key, Unique ������ �ɷ��� �÷��� �ڵ�������
   unique �� Index�� �����Ǿ�����.
 - �����ȣ => Primary key / �ֹι�ȣ => Unique �� �ָ�
   �����ȣ�� �ֹι�ȣ���� �ε����� �ڵ������� �����Ǿ�����.
 - �׷��� �˻�����(where)�� ������� ���� ����Ѵٶ�� ����� �÷��� �ε����� �������ָ� �ȴ�.
*/

create index idx_sawon_saname
on tbl_sawon(saname); -- tbl_sawon ���̺��� saname �÷��� ����
                      -- insert or update �� �ߺ��� ���� ����Ѵ�. (�������� ����)

create unique index idx_sawon_saname
on tbl_sawon(saname); -- tbl_sawon ���̺��� saname �÷��� ����
                      -- insert or update �� ������ ���� ������. (�������� �Ұ�)
                      
create index idx_sawon_saname
on tbl_sawon(saname desc); --> �ε����� Ư¡�� ���ĵǾ����� ���ε� desc �����ָ�
                           -- saname�� ������������ �����Ѵ�.(������ ��������)

/*
------ *** Composite Index(�����ε���) *** ---------
 - Composite Index(�����ε���)��?
   2�� �̻��� �÷��� ��� �ϳ��� �ε����� ����� ��.
*/
select jik, salary
from tbl_sawon
where saname = '�̼���';

-- ���������� ���� ���� ��ȸ�ϴ� ���� ���� ����ϴٶ��
-- saname, jik, salary �÷��� ��� �ϳ��� Index(�ε���)�� �����ϴ� ���� �ӵ��� ��������.
-- ** �߿� ** --
-- Composite Index(�����ε���)�� ���鋚 �����÷��� � �÷����� �������ΰ�? �� �߿��ϴ�!!!!

create indeex idx_tblsawon_test
on tbl_sawon(saname, jik, salary);
--> �ε��� idx_tblsawon_test �� �����÷��� saname �̴�.

create indeex idx_tblsawon_test
on tbl_sawon(jik, saname, salary);
--> �ε��� idx_tblsawon_test �� �����÷��� jik �̴�.
/*
 - �����÷��� �����ϴ� ������ ù������ ���õ�(selectivity)�� ���ƾ� �Ѵ�.
 - �ι����� where ���� �ܵ����� ���� ���Ǿ����� �Ѵ�.
 
 --- select(��ȸ)�� �����ε����� �����Ǿ��� �ε����� ����ϱ� ���ؼ���
     �ݵ�� where ���� �����÷��� �;��Ѵ�. where ���� �����÷��� ���ٶ��
     �ε����� ��������ʰ� ���̺� Full Scan �ϱ� �����̴�.
     
 ��> create index idx_tblsawon_test
     on tbl_sawon(saname, jik, salary);
     --> �����÷��� saname�̴�.
     
     select jik, salary
     from tbl_sawon
     where saname = '�̼���';
     --> �ε��� indx_tblsawon_test �� ����ؼ� �˻���.
     
     select saname, jik, salary
     from tbl_sawon
     where saname = '����' and salary = 5000;
     --> �ε��� indx_tblsawon_test �� ������� �ʰ� ���̺� Full Scan �Ͽ� �˻��Ѵ�.
     
     select jik, salary
     from tbl_sawon
     where salary = 5000 and saname = '�̼���';
     --> �ε��� indx_tblsawon_test �� ����ؼ� �˻���.
*/


--- *** �����Ǿ��� �ε��� ��ȸ�ϱ� *** ---
 
 select *
 from user_indexes
 where table_name = 'TBL_USERDETAIL'


--- *** �ε��� �����ϱ� *** ---
create unique index idx_tbl_userlogin_name
on tbl_userlogin(name);

select *
from user_indexes
where table_name = 'TBL_USERLOGIN';

select *
from user_ind_columns
where table_name = 'TBL_USERLOGIN'

select *
from user_indexes A join user_ind_columns B
on A.index_name = B.index_name
where A.table_name = 'TBL_USERLOGIN';

select *
from tbl_userlogin;

insert into tbl_userlogin(userid, passwd, name)
values ('batman', 'qwer1234$', '������'); -- ����! �ε��������� name�� unique�� �ؼ�

--- *** �ε��� �����ϱ� *** ---

drop index idx_tbl_userlogin_name;

create index idx_tbl_userlogin_name
on tbl_userlogin(name);

insert into tbl_userlogin(userid, passwd, name)
values ('batman', 'qwer1234$', '������');

rollback;

select *
from user_indexes A join user_ind_columns B
on A.index_name = B.index_name
where A.table_name = 'TBL_SAWON';

drop index UQ_TBL_SAWON_SANAME; -- �����߻�!!!

-- Primary Key / Unique �������� �����Ǿ��� �ε����� ������ drop index �� �ƴ϶�
-- ���������� ������ �ϸ� �ڵ������� �ε����� �����ȴ�.

alter table tbl_sawon
drop constraint UQ_TBL_SAWON_SANAME;
-- �� �ϸ� ���������� �����ʰ� ���ÿ� �ε����� �����ȴ�. 

/*
  DDL(Data Definition Language) --> create, drop, alter, truncate
  DML(Data Manuplation Language) --> insert, update, delete, merge
  DCL(Data Control Language) --> graint(������ �ִ°�), revoke(������ ���Ҵ°�)
  TCL(Transaction Control Language) --> commit, rollback

  -- DML(Data Manuplation Language)�� �� ���� commit �̰�
  -- ������ DDL, DCL ���� �����ϸ� �ڵ������� commit�� �Ͼ��.
*/

 create table tbl_a
 (no    number
 ,name  varchar2(20)
 );
 
 insert into tbl_a(no, name) values(1,'�Ѽ���');
 commit;
 
 insert into tbl_a(no, name) values(2,'�μ���');
 
 create table tbl_b
 (no    number
 ,name  varchar2(20)
 ); -- auto commit �� �߻���.
 
 rollback;
 
 select *
 from tbl_a;
 -- �μ��Դ� rollback �� ���� �ʰ� insert �Ǿ��� ����.


/*
                 -- *** PL/SQL *** ---
      Procedure Language / Structured Query Language
*/

-- ******* PL/SQL �������� ������ ���� *********
execute �Ǵ� exec

exec pcd_empinfo(101); // exe pcd_empinfo(�����ȣ);
exec pcd_empinfo(102);
exec pcd_empinfo(103);

<< ����� >>
-----------------------------------
�����ȣ  ����� ����  ����
-----------------------------------
 101    ...   ...   ...

create or replace procedure pcd_empinfo
(p_employee_id IN number)
is
  ������ �����ϴ� �κ�
begin 
   �����Ͼ��� �������� ������ �κ�
   ������ ���๮�� ������ �ݵ�� ; �� �����ؾ� �Ѵ�.

end;

create or replace procedure pcd_empinfo
(p_employee_id IN number)
is
 v_empno number(5);
 v_ename varchar2(50);
 v_gender varchar2(10);
 v_monthsal number(10);
begin
      select employee_id,
             first_name || ' ' || last_name,
             case when substr(jubun, 7, 1) in ('1','3') then '��' else '��' end,
             nvl(salary + (salary * commission_pct), salary) 
        into
             v_empno, v_ename, v_gender, v_monthsal
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '�����ȣ ����� ����  ����' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_empno || '  ' || v_ename || '  ' ||
                            v_gender || '  ' || v_monthsal
                           );
end;
-- ���� �߻��� cmd ���� ����Ŭ���� ( sqlplus/nolog ) -->  conn hr/eclass
-- �ڵ� ������ / �Է���  show errors �� Ȯ��

--------------------------- �ٸ���� --------------------------------------------
create or replace procedure pcd_empinfo2
(p_employee_id IN employees.employee_id%type) -- employees���ִ� employee_id Ÿ������ ����.
is
 v_empno number(5);
 v_ename varchar2(50);
 v_gender varchar2(10);
 v_monthsal number(10);
begin
      select employee_id,
             first_name || ' ' || last_name,
             case when substr(jubun, 7, 1) in ('1','3') then '��' else '��' end,
             nvl(salary + (salary * commission_pct), salary) 
        into
             v_empno, v_ename, v_gender, v_monthsal
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '�����ȣ ����� ����  ����' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_empno || '  ' || v_ename || '  ' ||
                            v_gender || '  ' || v_monthsal
                           );
end ;

---------------------------------------------------------------------------------
/*
 ���̺� == entity(��ü)
 �� == row == record == tuple
 �� == column == field == attribute
*/

create or replace procedure pcd_empinfo3
(p_employee_id IN employees.employee_id%type) -- employees���ִ� employee_id Ÿ������ ����.
is
  -- record Ÿ�� ����
  type myemptype
  is record
  (empno employees.employee_id%type,
   ename varchar2(50),
   gender varchar2(10),
   monthsal number(10)
  );
  v_emprcd myemptype;
begin
      select employee_id,
             first_name || ' ' || last_name,
             case when substr(jubun, 7, 1) in ('1','3') then '��' else '��' end,
             nvl(salary + (salary * commission_pct), salary) 
        into v_emprcd
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '�����ȣ ����� ����  ����' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_emprcd.empno || '  ' || v_emprcd.ename || '  ' ||
                            v_emprcd.gender || '  ' || v_emprcd.monthsal
                           );
end;

---------------------------------------------------------------------------------

create or replace procedure pcd_empinfo4
(p_employee_id IN employees.employee_id%type) -- employees���ִ� employee_id Ÿ������ ����.
is
  v_empall employees%rowtype;
  v_result varchar2(4000); -- varchar2(4000) �� �ִ�ġ. �Ѿ�� clob�� ��ü�Ѵ�(4GB)��������
begin
      select *
        into v_empall
      from employees
      where employee_id = p_employee_id;
      
      v_result := v_empall.employee_id || ' ' ||
                  v_empall.first_name || ' ' ||
                  v_empall.last_name || ' ' ||
                  case when substr(v_empall.jubun, 7, 1) in ('1','3') then '��' else '��' end || ' ' ||
                  nvl(v_empall.salary + (v_empall.salary * v_empall.commission_pct), v_empall.salary);
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '�����ȣ ����� ����  ����' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_result );
end;

exec pcd_empinfo(103);
exec pcd_empinfo2(103);
exec pcd_empinfo3(103);
exec pcd_empinfo4(103);


----------- *** procedure, function, trigger �� �ҽ� ���� *** --------------

select *
from user_source
where type = 'PROCEDURE';

select distinct name
from  user_source
where type = 'PROCEDURE';
 
select line, text 
from  user_source
where type = 'PROCEDURE' and name = 'PCD_EMPINFO' ; 

select line, text 
from  user_source
where type = 'PROCEDURE' and name = 'FUNC_PASSWDCHECK' ; 

------ *** ���(if��) *** --------
�� ����
if ����1 then ���๮�� 1;
elsif ����2 then ���๮�� 2;
else ���๮��3;
end if;

------------------------------------------
 �����ȣ ����� ��������  �μ���ȣ  �μ�Ƽ��
------------------------------------------

create table tbl_busiperformance
as
select employee_id,
       first_name || ' ' || last_name AS ENAME,
       salary AS BUSIPERFORM,
       department_id,
       0 AS INSENTIVE
from employees;


desc tbl_busiperformance;

select *
from tbl_busiperformance
where employee_id = 101;


/*
  tbl_busiperformance ���̺��� �����ȣ�� �Է¹޾� �ش� ����� ��������(BUSIPERFORM)
  20000 �̻��̸� �μ�Ƽ��� 100�� �ְ�, 10000�̻� 20000 �̸��̸� �μ�Ƽ��� 80�� �ְ�,
   7000 �̻� 10000�̸��̸� �μ�Ƽ�� 50 �� �ְ�, 7000 �̸��̸� �μ�Ƽ�� 0�� �ֵ���
   insentive �÷��� ���� �����Ͻÿ�.
*/

exec pcd_insentive(101);
/*
  --------------------------------------------------------
  �����ȣ    �����  ��������   �λ����μ�Ƽ��     �λ����μ�Ƽ��
  --------------------------------------------------------
*/

exec pcd_insentive(9999);
/*
-----------------------------------------------------------
  �Է��Ͻ� �����ȣ 9999 �� ������ �������� �ʽ��ϴ�.
-----------------------------------------------------------  
*/

create or replace procedure pcd_insentive
(p_employee_id  IN  tbl_busiperformance.employee_id%type)
is
   v_cnt               number(1);
   v_insentive         number(3);
   v_ename             tbl_busiperformance.ename%type; 
   v_busiperform       tbl_busiperformance.busiperform%type; 
   v_before_insentive  tbl_busiperformance.insentive%type;
   v_after_insentive   tbl_busiperformance.insentive%type;
   v_line        varchar2(60) := lpad('-',60,'-');  -- ������ �ʱ�ȭ 
begin
      select count(*) into v_cnt        
      from tbl_busiperformance
      where employee_id = p_employee_id;

      if v_cnt = 0 then
         dbms_output.put_line( v_line );
         dbms_output.put_line( '�Է��Ͻ� �����ȣ '|| p_employee_id ||'�� ������ �������� �ʽ��ϴ�.' ); 
         dbms_output.put_line( v_line );

         return;  -- ����. 
      end if;

      select ename, busiperform, insentive
          into
             v_ename, v_busiperform, v_before_insentive 
      from tbl_busiperformance
      where employee_id = p_employee_id;

      if    v_busiperform >= 20000 then v_insentive := 100;
      elsif v_busiperform >= 10000 then v_insentive :=  80;
      elsif v_busiperform >=  7000 then v_insentive :=  50;
      else  v_insentive := 0; 
      end if;

      update tbl_busiperformance set insentive = insentive + v_insentive 
      where employee_id = p_employee_id;

      -- commit;

      select insentive 
          into 
             v_after_insentive
      from tbl_busiperformance
      where employee_id = p_employee_id;

      dbms_output.put_line( v_line );
      dbms_output.put_line( '�����ȣ  �����  �λ����μ�Ƽ��  �λ����μ�Ƽ��' ); 
      dbms_output.put_line( v_line );
      dbms_output.put_line( p_employee_id || '   ' ||
                            v_ename || '    '||
                            v_before_insentive || '  ' ||
                            v_after_insentive ); 

end pcd_insentive;

exec pcd_insentive(101);
exec pcd_insentive(9999);


------- *** �ݺ��� *** ----------

create table tbl_looptest
(no number,
 name varchar2(50)
);


1. �⺻ LOOP ��
  �� ����
     LOOP
          ���๮��;
     EXIT WHEN ����; -- ������ ���̶�� LOOP Ż��
     END LOOP;
   
  exec pcd_looptest('������', 10);
  
  create or replace procedure pcd_looptest
  (p_name IN varchar2,
   p_count IN number)
  is
    v_cnt number := 0;
  begin
      loop
        v_cnt :=  v_cnt + 1;
      exit when p_count < v_cnt ;
        insert into tbl_looptest(no, name)
        values(v_cnt, p_name || v_cnt);
      end loop;
  
      commit;
  end pcd_looptest;
  
  select *
  from tbl_looptest;
  
  
-- ��������
exec pcd_sum(1,10)
exec pcd_sum(2,10)
--  <�����>
--  1 ���� 10������ ���� 55 �Դϴ�.

create or replace procedure pcd_sum
(v_num1 IN number,
 v_num2 IN number)
is
  v_sum number := 0;
  v_num number := v_num1;
begin
  loop
    v_sum := v_sum + v_num;
    v_num := v_num + 1;
  exit when v_num > v_num2;
  
  end loop;
  
  dbms_output.put_line(v_num1 || ' ���� ' || v_num2 || ' ������ ���� ' || v_sum || '�Դϴ�.' );
end;
  

-- ��������
exec pcd_sum2(1,10,1); -- 3��° �Ķ���ʹ� Ȧ�� ¦�� ����
exec pcd_sum2(1,10,2);
-- <�����>
-- 1���� 10������ Ȧ���� ���� �Դϴ�

create or replace procedure pcd_sum2
 (p_start_num  IN  number   --  1  2
 ,p_end_num    IN  number   -- 10 10
 ,p_flag       IN  number
 )
 is
     v_holjak  varchar2(4);
     v_sum     number := 0;
     v_cnt     number := p_start_num;
 begin
  -- if( p_flag != 1 and p_flag != 2 ) then
     if( p_flag not in(1,2) ) then
       dbms_output.put_line('����° �Ű������� ���ڰ��� 1(Ȧ��) �Ǵ� 2(¦��) �̾�߸� �մϴ�.');
       return;
     elsif( p_flag = 1 ) then -- Ȧ���� ���� ���Ѵ�.
       v_holjak := 'Ȧ'; 
       if mod(p_start_num, 2) = 0  then -- ó�����۰��� ¦���� ��� 
          v_cnt := v_cnt + 1;
       end if;

     elsif( p_flag = 2 ) then -- ¦���� ���� ���Ѵ�.
       v_holjak := '¦'; 
       if mod(p_start_num, 2) != 0  then -- ó�����۰��� Ȧ���� ��� 
          v_cnt := v_cnt + 1;
       end if;

     end if;

     loop
        v_sum := v_sum + v_cnt;
        v_cnt := v_cnt + 2;
     exit when v_cnt > p_end_num;  -- 1, 10 ¦���� ��
                                   -- 2 + 4 + 6 + 8 + 10 + 12 
     end loop;

     dbms_output.put_line(p_start_num ||'���� '|| p_end_num || '������ '|| v_holjak || '���� ���� '|| v_sum ||'�Դϴ�.');  
 end pcd_sum2;

  
2. FOR LOOP ��

create table tbl_forlooptest
(no number,
 name varchar2(50)
);

�� ����
  FOR ���� IN [REVERSE] ���۰�..�������� LOOP -- ������ �ڵ����� ����Ǿ�����.
      ���๮��;
  END LOOP;
  
create or replace procedure pcd_forlooptest
(p_name IN tbl_forlooptest.name%type,
 p_cnt IN tbl_forlooptest.no%type)
is

begin
  for i in 1..p_cnt loop -- ������ 1������ 
    insert into tbl_forlooptest(no, name)
    values(i, p_name || i);
  end loop;
end;

exec pcd_forlooptest('����',20);

select *
from tbl_forlooptest;

rollback;

create or replace procedure pcd_forlooptest
(p_name IN tbl_forlooptest.name%type,
 p_cnt IN tbl_forlooptest.no%type)
is

begin
  for i in REVERSE 1..p_cnt loop -- ������ 1������ 
    insert into tbl_forlooptest(no, name)
    values(i, p_name || i);
  end loop;
end;

--- ������ ������
create or replace procedure gugudan
is
 
begin
  for i in 2..9 loop
    for j in 1..9 loop
      dbms_output.put_line(i || ' * ' || j || ' = ' ||i * j );
    end loop;
  end loop;  
end gugudan;

exec gugudan();


3. WHILE LOOP ��
 �� ����
  WHILE ���� LOOP -- ������ ���̸� �ݺ� �����̸� Ż��
    ���๮��;
  END LOOP;
  
create table tbl_whilelooptest
(no number,
 name varchar2(50)
);

create or replace procedure pcd_whilelooptest
(p_name IN varchar2,
 p_count IN number)
is
  v_cnt number := 0;
begin
  while not(v_cnt >= p_count) loop  -- while not(����) loop : �����̸� Ż��
    v_cnt := v_cnt + 1;
    insert into tbl_whilelooptest(no, name)
    values(v_cnt, p_name || v_cnt);
    
  end loop;
end pcd_whilelooptest;


exec pcd_whilelooptest('�̼���',10);

select *
from tbl_whilelooptest;

commit;


create or replace function func_gender
(p_jubun IN varchar2 ) -- IN : ���� �Է¹޴´� 
return varchar2
is
  v_result varchar2(4);
begin
  select case when substr(p_jubun, 7, 1) in ('1','3')
         then '��' else '��' end
         into v_result -- ������ ����ش�
           
  from dual;
  
  return v_result;
end func_gender;

select employee_id,
       first_name || '' || last_name AS ENAME,
       jubun,
       func_gender(jubun) AS GENDER --  �ֹι�ȣ�� �־��ָ� ���� �������ִ� �Լ�
from employees;



----- *** �ֹι�ȣ ���� *** -----
'9003141234567'

select 9*2 + 0*3 + 0*4 + 3*5 + 1*6 + 4*7 + 1*8 + 2*9 + 3*2 + 4*3 + 5*4 + 6*5
from dual; -- 161

select mod(161,11) -- �� ������� 11�� ���� �������� ���Ѵ�.
from dual; -- 7

select 11 - 7 -- 11���� �� ������� ����.
from dual; -- 4

select mod(4,10) -- �� ������� 10���� ���� �������� ���Ѵ�
from dual; -- 4

if(7 == 4) -- 13��° ���� ��. �ٸ��� ��¥ �ֹι�ȣ

create or replace function fun_jubuncheck
(p_jubun IN varchar2)
return number
is
  v_sum number := 0;
  v_check number(1);
  v_result number(1);
begin
  for i in 1..12 loop
    if (i <9) then 
      v_sum := v_sum + to_number( substr(p_jubun, i, 1) ) * (i+1) ;
    else
      v_sum := v_sum + to_number( substr(p_jubun, i, 1) ) * (i-7) ;
    end if;  
  end loop;
  
  v_check := mod( 11 - mod(v_sum, 11), 10 );
   
  if(v_check = to_number( substr(p_jubun,13,1) ) ) then
    v_result := 1;
  else
    v_result := 0;
  end if;
  return v_result;
end;

select fun_jubuncheck('9003141234564')
from dual;

-----------------------------------------------

select ascii('A') , ascii('a'),
       ascii('0') , ascii('9'),
       ascii('!') , ascii('&')
from dual;

select chr(65), chr(97),
       chr(48), chr(57)
from dual;

-- ���ڿ�(��ȣ)�� �Է¹޾� ���ڿ��� ���̰� 8���� �̻� 20���� �����̸鼭,
-- ������ ���ڿ��� ������, ����, Ư����ȣ(! @ # $ %)�� ȥ�յǾ������� ���ϰ� 1 �ƴϸ� 0


/*
create or replace function func_passwdcheck
(p_passwd IN varchar2)
return number
is
  v_ascii number(3);
  v_check1 number(1) := 0;
  v_check2 number(1) := 0;
  v_check3 number(1) := 0;
begin
  if( length(p_passwd) < 8 or length(p_passwd) > 20 ) then
     return 0;
  else
    for i in 1..length(p_passwd) loop
      v_ascii := ascii( substr(p_passwd,i,1));
      if( v_ascii >= 60 and v_ascii <= 90 or v_ascii >= 97 and v_ascii <= 122 ) then
        v_check1 := 1;
      elsif( v_ascii >= 48 and v_ascii <= 57) then
        v_check2 := 1;
      elsif( v_ascii in ( ascii('!'), ascii('@'), ascii('#'), ascii('$'), ascii('%') ) ) then
        v_check3 := 1;
      end if;
    end loop;
    
    if(v_check1 + v_check2 + v_check3 = 3) then
      return 1;
    else
      return 0;
    end if;
    
  end if;
end;
*/

-- ���ڿ��� �Է¹޾� ���ڿ��� ���̴� 
 -- 8���� �̻� 20���� �����̾���ϰ�
 -- ������ ���ڿ��� ������, ����, Ư����ȣ(! @ # $ %)��
 -- ȥ�յǾ��� ������ 1 �� �����ϰ�
 -- �ƴϸ� 0 �� �����ϴ� �Լ� func_passwdcheck �� 
 -- �����Ͻÿ�.
 
 select ascii('A'), ascii('a')
      , ascii('0'), ascii('9')
      , ascii('!'), ascii('&')
 from dual;
 
 select chr(65), chr(97)
       ,chr(48), chr(57)
 from dual;
 
create or replace function func_passwdcheck
(p_passwd IN varchar2)  -- 'qwer1234$'
return number
is
    v_ascii    number(3);
    v_engflag  number(1) := 0;
    v_numflag  number(1) := 0;
    v_speflag  number(1) := 0; 
begin
    if (length(p_passwd) < 8 OR length(p_passwd) > 20) then 
       return 0;
    else
       for i in 1..length(p_passwd) loop
          v_ascii := ascii( substr(p_passwd, i, 1) );
            -- ���������� �˻� --
            if ( ascii('a') <= v_ascii and v_ascii <= ascii('z') OR
                 ascii('A') <= v_ascii and v_ascii <= ascii('Z')  ) 
               then v_engflag := 1;
            
            -- �������� �˻� -- 
            elsif ( ascii('0') <= v_ascii and v_ascii <= ascii('9') ) 
               then v_numflag := 1;

            -- Ư���������� �˻� -- 
            elsif ( v_ascii in(ascii('!')
                              ,ascii('@')
                              ,ascii('#')
                              ,ascii('$')
                              ,ascii('%') ) )
                then v_speflag := 1;
            end if;
       end loop;

       if (v_engflag + v_numflag + v_speflag = 3)
          then return 1;
       else
          return 0;
       end if;
	
    end if;
        
end func_passwdcheck;


 select func_passwdcheck('qwer1234$'), func_passwdcheck('qwe124$'), func_passwdcheck('qwer12345')
 from dual;  
 

-- **ȸ������ **--

create table tbl_member_login
 (userid   varchar2(20)  not null
 ,passwd   varchar2(20)  not null
 ,name     varchar2(20)  not null 
 ,constraint PK_tbl_member_login primary key(userid)
 );
 


 create table tbl_member_detail
 (fk_userid    varchar2(20)  not null
 ,jubun        varchar2(13)
 ,address      varchar2(200)
 ,tel          varchar2(20)
 ,email        varchar2(30)
 ,point        number default 0
 ,registerday  date default sysdate
 ,constraint PK_tbl_member_detail primary key(fk_userid)
 ,constraint FK_tbl_member_detail_fk_userid foreign key(fk_userid) 
             references tbl_member_login(userid) 
             on delete cascade
 ,constraint UQ_tbl_member_detail_jubun unique(jubun) 
 );


 create table tbl_member_login
 (userid   varchar2(20)  not null
 ,passwd   varchar2(20)  not null
 ,name     varchar2(20)  not null 
 ,constraint PK_tbl_member_login primary key(userid)
 );

 create table tbl_member_detail
 (fk_userid    varchar2(20)  not null
 ,jubun        varchar2(13)
 ,address      varchar2(200)
 ,tel          varchar2(20)
 ,email        varchar2(30)
 ,point        number default 0
 ,registerday  date default sysdate
 ,constraint PK_tbl_member_detail primary key(fk_userid)
 ,constraint FK_tbl_member_detail_fk_userid foreign key(fk_userid) 
             references tbl_member_login(userid) 
             on delete cascade
 ,constraint UQ_tbl_member_detail_jubun unique(jubun) 
 );

 
create or replace procedure pcd_member_register
 (p_userid  IN  tbl_member_login.userid%type
 ,p_passwd  IN  tbl_member_login.passwd%type
 ,p_name    IN  tbl_member_login.name%type
 ,p_jubun   IN  tbl_member_detail.jubun%type
 ,p_address IN  tbl_member_detail.address%type
 ,p_tel     IN  tbl_member_detail.tel%type
 ,p_email   IN  tbl_member_detail.email%type
 )
 is
   v_passwdresult  number(1);
   v_jubunresult   number(1);
   v_cnt_login     number(1);
   v_cnt_detail    number(1);
 begin
     select func_passwdcheck(p_passwd) 
          into
            v_passwdresult
     from dual;

     if (v_passwdresult = 0) then
        dbms_output.put_line('��ȣ�� 8���� �̻��� ������,����,Ư����ȣ�� ȥ�յǾ�� �մϴ�.'); 
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
        dbms_output.put_line('�ùٸ� �ֹι�ȣ�� �ƴմϴ�.');
        return;
     end if;

     insert into tbl_member_login(userid, passwd, name)
     values(p_userid, p_passwd, p_name);

     insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
     values(p_userid, p_jubun, p_address, p_tel, p_email); 

     select count(*) 
          into v_cnt_login
     from tbl_member_login
     where userid = p_userid;

     select count(*)
          into v_cnt_detail
     from tbl_member_detail
     where fk_userid = p_userid;

     if(v_cnt_login * v_cnt_detail = 1) 
        then commit;
     else 
        rollback;
     end if;
     
end pcd_member_register;


 exec pcd_member_register('hongkd','qwer1234','ȫ�浿','9003141234567','����� ������','010-234-5678','hong@gmail.com'); 
 
 exec pcd_member_register('hongkd','qwer1234$','ȫ�浿','9003141234567','����� ������','010-234-5678','hong@gmail.com');
 
 exec pcd_member_register('hongkd','qwer1234$','ȫ�浿','9003141234564','����� ������','010-234-5678','hong@gmail.com');

select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
 

--- *** ����� ���� ������(EXCEPTION) *** --- 

 ������ = ������
 
 �� ����
 EXCEPTION 
    WHEN �ͼ����̸�1 [ OR �ͼ����̸�2 ] then
         ���๮��1;
         ���๮��2;
    WHEN �ͼ����̸�3 [ OR �ͼ����̸�4 ] then
         ���๮��3;
         ���๮��4;
   WHEN OTHERS THEN
        ���๮��5;
        ���๮��6;


exec pcd_member_register('hongkd','qwer1234$','ȫ�浿','9003141234564','����� ���α�','010-234-5678','lee@gmail.com');


create or replace procedure pcd_member_register
 (p_userid  IN  tbl_member_login.userid%type
 ,p_passwd  IN  tbl_member_login.passwd%type
 ,p_name    IN  tbl_member_login.name%type
 ,p_jubun   IN  tbl_member_detail.jubun%type
 ,p_address IN  tbl_member_detail.address%type
 ,p_tel     IN  tbl_member_detail.tel%type
 ,p_email   IN  tbl_member_detail.email%type
 )
 is
   v_passwdresult  number(1);
   v_jubunresult   number(1);
   v_cnt_login     number(1);
   v_cnt_detail    number(1);
   
   err_passwd exception;
   err_jubun exception;
 begin
     select func_passwdcheck(p_passwd) 
          into
            v_passwdresult
     from dual;

     if (v_passwdresult = 0) then
       -- dbms_output.put_line('��ȣ�� 8���� �̻��� ������,����,Ư����ȣ�� ȥ�յǾ�� �մϴ�.'); 
        raise err_passwd;
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
      --  dbms_output.put_line('�ùٸ� �ֹι�ȣ�� �ƴմϴ�.');
        raise err_jubun;
        return;
     end if;

     insert into tbl_member_login(userid, passwd, name)
     values(p_userid, p_passwd, p_name);

     insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
     values(p_userid, p_jubun, p_address, p_tel, p_email); 

     select count(*) 
          into v_cnt_login
     from tbl_member_login
     where userid = p_userid;

     select count(*)
          into v_cnt_detail
     from tbl_member_detail
     where fk_userid = p_userid;

     if(v_cnt_login * v_cnt_detail = 1) 
        then commit;
     else 
        rollback;
     end if;
     
     exception
        when err_passwd then
            raise_application_error(-20001, '��ȣ�� 8���� �̻��� ������,����,Ư����ȣ�� ȥ�յǾ�� �մϴ�. ');
              -- ����� ���� ������ȣ -20001 ���� -20999 ������ ���������� ������ �Ѵ�.
        when err_jubun then
            raise_application_error(-20002, '�ùٸ� �ֹι�ȣ�� �ƴմϴ�.' );
end pcd_member_register;


delete from tbl_member_login
where userid = 'hongkd';

select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
exec pcd_member_register('hongkd','qwer1234$','ȫ�浿','9003141234562','����� ���α�','010-234-5678','lee@gmail.com');
--  ORA-20002: �ùٸ� �ֹι�ȣ�� �ƴմϴ�.

exec pcd_member_register('hongkd','qwer1234$','ȫ�浿','9003141234564','����� ���α�','010-234-5678','lee@gmail.com');

exec pcd_member_register('leess','qwer1234$','�̼���','9003141234564','����� ���α�','010-234-5678','lee@gmail.com');
-- ���� ����-
-- ORA-00001: unique constraint (HR.UQ_TBL_MEMBER_DETAIL_JUBUN) violated


---------------- Ư���ð� ȸ������ ---------------

create or replace procedure pcd_member_register
 (p_userid  IN  tbl_member_login.userid%type
 ,p_passwd  IN  tbl_member_login.passwd%type
 ,p_name    IN  tbl_member_login.name%type
 ,p_jubun   IN  tbl_member_detail.jubun%type
 ,p_address IN  tbl_member_detail.address%type
 ,p_tel     IN  tbl_member_detail.tel%type
 ,p_email   IN  tbl_member_detail.email%type
 )
 is
   v_passwdresult  number(1);
   v_jubunresult   number(1);
   v_cnt_login     number(1);
   v_cnt_detail    number(1);
   
   err_passwd exception;
   err_jubun exception;
   err_timeday exception;
 begin
     if ( to_char(sysdate, 'd') in ('1','7') OR -- �Ͽ��� �Ǵ� �����
          to_char(sysdate, 'hh24') = '14')
       then raise err_timeday;
     end if;  
     select func_passwdcheck(p_passwd) 
          into
            v_passwdresult
     from dual;

     if (v_passwdresult = 0) then
       -- dbms_output.put_line('��ȣ�� 8���� �̻��� ������,����,Ư����ȣ�� ȥ�յǾ�� �մϴ�.'); 
        raise err_passwd;
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
      --  dbms_output.put_line('�ùٸ� �ֹι�ȣ�� �ƴմϴ�.');
        raise err_jubun;
        return;
     end if;

     insert into tbl_member_login(userid, passwd, name)
     values(p_userid, p_passwd, p_name);

     insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
     values(p_userid, p_jubun, p_address, p_tel, p_email); 

     select count(*) 
          into v_cnt_login
     from tbl_member_login
     where userid = p_userid;

     select count(*)
          into v_cnt_detail
     from tbl_member_detail
     where fk_userid = p_userid;

     if(v_cnt_login * v_cnt_detail = 1) 
        then commit;
     else 
        rollback;
     end if;
     
     exception
        when err_passwd then
            raise_application_error(-20001, '��ȣ�� 8���� �̻��� ������,����,Ư����ȣ�� ȥ�յǾ�� �մϴ�. ');
              -- ����� ���� ������ȣ -20001 ���� -20999 ������ ���������� ������ �Ѵ�.
              -- ��ȣ �ߺ�����
        when err_jubun then
            raise_application_error(-20002, '�ùٸ� �ֹι�ȣ�� �ƴմϴ�.' );
        when err_timeday then
            raise_application_error(-20001, '��,�Ͽ��� �� ���� ����2�ú��� ����3���������� ȸ�������� �Ұ��մϴ�.');
end pcd_member_register;

exec pcd_member_register('hongkd','qwer1234$','ȫ�浿','9003141234564','����� ���α�','010-234-5678','lee@gmail.com');
-- ���� ����-
-- ORA-20001: ��,�Ͽ��� �� ���� ����2�ú��� ����3���������� ȸ�������� �Ұ��մϴ�.

select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;

/*
------------------------------------------
           --- *** CURSOR *** ---
-------------------------------------------    
*/

create or replace procedure pcd_empdept
(p_department_id IN employees.department_id%type)
is
  v_department_id employees.department_id%type;
  v_employee_id employees.employee_id%type;
  v_ename varchar2(40);
  v_gender varchar2(10);
  v_salary employees.salary%type;

begin
    select department_id,
           employee_id,
           first_name || ' ' || last_name,
           func_gender(jubun),
           salary
      into
         v_department_id, v_employee_id, v_ename, v_gender, v_salary
    from employees
    where nvl(department_id, -9999) = nvl(p_department_id, -9999);

   dbms_output.put_line( lpad('-', 50, '-') );
   dbms_output.put_line( '�μ���ȣ  �����ȣ  ����� ����  �⺻�޿�');
   dbms_output.put_line( lpad('-', 50, '-') );
   dbms_output.put_line(v_department_id || '  ' || v_employee_id || '  ' ||
                        v_ename || '  ' || v_gender || '  ' || v_salary);
end;

exec pcd_empdept(10);
exec pcd_empdept(null);

exec pcd_empdept(50);
-- ���� ���� -
-- ORA-01422: exact fetch returns more than requested number of rows


------- *** ����� CURSOR ����� *** ---------
 �� ����
  1�ܰ� -- CURSOR �� ���� (����)
        CURSOR Ŀ����
        IS
         SELECT ��;
  2�ܰ� -- CURSOR �� OPEN
        OPEN Ŀ����;
        
  3�ܰ� -- CURSOR �� FETCH
         --(FETCH ��? SELECT �Ǿ��� ������� ������ ���� �۾��� ���Ѵ�)
         FETCH Ŀ���� INTO ����;
      
  4�ܰ� -- CURSOR �� CLOSE
        CLOSE Ŀ����;
        
 �� ====  Ŀ���� �Ӽ����� ==== ��
 1. Ŀ����%ISOPEN  ==> Ŀ���� OPEN �Ǿ��� �����ΰ��� üũ�ϴ� ��.
                      ���࿡ Ŀ���� OPEN �Ǿ��� �����̶�� TRUE.
 2. Ŀ����%FOUND  ==> FETCH �� ���ڵ�(��)�� �ִ����� üũ�ϴ� ��.
                      ���࿡ FETCH �� ���ڵ�(��)�� �ִٸ� TRUE.
 3. Ŀ����$NOTFOUND ==> FETCH �� ���ڵ�(��)�� �������� üũ�ϴ� ��.
                      ���࿡ FETCH �� ���ڵ�(��)�� ���ٸ� TRUE.    
 4. Ŀ����%ROWCOUNT ==> ������� FETCH�� ��ũ��(��)�� ������ ��ȯ����.
 
------------------------------------------------------------------------

create or replace procedure pcd_empdept
(p_department_id IN employees.department_id%type)
is
  -- 1�ܰ� : CURSOR �� ����
   cursor cur_empinfo 
   is
    select E.department_id,
           D.department_name,
           E.employee_id,
           E.first_name || ' ' || E.last_name,
           func_gender(E.jubun),
           E.salary
    from employees E left join departments D
    on E.department_id = D.department_id
    where nvl(E.department_id, -9999) = nvl(p_department_id, -9999);
    
    v_department_id employees.department_id%type;
    v_department_name departments.department_name%type;
    v_employee_id employees.employee_id%type;
    v_ename varchar2(50);
    v_gender varchar2(10);
    v_salary employees.salary%type;
begin
   -- 2�ܰ� : CURSOR �� OPEN
   open cur_empinfo;
   
   dbms_output.put_line( lpad('-', 50, '-') );
   dbms_output.put_line( '�μ���ȣ  �����ȣ  ����� ����  �⺻�޿�');
   dbms_output.put_line( lpad('-', 50, '-') );
   
   loop
   -- 3�ܰ� : CURSOR �� FETCH
      fetch cur_empinfo 
      into
        v_department_id, v_department_name, v_employee_id, v_ename,
        v_gender, v_salary;
   exit when cur_empinfo%notfound; 
        dbms_output.put_line(v_department_id || '  ' || v_department_name || '  ' || v_employee_id || '  ' ||
                        v_ename || '  ' || v_gender || '  ' || v_salary);
   end loop;
   
   if(cur_empinfo%rowcount = 0) then
      dbms_output.put_line('��ȸ�Ϸ��� ' || p_department_id ||' �μ��� �������� �ʽ��ϴ�.');
   end if;   
   
   -- 4�ܰ� : CURSOR �� CLOSE 
   close cur_empinfo;
end;

exec pcd_empdept(10);
exec pcd_empdept(null);
exec pcd_empdept(50);
exec pcd_empdept(777);


------------------- *** FOR LOOP CURSOR �� *** -------------------------

--> FOR LOOP CURSOR ���� ����ϸ�
-- Ŀ���� OPEN, FETCH, CLOSE �� �ڵ������� �߻��Ǿ����� ������ ����� �ʿ䰡 ����.

 �� ����
 FOR ������(���ڵ������� ���� ����) IN Ŀ���� LOOP
    ���๮��;
 END LOOP;
 
 -------------------------------------------------------------------------
 create or replace procedure pcd_empdept2
(p_department_id IN employees.department_id%type)
is
   cursor cur_empinfo 
   is
    select E.department_id,
           D.department_name,
           E.employee_id,
           E.first_name || ' ' || E.last_name AS ENAME,
           func_gender(E.jubun) AS GENDER,
           E.salary
    from employees E left join departments D
    on E.department_id = D.department_id
    where nvl(E.department_id, -9999) = nvl(p_department_id, -9999);
    
    v_count number := 0; 
begin
   dbms_output.put_line( lpad('-', 50, '-') );
   dbms_output.put_line( '�μ���ȣ  �����ȣ  ����� ����  �⺻�޿�');
   dbms_output.put_line( lpad('-', 50, '-') );
   
   for rcd in cur_empinfo loop
      dbms_output.put_line(rcd.department_id || '  ' || rcd.department_name || '  ' || rcd.employee_id ||
                           '  '|| rcd.ename || '  ' || rcd.gender || '  ' || rcd.salary );
      v_count := v_count + 1;                    
   end loop;
   
   if(v_count = 0) then
      dbms_output.put_line('��ȸ�Ϸ��� ' || p_department_id ||' �μ��� �������� �ʽ��ϴ�.');
   else
      dbms_output.put_line('��ȸ�Ǿ��� �Ǽ��� ' || v_count || ' �� �Դϴ�');
   end if;   
   
end;

exec pcd_empdept2(10);
exec pcd_empdept2(null);
exec pcd_empdept2(50);
exec pcd_empdept2(777);



---------->>> Ʈ���� (Trigger) <<<-----------
 Ʈ����(Trigger)�� ����Ͽ� Transaction ó���� �غ���.
 �ټ����� ���̺��� �����Ҷ� �� ���̺� DML(insert, update, delete)�� �߻��Ǿ�����
 �ٸ� ���̺��� ���õ� DML �۾��� �ڵ������� �߻��Ǿ������� ������ִ� ���� Ʈ���� �̴�.

1. Statement Trigger (����Ʈ����)
   => � ���̺� DML �Ǿ���(��) ���� �÷����� �˾ƿü� ����.
   
  - Before Statement Trigger : � ���̺� DML �۾��� �߻��ϱ����� ó�����ִ�
                               �۾����μ� �ַ� �˻�(üũ)�뵵�� ���ȴ�.
                               
  - After Statement Trigger : � ���̺� DML �۾��� �߻��� ������ �ٸ� ���̺�
                              ���õ� DML �۾��� �ڵ������� �Ͼ���� ����� ��.
  
2. Row Trigger (��Ʈ����)
   => � ���̺� DML �Ǿ���(��) ���� �÷����� �˾ƿü� �ִ�.
   
  - Before Row Trigger : � ���̺� DML �۾��� �߻��ϱ����� ó�����ִ�
                         �۾����μ� �ַ� �˻�(üũ)�뵵�� ���ȴ�.
                               
  - After Row Trigger : � ���̺� DML �۾��� �߻��� ������ �ٸ� ���̺�
                        ���õ� DML �۾��� �ڵ������� �Ͼ���� ����� ��.



-- 1. Before Statement Trigger
/*
  tbl_member_login ���̺� insert, update, delete �� �� ���ִ� �ð��븦 �����ϵ��� �Ѵ�.
  �� ~ �� ���� ���� 10�� ���� ���� 5�� ���������� ������!.
*/
create or replace trigger stbtri_tbl_member_login
before 
insert or update or delete
on tbl_member_login
declare
  err_imposibleday exception;
  err_imposibletime exception;
  v_hour number(2);
begin
    if to_char(sysdate, 'd') in ('1','7') then
       raise err_imposibleday;
    end if;
    
    v_hour := to_number( to_char(sysdate, 'hh24') );
    if (v_hour < 10 or v_hour >= 17) then 
      raise err_imposibletime;
    end if;
    
    exception 
      when err_imposibleday then 
        raise_application_error(-20001, '��-�� ������ �����մϴ�.');
      when err_imposibletime then 
        raise_application_error(-20001, '���� 10�� ���� ���� 5�� ���������� �����մϴ�.');
end stbtri_tbl_member_login;


insert into tbl_member_login(userid, passwd, name)
values('supermen', 'qwer1234$', '������'); -- ���� 9�� 45�б���
-- ���� ���� -
-- SQL ����: ORA-20001: ���� 10�� ���� ���� 5�� ���������� �����մϴ�
 
select *
from tbl_member_login;

select *
from tbl_member_detail;

-- 2. After Statement Trigger 
/*
  tbl_member_login ���̺� DML�� �߻��Ǿ� ������ tbl_history ���̺�
  ����� ����� �ʹ�.
*/

create table tbl_history
(seq number,
 table_name varchar2(50),
 dmltype varchar2(20),
 workdate date default sysdate
);

create sequence seq_tbl_history
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create or replace trigger statri_tbl_member_login_insert
after
insert
on tbl_member_login
declare
  
begin
  insert into tbl_history(seq, table_name, dmltype)
  values (seq_tbl_history.nextval, 'tbl_history', 'insert' );
end;


create or replace trigger statri_tbl_member_login_update
after
update
on tbl_member_login
declare
  
begin
  insert into tbl_history(seq, table_name, dmltype)
  values (seq_tbl_history.nextval, 'tbl_history', 'update' );
end;


create or replace trigger statri_tbl_member_login_delete
after
delete
on tbl_member_login
declare
  
begin
  insert into tbl_history(seq, table_name, dmltype)
  values (seq_tbl_history.nextval, 'tbl_history', 'delete' );
end;

insert into tbl_member_login(userid, passwd, name)
values('superman', 'qwer1234$', '������');

select *
from tbl_member_login;

select *
from tbl_history;

rollback;

update tbl_member_login set passwd = 'java1234$$'
where userid = 'superman';

delete from tbl_member_login
where userid = 'superman';

commit;


-- 3. Before Row Trigger
/*
  !! Row Trigger ���� insert �Ǿ��� ������ ���� :new ��� ���� ����ȴ�.
  !! Row Trigger ���� delete �Ǿ��� ������ ���� :old ��� ���� ����ȴ�.
  update �� �������� delete �Ǿ����� ���� ���ο� ���� insert �Ǿ����� ���̴�.
  �׷��Ƿ� Row Trigger���� update �� �߻��Ǿ�����, update �ϱ� ������ ���� ����
  :old �� ����Ǿ����� update �� �������� ���� :new �� ����ȴ�.
  
  tbl_member_login ���̺� insert �� update �� �ϱ��� passwd �÷��� ���� �˻��ؼ�
  �츮�� �䱸���ǿ� ������ insert �� update �� ������ְ�
  �䱸���ǿ� ���� ������ �������� �߻��ϵ��� �Ѵ�.
*/ 

create or replace trigger rowbtri_tbl_member_login
before
insert or update
on tbl_member_login
for each row

declare
  err_passwd exception;
  v_check number(1);
  
begin
  select func_passwdcheck(:new.passwd)
        into
          v_check
  from dual;
  
  if(v_check = 0)then
    raise err_passwd;
  end if;  
  
  exception
      when err_passwd then
          raise_application_error(-20001, '��ȣ�� ������, ����, Ư�����ڰ� ȥ�յ� 8���� �̻� 20 ���� ���Ͽ����մϴ�');
end;

insert into tbl_member_login(userid, passwd, name)
values('superman', 'qwer1234ss', '������');
-- ���� ���� -
-- SQL ����: ORA-20001: ��ȣ�� ������, ����, Ư�����ڰ� ȥ�յ� 8���� �̻� 20 ���� ���Ͽ����մϴ�

select *
from tbl_member_login;

insert into tbl_member_login(userid, passwd, name)
values('superman', 'qwer1234$', '������');

rollback;

select *
from tbl_member_login;


create or replace trigger rowbtri_tbl_member_detail
before
insert or update
on tbl_member_detail
for each row

declare
  v_check number(1);
  err_jubun exception;
begin
  select fun_jubuncheck(:new.jubun)
        into v_check
  from dual;
  
  if(v_check = 0) then
    raise err_jubun;
  end if;
  
  exception
    when err_jubun then
     -- rollback; Ʈ���� �ȿ����� �ѹ�Ұ�.
      raise_application_error(-20001, '�ùٸ� �ֹι�ȣ ���°� �ƴմϴ�.');

end;


insert into tbl_member_login(userid, passwd, name)
values('superman', 'qwer1234$', '������');

insert into tbl_member_detail(fk_userid, jubun,address, tel, email)
values ('superman','9003141234562', '����', '010-2222-3333', 'skskrlwk@gmail.com');
-- ���� ���� -
-- SQL ����: ORA-20001: �ùٸ� �ֹι�ȣ ���°� �ƴմϴ�.

select *
from tbl_member_login;

select *
from tbl_member_detail;

-------------------------------------------------------------
create or replace procedure pcd_member_insert
(p_userid  IN  tbl_member_login.userid%type
 ,p_passwd  IN  tbl_member_login.passwd%type
 ,p_name    IN  tbl_member_login.name%type
 ,p_jubun   IN  tbl_member_detail.jubun%type
 ,p_address IN  tbl_member_detail.address%type
 ,p_tel     IN  tbl_member_detail.tel%type
 ,p_email   IN  tbl_member_detail.email%type
)
is
  v_logincount number(1);
  v_jubuncheck number(1);
  err_jubun exception;
begin
  insert into tbl_member_login(userid, passwd, name)
  values(p_userid, p_passwd, p_name);
  
  select count(*)
        into v_logincount
  from tbl_member_login
  where userid = p_userid;
  
  if(v_logincount = 1) then
    select fun_jubuncheck(p_jubun)
          into v_jubuncheck
    from dual;
    
    if(v_jubuncheck = 1) then
      insert into tbl_member_detail (fk_userid, jubun, address, tel, email)
      values(p_userid, p_jubun, p_address, p_tel, p_email);
    else 
      rollback;
      raise err_jubun;
    end if;
    
    commit;
  end if;
  
  exception 
    when err_jubun then
      raise_application_error(-20009,'�ֹι�ȣ�� �߸��Ǿ����ϴ�.');
end;

exec pcd_member_insert('superman', 'qwer1234$', '������', '9003141234564', '����� ���α�', '010-2222-3333', 'skskrlwk@gmail.com');

select *
from tbl_member_login;

select *
from tbl_member_detail;

----------------------------------------------------
-- ����
create table tbl_histroy2
(seq number,
 table_number varchar2(100),
 dmltype varchar2(20),
 content varchar2(1000),
 workdate date default sysdate
);

create sequence seq_tbl_histroy2
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- tbl_member_login ���̺� insert �� �Ǿ��� ������ �ڵ�������
-- seq_tbl_histroy ���̺� ��ϵǾ����� �Ѵ�.

-- tbl_member_login ���̺� update �� �Ǿ��� ������ �ڵ�������
-- seq_tbl_histroy ���̺� ��ϵǾ����� �Ѵ�.

-- tbl_member_login ���̺� delete �� �Ǿ��� ������ �ڵ�������
-- seq_tbl_histroy ���̺� ��ϵǾ����� �Ѵ�.

create or replace trigger rowaftri_tbl_histroy2_insert 
after
insert
on tbl_member_login
for each row
declare
  v_check number(1);
  
begin
  select count(*)
        into v_check
  from tbl_member_login;
  
  if(v_check = 1) then
    insert into tbl_histroy2 (seq, table_number, dmltype, content)
    values (seq_tbl_histroy2.nextval, 'tbl_member_login', 'insert',
            :new.userid );
      --'�̸� : ' || :new.userid || ', �н����� : ' || :new.passwd || ', �̸� : ' || new.name );
  end if;
    
end;

desc tbl_member_login;

insert into tbl_member_login(userid, passwd, name)
values ('skskrlwk','1123213aa@2','������');

select *
from tbl_member_login


----------- *** �����Ǿ��� Ʈ������ ������ �ҽ��� ���� �� *** ----------------

select *
from user_triggers;

------ *** Ʈ���� �����ϱ� *** -----
drop trigger Ʈ���Ÿ�;
drop trigger ROWAFTRI_TBL_HISTROY2;

--- *** Ʈ������ ��Ȱ��ȭ / Ȱ��ȭ �ϱ� *** ---
alter trigger Ʈ���Ÿ� disable; -- ��Ȱ��ȭ
alter trigger Ʈ���Ÿ� enable; -- Ȱ��ȭ



