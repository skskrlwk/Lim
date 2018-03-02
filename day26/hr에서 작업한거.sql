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