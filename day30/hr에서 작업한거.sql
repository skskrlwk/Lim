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