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

insert into tbl_user(userid, passwd, name, addr)
values('dusk', 'qwer1234', '두석규', '서울시 강남구');

insert into tbl_user(userid, passwd, name, addr)
values('seck', 'qwer1234', '세석규', '서울시 강북구');

commit;
-- tbl_user 테이블에 존재하는 데이터 값을 변경하기
update tbl_user set name = '이순신', addr = '경기도 군포시';

select *
from tbl_user;

Rollback;

update tbl_user set name = '이순신', addr = '경기도 군포시'
where userid = 'dusk';

commit;

-- tbl_user 테이블에 있는 모든 행들을 삭제한다.
delete from tbl_user
where userid = 'dusk';

select *
from employees;

-- employees 테이블에서 각 부서번호마다 존재하는 직종 ID값을 출력하세요
select department_id, job_id
from employees;

-- select 되어진 결과물에서 행의 결과값이 중복되어 나온다면
-- 중복된 행을 제거하고 1개만 보이고 싶을때 distinct를 사용한다.
select distinct department_id, job_id
from employees;

-- select 되어진 결과물을 정렬(sort)하려면 order by 절을 이용한다
select distinct department_id, job_id
from employees
order by department_id asc; -- 오름차순 정렬

select distinct department_id, job_id
from employees
order by department_id desc; -- 내림차순 정렬

select distinct department_id, job_id
from employees
order by department_id; -- 오름차순 정렬(asc 는 생략가능)

-- *** 비교연산자 *** --

/* employees 테이블에서 부서번호가 50번인 부서에 근무하는
  사원들의 부서번호, 사원번호, 사원명, 월급을 나타내세요
*/
select department_id as "부서번호" , employee_id, first_name||' '||last_name as "이름" ,
      nvl(salary + (salary * commission_pct), salary) as "월급"
from employees
where department_id = 50
order by "월급" desc; -- 월급 컬럼의 내림차순 정렬

select department_id as "부서번호" , employee_id, first_name||' '||last_name as "이름" ,
      nvl(salary + (salary * commission_pct), salary) as "월급"
from employees
where department_id = 50
order by 4 desc; -- 4번쨰 컴럼의 내림차순 정렬

/*
  employees 테이블에서 부서번호가 50번에 근무하는 사원들을 제외한 사원들에 대해서
  부서번호, 사원번호, 사원명, 월급을 나타내세요.
*/
select department_id as "부서번호" , employee_id, first_name||' '||last_name as "이름" ,
      nvl(salary + (salary * commission_pct), salary) as "월급"
from employees
where department_id != 50 
order by 1;

select *
from employees
where department_id is null; -- null은 존재하지 않는 것이므로 비교대상이 될수가 없다.
                             -- department_id == null 로는 비교가 안됨
                             -- 그래서 is를 사용해야하고, 비교연산자를 사용하려면
                             -- nvl()함수를 통해서 비교해준다

select department_id,nvl(department_id, -99999), first_name, last_name
from employees;

desc employees; -- 조회하고자하는 값이 null인지 확인

select department_id, first_name, last_name
from employees
where nvl(department_id, -9999) = -9999;

select department_id as "부서번호" , employee_id, first_name||' '||last_name as "이름" ,
      nvl(salary + (salary * commission_pct), salary) as "월급"
from employees
where nvl(department_id, -9999) != 50  
order by 1;

select department_id as "부서번호" , employee_id, first_name||' '||last_name as "이름" ,
      nvl(salary + (salary * commission_pct), salary) as "월급"
from employees
where nvl(department_id, -9999) <> 50 -- !=이랑 같은의미 
order by 1;

select department_id as "부서번호" , employee_id, first_name||' '||last_name as "이름" ,
      nvl(salary + (salary * commission_pct), salary) as "월급"
from employees
where nvl(department_id, -9999) ^= 50 -- !=이랑 같은의미 
order by 1;


select department_id as "부서번호" , employee_id, first_name||' '||last_name as "이름" ,
      nvl(salary + (salary * commission_pct), salary) as "월급"
from employees
where not nvl(department_id, -9999) = 50 
order by 1;

select *
from employees
where not department_id is null; -- department_id 가 null값이 아닌 데이터 보기

select *
from employees
where department_id is not null; 

/*
  오라클은 테이블에 저장된 데이터값에 대해서만 대,소문자를 구분한다.
  문자열 함수중에 대,소문자를 변경해주는 upper(),lower(),initcap() 이 있다.
  emplyees 테이블에서 성(first_name)이 'John' 인 사원만
  사원번호, 사원명, 기본급여의 정보를 추출하세요
*/

select employee_id, first_name || ' ' || last_name, salary
from employees
where first_name = 'John'; -- 데이터값은 대소문자 구분


select first_name, upper(first_name), lower(first_name)
from employees;

select street_address, upper(street_address), lower(street_address),
        initcap(street_address) -- initcap() 단어를 기준으로 첫번째 글자만 대문자 나머지는 소문자   
from locations;

select 'seOUl cITy', upper('seOUl cITy'), lower('seOUl cITy'), initcap('seOUl cITy')
from dual;

select employee_id, first_name || ' ' || last_name, salary
from employees
where lower(first_name) = lower('jOhn');

-- employees 테이블에서 검색어로 성명을 'jOHn sEo'로 검색했을 경우
-- 사원번호, 성, 이름, 기본급여를 출력하세요.

select Employee_Id, First_Name, Last_Name, Salary
from employees
where upper(first_name || ' ' || Last_Name) = upper('jOHn sEo');

-- *** or, and , not, in 연산자에 대해서 알아본다. *** --

/*
  employees 테이블에서 부서번호가 30, 60, 90번 부서에
  근무하는 사원들에 대해서 사원번호, 사원명, 연봉(월급*12), 부서번호를 출력
*/
select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where Department_Id = 30 or Department_Id = 60 or Department_Id = 90;

select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where Department_Id in(30,60,90); -- Department_Id = 30 or Department_Id = 60 or Department_Id = 90; 와 같은결과

/*
  employees 테이블에서 부서번호가 30, 60, 90번 부서에
  근무하지 않는 사원들에 대해서 사원번호, 사원명, 연봉(월급*12), 부서번호를 출력
*/
select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where nvl(department_id,-9999) != 30 and nvl(department_id,-9999) != 60 and nvl(department_id,-9999) != 90
order by 4;

select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where not nvl(Department_Id,-9999) in(30,60,90)
order by 4;

select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where nvl(Department_Id,-9999) not in(30,60,90)
order by 4;

/*
  employees 테이블에서 부서번호가 30, 60, 90번 부서에
  근무하지 않는 사원들에 대해서 사원번호, 사원명, 연봉(월급*12), 부서번호의 오름차순으로 정렬한후
  연봉의 내림차순으로 정렬하여 출력
*/

select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where nvl(department_id, -9999) not in (30,60,90)
order by 4, 3 desc;

-- *** and, or, not 연산자의 우선순위 *** ---
-- and, or, not 연산자가 혼용되어지면 우선순위를 따르는데 not > and > or 의 순의를 따라간다.
-- 우선순위에 있어서 최우선은 () 이다.

/*
    employees 테이블에서 부서번호가 30, 50, 60번 부서에
    근무하는 사원들중에 연봉이 20000 이상 60000 이하인
    사원들만 사원번호, 사원명, 연봉(월급*12), 부서번호를 출력
    부서번호별로 오름차순 정렬한 후 연봉의 내림차순으로 정렬하여 출력하세요.
*/
select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where department_id = 30 or department_id = 50 or department_id = 60
      and 20000 <= nvl(salary + (salary * commission_pct),salary) *12
      and nvl(salary + (salary * commission_pct), salary)*12 <= 60000
order by 4 , 3 desc; -- and 연산자가 우선순위서 값이 이상하게 나온다.

select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where (department_id = 30 or department_id = 50 or department_id = 60)
      and 20000 <= nvl(salary + (salary * commission_pct),salary) *12
      and nvl(salary + (salary * commission_pct), salary)*12 <= 60000
order by 4 , 3 desc; 

select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where nvl(department_id, -9999) in (30,50,60) and 20000 <= nvl(salary + (salary * commission_pct),salary) *12
      and nvl(salary + (salary * commission_pct), salary)*12 <= 60000
order by 4 , 3 desc;

-- 범위를 나타내어주는 연산자가 있다.
-- A(이상) 부터 B(이하) 까지  => between A and B

select employee_id as "사원번호", First_Name || ' ' || Last_Name as "사원명",
        nvl(Salary +(Salary * Commission_Pct), Salary)*12 as "연봉", Department_Id as "부서번호"
from employees
where nvl(department_id, -9999) in (30,50,60) and 
      nvl(salary + (salary * commission_pct),salary) * 12 between 20000 and 60000
order by 4 , 3 desc;

-- in 보다는 or 를 , between 보다는 <= 을 사용할 것을 권장(속도 차이)

---- **** like 연산자 **** ----
select *
from employees
where department_id = 80;

select *
from employees
where department_id like 80;

update employees set first_name = 'J'
where employee_id = 100;

commit;

-- employees 테이블에서 first_name 의 값이 첫글자가
-- 'J'로 시작하는 사원들만 모든 정보를 나타내세요.
select *
from employees
where first_name like 'J%'; -- first_name의 값이 J로시작하는 정보 출력

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
    like 연산자와 함께 사용하는 _는 아무글자 1개를 뜻한다.
    like 연산자와 함께 사용하는 %는 글자가 있든지 없던지
    
*/
select first_name, last_name, department_id
from employees
where last_name like 'F_e%';

-- [퀴즈] employees 테이블에서 성별이 여자만 사원번호, 사원명, 주민번호를 나타내세요

select employee_id as "사원번호", first_name ||' ' ||last_name as "사원명", jubun as "주민번호"
from employees
where jubun like '______2%' or jubun like '______4%' ;

create table tbl_watch(watchname varchar2(30), bigo varchar2(200));

insert into tbl_watch values('금시계', '순금 99.99% 함유 고급시계');
insert into tbl_watch values('은시계', '고객만족도 99.99점 획득 고급시계');

-- tbl_watch 테이블에서 bigo 컬럼에 99.99% 라는 글자가 들어있는 행만 추출하세요.
select *
from tbl_watch
where bigo like '%99.99%%'; -- %가 문자열로 인식을 못함.

select *
from tbl_watch
where bigo like '%99.99\%%' escape '\'; 

/*
※ 단일행 함수의 종류

1. 문자함수 
2. 숫자함수
3. 날짜함수
4. 변환함수
5. 기타함수

----------------------------------------------

================= 1. 문자함수 =================
  1.1 lower
  1.2 upper
  1.3 initcap
  1.4 substr : 문자열중 특정문자 또는 문자열의 일부분을 선택할때 사용함.
  1.5 lenth : 문자열 길이를 알려주는 것.
  1.6 lengthb : 문자열의 byte수를 알려주는 것.
  1.7 instr : 어떤 문자열에서 명명된 문자의 위치를 알려주는 것.
  1.8 reverse : 어떤 문자열을 거꾸로 보여주는 것이다.
  1.9 lpad : 왼쪽부터 문자를 자리채움
  1.10 rpad : 오른쪽부터 문자를 자리채움
  1.11 ltrim : 왼쪽부터 문자를 제거하는 함수
  1.12 rtrim : 오른쪽부터 문자를 제거하는 함수
  1.13 translate 
  1.14 replace 
*/

