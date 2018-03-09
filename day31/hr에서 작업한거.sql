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