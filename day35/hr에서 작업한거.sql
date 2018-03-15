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