select 'KH정보교육원',
         substr('KH정보교육원',3,2),
         substr('KH정보교육원',3)
from dual;        

--1.4 substr
-- [퀴즈] employees 테이블에서 성별이 남자만 사원번호, 사원명, 주민번호를 나타내세요

select employee_id as "사원번호", first_name || ' ' || last_name as "사원명", jubun as "주민번호" 
from employees
where substr(jubun,7,1) = 1 or substr(jubun,7,1) = 3;
1234561234567
--1.5 lenth
select length('KH정보교육원'), length('Korea')
from dual;

--1.6 lengthb
select lengthb('KH정보교육원'), lengthb('Korea')
from dual;

--1.7 instr

select instr('KH정보교육원 국가정보원 정보문화사', '정보', 1, 1),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', 1, 2),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', 4, 1),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', 4, 3),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', 1),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', 4),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', -1, 1), -- 거꾸로 읽어온다 
      instr('KH정보교육원 국가정보원 정보문화사', '정보', -1, 2),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', -4, 1),
      instr('KH정보교육원 국가정보원 정보문화사', '정보', -4, 3)
from dual;

--1.8 reverse
select 'ORACLE', reverse('ORACLE')
from dual;

select '한글', reverse('한글'), reverse(reverse('한글')) 
from dual;

create table tbl_files
(fileno number(3), --- -999~999 까지 가능 number(5) -> -99999 ~ 99999
 filepath varchar2(100));
 
 insert into tbl_files(fileno, filepath) values (1,'C:\document\resume.hwp');
 insert into tbl_files(fileno, filepath) values (2,'d:\mymusic.mp3');
 insert into tbl_files(fileno, filepath) values (3,'C:\myphoto\abc\def\face.jpg');
 
 commit;
 
 select *
 from tbl_files;
 
 /*
 -- [퀴즈] 아래와 같이 나오도록 하세요.
 ------------------------------------
  파일번호    파일명
------------------------------------ 
   1          resume.hwp
   2          mymusic.mp3
   3          face.jpg
*/

select fileno as "파일번호", reverse(substr(reverse(filepath) , 1, instr(reverse(filepath),'\',1)-1)) as "파일명"
from tbl_files
order by 1;

select fileno as "파일번호", substr(filepath ,instr(filepath, '\', -1, 1)+1)
from tbl_files
order by 1;

-- 1.9 1.10 lpad rpad

select lpad('정보교육원', 20, '정보교육원'), -- 20바이트
       rpad('정보교육원', 20, '*')
from dual;

select lpad('대한민국',length('대한민국')*2*5,'대한민국') ,lengthb('대한민국')
from dual;
         
-- 1.11 1.12 ltrim rtrim

select ltrim('aabccdadsabcd', 'abcd'), -- 왼쪽부터 a또는b또는c또는d가있으면 문자제거ㄴ
       rtrim('aabbbtddabca', 'abcd')
from dual;

select 'kH' || '                        정보           교육원              ',
        'kH' || ltrim('                       정보           교육원              ') -- 글자지정을 안해주면 공백삭제
from dual;

1.13 translate  
 
select translate('010-3456-0987','0123456789', '영일이삼사오육칠팔구')
from dual;

select *
from tbl_user;

insert into tbl_user(userid, passwd, name, addr) values ('superman' , 'qwer1234', '슈퍼맨', '서울시 종로구');
commit;

insert into tbl_user(userid, passwd, name, addr)
    values ('batman' , translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789','ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210'), '배트맨', '경기도 의정부시');

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

select replace('KH정보교육원 교육진흥원 서울교육대학교','교육', 'education')
from dual;

insert into tbl_user(userid, passwd, name , addr) values ('kimys', 'abcd', '김유신', '서울');
insert into tbl_user(userid, passwd, name , addr) values ('leesa', 'abcd', '이영이', '서울');
insert into tbl_user(userid, passwd, name , addr) values ('yong', 'abcd', '이엘리아', '서울');
insert into tbl_user(userid, passwd, name , addr) values ('park', 'abcd', '박아님', '서울');
insert into tbl_user(userid, passwd, name , addr) values ('leebon', 'abcd', '이본', '서울');
insert into tbl_user(userid, passwd, name , addr) values ('leess', 'abcd', '이순신', '서울');
commit;

select *
from tbl_user;
-- 문제 성이 '이'씨인 사람만 성을 '리'씨로 변경하세요


-- update tbl_user set name = replace(substr(name, 1,1),'이','리') || substr(name,2) where substr(name, 1,1) = '이';  

update tbl_user set name = '리'|| substr(name,2)  where name like '이%';

select *
from tbl_user;

rollback;

/*
  ========== 2.숫자함수 ==============
  
  -- 2.1 mod : 나머지를 구해주는 것
  -- 2.2 round : 반올림을 해주는 것
  -- 2.3 trunc : 절삭 해주는 것
  -- 2.4 poer : 거듭제곱
  -- 2.5 sqrt : 제곱근
  -- 2.6 sign : 결과값이 양수이라면 1, 0이라면 0, 음수라면 -1을 리턴
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
 
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0001' , '한석규', 100, 100, 100);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0002' , '두석규', 80, 83, 87);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0003' , '세석규', 90, 91, 99);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0004' , '네석규', 60, 50, 59);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0005' , '오석규', 82, 80, 80);

select *
from tbl_sungjuk;

select hakbun as "학번", name as "학생명", kor as "국어", eng as "영어", math as "수학",
       (kor +eng +math) as "총점", round((kor +eng +math)/3) as "평균",
       case(trunc(round((kor +eng +math)/3)/10)) when 10 then 'A' when 9 then 'A' when 8 then 'B'
            when 7 then 'C' when 6 then 'D' else 'F' end as 학점1,
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
 ================= 3. 날짜함수 =================
 -- 현재 오라클 서버의 시스템의 시간을 알려주는 것.
*/
select sysdate, current_date, -- RR/MM/DD
       localtimestamp, current_timestamp
from dual;

select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

-- 3.1
/*
  날짜 + 숫자 = 날짜
  날짜 - 숫자 = 날짜
  여기서 숫자의 단위는 일수 이다.
*/
select sysdate -1 as "어제시각", sysdate as "현재시각", sysdate + 1 as "내일시각"
from dual;


select to_char(sysdate -1,'yyyy-mm-dd hh24:mi:ss' ) as "어제시각", to_char(sysdate -1,'yyyy-mm-dd hh24:mi:ss' ) as "현재시각",
               to_char(sysdate + 1, 'yyyy-mm-dd hh24:mi:ss') as "내일시각" , to_char(sysdate + 1 + 2/24 + 3/(24*60) + 4/(24*60*60),'yyyy-mm-dd hh24:mi:ss')  as "1일2시간3분4초뒤"
from dual;

-- 3.2
/*
 날짜 - 날짜 = 숫자(숫자의 단위는 일수)
*/
select (sysdate+2) - (sysdate+1) 
from dual;

-- 3.3 add_months
select add_months(sysdate, -2) as "2개월 전", sysdate as "현재" , add_months(sysdate, 2) as "2개월 후"
from dual;
/*
 문제 오늘부로 김시온씨가 또 군대에 끌려간다.
 군복무기간이 21개월 가정한다면
 첫번쨰, 제대일자를 구하시고,
 두번쨰, 제대일자까지 먹어야할 짬밥의 그릇수를 구하세요
 (단, 1일 3끼를 먹는다.)
*/

select add_Months(sysdate,21) as "제대일자" , (add_Months(sysdate,21) - sysdate + 1) * 3 as "그릇수"
from dual;

-- 1일 2시간 3분 4초를 초로 나타내어 보자
select 1*24*60*60 + 2*60*60 + 3*60 + 4
from dual;

-- 185초
select trunc(185/60) ||'분', mod(185,60) || '초'
from dual;

-- 93784초를 1일 2시간 3분 4초로 나타내어 보자
select trunc(trunc(trunc(93784/60)/60)/24) || '일',mod(trunc(trunc(93784/60)/60),24) || '시간', mod(trunc(93784/60),60) || '분', mod(93784,60)|| '초'
from dual;

-- 현재시각으로 부터 수료일자('2018-07-31 18:00:00') 까지 남은 기간을 일 시간 분 초 로 나태나세요

select trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) ) || '초'
from dual;

select trunc(trunc(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60)/60)/24) || '일' ||
       mod(trunc(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60)/60),24) || '시간' ||
       mod(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60),60) || '분' ||
       mod(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) ),60)|| '초' as "수료시까지 남은 기간"
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
      , trunc(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60)/24) || '일 ' ||
        mod(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60), 24) || '시간 ' ||
        mod(trunc((trunc( (expire_date - sysdate ) * (24*60*60) ))/60), 60) || '분 ' ||
        mod((trunc( (expire_date - sysdate ) * (24*60*60) )),60) || '초' 
        as "종료까지남은기간"
 from tbl_auction;

desc employees;

select employee_id, first_name, hire_date, jubun
from employees; -

-- 3.4 extract -- 날짜에서 년, 월, 일을 추출해주는 함수

select sysdate,
       to_char(sysdate, 'yyyy') as "년도1",
       extract(year from sysdate) as "년도2",
       to_char(sysdate, 'mm') as "월1",
        extract(month from sysdate) as "월2",
        to_char(sysdate, 'dd') as "일1",
        extract(day from sysdate) as "일2"
from dual; -- 자동으로 문자는 왼쪽정렬 숫자는 오른쪽정렬


-- employees 테이블에서 아래와 같이 나오도록 하세요.
-- 사원번호, 사원명, 주민번호, 성별, 생년, 현재 나이

