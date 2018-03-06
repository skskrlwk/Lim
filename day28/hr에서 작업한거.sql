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