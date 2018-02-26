show user;

select *
from tab; -- 현재 오라클 서버에 접속한 사용자(지금은 HR) 소유의 테이블명과 뷰명을 조회해주는 쿼리문.

/*
------  순서 중요함!!!! -------

  ====== select 문의 처리순서 =======
  
  select 컬럼명          --- 5
  from 테이블명(뷰명)     --- 1
  where 조건절           --- 2 where 절이 뜻하는 것은 해당 테이블에서 조건에 만족하는 행을 메모리(RAM)에 로딩(올리는 것)하는 것이다. 
  group by 절            --- 3
  having 그룹함수 조건절  --- 4
  order by 절            --- 6

*/
select *
from departments;

/*
   column = filed = attribute = 열
   row = record = tuple =행
   table = entity = 테이블
*/
describe departments;
desc departments;
-- departments 테이블의 컬럼구성을 조회해주는 것
/*
  DEPARTMENT_ID    ==> 부서번호   
  DEPARTMENT_NAME  ==> 부서명 
  MANAGER_ID       ==> 부서장의 사원번호   
  LOCATION_ID      ==> 부서가 위치하는 지역번호
*/
select *
from employees;

desc employees;
/*
  EMPLOYEE_ID      ==> 사원번호
  FIRST_NAME       ==> 성
  LAST_NAME        ==> 명 
  EMAIL            ==> 이메일 
  PHONE_NUMBER     ==> 전화번호 
  HIRE_DATE        ==> 입사일자         
  JOB_ID           ==> 직종아이디 
  SALARY           ==> 기본급여  
  COMMISSION_PCT   ==> 커미션(수당)퍼센티지 0.2 가 기본급의 20% 
  MANAGER_ID       ==> 직속상관(사수)의 사원번호    
  DEPARTMENT_ID    ==> 본인이 근무하는 부서번호 
*/

select *
from locations; -- 부서 위치를 알려주는 테이블

select *
from countries; -- 국가 정보를 알려주는 테이블

select *
from regions;  -- 대륙정보를 알려주는 테이블

-- **** 테이블 생성 이후에 해야할 일은 테이블명과 컬럼명에 주석문을 꼭 달아주어야 한다. **** --

select *
from user_tab_comments;
-- 현재 오라클 서버에 접속한 사용자(지금은 HR)가 만든 테이블명, 뷰명에 주석문을 단 것을 조회하는 것 

select *
from user_tab_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES 테이블에 달려진 주석문을 조회하는 것이다.

select *
from user_col_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES 테이블의 컴럼에 달려진 주석문을 조회하는 것이다.

create table tbl_user
(userid varchar2(20) not null
,passwd varchar2(20) not null
,name varchar(20) not null
,addr varchar(100) null
,constraint PK_tbl_user_userid primary key(userid)
);

comment on table tbl_user
is '회원정보 연습 테이블' ;

comment on column tbl_user.userid
is '사용자 아이디 필수입력사항';

comment on column tbl_user.passwd
is '암호의 길이는 최소 8글자 이상의 영문자, 숫자, 특수기호가 혼합되어야함';

select *
from user_tab_comments;

select *
from user_col_comments
where table_name = 'TBL_USER';

--- *** NULL 을 처리해주는 함수 *** ---
  1. nvl
  select nvl(7,3), nvl(null,3),
         nvl('이순신','거북선'), nvl(null,'거북선')

  from dual;
  2. nvl2
  select nvl2(7,3,2), nvl2(null,3,2)
  from dual;
  
  /*
    null 은 존재하지 않는 것이므로 사칙연산(+,-,/,*)에 들어가면
    그 결과는 무조건 null 이 된다.
  */

 select 2+3, 1+null
 from dual;
 
 select employee_id, first_name, last_name,
         salary, commission_pct,
         salary * commission_pct,
  
         nvl(salary + (salary * commission_pct), salary),
         nvl2(commission_pct, salary + (salary * commission_pct), salary)
 from employees;
  
 select employee_id 사원번호, first_name 성, last_name 이름,
          nvl2(commission_pct, salary + (salary * commission_pct), salary) as "월 급"
          
 from employees;

select '자바' || 1234 || '오라클' || sysdate
from dual;

select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual; -- RR/MM/DD

-- 테이블에 컬럼 추가하기(employees 테이블에 주민번호 컬럼을 추가)
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
 
 -- 테이블에 컬럼 삭제하기(employees 테이블에 주민번호 컬럼을 삭제)
alter table employees
drop column jubun;

select *
from tbl_user;
 
-- tbl_user 테이블에 데이터 추가하기.
insert into tbl_user(userid, passwd, name, addr)
values('hansk', 'qwer1234', '한석규', '서울시 종로구');
Rollback;
commit;
/*
DML(Data Manuplation Language) -- 데이터 조작어
==> 1. insert(입력)   2. update(변경)    3. delete(삭제)
DML 문은 바로 디스크에 적용되자 않고 메모리(RAM)상에서만 적용되어진다.
그래서 디스크에 적용(저장)을 하려면 commit; 을 해야하고 만약에 디스크에 적용하지 않으려면
rollback을 한다.

이미 commit 되어진 정보는 rollback; 해봐야 소용없다.
*/