select employee_id as "사원번호" , first_name || ' ' || last_name as "사원명",
       jubun as "주민번호", case when substr(jubun,7,1) in ('1' ,'3') then '남' else '여' end as "성별" ,
       substr(jubun,1,2) as "년생",
       extract(year from sysdate) - to_number(case  when  substr(jubun,7,1) in('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1 as "나이" --to_number(문자) 숫자로 변경
from employees;

-- employees 테이블에서 아래와 같이 나오도록 하세요.
-- 여자중에 나이가 20대와 40대만 사원번호, 사원명, 주민번호, 성별, 생년, 현재 나이

/*
   ==========  VIEW(뷰) 란? ===============
   테이블은 아니지만 select 되어져 나오는 결과물들이
   테이블 모양과 같으므로 그 결과물을 테이블처럼 보는것(간주하는 것)을 말한다.
*/
select V.*
from(
select employee_id , first_name || ' ' || last_name as "사원명",
       jubun, case when substr(jubun,7,1) in ('1' ,'3') then '남' else '여' end as "GENDER" ,
       substr(jubun,1,2) as "년생",
       extract(year from sysdate) - to_number(case  when  substr(jubun,7,1) in('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1 as "AGE"
from employees
) V -- inline View라고 부른다
where V.GENDER = '여' and trunc(V.AGE, -1) in ('20','40');


-- 3.5 months_between -- 두날짜의 개월 차이를 알려주는 것.
select months_between (add_months(sysdate,5), sysdate)
from dual;

-- 3.6 last_day(특정날짜) 
--   --> 특정날짜가 포함된 달력에서 맨 마지막날을 알려주는 것이다.
select last_day(sysdate),last_day(to_date('2016-02-09'))
from dual;
/*
    [퀴즈]
    employees 테이블에서
    사원번호, 사원명, 주민번호, 성별, 현재나이, 월급,
    입사일자, 정년퇴직일 을 나타내세요
    
    -- 정년퇴직일이라 함은[교육원공무원법상];
      해당 사원의 생월 3월에서 8월에 태어난 사람은 해당사원 나이(한국나이)가
      63세가 되는 년도의 8월31일로 하고,
      해당 사원의 생월 9월에서 2월에 태어난 사람은 해당사원 나이(한국나이)가
      63세가 되는 년도의 2월말(2월28일 또는 2월29일 로 한다.
      
*/
-- 내가푼 예제 --
select v.employee_id AS "사원번호", v.ename AS "사원명", v.jubun AS "주민번호", v.age AS "현재나이",
       v.salary as "월급",v.hire_date as "입사년도",
       last_day ('20' ||substr(add_Months(sysdate, (63-v.age)*12),1,2) || '-' ||
          case when v.lmonth in ('9','10','11','12','1','2') then '02-02' else '08-08' end) as "퇴사년도"
       
from (
select employee_id , first_name || ' ' || last_name AS ename, jubun ,
       case when substr(jubun,7,1) in ('1','3') then '남자' else '여자' end AS gender,
       extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) + 1 AS age,
       salary + nvl(salary*commission_pct,0) AS salary, hire_date, to_number(substr(jubun,3,2)) AS lmonth,
       63 - (extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) +1)  AS lyear
       
          
from employees
)v;

-----  다른 코드 ----------
select employee_id AS "사원번호",
       ename AS "사원명",
       jubun AS "주민번호",
       gender AS "성별",
       age AS "현재나이",
       monthsal AS "월급",
       to_char(hire_date, 'yyyy-mm-dd') AS "입사일자",
       to_char( last_day(to_char(add_months(sysdate , (63-V.age)*12),'yyyy-') || case when to_number(substr(v.jubun,4,1)) between 3 and 8 then '08-08' else '02-02' end),'yyyy-mm-dd' ) as "퇴사년도"
       
from (
select employee_id ,
       first_name || ' ' || last_name AS ENAME, 
       jubun,
       case when substr(jubun,7,1) in ('1','3') then '남자' else '여자' end AS GENDER,
       extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) + 1 AS AGE,
       nvl(salary + (salary*commission_pct), salary) AS MONTHSAL,
       hire_date
       
from employees
)V;

/*
    
*/
select sysdate, to_char(sysdate, 'day'), to_char(sysdate, 'dy'), -- 18/02/28 , 수요일, 수
       to_char(sysdate ,'d'), -- 4                  '1' '2' '3' '4' '5' '6' '7'  일 월 화 수 목 금 토 , linux 에서는 영어 표현
       case to_char(sysdate, 'd') when '1' then '일'
                                  when '2' then '월'
                                  when '3' then '화'
                                  when '4' then '수'
                                  when '5' then '목'
                                  when '6' then '금'
                                  when '7' then '토'
       end AS "오늘의 요일명"
from dual;


--   number(4) -->  -9999~9999   number(4,2)  --> -99.99 ~ 99.99   number(2,2) --> -0.99 ~ 0.99   
create table tbl_loan
(gejanum  varchar2(10),
 loanmoney  number,         -- 대출금
 interestrate number(2,2),    -- 이자율      
 paymentdate  varchar2(2),         -- 이자를 내는 날짜
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
  

/* 예제 1
 계좌번호    대출금 대출이자율    이번달상환일자
10-1234-01	5000	  0.03	    2018-02-05
10-1234-02	5000	  0.03	    2018-02-07
10-1234-03	5000	  0.03	    2018-02-15
10-1234-04	5000	  0.03	    2018-02-28
*/

select gejanum AS "계좌번호",
       loanmoney AS "대출금",
       interestrate AS "대출이자율",
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS "이번달상환일자"
from tbl_loan;

/* 예제 2
 계좌번호    대출금 대출이자율    이번달상환일자     이번달 상환요일명
10-1234-01	5000	  0.03	    2018-02-05            2
10-1234-02	5000	  0.03	    2018-02-07            4
10-1234-03	5000	  0.03	    2018-02-15            5
10-1234-04	5000	  0.03	    2018-02-28            4
10-1234-05	5000	  0.03	    2018-02-10	          7
*/
select gejanum AS "계좌번호",
       loanmoney AS "대출금",
       interestrate AS "대출이자율",
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS "이번달상환일자",
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(sysdate), 'yyyy/mm/dd')
                       else to_char(sysdate, 'yyyy/mm/') || paymentdate
                       end)
                       ,'d') as "이번달 상환요일명"
from tbl_loan;

/* 예제 3 (토요일, 일요일이면 월요일날 상환)
 계좌번호    대출금 대출이자율    이번달상환일자     이번달 상환요일명
10-1234-01	5000	  0.03	    2018-02-05            2
10-1234-02	5000	  0.03	    2018-02-07            4
10-1234-03	5000	  0.03	    2018-02-15            5
10-1234-04	5000	  0.03	    2018-02-28            4
10-1234-05	5000	  0.03	    2018-02-12	          7
*/

select gejanum AS "계좌번호",
       loanmoney AS "대출금",
       interestrate AS "대출이자율",
       to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end) AS "이번달상환날짜"
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

select gejanum AS 계좌번호,
       loanmoney AS 대출금,
       interestrate AS 대출이자율,
       to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end) AS 이번달상환날짜,
       to_date(add_months(Monthday,-1)) + (case to_number(bfdayname) when 1 then 1 when 7 then 2 else 0 end) AS 지난달상환일자,
       ( (to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end)) 
                            -  (to_date(add_months(Monthday,-1)) + (case to_number(bfdayname) when 1 then 1 when 7 then 2 else 0 end)) ) * (loanmoney * interestrate) as 이자금액
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
   -- 돌아오는 요일명중 가장 빠른날을 알려주는 것.

select sysdate,
       next_day(sysdate, '토'),
       next_day(sysdate, '금'),
       next_day(sysdate, '수')
from dual;

