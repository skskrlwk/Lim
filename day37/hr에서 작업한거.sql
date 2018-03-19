---------------- 특정시간 회원가입 ---------------

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
     if ( to_char(sysdate, 'd') in ('1','7') OR -- 일요일 또는 토요일
          to_char(sysdate, 'hh24') = '14')
       then raise err_timeday;
     end if;  
     select func_passwdcheck(p_passwd) 
          into
            v_passwdresult
     from dual;

     if (v_passwdresult = 0) then
       -- dbms_output.put_line('암호는 8글자 이상의 영문자,숫자,특수기호가 혼합되어야 합니다.'); 
        raise err_passwd;
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
      --  dbms_output.put_line('올바른 주민번호가 아닙니다.');
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
            raise_application_error(-20001, '암호는 8글자 이상의 영문자,숫자,특수기호가 혼합되어야 합니다. ');
              -- 사용자 정의 오류번호 -20001 부터 -20999 까지의 범위내에서 만들어야 한다.
              -- 번호 중복가능
        when err_jubun then
            raise_application_error(-20002, '올바른 주민번호가 아닙니다.' );
        when err_timeday then
            raise_application_error(-20001, '토,일요일 및 평일 오후2시부터 오후3시전까지는 회원가입이 불가합니다.');
end pcd_member_register;

exec pcd_member_register('hongkd','qwer1234$','홍길동','9003141234564','서울시 종로구','010-234-5678','lee@gmail.com');
-- 오류 보고-
-- ORA-20001: 토,일요일 및 평일 오후2시부터 오후3시전까지는 회원가입이 불가합니다.

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
   dbms_output.put_line( '부서번호  사원번호  사원명 성별  기본급여');
   dbms_output.put_line( lpad('-', 50, '-') );
   dbms_output.put_line(v_department_id || '  ' || v_employee_id || '  ' ||
                        v_ename || '  ' || v_gender || '  ' || v_salary);
end;

exec pcd_empdept(10);
exec pcd_empdept(null);

exec pcd_empdept(50);
-- 오류 보고 -
-- ORA-01422: exact fetch returns more than requested number of rows


------- *** 명시적 CURSOR 만들기 *** ---------
 ※ 형식
  1단계 -- CURSOR 의 선언 (정의)
        CURSOR 커서명
        IS
         SELECT 문;
  2단계 -- CURSOR 의 OPEN
        OPEN 커서명;
        
  3단계 -- CURSOR 의 FETCH
         --(FETCH 란? SELECT 되어진 결과물을 끄집어 내는 작업을 말한다)
         FETCH 커서명 INTO 변수;
      
  4단계 -- CURSOR 의 CLOSE
        CLOSE 커서명;
        
 ※ ====  커서의 속성변수 ==== ※
 1. 커서명%ISOPEN  ==> 커서가 OPEN 되어진 상태인가를 체크하는 것.
                      만약에 커서가 OPEN 되어진 상태이라면 TRUE.
 2. 커서명%FOUND  ==> FETCH 된 레코드(행)이 있는지를 체크하는 것.
                      만약에 FETCH 된 레코드(행)이 있다면 TRUE.
 3. 커서명$NOTFOUND ==> FETCH 된 레코드(행)이 없는지를 체크하는 것.
                      만약에 FETCH 된 레코드(행)이 없다면 TRUE.    
 4. 커서명%ROWCOUNT ==> 현재까지 FETCH된 레크드(행)의 갯수를 반환해줌.
 
------------------------------------------------------------------------

