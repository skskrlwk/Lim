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