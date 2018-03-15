/*
--- *** Index(인덱스) *** ---
 - Index(인덱스)를 생성하는 이유는 검색(select)을 빨리하기 위함이다.
 - Index(인덱스)는 책의 뒷면에 나오는 색인(인덱스)과 같은 의미를 가진다.
 - Index(인덱스)를 생성하면 select 속도는 향상되지만
   DML(insert, update, delete, merge) 속도는 떨어진다. 그러므로 where 절에
   자주 사용되어지는 컬럼에 만들어야 한다.
   
 - Index(인덱스)로 사용되어지는 컬럼은 선택도(selectivity)가 좋은 컬럼이어야 한다!!.
   선택도가 좋다는 말은 고유한 정도가 높다는 말이다. 예) 주민번호, 학번, 사원번호 등 ...
 
 << 사원 >>
-----------------------------------------------------------
  사원번호    사원명   직급    주민번호    급여    입사일
-----------------------------------------------------------
  number    varchar2 varchar2 varchar2 number  date

 - 인덱스로 사용되어지는 컬럼은 조회시(select) 변형되지 않고 그래도 사용되어지는
   컬럼이어야 한다. 인덱스로 사용되어지는 컬럼이 함수를 사용하여 값이 변경되면
   인덱스 기능을 잃어버리기 때문이다.
   예) 위의 "사원" 테이블에서 입사일(date default로 sysdate) 컬럼에 인덱스를 주었다면
       조회시 where 입사일자 = '2018-03-13 10:05:07' 이런식으로 검색을 해야한다.
       일반적으로 where to_char(입사일자 , 'yyyy-mm-dd') = '2018-03-13' 으로
       조회를 하므로 입사일자 컬럼의 값이 함수를 사용하여 변경되므로 인덱스를 사용하지 않고
       테이블 Full Scan 하여 검색한다.
       
 - 제약조건 Primary Key, Unique 제약이 걸려진 컬럼은 자동적으로
   unique 한 Index가 생성되어진다.
 - 사원번호 => Primary key / 주민번호 => Unique 을 주면
   사원번호와 주민번호에는 인덱스가 자동적으로 생성되어진다.
 - 그런데 검색조건(where)에 사원명을 자주 사용한다라면 사원명 컬럼에 인덱스를 생성해주면 된다.
*/

create index idx_sawon_saname
on tbl_sawon(saname); -- tbl_sawon 테이블의 saname 컬럼의 값은
                      -- insert or update 시 중복된 값을 허락한다. (동명이인 가능)

create unique index idx_sawon_saname
on tbl_sawon(saname); -- tbl_sawon 테이블의 saname 컬럼의 값은
                      -- insert or update 시 고유한 값만 가진다. (동명이인 불가)
                      
create index idx_sawon_saname
on tbl_sawon(saname desc); --> 인덱스의 특징은 정렬되어지는 것인데 desc 를해주면
                           -- saname을 내림차순으로 정렬한다.(생략시 오름차순)

/*
------ *** Composite Index(복합인덱스) *** ---------
 - Composite Index(복합인덱스)란?
   2개 이상의 컬럼을 묶어서 하나의 인덱스로 만드는 것.
*/
select jik, salary
from tbl_sawon
where saname = '이순신';

-- 전제조건이 위와 같이 조회하는 것이 아주 빈번하다라면
-- saname, jik, salary 컬럼을 묶어서 하나의 Index(인덱스)를 생성하는 것이 속도가 빨라진다.
-- ** 중요 ** --
-- Composite Index(복합인덱스)를 만들떄 선행컬럼을 어떤 컬럼으로 잡을것인가? 가 중요하다!!!!

create indeex idx_tblsawon_test
on tbl_sawon(saname, jik, salary);
--> 인덱스 idx_tblsawon_test 의 선행컬럼은 saname 이다.

create indeex idx_tblsawon_test
on tbl_sawon(jik, saname, salary);
--> 인덱스 idx_tblsawon_test 의 선행컬럼은 jik 이다.
/*
 - 선행컬럼을 선택하는 기준은 첫번쨰는 선택도(selectivity)가 좋아야 한다.
 - 두번쨰로 where 절에 단독으로 많이 사용되어저야 한다.
 
 --- select(조회)시 복합인덱스로 생성되어진 인덱스를 사용하기 위해서는
     반드시 where 절에 선행컬럼이 와야한다. where 절에 선행컬럼이 없다라면
     인덱스를 사용하지않고 테이블 Full Scan 하기 때문이다.
     
 예> create index idx_tblsawon_test
     on tbl_sawon(saname, jik, salary);
     --> 선행컬럼이 saname이다.
     
     select jik, salary
     from tbl_sawon
     where saname = '이순신';
     --> 인덱스 indx_tblsawon_test 를 사용해서 검색함.
     
     select saname, jik, salary
     from tbl_sawon
     where saname = '과장' and salary = 5000;
     --> 인덱스 indx_tblsawon_test 를 사용하지 않고 테이블 Full Scan 하여 검색한다.
     
     select jik, salary
     from tbl_sawon
     where salary = 5000 and saname = '이순신';
     --> 인덱스 indx_tblsawon_test 를 사용해서 검색함.
*/


--- *** 생성되어진 인덱스 조회하기 *** ---
 
 select *
 from user_indexes
 where table_name = 'TBL_USERDETAIL'


--- *** 인덱스 생성하기 *** ---
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
values ('batman', 'qwer1234$', '정영광'); -- 에러! 인덱스생성시 name을 unique로 해서

--- *** 인덱스 삭제하기 *** ---

drop index idx_tbl_userlogin_name;

create index idx_tbl_userlogin_name
on tbl_userlogin(name);

