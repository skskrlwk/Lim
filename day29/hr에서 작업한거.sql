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