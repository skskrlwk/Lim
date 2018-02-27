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