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