-- 3.8 to_yminterval, to_dsinterval
-- 현재일로 부터 1년 2개월 3일 4시간 5분 6초 뒤를 나타내세요.

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
       to_char(add_months(sysdate , 1*12+2) + 3 + 4/24 + 5/(24*60) + 6/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') ,
       to_char(sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'),'yyyy-mm-dd hh24:mi:ss' )
from dual;

select 
from dual;


-- 4. 변환함수
  -- 4.1 to_char -- 숫자, 날짜를 문자타입으로 변환시켜주는 것.

select to_char(sysdate, 'yyyy') AS "년도",
       to_char(sysdate, 'mm') AS "월",
       to_char(sysdate, 'dd') AS "일",
       to_char(sysdate, 'hh') AS "24시간",
       to_char(sysdate, 'hh am') AS "12시간" ,
       to_char(sysdate, 'hh pm') AS "12시간",
       to_char(sysdate, 'mi') AS "분",
       to_char(sysdate, 'ss') AS "초",
       to_char(sysdate, 'q') AS "분기", -- 1월~3월 : 1, 4월~6월 : 2, 7월~9월 : 3, 10월~12월 : 4
       to_char(sysdate, 'day') AS "요일명",
       to_char(sysdate, 'dy') AS "요일명",
       to_char(sysdate, 'd') AS "요일명"
from dual;

select to_char(sysdate, 'ddd'), -- 올해부터 부터 sysdate까지 몇일쨰인지
       to_char(sysdate, 'dd'), -- 현재달의 마지막 일
       to_char(sysdate, 'dd')
from dual;

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
       ,to_char(sysdate, 'yyyy-mm-dd') -- 년월일만 뽑아오면 0시0분-초
from dual;

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
       ,to_char(to_date(to_char(sysdate, 'yyyy-mm-dd')), 'yyyy-mm-dd hh24:mi:ss')  -- 년월일만 뽑아오면 0시0분-초
from dual;

select (sysdate - to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')) * (24*60*60),
       to_char(sysdate,'sssss') -- 자정을부터 현재까지 흘러간 초
from dual;

select 123456789
       ,to_char(123456789, '999,999,999')
       ,to_char(123456789, 'L999,999,999') -- 나라의 기호
       ,to_char(123456789, '$999,999,999') -- 달러
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

-- 4.2 to_date -- 문자를 날짜타입으로 변환해주는 것.
-- 4.3 to_number -- 문자를 숫자타입으로 변환해주는 것.
select '2', to_number('2'), 2
from dual;

/*
 ================= 5. 기타함수 =================
 -- 5.1 case when then else endf
 -- 5.2 decode
*/

select case 5-2 when 4 then '5-2=4 입니다' when 1 then '5-2=1 입니다' when 3 then '5-2=3 입니다'
       else '나는 수학을 몰라요 ㅜㅜ' end
from dual;

select decode(5-2, 4, '5-2=4 입니다',
                   1, '5-2=1 입니다',
                   3, '5-2=3 입니다',
                      '나는 수학을 몰라요 ㅜㅜ') as 결과 -- decode는 밑에 예제와 같이 참거짓을 구분할수 업다.
from dual;

select case  when 4>5 then '4는 5보다 큽니다' when 5>7 then '5는 7보다 큽니다' when 3>2 then '3은 2보다 큽니다'
       else '나는 수학을 몰라요 ㅜㅜ' end
from dual;


select case (select count(*)
              from tbl_user
              where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
              'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')) when 1 then '로그인 성공' else '로그인 실패' end as "로그인 결과"
from dual;

select decode((select count(*)
                 from tbl_user
                 where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')),1, '로그인 성공'
                 ,'로그인 실패') as 결과
from dual;



select case( select count(*)
             from tbl_user
             where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
              'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210'))
       when 1 then '로그인 성공' else(case ( select count(*) 
                                            from tbl_user
                                            where userid = 'batman')
                               when 1 then '패스워드가 틀렸습니다' else '아이디가 없습니다.' end  )
       end as "로그인 결과"
from dual;

select decode((select count(*)
                 from tbl_user
                 where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')),1, '로그인 성공'
                 , decode(( select count(*) 
                            from tbl_user
                            where userid = 'batman'),1, '비밀번호가 틀렸습니다'
                            ,'아이디가 없습니다')) as 결과
from dual;

select employee_id, first_name || ' ' || last_name, jubun, 
       case(substr(jubun,7,1)) when '1' then '남' when '3' then '남' else '여' end as 성별1,
       case when substr(jubun,7,1) in ('1','3') then '남' else '여' end as 성별2,
       decode(substr(jubun,7,1),'1','남'
                               ,'3','남'
                               ,'여') as 성별3
from employees;

-- 5.3 등수 rank, 서열 dense_rank
select department_id AS 부서번호, 
       employee_id AS 사원번호,
       first_name || ' ' || last_name AS 사원명,
       salary AS 기본급여,
       rank() over(order by salary desc) AS 전체기본급여등수,
       dense_rank() over(order by salary desc) AS 전체기본급여서열,
       rank() over(partition by department_id
                    order by salary desc) AS 부서내급여등수,
       dense_rank() over(partition by department_id
                         order by salary desc) AS 부서내기본급여서열
       
from employees
order by 1;

select *
from(
select department_id AS 부서번호, 
       employee_id AS 사원번호,
       first_name || ' ' || last_name AS ENAME,
       salary,
       rank() over(order by salary desc) AS RANKING
from employees
-- where rank() over(order by salary desc) <= 10;  오류!!!! where절에는 사용불가
)v
where ranking <= 10;

-- 예제 각부서별 1등만 출력--

select *
from(
select department_id AS 부서번호, 
       employee_id AS 사원번호,
       first_name || ' ' || last_name AS ENAME,
       salary,
       rank() over(order by salary desc) AS RANKING,
       rank() over(partition by department_id
                    order by salary desc) AS DEPTRANKING
from employees
-- where rank() over(order by salary desc) <= 10;  오류!!!! where절에는 사용불가
)v
where deptranking = 1;

-- 5.4 -- greatest, lesast : 나열된수 중에  큰값, 작은값

select greatest(10, 90, 100, 80), least(10, 90, 100, 80)
from dual;

select greatest('김유신', '윤봉길', '허준', '고두심'),
       least('김유신', '윤봉길', '허준', '고두심')
from dual;

---- *** 그룹함수(집계함수) *** ----
 -- 중요!! 그룹함수에서는 null은 무조건 제외하고서 연산을 한다.
 
1. sum -- 합계
2. avg -- 평균
3. max -- 최대값
4. min -- 최소값
5. count -- select 되어서 나온 결과물의 행의 갯수
6. variance -- 분산
7. stddev -- 표준편차

select count(salary)
from employees;

select count(commission_pct) 
from employees; -- null을 자동으로 제외

select sum(salary)
from employees;

select sum(salary * commission_pct)
from employees; -- null을 자동으로 제외

select sum(salary) / count(salary) , avg(salary)
from employees;

select sum(salary * commission_pct) / count(*)
from employees; -- null을 자동으로 제외

select sum(nvl(salary * commission_pct, 0)) / count(nvl(salary * commission_pct, 0)),
       avg(nvl(salary * commission_pct, 0))
from employees;

/*
employees 테이블에서 부서번호별 인원수를 나타내세요
-----------------------
부서번호       인원수
-----------------------
  10
  20
  30
  40
  50
*/

select department_id AS 부서번호, count(*) AS 인원수
from employees
group by department_id
order by 1;

/* 예제
----------------------
성별      인원수
---------------------
남
여
*/

select gender AS 성별, count(*) AS 인원수
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '남' else '여' end AS GENDER 
from employees
)V
group by gender;


select case when substr(jubun,7,1) in ('1','3') then '남' else '여' end AS 성별,
       count(*) AS 인원수
from employees
group by case when substr(jubun,7,1) in ('1','3') then '남' else '여' end;

/*
------------------------------------------------
    연령대             인원수
      0
      10
      20
      30
      40
      50
      60
*/

select age AS 연령대, count(*) AS 인원수 
from(
select jubun, trunc(to_number(to_char(sysdate, 'yyyy')) - to_number(case when substr(jubun,7,1) in ('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1, -1) AS AGE
from employees
)V
group by AGE
order by 1;


select age AS 연령대, count(*) AS 인원수 
from(
select jubun, trunc(to_number(to_char(sysdate, 'yyyy')) - to_number(case when substr(jubun,7,1) in ('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1, -1) AS AGE
from employees
)V
group by AGE
order by 1;

select age AS 연령대, count(*) AS 인원수
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by age
order by 1;

---------------rollup-------------------

select department_id AS 부서번호,
       count(*) AS 인원수
from employees
group by rollup(department_id);


select gender AS 성별, count(*) AS 인원수
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '남' else '여' end AS GENDER 
from employees
)V
group by rollup(gender);


select age AS 연령대, count(*) AS 인원수
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);


select department_id,
       grouping(department_id)  -- group by 절에 rollup이 존재할 때만 사용가능 0이면 그룹화한 것들, 1이면 그룹화 아닌 전체
       ,count(*)
from employees
group by rollup(department_id);

select case grouping(department_id) when 0 then nvl(to_char(department_id),'인턴') else '전체' end  AS 부서번호
       ,count(*) AS 인원수
from employees
group by rollup(department_id);


select case grouping(gender) when 0 then gender else '전체' end AS 성별,
       count(*) AS 인원수       
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '남' else '여' end AS GENDER 
from employees
)V
group by rollup(gender);


select case grouping(age) when 0 then to_char(age) else '전체' end AS 연령대,
       count(*) AS 인원수
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);

------------ 백분율로 나타내세요--------------

select case grouping(department_id) when 0 then nvl(to_char(department_id),'인턴') else '전체' end  AS 부서번호
       ,count(*) AS 인원수,
       round(count(*)/(select count(*) from employees) *100 ,1)   || '%'  AS "퍼센티지(%)"
from employees
group by rollup(department_id);


select case grouping(gender) when 0 then gender else '전체' end AS 성별,
       count(*) AS 인원수,
       round((count(*) / (select count(*) from employees)) *100, 1) AS "퍼센티지(%)"
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '남' else '여' end AS GENDER 
from employees
)V
group by rollup(gender);



select case grouping(age) when 0 then to_char(age) else '전체' end AS 연령대,
       count(*) AS 인원수,
       round((count(*) / (select count(*) from employees))*100, 1) AS "퍼센티지(%)"
       
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);

/*
--------------------------------------------
  부서번호        성별          인원수
----------------------------------------------
   10            남
   10            여
   20
   20
   30
  
*/

select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '부서총합' end, '인턴') AS 부서번호 ,
       
       case grouping(gender)
            when 0 then gender
            else '남녀총합' end AS 성별 ,
       count(*) AS 인원수,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as 퍼센트  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '남' else '여' end  AS GENDER
      
from employees
)v
group by rollup(department_id, gender)
order by 1,2;

-- cube --
select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '부서총합' end, '인턴') AS 부서번호 ,
       
       case grouping(gender)
            when 0 then gender
            else '남녀총합' end AS 성별 ,
       count(*) AS 인원수,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as 퍼센트  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '남' else '여' end  AS GENDER
      
from employees
)v
group by cube(department_id, gender)
order by 1,2;


---> *** 요약값(rollup, cube, grouping sets) *** <---

-- 1. rollup(a,b,c) == grouping sets( (a,b,c),(a,b),(a),() )        뒤에서 하나씩 없어진다.
      rollup(department_id, gender) == grouping sets((department_id, gender), (department_id), () )
-- 2. cube(a,b,c) == grouping sets( (a,b,c), (a,b), (b,c), (a,c), (a) ,(b), (c), () )  
      cube(department_id, gender) == grouping sets((department_id, gender), (department_id), (gender), () )



select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '부서총합' end, '인턴') AS 부서번호 ,
       
       case grouping(gender)
            when 0 then gender
            else '남녀총합' end AS 성별 ,
       count(*) AS 인원수,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as 퍼센트  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '남' else '여' end  AS GENDER
      
from employees
)v
-- group by rollup(department_id, gender)
   group by grouping sets( (department_id, gender), (department_id), () )
order by 1,2;


select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '부서총합' end, '인턴') AS 부서번호 ,
       
       case grouping(gender)
            when 0 then gender
            else '남녀총합' end AS 성별 ,
       count(*) AS 인원수,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as 퍼센트  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '남' else '여' end  AS GENDER
      
from employees
)v
-- group by cube(department_id, gender)
   group by grouping sets((department_id, gender), (department_id), (gender), () )
order by 1,2;


select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '부서총합' end, '인턴') AS 부서번호 ,
       
       case grouping(gender)
            when 0 then gender
            else '남녀총합' end AS 성별 ,
       count(*) AS 인원수,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as 퍼센트  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '남' else '여' end  AS GENDER
      
from employees
)v
group by grouping sets( (department_id, gender), (gender) ) -- 원하는 값만 조회가능
order by 1,2;


-- 예제.
---------------------------------------------------------
    연령대     성별     인원수     퍼센티지
---------------------------------------------------------

select nvl(to_char(age), '전체연령대') AS 연령대,
       nvl(gender, '전체성별') AS 성별,
       count(*) AS 인원수,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' AS 퍼센티지
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '남' else '여' end  AS GENDER,
       trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end),  -1) AS AGE
      
from employees
)v
group by grouping sets( (age,gender), (age), ())
order by 1;

select case grouping(age) when 0 then to_char(age) else '전체연령대' end  AS 연령대,
       case grouping(gender) when 0 then gender else '전체성별' end  AS 성별,
       count(*) AS 인원수,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' AS 퍼센티지
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '남' else '여' end  AS GENDER,
       trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end),  -1) AS AGE
      
from employees
)v
group by grouping sets( (age,gender), (age), ())
order by 1;
/* 예제
----------------------------------------
    부서번호          월급의합계
-----------------------------------------
    10
    20
    30
    전체
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '총합' end , '인턴') AS 부서번호,
        to_char( sum(monthsal), '$999,999,999,999') AS 월급의합계
from(
select department_id,
       nvl(salary +(commission_pct*salary), salary) AS MONTHSAL
from employees
)v
group by rollup(department_id)
order by 1;


select nvl(case grouping(department_id) when 0 then to_char(department_id) else '총합' end , '인턴') AS 부서번호,
        to_char( sum(nvl(salary +(commission_pct*salary), salary)), '$999,999,999,999' ) AS 월급의합계
from employees
group by rollup(department_id)
order by 1;


/* 예제
----------------------------------------
    부서번호         평균월급     퍼센티지
-----------------------------------------
    10
    20
    30
    전체
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '총합' end , '인턴') AS 부서번호,
      to_char( sum(monthsal) / count(monthsal), '$999,999,999,999') AS 평균월급,
      round( (sum(monthsal) / count(monthsal) )  / ( select sum( nvl(salary +(commission_pct*salary), salary) )  from employees ) *100, 1 ) AS 퍼센티지
from(
select department_id,
      nvl(salary +(commission_pct*salary), salary) AS MONTHSAL
from employees
)
group by grouping sets(department_id,())
order by 1;

/*
---------------------------------------------
 전체사원수      10대미만   10대   20대   30대
---------------------------------------------
*/

