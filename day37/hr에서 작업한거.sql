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