create or replace procedure pcd_empdept
(p_department_id IN employees.department_id%type)
is
  -- 1단계 : CURSOR 의 선언
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
   -- 2단계 : CURSOR 의 OPEN
   open cur_empinfo;
   
   dbms_output.put_line( lpad('-', 50, '-') );
   dbms_output.put_line( '부서번호  사원번호  사원명 성별  기본급여');
   dbms_output.put_line( lpad('-', 50, '-') );
   
   loop
   -- 3단계 : CURSOR 의 FETCH
      fetch cur_empinfo 
      into
        v_department_id, v_department_name, v_employee_id, v_ename,
        v_gender, v_salary;
   exit when cur_empinfo%notfound; 
        dbms_output.put_line(v_department_id || '  ' || v_department_name || '  ' || v_employee_id || '  ' ||
                        v_ename || '  ' || v_gender || '  ' || v_salary);
   end loop;
   
   if(cur_empinfo%rowcount = 0) then
      dbms_output.put_line('조회하려는 ' || p_department_id ||' 부서가 존재하지 않습니다.');
   end if;   
   
   -- 4단계 : CURSOR 의 CLOSE 
   close cur_empinfo;
end;

exec pcd_empdept(10);
exec pcd_empdept(null);
exec pcd_empdept(50);
exec pcd_empdept(777);


------------------- *** FOR LOOP CURSOR 문 *** -------------------------

--> FOR LOOP CURSOR 문을 사용하면
-- 커서의 OPEN, FETCH, CLOSE 가 자동적으로 발생되어지기 때문에 기술할 필요가 없다.

 ※ 형식
 FOR 변수명(레코드정보가 담기는 변수) IN 커서명 LOOP
    실행문장;
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
   dbms_output.put_line( '부서번호  사원번호  사원명 성별  기본급여');
   dbms_output.put_line( lpad('-', 50, '-') );
   
   for rcd in cur_empinfo loop
      dbms_output.put_line(rcd.department_id || '  ' || rcd.department_name || '  ' || rcd.employee_id ||
                           '  '|| rcd.ename || '  ' || rcd.gender || '  ' || rcd.salary );
      v_count := v_count + 1;                    
   end loop;
   
   if(v_count = 0) then
      dbms_output.put_line('조회하려는 ' || p_department_id ||' 부서가 존재하지 않습니다.');
   else
      dbms_output.put_line('조회되어진 건수는 ' || v_count || ' 건 입니다');
   end if;   
   
end;

exec pcd_empdept2(10);
exec pcd_empdept2(null);
exec pcd_empdept2(50);
exec pcd_empdept2(777);



---------->>> 트리거 (Trigger) <<<-----------
 트리거(Trigger)를 사용하여 Transaction 처리를 해본다.
 다수개의 테이블이 존재할때 한 테이블에 DML(insert, update, delete)이 발생되어지면
 다른 테이블에도 관련된 DML 작업이 자동적으로 발생되어지도록 만들어주는 것이 트리거 이다.

1. Statement Trigger (문장트리거)
   => 어떤 테이블에 DML 되어질(진) 행의 컬럼값을 알아올수 없다.
   
  - Before Statement Trigger : 어떤 테이블에 DML 작업이 발생하기전에 처리해주는
                               작업으로서 주로 검사(체크)용도로 사용된다.
                               
  - After Statement Trigger : 어떤 테이블에 DML 작업이 발생한 다음에 다른 테이블에
                              관련된 DML 작업이 자동적으로 일어나도록 만드는 것.
  
2. Row Trigger (행트리거)
   => 어떤 테이블에 DML 되어질(진) 행의 컬럼값을 알아올수 있다.
   
  - Before Row Trigger : 어떤 테이블에 DML 작업이 발생하기전에 처리해주는
                         작업으로서 주로 검사(체크)용도로 사용된다.
                               
  - After Row Trigger : 어떤 테이블에 DML 작업이 발생한 다음에 다른 테이블에
                        관련된 DML 작업이 자동적으로 일어나도록 만드는 것.