select count(*) AS 전체사원수,
       sum(case age when 0 then 1 else null end) AS "10대 미만",
       sum(case age when 10 then 1 else null end) AS "10대",
       sum(case age when 20 then 1 else null end) AS "20대",
       sum(case age when 30 then 1 else null end) AS "30대",
       sum(case age when 40 then 1 else null end) AS "40대",
       sum(case age when 50 then 1 else null end) AS "50대",
       sum(case age when 60 then 1 else null end) AS "60대"
from(
select trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end) +1, -1)  AS AGE
from employees
)v;

/* 예제
------------------------------------------
  부서번호    남자     여자     총인원수
------------------------------------------
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '전체총원' end, '인턴') AS 부서번호 ,
       sum(case gender when '남자' then 1 else 0 end) AS 남자,
       sum(case gender when '여자' then 1 else 0 end) AS 여자,
       nvl(to_char(sum(case gender when '남자' then 1 else null end)), 'X') AS 남자,
       count(*) AS 총인원수
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '남자' else '여자' end AS GENDER
from employees
)v
group by rollup(department_id);

------------ having 그룹함수 조건절 -----------------
select department_id, count(*)
from employees
group by department_id
having count(*) >= 10
order by 1;
      
      
select job_id, count(*)      
from employees
group by job_id;

-- 부서번호별 월급의 합이 50000 이상인 부서번호, 월급의 합을 나타내세요.

select department_id AS 부서번호,
       to_char(sum(monthsal), '$9,999,999,999') AS 월급의합
from(
select department_id,
       nvl(salary + (salary * commission_pct), salary ) AS MONTHSAL
from employees
)V
group by department_id
having sum(monthsal) >= 50000
order by 1;

select department_id AS 부서번호,
       to_char( sum( nvl(salary + (salary * commission_pct), salary ) ), '$9,999,999,999' ) AS 월급의합
from employees
group by department_id
having sum(nvl(salary + (salary * commission_pct), salary )) >= 50000
order by 1;

-------- *** 누적에 대해서 알아봅시다 *** ----------
create table tbl_panmae
(panmaedate date,
 jepumname varchar2(20),
 panmaesu number
);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2) , '새우깡', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+1 , '새우깡', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+2 , '감자깡', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+3 , '새우깡', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1) , '고구마깡', 7 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+1 , '새우깡', 8 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+2 , '감자깡', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+3 , '감자깡', 5 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -4 , '허니버터칩', 30 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -3 , '고구마깡', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -2 , '고구마깡', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -1 , '허니버터칩', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '새우깡', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '새우깡', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '감자깡', 5 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '허니버터칩', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '고구마깡', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '감자깡', 10 );

commit;

select *
from tbl_panmae;

select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss'),
       panmaesu
from tbl_panmae;

/*
-- 아래와 같이 나오도록 하세요
-------------------------------
제품명   판매일자   판매량
새우깡   18/01/05  	10
새우깡   18/01/06  	15
새우깡   18/01/08  	10
새우깡   18/02/06  	8
새우깡   18/03/05  	20

-------------------------------
*/
select jepumname AS 제품명,
       to_char(panmaedate, 'yyyy-mm-dd') AS 판매일자,
       sum(panmaesu) AS 판매량
from tbl_panmae
where jepumname = '새우깡'
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
order by 2;

/*
-- 아래와 같이 나오도록 하세요 
-------------------------------
제품명   판매월   판매량
새우깡   18/01  	  35
새우깡   18/02    	8
새우깡   18/03   	20
-------------------------------
*/
select jepumname AS 제품명,
       to_char(panmaedate, 'yyyy-mm') AS 판매월,
       sum(panmaesu) AS 월별판매량
from tbl_panmae
where jepumname = '새우깡'
group by jepumname, to_char(panmaedate, 'yyyy-mm')
order by 2;

----- 누적구하기 -------
select employee_id, hire_date, salary,
       sum(salary) over (order by employee_id )
from employees;


select jepumname AS 제품명,
       pmonth AS 판매월,
       monthsu AS 월별판매량,
       sum(monthsu) over(order by pmonth) AS 판매량누계
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm') AS PMONTH,
       sum(panmaesu) AS MONTHSU
from tbl_panmae
where jepumname = '새우깡'
group by jepumname, to_char(panmaedate, 'yyyy-mm')
)V;

/*
-------------------------------
제품명   판매일자   판매량    판매일자별누계
새우깡   18/01/05  	10          10
새우깡   18/01/06  	15          25
새우깡   18/01/08  	10          35 
새우깡   18/02/06  	8           43
새우깡   18/03/05  	20          63

-------------------------------
*/
select jepumname AS 제품명,
       pdate AS 판매일자,
       psum AS 판매량,
       sum(psum) over(order by pdate) AS 판매일자별누계  
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd') AS PDATE,
       sum(panmaesu) AS PSUM
from tbl_panmae
where jepumname = '새우깡'
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
)V;

/*
-------------------------------
제품명   판매일자   판매량    판매일자별누계
감자깡 	2018-01-07	20	      20
감자깡	  2018-02-07	10	      30
감자깡	  2018-02-08	5	        5
감자깡 	2018-03-05	15      	20
고구마깡	2018-02-05	7       	7
고구마깡	2018-03-02	15      	22
고구마깡	2018-03-03	10	      32
...
*/

select jepumname AS 제품명,
       pdate AS 판매일자,
       psum AS 판매량,
       sum(psum) over(partition by jepumname order by psum) AS 판매일자별누계  
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd') AS PDATE,
       sum(panmaesu) AS PSUM
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
)V;

select jepumname AS 제품명,
       to_char(panmaedate, 'yyyy-mm-dd')  AS 판매일자,
       sum(panmaesu) AS 판매량,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS 판매일자별누계  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd');



create or replace view view_panmae -- view_pname이 없으면 생성하고 있으면 재정의해준다. 
as
select jepumname AS jepumname,
       to_char(panmaedate, 'yyyy-mm')  AS PANMAEMONTH,
       sum(panmaesu) AS panmaesu,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS TOTAL  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm');


select *
from view_panmae
where jepumname in ('감자깡','새우깡');



-- 현재 오라클 서버에 접속한 사용자(지금은 HR) 소유의 테이블명과 뷰명을 조회해주는 쿼리문.
select *
from tab;


--- *** Stored View 조회하기 *** ---
select *
from user_views;

select text
from user_views
where view_name= 'VIEW_PANMAE'; -- 대소문자 구분함

create or replace view view_panmae -- view_pname이 없으면 생성하고 있으면 재정의해준다. 
as
select jepumname AS jepumname,
       to_char(panmaedate, 'yyyy-mm')  AS PANMAEMONTH,
       sum(panmaesu) AS MONTHTOTAL,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS NUGAE  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm');




---- ==== 분석함수 ==== ----
-- ▷ ntile 함수
select first_name || ' ' || last_name AS ENAME
    , salary
from employees
where department_id = 50; -- 45개 행


select first_name || ' ' || last_name AS ENAME
    , salary
from employees
where department_id = 80; -- 34개 행


select first_name || ' ' || last_name AS ENAME
    , salary
    , ntile(4) over(order by salary desc) AS CLASS -- 45개를 4개의 부류로 나눠라. 
    /*
    trunc(45/4) ==> 11 (내림차순으로 1~4를 주며 1이 남을 경우 내림차순으로 추가 시켜준다.)
    111111111111  => 1부류는 12개
    22222222222   => 2부류는 11개
    33333333333   => 3부류는 11개
    44444444444   => 3부류는 11개
    */
from employees
where department_id = 50; -- 45개 행

 /*
    trunc(34/4) ==> 8 (내림차순으로 1~4를 주며 1이 남을 경우 내림차순으로 추가 시켜준다.)
    111111111  => 1부류는 9개
    222222222   => 2부류는 9개
    33333333   => 3부류는 8개
    44444444   => 3부류는 8개
    */

-- ▷ row_number 함수
-- ▷ rownum

create table tbl_board
(writeno number not null,        -- 글번호
 userid varchar(20) not null,    -- 사용자 ID
 title varchar(20) not null,     -- 글작성일자
 writeday date default sysdate not null,
 constraint PK_tbb_board_writeno primary key(writeno)
);

--- 시퀀스 생성하기 ---
create sequence seq_tbl_board
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '이순신입니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hansk', '한석규 입니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hong', '홍길동 입니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '충무공 이순신.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hongkd', '동에 홍길동');

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITENDAY
from tbl_board;

delete from tbl_board where writeno = 2;
delete from tbl_board where writeno = 4;

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'dusk', '두석규');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'eom', '엄정화');

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITENDAY
from tbl_board
order by writeno desc;

select rownum, -- 의사컬럼(pseudo colunm)
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

-- ▷ lag, read 함수 (게시판에서 목록보기시 이전글, 다음글 작성에 사용됨)

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
이전글의제목 글번호 userid 글제목 작성일자 다음글의 제목
----------------------------------------------------

select (select title
        from tbl_board
        where writeno = v.bfwriteno) AS 이전글의글제목,
        v.bfwriteno,
        v.writeno, v.title, v.writeday,
       (select title
        from tbl_board
        where writeno = v.afwriteno) AS 다음글의글제목,
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

---- SQL (Structured Query Language) -- 구조화된 질의어 ------
----------------  *** 계층형 쿼리(Query) *** --------------------------
-- ▷ start with connect by prior 절 -- (게시판에서 답변형 게시판에서 많이 사용됨)

select level 
       employee_id,
       first_name || ' '  || last_name AS ENAME,
       job_id,
       manager_id
from employees
start with employee_id = 106
-- connect by prior employee_id = manager_id
connect by prior manager_id = employee_id;
-- connect by prior 다음에 나오는 manager_id 컬럼의 값은
-- start whit employee_id 에 매핑된 행의 컬럼값이다.
-- 즉 사원번호 106 행의 manager_id 컬럼의 값이다.
-- connect by prior 103 = employee_id 이다.
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



--------------- *** Sub Query(서브쿼리) *** ----------------------

-- Sub Query(서브쿼리)란?
select 문 속에 또 다른 select 문이 포함되어져 있을때
포함되어진 select 문을 Sub Query(서브쿼리)라고 부른다.

select ....
from ....                --> Main Query == 외부쿼리
where .... in (select ...
               from ...) --> Sub Query == 내부쿼리

-- employees 테이블에서 기본급여가 제일많은 사람과  제일적은 사람의 정보를
-- 사원번호, 사원명, 기본급여를 나타내세요

select employee_id AS 사원번호,
       first_name || ' ' || last_name AS 사원명,
       salary AS 기본급여
from employees
where salary = (select max(salary) from employees)
      or salary = (select min(salary) from employees);

최고급여 ==> select max(salary) from employees
최저급여 ==> select min(salary) from employees
/*
    employees 테이블에서 부서번호가 60번, 80번 부서에 근무하는 사원들중에
    월급이 50번 부서 직원들의 '평균월급' 보다 많은 사원들만 부서번호, 사원번호
    사원명,월급을 나타내세요
*/

select department_id AS 부서번호,
       employee_id AS 사원번호,
       ename AS 이름,
       monthsal AS 월급 
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
 Sub Query절에서 사용되어지는 ANY 는 OR 와 흡사하고
 ALL 은 AND 와 흡사하다.
 
