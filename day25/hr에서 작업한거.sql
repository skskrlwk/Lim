
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