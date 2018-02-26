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