-- employees 테이블에서 salary 가 부서번호 30번의 salary 동일한 사원들만 추출하세요
              
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
                where department_id = 30) -- single-row subquery returns more than one row 에러발생

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary = any(select salary
                from employees
                where department_id = 30)


-- 기본급여(salary)가 제일꼴지를 제외한 모든 사원들만
-- 사원번호, 기본급여를 나타내세요

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

-- 기본급여가 최고인사람

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

---- 최고수당인사람
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
  employees 테이블에서
  부서번호별로 salary 가 최대인 사원과 최소인 사원의 정보를 
  부서번호, 사원번호, 사원명, 기본급여를 나타내세요.
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
order by 1, 4; -- null값이 안나옴

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
-------- *** 상관Sub Query(== 서브상관쿼리) ***----------
 상관 Sub Query 이라 함은 Main Query(== 외부쿼리) 에서 사용된
 테이블(뷰)에 존재하는 컬럼이 Sub Query의 조건절(where절, having절)에
 사용되어질때를 말한다.
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

--- *** 상관서브쿼리를 이용한 UPDATE 처리 *** ---

--- 테이블 복사하기 ---
create table tbl_empcopy
as
select * from employees; 

select *
from tbl_empcopy;

update employee set first_name = '임규하';
commit

select *
from employees;

------------- ======   *** DICTIONARY 조회하기 *** ======== ----------------------
select *
from dictionary;

USER_CONS_COLUMS -- 현재 오라클 서버에 접속한(HR) 것이 만든 user 
ALL_CONS_COLUMNS -- 다른 사용자가 만든 것까지 보인다.

select *
from dictionary
where table_name like 'USER_%' and  -- 테이블 이름중에 USER 로시작하는 것들 중에 comments내용에 table이 나오는 것 출력
      lower(comments) like '%table%';
      
select *
from USER_TABLES;      

select *
from dictionary
where table_name like 'USER_%' and 
      lower(comments) like '%database link%';
      
select *
from USER_DB_LINKS
      

---------- **** 데이터베이스 링크 생성하기 **** -------------
/* tnsnames.ora 에 추가

ORATEACHER =                   -- net server name
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.50.42)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE) --연결할 이름 select *from global_name; 로 알수있다. 
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

--- *** 데이터베이스 링크 삭제하기 *** ----

drop database link teacherlink;




------------------------------------------------------------------------------
             ---------- *** JOIN(조인)  *** -----------
------------------------------------------------------------------------------

JOIN(조인)은 테이블(뷰)과 테이블(뷰)을 합치는 것을 말하는데
행(ROW)을 합치는 것아 아니라, 컬넘(COLUMN)과 컬럼(COLUMN)을 합치는 것을 말한다.
그리고, 서로 다른 테이블(뷰)의 행(ROW)과 행(ROW)을 합치는 것은 UNION 연산자를 사용하는 것이다.

A = {1,2,3} 원소 3개
B = {a,b}   원소 2개

A ⊙ B = { {1,a}, {1,b},
           {2,a}, {2,b},
           {3,a}, {3,b} } 
데카르트곱 => 원소의 곱 : 3*2 = 6(모든 경우의 수)
--> 데카르트곱을 데이터베이스에서는 Catersian Product 라고 부른다

INNER JOIN(= 내부조인)

OUTER JOIN(= 외부조인)

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

--> JOIN : SQL 1992 code 방식(데이터베이스 밴더마다 문법이 다름)과
--         SQL 1999 code 방식(ANSI SQL 표준화)

-- 1. SQL 1992 CODE 방식 => 테이블(뷰)과 테이블(뷰)사이에 콤마(,)를 찍어준는 것
-- 2. SQL 1999 CODE 방식 => 테이블(뷰)과 테이블(뷰)사이에 조인시 JOIN 이라는 단어를 넣어주는 것.

-- 1.  SQL 1992 CODE 방식
select *
from employees, departments  -- 모든 경우의 수(Catersian Product) 2889

select *
from employees E, departments D
where E.department_id = D.department_id -- join 조건절
-- EQUI JOIN 이라 부른다.

select *
from employees E, departments D
where E.department_id = D.department_id(+) -- left outer join 과 같다

select *
from employees E, departments D
where E.department_id(+) = D.department_id -- right outer join 과 같다

select *
from employees E, departments D
where E.department_id(+) = D.department_id(+) -- 에러. 사용불가

-- 2. SQL 1999 CODE 방식
select *
from employees cross join departments  -- 모든 경우의 수(Catersian Product) 2889

-- inner join --
select *
from employees E inner join departments D 
on E.department_id = D.department_id; -- join 조건절

select *
from employees E join departments D -- inner join에서 inner는 생략가능
on E.department_id = D.department_id; -- join 조건절


-- outer join --
select *
from employees E left outer join departments D
on E.department_id = D.department_id;

select *
from employees E left join departments D -- outer join에서 outer는 생략가능
on E.department_id = D.department_id; 

select *
from employees E right outer join departments D
on E.department_id = D.department_id;

select *
from employees E right join departments D -- outer join에서 outer는 생략가능
on E.department_id = D.department_id; 

select *
from employees E full outer join departments D
on E.department_id = D.department_id; 


/*
 예제 
-----------------------------------------------------------
 부서번호   사원번호   월급   전체평균월급    평균차액
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
       nvl(salary + (salary * commission_pct), salary) - V.avgmonthsal AS 평균차익
from  employees cross join
      (select trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
       from employees) V
order by 5 desc;

/*
 예제
-----------------------------------------------------------
 부서번호        부서명     사원번호     사원명       월급
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
 예제 
------------------------------------------------------------------------
 부서번호      부서명      부서평균월급   사원번호   사원명    월급  부서평균차액
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

------- 위의 결과물을  SQL 1992 CODE 방식으로 변환하세요 -------------

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
       B.monthsal - A.avgmonthsal  AS 부서평균차액
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


---- **** Multi Table JOIN(다중 테이블 조인) *** ----
--> 3개 이상의 테이블을 가지고 조인 시켜주는 것이다.
--------------------------------------------------------------------------
부서번호     부서명       부서주소      사원번호       사원명      기본급여
---------------------------------------------------------------------------
departments  dep        locations     emp           emp         emp
employees

  테이블명              조인조건컬럼명
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
부서번호     부서명       국가명       부서주소     사원번호       사원명      기본급여
---------------------------------------------------------------------------
departemnt  dep         countries

  테이블명              조인조건컬럼명
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

---------------1992 code 방식-----------------------

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
--> 어떤 컴럼의 값이 특정 범위에 속할 떄 사용하는 JOIN

-- 소득세율 지표 관련 테이블 생성한다.
create table tbl_taxindex
(lowerincome  number, -- 연봉의 최저
 highincome  number,  -- 연봉의 최대
 taxpercent number(2,2)  -- 세율 -0.99 ~ 0.99
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

insert into tbl_imsi(no, name, addr) values (1,'일지매','서울');
insert into tbl_imsi(no, name, addr) values (1,'일지매','서울');
insert into tbl_imsi(no, name, addr) values (1,'일지매','서울');
insert into tbl_imsi(no, name, addr) values (2,'이미자','경기');

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
       to_char(A.yearsal * B.taxpercent, '$999,999,999,999,999') AS 소득세
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
            else 0.1 * yearsal end AS 소득세
from
(select employee_id ,
        first_name || ' ' || last_name AS ENAME,
        nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL     
 from employees
)V --- 값이 변할시 코드전체가 변경

----------------- *** 자기조인(self join) *** -------------------------
 
create table tbl_authorbook
(bookname   varchar2(100),
 authorname  varchar2(20),
 loyalty    number(5)
);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('노인과바다', '정영광', 1000);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('반지의제왕', '김규전', 800);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('반지의제왕', '김종성', 500);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('빵가게재습격', '김종성', 2500);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('해리포터', '임규하', 1200);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('해리포터', '이정원', 1400);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('나미야잡화점의기적', '이정원', 1700);

commit;

select *
from tbl_authorbook;

------ tbl_authorbook 에서 공저로 지어진 도서정보를 추출하세요.

-- 서브쿼리

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
      
-- 연습문제      
---------------------------------------------------------------------
부서번호  사원번호  사원명  입사일자  직속상관사원번호   직속상관명
 60       105      
----------------------------------------------------------------------
select *
from employees

-- 1992 code
select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS 직속상관사원번호,
       E2.first_name || ' ' || E2.last_name AS 직속상관
from employees E1 ,employees E2
where E1.manager_id = E2.employee_id(+)
order by 1,2


select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS 직속상관사원번호,
       E2.first_name || ' ' || E2.last_name AS 직속상관
from employees E1 ,employees E2
where E1.manager_id = E2.employee_id(+)
and E1.department_id in (20,50,60)
order by 1,2

-- 1998 code

select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS 직속상관사원번호,
       E2.first_name || ' ' || E2.last_name AS 직속상관
from employees E1 left join employees E2
on E1.manager_id = E2.employee_id
order by 1,2

select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS 직속상관사원번호,
       E2.first_name || ' ' || E2.last_name AS 직속상관
from employees E1 left join employees E2
on E1.manager_id = E2.employee_id
where E1.department_id in (20,50,60)
order by 1,2

-----------!!!!!!! 퀴즈 ------------------(107명이 나와야함!!)
-------------------------------------------------------------------------------------------
부서번호  부서명 부서주소  부서장명  사원번호  사원명 연봉  소득세금  부서연봉평균차액  부서내연봉등수        
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

select D.department_id AS 부서번호, D.department_name AS 부서명,
       L.street_address AS 부서주소,
       E1.first_name || ' ' || E1.last_name AS 부서장명,
       E2.employee_id AS 사원번호,
       E2.first_name || ' ' || E2.last_name AS 사원명,
       nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12 AS 연봉,
       ( nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12 ) - V.yearsalage AS 부서연봉평균차액,
       dense_rank() over(partition by E2.department_id
                         order by nvl(E2.salary + (E2.salary * E2.commission_pct),E2.salary) desc) AS 부서내기본급여서열,
       to_char( (nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12) * T.taxpercent, '$999,999,999,999,999') AS 소득세
       
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

1. UNION 은 테이블(뷰)과 테이블(뷰)을 합쳐서 보여주는데
   이것은 행과 행을 합친 결과를 보여주는 것이다.
   
   A = { a, x, b, e, g}
   B = { c, d, a, b, y, k, m}
   
   A ∪ B = {}  ==> UNION  {a,b,c,d,e,g,k,m,x,y} 중복X 정렬 O.
                    UNION ALL  {a,x,b,e,g,c,d,a,b,y,j,m} 중복O 정렬X
   A ∩ B = {} ==> INTERSECT {a,b}
   A - B = {} ==> MINUS {x,e,g}
   B - A = {} ==> MINUS {c,d,y,k,m}
   
   
select *
from tbl_panmae;

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '새우깡', 15);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '감자깡', 10);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '새우깡', 5);
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

-- 테이블명 변경하기
rename tbl_2018_01 to tbl_panmae_2018_01;
rename tbl_2018_02 to tbl_panmae_2018_02;


--------------------------------
  제품명    판매월     총판매량
--------------------------------
           2018-01
           2018-02
           2018-03

select jepumname AS 제품명,
       to_char(panmaedate, 'yyyy-mm') AS 판매월,
       sum(panmaesu) AS 총판매량
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

select jepumname AS 제품명,
       to_char(panmaedate, 'yyyy-mm') AS 판매월,
       sum(panmaesu) AS 총판매량
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
where jepumname = '새우깡';

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
select panmaedate AS 판매일자,  -- 사용불가 AS는 항상 맨위에
       jepumname AS 제품명,
       panmaesu AS 판매량
from tbl_panmae_2018_02
union
select *
from tbl_panmae;

select panmaedate AS 판매일자, 
       jepumname AS 제품명,
       panmaesu AS 판매량
from tbl_panmae_2018_01
union
select *
from tbl_panmae_2018_02
union
select *
from tbl_panmae;

select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss' ) AS 판매일자, 
       jepumname AS 제품명,
       panmaesu AS 판매량
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




--- *** 테이블 생성하기 *** ---
--1.  1:1 관계의 테이블 생성하기

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
 registerday date default sysdate, -- 값이 없으면 자동으로 sysdate 저장
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- 외래키 설정
            references tbl_userlogin(userid)
            on delete cascade,   -- 부모 테이블에서 어떤 행을 삭제하면 자식 테이블에서 자동삭제
                                 -- 테이블의 관계가 1:1 이라면 foreign key 생성시 on delete cascade 를 해준다.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ) -- check 제약          
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '정영광');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '서울시 동대문구', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '안지혜');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '서울시 구로구', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;

-- 회원탈퇴
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
(orderno varchar2(30) not null, -- 시퀀스
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

-- 회원탈퇴
delete from tbl_userlogin
where userid =  'superman'; --에러

delete from tbl_userlogin
where userid =  'wonderwoman';

rollback;
---- *** 테이블 삭제하기 *** ---
-- 자식 테이브을 먼저 삭제한 후 부모 테이블을 삭제한다.

-- drop table tbl_userlogin -- 에러

drop table tbl_order purge;
drop table tbl_userdetail purge;
drop table tbl_userlogin purge;


create table tbl_userlogin
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(30) not null,
 status number(1) default 1 not null, -- 회원 탈퇴유무 체크 컬럼. 1이면 가입, 0이면 탈퇴
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
 registerday date default sysdate, -- 값이 없으면 자동으로 sysdate 저장
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- 외래키 설정
            references tbl_userlogin(userid)
            on delete cascade,   -- 부모 테이블에서 어떤 행을 삭제하면 자식 테이블에서 자동삭제
                                 -- 테이블의 관계가 1:1 이라면 foreign key 생성시 on delete cascade 를 해준다.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ), -- check 제약
 constraint CK_tbl_userdetail_status check( status in (0,1) ) 
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '정영광');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '서울시 동대문구', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '안지혜');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '서울시 구로구', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;
-- 로그인 처리
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
       when 1 then '로그인성공' 
       else '로그인실패' end AS 로그인결과
from dual;

-- 회원탈퇴
update tbl_userlogin set status = 0
where userid = 'superman';

update tbl_userdetail set status = 0
where userid = 'superman';

rollback;

-- *** 제품카테고리 테이블 ***
create table tbl_category 
(categoryno number(5) not null,
 categoryname varchar2(100) not null, -- 유추 가능한 것은 코드화
 constraint PK_tbl_category_categoryno primary key(categoryno)
);

insert into tbl_category(categoryno, categoryname)
values(1, '전자제품');

insert into tbl_category(categoryno, categoryname)
values(2, '의류');

insert into tbl_category(categoryno, categoryname)
values(3, '도서');

commit;

-- *** 제품 테이블 *** --
create table tbl_product
(productcode varchar2(20) not null,
 fk_categoryno number(5) not null,
 produckname varchar2(100) not null,
 price number not null, -- 단가
 releaseday date, -- 출시일 
 constraint PK_tbl_product_productcode primary key(productcode),
 constraint FK_tbl_product_fk_categoryno foreign key(fk_categoryno)
            references tbl_category(categoryno)
            on delete cascade
);

insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('ss12345', 1, '싱싱냉장고', 700000, to_date('2017-05-01', 'yyyy-mm-dd') );


insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('jj12345', 2, 'LED 와이드 TV', 900000, to_date('2018-03-01', 'yyyy-mm-dd') );

commit;

drop sequence seq_tbl_order; -- 시퀀스 삭제

create sequence seq_tbl_order
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table tbl_order 
(orderno varchar2(30) not null, -- 시퀀스
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

-- 회원 탈퇴

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

--  *** 주문상세 테이블 ***
create table tbl_order_detail
( orderdetailno number not null, -- 시퀀스 일련번호
  fk_orderno varchar2(30) not null,
  fk_productcode varchar2(30) not null,
  quantity number not null,  -- 주문량
  price number not null, -- 역정규화(단가)
  constraint PF_tbl_order_detail primary key(orderdetailno),
  constraint FK_tbl_order_detail_orderno foreign key (fk_orderno)
             references tbl_order(orderno)
             on delete cascade,
  constraint FK_tbl_order_detail_fk_pcode foreign key(fk_productcode)
             references tbl_product -- 제품은 사라져도 기록이 남아야하기 떄문에 on delete cascade X 
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
전표  제품명   주문량   단가    주문액
-----------------------------------
*/