insert into tbl_userlogin(userid, passwd, name)
values ('batman', 'qwer1234$', '정영광');

rollback;

select *
from user_indexes A join user_ind_columns B
on A.index_name = B.index_name
where A.table_name = 'TBL_SAWON';

drop index UQ_TBL_SAWON_SANAME; -- 오류발생!!!

-- Primary Key / Unique 제약으로 생성되어진 인덱스의 삭제는 drop index 가 아니라
-- 제약조건의 삭제를 하면 자동적으로 인덱스가 삭제된다.

alter table tbl_sawon
drop constraint UQ_TBL_SAWON_SANAME;
-- 을 하면 제약조건이 삭제됨과 동시에 인덱스도 삭제된다. 

/*
  DDL(Data Definition Language) --> create, drop, alter, truncate
  DML(Data Manuplation Language) --> insert, update, delete, merge
  DCL(Data Control Language) --> graint(권한을 주는것), revoke(권한을 뺴았는것)
  TCL(Transaction Control Language) --> commit, rollback

  -- DML(Data Manuplation Language)문 만 수동 commit 이고
  -- 나머지 DDL, DCL 문은 실행하면 자동적으로 commit이 일어난다.
*/

 create table tbl_a
 (no    number
 ,name  varchar2(20)
 );
 
 insert into tbl_a(no, name) values(1,'한석규');
 commit;
 
 insert into tbl_a(no, name) values(2,'두석규');
 
 create table tbl_b
 (no    number
 ,name  varchar2(20)
 ); -- auto commit 이 발생함.
 
 rollback;
 
 select *
 from tbl_a;
 -- 두석규는 rollback 이 되지 않고 insert 되어져 있음.


/*
                 -- *** PL/SQL *** ---
      Procedure Language / Structured Query Language
*/

-- ******* PL/SQL 구문에서 변수의 사용법 *********
execute 또는 exec

exec pcd_empinfo(101); // exe pcd_empinfo(사원번호);
exec pcd_empinfo(102);
exec pcd_empinfo(103);

<< 결과물 >>
-----------------------------------
사원번호  사원명 성별  월급
-----------------------------------
 101    ...   ...   ...

create or replace procedure pcd_empinfo
(p_employee_id IN number)
is
  변수를 선언하는 부분
begin 
   실행하야할 구문절이 들어오는 부분
   각각의 실행문이 끝나면 반드시 ; 을 기입해야 한다.

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
             case when substr(jubun, 7, 1) in ('1','3') then '남' else '여' end,
             nvl(salary + (salary * commission_pct), salary) 
        into
             v_empno, v_ename, v_gender, v_monthsal
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호 사원명 성별  월급' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_empno || '  ' || v_ename || '  ' ||
                            v_gender || '  ' || v_monthsal
                           );
end;
-- 에러 발생시 cmd 에서 오라클접속 ( sqlplus/nolog ) -->  conn hr/eclass
-- 코드 복사후 / 입력후  show errors 로 확인

--------------------------- 다른방식 --------------------------------------------
create or replace procedure pcd_empinfo2
(p_employee_id IN employees.employee_id%type) -- employees에있는 employee_id 타입으로 선언.
is
 v_empno number(5);
 v_ename varchar2(50);
 v_gender varchar2(10);
 v_monthsal number(10);
begin
      select employee_id,
             first_name || ' ' || last_name,
             case when substr(jubun, 7, 1) in ('1','3') then '남' else '여' end,
             nvl(salary + (salary * commission_pct), salary) 
        into
             v_empno, v_ename, v_gender, v_monthsal
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호 사원명 성별  월급' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_empno || '  ' || v_ename || '  ' ||
                            v_gender || '  ' || v_monthsal
                           );
end ;

---------------------------------------------------------------------------------
/*
 테이블 == entity(개체)
 행 == row == record == tuple
 열 == column == field == attribute
*/

create or replace procedure pcd_empinfo3
(p_employee_id IN employees.employee_id%type) -- employees에있는 employee_id 타입으로 선언.
is
  -- record 타입 생성
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
             case when substr(jubun, 7, 1) in ('1','3') then '남' else '여' end,
             nvl(salary + (salary * commission_pct), salary) 
        into v_emprcd
      from employees
      where employee_id = p_employee_id;
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호 사원명 성별  월급' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_emprcd.empno || '  ' || v_emprcd.ename || '  ' ||
                            v_emprcd.gender || '  ' || v_emprcd.monthsal
                           );
end;

---------------------------------------------------------------------------------

create or replace procedure pcd_empinfo4
(p_employee_id IN employees.employee_id%type) -- employees에있는 employee_id 타입으로 선언.
is
  v_empall employees%rowtype;
  v_result varchar2(4000); -- varchar2(4000) 이 최대치. 넘어가면 clob로 대체한다(4GB)까지가능
begin
      select *
        into v_empall
      from employees
      where employee_id = p_employee_id;
      
      v_result := v_empall.employee_id || ' ' ||
                  v_empall.first_name || ' ' ||
                  v_empall.last_name || ' ' ||
                  case when substr(v_empall.jubun, 7, 1) in ('1','3') then '남' else '여' end || ' ' ||
                  nvl(v_empall.salary + (v_empall.salary * v_empall.commission_pct), v_empall.salary);
      
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( '사원번호 사원명 성별  월급' );
      dbms_output.put_line( lpad('-',40,'-') );
      dbms_output.put_line( v_result );
end;

exec pcd_empinfo(103);
exec pcd_empinfo2(103);
exec pcd_empinfo3(103);
exec pcd_empinfo4(103);


----------- *** procedure, function, trigger 의 소스 보기 *** --------------

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