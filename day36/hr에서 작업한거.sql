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