select A.orderno AS 전표,
       C.produckname AS 제품명, 
       B.quantity As 주문량,
       B.price AS 단가,
       B.quantity * B.price AS 주문액
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
  constraint PK_tbl_sawon_sano primary key(sano,saname)  -- Composite Primary Key(복합 프라이머리키)
);

drop table tbl_sawon purge;

create table tbl_sawon
( sano varchar2(20),
  saname varchar2(30),
  jubun varchar2(13) not null,
  constraint PK_tbl_sawon_sano primary key(sano),  -- Composite Primary Key(복합 프라이머리키)
  constraint UQ_tbl_sawon_jubun unique(jubun),
  constraint UQ_tbl_sawon_saname unique(saname)
); -- 한 테이블당 unique key 제약은 여러번 가능하다.
   -- 하지만 primary key 제약은 한번만 가능하다.


insert into tbl_sawon(sano, saname, jubun)
values('kh1001', '이순신', '9003091234567');

insert into tbl_sawon(sano, saname, jubun)
values('kh1002', '한석규', '9003091234567'); -- 오류 

insert into tbl_sawon(sano,saname, jubun)
values('kh1003', '이순신', '8703091234567'); -- 오류

insert into tbl_sawon(sano, saname, jubun)
values('kh1004', null, '8703091234567'); 

insert into tbl_sawon(sano,saname, jubun)
values('kh1005', null, '7703091234567');  -- 오라클은 null을 여러번 허용 
 
insert into tbl_sawon(sano,saname, jubun)
values('kh1006', '엄정화', null);  -- 오류

commit;

select *
from tbl_sawon

/*
-- *** 제약조건의 조회 *** ---
 << 제약조건의 종류 >> 
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

-- 제약조건의 조회는 다음과 같이 JOIN 을 해서 본다.
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERDETAIL';

-- ** 제약조건의 추가 ** --
alter table tbl_userlogin
add constraint CK_tbl_userlogin_passwd check( 8 < length(passwd) and length(passwd) <= 20 );

select *
from tbl_userlogin;

update tbl_userlogin set passwd = 'abc123$'
where userid = 'superman'; -- 패스워드 체크제약에 걸려서 오류

update tbl_userlogin set passwd = 'abcd1234$'
where userid = 'superman'; 

commit

desc tbl_userdetail;

alter table tbl_userdetail
add constraint NN_tbl_userdetail tel not null; -- 오류
/*
 제약조건의 추가시 primary key, unique, check, foregin key 제약의 추가는
 alter table 테이블명
 add constraint 컨스트레인트이름 primary key(컬럼명);
 add constraint 컨스트레인트이름 unique(컬럼명);
 add constraint 컨스트레인트이름 check(컬럼명);
 add constraint 컨스트레인트이름 foreign key(컬럼명);
                references 부모테이블명(참조받는 컬렴명)

제약조건의 추가시 not null 은 아래와 같이 한다.
alter table 테이블명
modify 컬럼명 not null;
*/

alter table tbl_userdetail
modify tel not null;
                
desc tbl_userdetail;

--- *** 제약조건의 삭제 *** ---
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

alter table tbl_userlogin
drop constraint ck_tbl_userlogin_passwd;

-- ** not null 제약의 삭제는 2가지 방법이 있다. --
alter table tbl_userlogin
drop constraint SYS_C007039 ;

alter table tbl_userlogin
modify name null;

select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

-- ** 테이블에 컬럼 추가하기 ** --
alter table tbl_sawon
add email varchar2(30);

desc tbl_sawon;

select *
from tbl_sawon;

-- not null 제약을 주고자 할떄
alter table tbl_sawon
add email varchar2(30) not null; -- 오류
-- 이미 tbl_sawon 테이블에는 데이터가 들어가 있는 상태인데
-- email 컬럼을 넣어주자마자 not null 로 해야하는데 값을 넣어줄수가 없다.

alter table tbl_sawon
add email varchar2(30) default ' ' not null; 

desc tbl_sawon;

select *
from tbl_sawon;

-- ** 테이블에 컬럼 삭제하기 ** --
alter table tbl_sawon
drop column email;

desc tbl_sawon;

select *
from tbl_sawon;

-- ** 특정 테이블에 default 값이 무엇이 있는지 조회하기 ** --
select *
from user_tab_columns
where table_name = 'TBL_SAWON'

select *
from user_tab_columns
where table_name = 'TBL_ORDER'

-- ** default 값 변경하기 ** --
alter table tbl_sawon
modify email default ' ';

alter table tbl_order
modify orderday default sysdate;

-- ** 테이블에 컬럼명 변경하기 ** --
alter table tbl_sawon
rename column email to mail;

select *
from tbl_sawon;

-- ** 테이블명 변경하기 ** --
rename tbl_sawon to tbl_emp;

select *
from tbl_emp;

rename tbl_emp to tbl_sawon;

-- 컬럼의 데이터 타입 크기 변경하기 

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
이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

desc tbl_mber2

/*
이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

insert into tbl_mber(id, name) values ('lee', '이순신');
insert into tbl_mber2(id, name) values ('lee', '이순신');
commit;

create table tbl_mber_copy
as
select *
from tbl_mber
where 1=2; -- 테이블 컬럼구조만 카피할때

create table tbl_mber2_copy
as
select *
from tbl_mber2
where 1=2;

desc tbl_mber_copy;

/*
이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 

*/
desc tbl_mber2_copy;