-- 1. Before Statement Trigger
/*
  tbl_member_login 테이블에 insert, update, delete 를 할 수있는 시간대를 제한하도록 한다.
  월 ~ 금 까지 오전 10시 부터 오후 5시 이전까지만 가능함!.
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
        raise_application_error(-20001, '월-금 까지만 가능합니다.');
      when err_imposibletime then 
        raise_application_error(-20001, '오전 10시 부터 오후 5시 이전까지만 가능합니다.');
end stbtri_tbl_member_login;


insert into tbl_member_login(userid, passwd, name)
values('supermen', 'qwer1234$', '정영광'); -- 오전 9시 45분기준
-- 오류 보고 -
-- SQL 오류: ORA-20001: 오전 10시 부터 오후 5시 이전까지만 가능합니다
 
select *
from tbl_member_login;

select *
from tbl_member_detail;

-- 2. After Statement Trigger 
/*
  tbl_member_login 테이블에 DML이 발생되어 다음에 tbl_history 테이블에
  기록을 남기고 싶다.
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
values('superman', 'qwer1234$', '정영광');

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
  !! Row Trigger 에서 insert 되어진 한행의 값은 :new 라는 곳에 저장된다.
  !! Row Trigger 에서 delete 되어진 한행의 값은 :old 라는 곳에 저장된다.
  update 란 기존행이 delete 되어지고 나서 새로운 행이 insert 되어지는 것이다.
  그러므로 Row Trigger에서 update 가 발생되어지면, update 하기 이전의 행의 값은
  :old 에 저장되어지고 update 가 끝난행의 값은 :new 에 저장된다.
  
  tbl_member_login 테이블에 insert 나 update 를 하기전 passwd 컬럼의 값을 검사해서
  우리의 요구조건에 맞으면 insert 나 update 를 허락해주고
  요구조건에 맞지 않으면 오류절을 발생하도록 한다.
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
          raise_application_error(-20001, '암호는 영문자, 숫자, 특수문자가 혼합된 8글자 이상 20 글자 이하여야합니다');
end;

insert into tbl_member_login(userid, passwd, name)
values('superman', 'qwer1234ss', '정영광');
-- 오류 보고 -
-- SQL 오류: ORA-20001: 암호는 영문자, 숫자, 특수문자가 혼합된 8글자 이상 20 글자 이하여야합니다

select *
from tbl_member_login;

insert into tbl_member_login(userid, passwd, name)
values('superman', 'qwer1234$', '정영광');

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
     -- rollback; 트리거 안에서는 롤백불가.
      raise_application_error(-20001, '올바른 주민번호 형태가 아닙니다.');

end;


insert into tbl_member_login(userid, passwd, name)
values('superman', 'qwer1234$', '정영광');

insert into tbl_member_detail(fk_userid, jubun,address, tel, email)
values ('superman','9003141234562', '서울', '010-2222-3333', 'skskrlwk@gmail.com');
-- 오류 보고 -
-- SQL 오류: ORA-20001: 올바른 주민번호 형태가 아닙니다.

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
      raise_application_error(-20009,'주민번호가 잘못되었습니다.');
end;

exec pcd_member_insert('superman', 'qwer1234$', '나기자', '9003141234564', '서울시 종로구', '010-2222-3333', 'skskrlwk@gmail.com');

select *
from tbl_member_login;

select *
from tbl_member_detail;

----------------------------------------------------
-- 문제
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

-- tbl_member_login 테이블에 insert 가 되어진 다음에 자동적으로
-- seq_tbl_histroy 테이블에 기록되어지게 한다.

-- tbl_member_login 테이블에 update 가 되어진 다음에 자동적으로
-- seq_tbl_histroy 테이블에 기록되어지게 한다.

-- tbl_member_login 테이블에 delete 가 되어진 다음에 자동적으로
-- seq_tbl_histroy 테이블에 기록되어지게 한다.

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
      --'이름 : ' || :new.userid || ', 패스워드 : ' || :new.passwd || ', 이름 : ' || new.name );
  end if;
    
end;

desc tbl_member_login;

insert into tbl_member_login(userid, passwd, name)
values ('skskrlwk','1123213aa@2','나기자');

select *
from tbl_member_login


----------- *** 생성되어진 트리거의 종류와 소스를 보는 것 *** ----------------

select *
from user_triggers;

------ *** 트리거 삭제하기 *** -----
drop trigger 트리거명;
drop trigger ROWAFTRI_TBL_HISTROY2;

--- *** 트리거의 비활성화 / 활성화 하기 *** ---
alter trigger 트리거명 disable; -- 비활성화
alter trigger 트리거명 enable; -- 활성화