/*
이름   널        유형           
---- -------- ------------ 
ID            VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

-- ** 테이블 삭제하기(휴지통에 버리기) ** --
drop table tbl_empcopy1;

drop table tbl_empcopy2;

drop table tbl_empcopy3;


select *
from tab;
-- BIN$~~~~~ 로 나오는값이 휴지통에 버려진 테이블

select *
from "BIN$+cJi+3iHT5aM6ni5+MfrGA==$0";

select *
from "BIN$/j2GmVVTTniBa5hOA5+v1Q==$0"

select *
from "BIN$2GpPfldgQ1Cr31OIRRnLTA==$0"

-- ** 휴지통 보기 ** --
select *
from user_recyclebin

-- ** 휴지통에 버려진 테이블 복구하기 ** --
flashback table TBL_EMPCOPY1 to before drop;
flashback table TBL_EMPCOPY2 to before drop;
flashback table TBL_EMPCOPY3 to before drop;

-- ** 휴지통에 버려진 테이블 삭제하기 ** --
purge table TBL_EMPCOPY1;

-- 테이블 삭제시 휴지통에 버리지 않고 영구히 삭제하기

drop table tbl_empcopy4 purge;

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

------ *** 제어문(if문) *** --------
※ 형식
if 조건1 then 실행문장 1;
elsif 조건2 then 실행문장 2;
else 실행문장3;
end if;

------------------------------------------
 사원번호 사원명 업무실적  부서번호  인센티브
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
  tbl_busiperformance 테이블에서 사원번호를 입력받아 해당 사원의 업무실적(BUSIPERFORM)
  20000 이상이면 인센티브로 100을 주고, 10000이상 20000 미만이면 인센티브로 80을 주고,
   7000 이상 10000미만이면 인센티브 50 을 주고, 7000 미만이면 인센티브 0을 주도록
   insentive 컬럼의 값을 변경하시오.
*/

exec pcd_insentive(101);
/*
  --------------------------------------------------------
  사원번호    사원명  업무실적   인상전인센티브     인상후인센티브
  --------------------------------------------------------
*/

exec pcd_insentive(9999);
/*
-----------------------------------------------------------
  입력하신 사원번호 9999 번 직원은 존재하지 않습니다.
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
   v_line        varchar2(60) := lpad('-',60,'-');  -- 변수의 초기화 
begin
      select count(*) into v_cnt        
      from tbl_busiperformance
      where employee_id = p_employee_id;

      if v_cnt = 0 then
         dbms_output.put_line( v_line );
         dbms_output.put_line( '입력하신 사원번호 '|| p_employee_id ||'번 직원은 존재하지 않습니다.' ); 
         dbms_output.put_line( v_line );

         return;  -- 종결. 
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
      dbms_output.put_line( '사원번호  사원명  인상전인센티브  인상후인센티브' ); 
      dbms_output.put_line( v_line );
      dbms_output.put_line( p_employee_id || '   ' ||
                            v_ename || '    '||
                            v_before_insentive || '  ' ||
                            v_after_insentive ); 

end pcd_insentive;

exec pcd_insentive(101);
exec pcd_insentive(9999);


------- *** 반복문 *** ----------

create table tbl_looptest
(no number,
 name varchar2(50)
);


1. 기본 LOOP 문
  ※ 형식
     LOOP
          실행문장;
     EXIT WHEN 조건; -- 조건이 참이라면 LOOP 탈출
     END LOOP;
   
  exec pcd_looptest('전지현', 10);
  
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
  
  
-- 연습문제
exec pcd_sum(1,10)
exec pcd_sum(2,10)
--  <결과물>
--  1 부터 10까지의 합은 55 입니다.

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
  
  dbms_output.put_line(v_num1 || ' 부터 ' || v_num2 || ' 까지의 합은 ' || v_sum || '입니다.' );
end;
  

-- 연습문제
exec pcd_sum2(1,10,1); -- 3번째 파라미터는 홀수 짝수 구분
exec pcd_sum2(1,10,2);
-- <결과물>
-- 1부터 10까지의 홀수의 합은 입니다

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
       dbms_output.put_line('세번째 매개변수의 인자값은 1(홀수) 또는 2(짝수) 이어야만 합니다.');
       return;
     elsif( p_flag = 1 ) then -- 홀수의 합을 구한다.
       v_holjak := '홀'; 
       if mod(p_start_num, 2) = 0  then -- 처음시작값이 짝수인 경우 
          v_cnt := v_cnt + 1;
       end if;

     elsif( p_flag = 2 ) then -- 짝수의 합을 구한다.
       v_holjak := '짝'; 
       if mod(p_start_num, 2) != 0  then -- 처음시작값이 홀수인 경우 
          v_cnt := v_cnt + 1;
       end if;

     end if;

     loop
        v_sum := v_sum + v_cnt;
        v_cnt := v_cnt + 2;
     exit when v_cnt > p_end_num;  -- 1, 10 짝수의 합
                                   -- 2 + 4 + 6 + 8 + 10 + 12 
     end loop;

     dbms_output.put_line(p_start_num ||'부터 '|| p_end_num || '까지의 '|| v_holjak || '수의 합은 '|| v_sum ||'입니다.');  
 end pcd_sum2;

  
2. FOR LOOP 문

create table tbl_forlooptest
(no number,
 name varchar2(50)
);

※ 형식
  FOR 변수 IN [REVERSE] 시작값..마지막값 LOOP -- 변수는 자동으로 선언되어진다.
      실행문장;
  END LOOP;
  
create or replace procedure pcd_forlooptest
(p_name IN tbl_forlooptest.name%type,
 p_cnt IN tbl_forlooptest.no%type)
is

begin
  for i in 1..p_cnt loop -- 무조건 1씩증가 
    insert into tbl_forlooptest(no, name)
    values(i, p_name || i);
  end loop;
end;

exec pcd_forlooptest('원빈',20);

select *
from tbl_forlooptest;

rollback;

create or replace procedure pcd_forlooptest
(p_name IN tbl_forlooptest.name%type,
 p_cnt IN tbl_forlooptest.no%type)
is

begin
  for i in REVERSE 1..p_cnt loop -- 무조건 1씩증가 
    insert into tbl_forlooptest(no, name)
    values(i, p_name || i);
  end loop;
end;

--- 구구단 만들어보기
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


3. WHILE LOOP 문
 ※ 형식
  WHILE 조건 LOOP -- 조건이 참이면 반복 거짓이면 탈출
    실행문장;
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
  while not(v_cnt >= p_count) loop  -- while not(조건) loop : 조건이면 탈출
    v_cnt := v_cnt + 1;
    insert into tbl_whilelooptest(no, name)
    values(v_cnt, p_name || v_cnt);
    
  end loop;
end pcd_whilelooptest;


exec pcd_whilelooptest('이순신',10);

select *
from tbl_whilelooptest;

commit;


create or replace function func_gender
(p_jubun IN varchar2 ) -- IN : 값을 입력받는다 
return varchar2
is
  v_result varchar2(4);
begin
  select case when substr(p_jubun, 7, 1) in ('1','3')
         then '남' else '여' end
         into v_result -- 변수에 담아준다
           
  from dual;
  
  return v_result;
end func_gender;

select employee_id,
       first_name || '' || last_name AS ENAME,
       jubun,
       func_gender(jubun) AS GENDER --  주민번호만 넣어주면 남여 구분해주는 함수
from employees;



----- *** 주민번호 공식 *** -----
'9003141234567'

select 9*2 + 0*3 + 0*4 + 3*5 + 1*6 + 4*7 + 1*8 + 2*9 + 3*2 + 4*3 + 5*4 + 6*5
from dual; -- 161

select mod(161,11) -- 위 결과물에 11을 나눈 나머지를 구한다.
from dual; -- 7

select 11 - 7 -- 11에서 위 결과물을 뺀다.
from dual; -- 4

select mod(4,10) -- 위 결과물을 10으로 나눈 나머지를 구한다
from dual; -- 4

if(7 == 4) -- 13번째 수랑 비교. 다르면 가짜 주민번호

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

-- 문자열(암호)을 입력받아 문자열의 길이가 8글자 이상 20글자 이하이면서,
-- 구성된 문자열이 영문자, 숫자, 특수기호(! @ # $ %)가 혼합되어있으면 리턴값 1 아니면 0


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

-- 문자열을 입력받아 문자열의 길이는 
 -- 8글자 이상 20글자 이하이어야하고
 -- 구성된 문자열이 영문자, 숫자, 특수기호(! @ # $ %)가
 -- 혼합되어져 있으면 1 을 리턴하고
 -- 아니면 0 을 리턴하는 함수 func_passwdcheck 을 
 -- 생성하시오.
 
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
            -- 영문자인지 검사 --
            if ( ascii('a') <= v_ascii and v_ascii <= ascii('z') OR
                 ascii('A') <= v_ascii and v_ascii <= ascii('Z')  ) 
               then v_engflag := 1;
            
            -- 숫자인지 검사 -- 
            elsif ( ascii('0') <= v_ascii and v_ascii <= ascii('9') ) 
               then v_numflag := 1;

            -- 특수문자인지 검사 -- 
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
 

-- **회원가입 **--

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
        dbms_output.put_line('암호는 8글자 이상의 영문자,숫자,특수기호가 혼합되어야 합니다.'); 
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
        dbms_output.put_line('올바른 주민번호가 아닙니다.');
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


 exec pcd_member_register('hongkd','qwer1234','홍길동','9003141234567','서울시 강남구','010-234-5678','hong@gmail.com'); 
 
 exec pcd_member_register('hongkd','qwer1234$','홍길동','9003141234567','서울시 강남구','010-234-5678','hong@gmail.com');
 
 exec pcd_member_register('hongkd','qwer1234$','홍길동','9003141234564','서울시 강남구','010-234-5678','hong@gmail.com');

select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
 

--- *** 사용자 정의 예외절(EXCEPTION) *** --- 

 예외절 = 오류절
 
 ※ 형식
 EXCEPTION 
    WHEN 익셉션이름1 [ OR 익셉션이름2 ] then
         실행문장1;
         실행문장2;
    WHEN 익셉션이름3 [ OR 익셉션이름4 ] then
         실행문장3;
         실행문장4;
   WHEN OTHERS THEN
        실행문장5;
        실행문장6;


exec pcd_member_register('hongkd','qwer1234$','홍길동','9003141234564','서울시 종로구','010-234-5678','lee@gmail.com');


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
        when err_jubun then
            raise_application_error(-20002, '올바른 주민번호가 아닙니다.' );
end pcd_member_register;


delete from tbl_member_login
where userid = 'hongkd';

select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
exec pcd_member_register('hongkd','qwer1234$','홍길동','9003141234562','서울시 종로구','010-234-5678','lee@gmail.com');
--  ORA-20002: 올바른 주민번호가 아닙니다.

exec pcd_member_register('hongkd','qwer1234$','홍길동','9003141234564','서울시 종로구','010-234-5678','lee@gmail.com');

exec pcd_member_register('leess','qwer1234$','이순신','9003141234564','서울시 종로구','010-234-5678','lee@gmail.com');
-- 오류 보고-
-- ORA-00001: unique constraint (HR.UQ_TBL_MEMBER_DETAIL_JUBUN) violated


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



