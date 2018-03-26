show user;

select *
from tab;

select *
from user_sequences;

select *
from tbl_memo;

drop table tbl_memo purge;
drop sequence seq_memo;

insert into tbl_memo (no, name, msg) values (seq_memo.nextval, '임규하', '호호호');

select *
from tbl_memo;

insert into tbl_memo(no, name, msg)
values(seq_memo.nextval, '나기자', '안녕하세요 나기자입니다.');

insert into tbl_memo(no, name, msg)
values(seq_memo.nextval, '홍기자', '안녕하세요 홍홍.');

commit;

desc tbl_memo;

------- 제약조건을 추가 --------
select *
from user_constraints A join user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_MEMO';

alter table tbl_memo
add constraint PK_tbl_memo primary key(no);

alter table tbl_memo
modify no not null;

alter table tbl_memo
modify name not null;

alter table tbl_memo
modify msg not null;

--------- Stored Procedure 생성하기 ---------
create or replace procedure pcd_selectAllMemo
(o_data OUT SYS_REFCURSOR)
is 

begin
  open o_data for
  select no, name, msg
  from tbl_memo
  order by no desc;
 
end pcd_selectAllMemo;


create or replace procedure pcd_searchMemoByWord
(p_word IN varchar2,
 o_data OUT SYS_REFCURSOR)
is

begin
  open o_data for
  select no, name, msg
  from tbl_memo
  where msg like '%' || p_word || '%' ;
end pcd_searchMemoByWord;

create or replace procedure pcd_searchNoByWord
(p_no IN tbl_memo.no%type,
 o_no OUT tbl_memo.no%type,
 o_name OUT tbl_memo.name%type,
 o_msg OUT tbl_memo.msg%type)
is

begin
  select no, name, msg
    into o_no, o_name, o_msg
  from tbl_memo
  where no = p_no;

end;

create or replace procedure pcd_insertMemo
(p_name IN tbl_memo.name%type,
 p_msg IN tbl_memo.msg%type)
is
  err_insert exception;
begin
  if(p_name = null OR p_msg = null) then
    raise err_insert;
  end if;
  
  insert into tbl_memo(no, name, msg)
  values(seq_memo.nextval, p_name, p_msg);
  
  exception
    when err_insert then
      raise_application_error(-20001, '작성자명과 글내용은 필수입력사항입니다.');
end pcd_insertMemo;

create or replace procedure pcd_updateMemo
(p_no IN tbl_memo.no%type,
 p_name IN tbl_memo.name%type,
 p_msg IN tbl_memo.msg%type)
is

begin
  update tbl_memo set name = p_name, msg = p_msg
  where no = p_no;

end pcd_updateMemo;

create or replace procedure pcd_deleteMemo
(p_no IN tbl_memo.no%type)
is

begin
  delete from tbl_memo where no = p_no;

end pcd_deleteMemo;

--------------------------------------------------------------------------------]
+"SELECT no, name, msg FROM tbl_memo ORDER BY DESC"
+"SELECT no, name, msg FROM tbl_memo WHERE msg LIKE '%안녕%' ORDER BY no DESC"
+"SELECT no, name, msg FROM tbl_memo WHERE no = 2"

insert into tbl

update tbl_memo set name = '홍길동' , msg = '길동이.'
where no = 90;

alter table tbl_memo
add writeday date default sysdate;

select no, name, msg, to_char(writeday, 'yyyy-mm-dd hh24:mi:ss')
from tbl_memo
order by no desc;

update tbl_memo set writeday = writeday-0
where no between 1 and 8;

update tbl_memo set writeday = writeday-10
where no between 9 and 50;
commit;

---- 현재시각을 00:00:00 으로 변경해준후 계산
select no, name, msg, to_char(writeday, 'yyyy-mm-dd') AS writeday
from tbl_memo
where to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd' ) - to_date( to_char(writeday, 'yyyy-mm-dd') , 'yyyy-mm-dd') <= 30
order by no desc;

+"SELECT no, " 
+"  name, " 
+"  msg, " 
+"  TO_CHAR(writeday, 'yyyy-mm-dd') AS writeday " 
+"FROM tbl_memo " 
+"WHERE to_date( TO_CHAR(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd' ) - to_date( TO_CHAR(writeday, 'yyyy-mm-dd') , 'yyyy-mm-dd') <= 10 " 
+"ORDER BY no DESC"

--------------------------------------------------------------------

select no, name, msg, to_char(writeday, 'yyyy-mm-dd') AS writeday
from tbl_memo
where to_char(writeday, 'yyyy-mm-dd') between '2017-03-15' and '2017-03-20'
order by no desc;

+"SELECT no, " 
+"  name, " 
+"  msg, " 
+"  TO_CHAR(writeday, 'yyyy-mm-dd') AS writeday " 
+"FROM tbl_memo " 
+"WHERE TO_CHAR(writeday, 'yyyy-mm-dd') BETWEEN '2017-03-15' AND '2017-03-20' " 
+"ORDER BY no DESC"

----------------------------------------------------------------------------
select Rno, no, name, msg
from
(
  select rownum AS RNO, v.no, v.name, v.msg
  from
  (
  SELECT no, name, msg 
  FROM tbl_memo
  order by 1 
  )V
)T
order by rno desc;



+"SELECT T.Rno, " 
+"  no, " 
+"  name, " 
+"  msg " 
+"FROM " 
+"  (SELECT rownum AS RNO, " 
+"    v.no, " 
+"    v.name, " 
+"    v.msg " 
+"  FROM " 
+"    ( SELECT no, name, msg FROM tbl_memo ORDER BY 1 " 
+"    )V " 
+"  )T " 
+"ORDER BY T.rno DESC;"

--- 편리함을 위해 뷰생성 --
create or replace view view_memo
as
select Rno, no, name, msg, writeday
from
(
  select rownum AS RNO, v.no, v.name, v.msg, v.writeday
  from
  (
  SELECT no, name, msg, to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY 
  FROM tbl_memo
  order by 1 
  )V
)T
order by rno desc;

select rno, no, name, msg, writeday
from view_memo;

--- rno 10번의  no번호를 알고싶을때

select rno, no, name, msg
from view_memo
where rno = 10;

update tbl_memo set name = ?, msg = ?
where no = (select no
            from view_memo
            where rno = ? )
            
+"UPDATE tbl_memo " 
+"SET name = ?, " 
+"  msg    = ? " 
+"WHERE no = " 
+"  (SELECT no FROM view_memo WHERE rno = ? " 
+"  )"   

delete from tbl_memo
where no = (select no
            from view_memo
            where rno = ? );

+"DELETE FROM tbl_memo WHERE no = " 
+"  (SELECT no FROM view_memo WHERE rno = ? " 
+"  )"         

--------------------------------------------------------------------------

-- 관리자 로그인용
create table tbl_admin
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(20) not null,
 constraint PK_tbl_admin primary key(userid)
);

insert into tbl_admin(userid, passwd, name)
values ('admin', 'qwer1234$', '관리자');
commit;

select count(*) AS cnt
from tbl_admin
where userid = 'admin' and passwd = 'qwer1234$';

+"SELECT COUNT(*) AS cnt " 
+"FROM tbl_admin " 
+"WHERE userid = 'admin' " 
+"AND passwd   = 'qwer1234$'"

-- 일반사용자 로그인용
create table tbl_member
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(20) not null,
 constraint PK_tbl_member primary key(userid)
);

-- 일반사용자 상세정보
create table tbl_member_detail
(fk_userid varchar2(20) not null,
 birthday varchar2(20) not null,
 email varchar2(30),
 tel varchar2(20),
 address varchar2(100),
 point number default 0, -- 마일리지
 coin number default 0,--코인
 renttotal number default 0, -- 지금까지 대여한 총누적권수
 mibannapcnt number default 0, -- 미반납 도서권수(미반납 도서권수가 3권 이라면 더이상 새로운 책을 대여하지 못하도록 한다!!)
 delaymoney number default 0, -- 연채료
 constraint PK_tbl_member_detail primary key(fk_userid),
 constraint FK_tbl_member_detail_fk_userid foreign key(fk_userid)
            references tbl_member(userid)
            on delete cascade         
);

select *
from tbl_member;

select *
from tbl_member_detail;

create table tbl_bookcategory
(categoryno number not null,
 categoryname varchar2(100) not null,
 constraint PK_tbl_bookcategory primary key(categoryno)
);

create sequence seq_bookcategory
start with 1000
increment by 1000
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_bookcategory(categoryno, categoryname)
values (seq_bookcategory.nextval, '소설');

insert into tbl_bookcategory(categoryno, categoryname)
values (seq_bookcategory.nextval, 'IT');

insert into tbl_bookcategory(categoryno, categoryname)
values (seq_bookcategory.nextval, '만화');

commit;

select *
from tbl_bookcategory

create table tbl_book
(bookcode varchar2(50) not null,
 fk_categoryno number not null,
 bookname varchar2(100) not null,
 publishday date not null,
 constraint PK_tbl_book primary key(bookcode),
 constraint FK_tbl_book_fk_categoryno foreign key(fk_categoryno)
            references tbl_bookcategory(categoryno)
);

create table tbl_rentbook
(rentbookno number not null,
 fk_bookcode varchar2(50) not null,
 rentyn number(1) default 1 not null, -- 대여중 0 비치중 1
 constraint PK_tbl_rentbook primary key(rentbookno),
 constraint FK_tbl_rentbook_bookcode foreign key (fk_bookcode)
            references tbl_book(bookcode)
);

create sequence seq_rentbook
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select bookcode, fk_categoryno, bookname, publishday
from tbl_book
where fk_categoryno = ?

+"SELECT bookcode, " 
+"  fk_categoryno, " 
+"  bookname, " 
+"  publishday " 
+"FROM tbl_book " 
+"WHERE fk_categoryno = ?"

select A.categoryno, A.categoryname, B.cnt
from tbl_bookcategory A join (select fk_categoryno, count(*) AS cnt
                              from tbl_book
                              group by fk_categoryno)B
on A.categoryno = B.fk_categoryno
order by 1;

+"SELECT A.categoryno, " 
+"  A.categoryname, " 
+"  B.cnt " 
+"FROM tbl_bookcategory A " 
+"JOIN " 
+"  (SELECT fk_categoryno, COUNT(*) AS cnt FROM tbl_book GROUP BY fk_categoryno " 
+"  )B " 
+"ON A.categoryno = B.fk_categoryno " 
+"ORDER BY 1"

select *
from tbl_book;

select bookname, to_char(publishday , 'yyyy-mm-dd') AS publishday
from tbl_book
where fk_categoryno = ?

+"SELECT bookname, " 
+"  TO_CHAR(publishday , 'yyyy-mm-dd') AS publishday " 
+"FROM tbl_book " 
+"WHERE fk_categoryno = ?"

select case when months_between(to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), publishday) < 6 then '[신간]' else '[구간]' end AS OLDNEW,
       bookname,
       to_char(publishday, 'yyyy-mm-dd') AS publishday
from tbl_book
where fk_categoryno = 1000;

+"SELECT " 
+"  CASE " 
+"    WHEN months_between(to_date(TO_CHAR(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), publishday) < 6 " 
+"    THEN '[신간]' " 
+"    ELSE '[구간]' " 
+"  END AS OLDNEW, " 
+"  bookname, " 
+"  TO_CHAR(publishday, 'yyyy-mm-dd') AS publishday " 
+"FROM tbl_book " 
+"WHERE fk_categoryno = ?"

insert into tbl_rentbook(rentbookno, fk_bookcode)
values (seq_rentbook.nextval, ?)

select *
from tbl_rentbook

select fk_bookcode, count(*) AS cnt
from tbl_rentbook
group by fk_bookcode


update tbl_rentbook set rentyn = 0
where rentbookno in (6,8,12,15,17,18,20);
rollback;

select case when months_between(to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), publishday) < 6 then '[신간]' else '[구간]' end AS OLDNEW,
       bookname,
       to_char(publishday, 'yyyy-mm-dd') AS publishday
from tbl_book
where fk_categoryno = 1000;

select fk_bookcode,
       count(*) AS TOTALCNT,
       sum(case rentyn when 1 then 1 else 0 end) AS EXISTSCNT,
       sum(case rentyn when 0 then 1 else 0 end) AS RENTINGCNT
from tbl_rentbook
group by fk_bookcode
order by 1;


select A.OLDNEW, A.BOOKCODE, A.BOOKNAME, A.PUBLISHDAY, B.TOTALCNT, B.EXISTSCNT, B.RENTINGCNT
from (select case when months_between(to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), publishday) < 6 then '[신간]' else '[구간]' end AS OLDNEW,
       bookcode,
       bookname,
       to_char(publishday, 'yyyy-mm-dd') AS publishday
      from tbl_book
      where fk_categoryno = 1000) A
join (select fk_bookcode,
       count(*) AS TOTALCNT,
       sum(case rentyn when 1 then 1 else 0 end) AS EXISTSCNT,
       sum(case rentyn when 0 then 1 else 0 end) AS RENTINGCNT
       from tbl_rentbook
       group by fk_bookcode
       order by 1) B
on A.bookcode = B.fk_bookcode
order by 2;


+"SELECT A.OLDNEW, " 
+"  A.BOOKCODE, " 
+"  A.BOOKNAME, " 
+"  A.PUBLISHDAY, " 
+"  B.TOTALCNT, " 
+"  B.EXISTSCNT, " 
+"  B.RENTINGCNT " 
+"FROM " 
+"  (SELECT " 
+"    CASE " 
+"      WHEN months_between(to_date(TO_CHAR(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), publishday) < 6 " 
+"      THEN '[신간]' " 
+"      ELSE '[구간]' " 
+"    END AS OLDNEW, " 
+"    bookcode, " 
+"    bookname, " 
+"    TO_CHAR(publishday, 'yyyy-mm-dd') AS publishday " 
+"  FROM tbl_book " 
+"  WHERE fk_categoryno = ? " 
+"  ) A " 
+"JOIN " 
+"  (SELECT fk_bookcode, " 
+"    COUNT(*) AS TOTALCNT, " 
+"    SUM( " 
+"    CASE rentyn " 
+"      WHEN 1 " 
+"      THEN 1 " 
+"      ELSE 0 " 
+"    END) AS EXISTSCNT, " 
+"    SUM( " 
+"    CASE rentyn " 
+"      WHEN 0 " 
+"      THEN 1 " 
+"      ELSE 0 " 
+"    END) AS RENTINGCNT " 
+"  FROM tbl_rentbook " 
+"  GROUP BY fk_bookcode " 
+"  ORDER BY 1 " 
+"  ) B " 
+"ON A.bookcode = B.fk_bookcode " 
+"ORDER BY 2"

-- 성인물 유무 컬럼 추가하기 --
alter table tbl_book
add adult number(1) default 0; -- 1:성인물 0:전체관람

select *
from tbl_book

update tbl_book set adult = 1
where bookcode = 'fiction003';

update tbl_book set adult = 1
where bookcode = 'cartoon001';
commit;

select A.OLDNEW, A.BOOKCODE, A.BOOKNAME, A.PUBLISHDAY, B.TOTALCNT, B.EXISTSCNT, B.RENTINGCNT
from (select case when months_between(to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), publishday) < 6 then '[신간]' else '[구간]' end AS OLDNEW,
       bookcode,
       bookname,
       to_char(publishday, 'yyyy-mm-dd') AS publishday
      from tbl_book
      where fk_categoryno = 1000 and adult != 1 ) A
join (select fk_bookcode,
       count(*) AS TOTALCNT,
       sum(case rentyn when 1 then 1 else 0 end) AS EXISTSCNT,
       sum(case rentyn when 0 then 1 else 0 end) AS RENTINGCNT
       from tbl_rentbook
       group by fk_bookcode
       order by 1) B
on A.bookcode = B.fk_bookcode
order by 2;



select case when extract(year from sysdate) - to_number( substr(birthday, 1, 4) ) < 20
       then 0 else 1 end AS ADULTCHECK
from tbl_member A join tbl_member_detail B
on A.userid = B.fk_userid
where userid = 'skskrlwk' and passwd = 'qwer1234$';

+"SELECT " 
+"  CASE " 
+"    WHEN extract(YEAR FROM sysdate) - to_number( SUBSTR(birthday, 1, 4) ) < 20 " 
+"    THEN 0 " 
+"    ELSE 1 " 
+"  END AS ADULTCHECK " 
+"FROM tbl_member A " 
+"JOIN tbl_member_detail B " 
+"ON A.userid  = B.fk_userid " 
+"WHERE userid = 'skskrlwk' " 
+"AND passwd   = 'qwer1234$'"
-----------------
select *
from fk_userid;

select *
from tbl_member;

select *
from tbl_member_detail;
-------------------------------------------------------------------

create table tbl_rentlist -- 대여 테이블
  (fk_rentbookno   number  not null
  ,fk_userid      varchar2(20) not null
  ,fk_bookcode     varchar2(50)    not null
  ,rent_date       date default sysdate not null
  ,constraint PK_tbl_rentlist primary key(fk_rentbookno)
  ,constraint FK_tbl_rentlist_fk_rentbookno foreign key(fk_rentbookno)
                                        references tbl_rentbook(rentbookno)
  ,constraint FK_tbl_rentlist_fk_userid foreign key(fk_userid)
                                        references tbl_member_detail(fk_userid)
  ,constraint FK_tbl_rentlist_fk_bookcode foreign key(fk_bookcode)
                                        references tbl_book(bookcode)
  );
  
  --------------------------------------------------------------------------
create table tbl_returnlist -- 반납 테이블
  (fk_rentbookno   number  not null
  ,fk_userid      varchar2(20) not null
  ,fk_bookcode     varchar2(50)    not null
  ,rent_date       date default sysdate not null
  ,constraint PK_tbl_returnlist primary key(fk_rentbookno)
  ,constraint FK_tbl_return_fk_rentbookno foreign key(fk_rentbookno)
                                        references tbl_rentbook(rentbookno)
  ,constraint FK_tbl_return_fk_userid foreign key(fk_userid)
                                        references tbl_member_detail(fk_userid)
  ,constraint FK_tbl_return_fk_bookcode foreign key(fk_bookcode)
                                        references tbl_book(bookcode)
  );
  --------------------------------------------------------------------------

create table setting_opt -- 가격
(rent_range number not null --미반납 기간()
,new_price number not null
,old_price number not null
);

insert into setting_opt(rent_range, new_price, old_price)
values (14, 2000 ,1000);
commit;

select *
from tbl_rentbook

select *
from tbl_rentlist

select *
from tbl_returnlist

select *
from tbl_member_detail

select fk_userid, name ,birthday, email, tel, address, point, coin, renttotal, mibannapcnt, delaymoney
from tbl_member A join tbl_member_detail B
on A.userid = B.fk_userid
where B.fk_userid = 'skskrlwk'

+"SELECT fk_userid, " 
+"  name , " 
+"  birthday, " 
+"  email, " 
+"  tel, " 
+"  address, " 
+"  point, " 
+"  coin, " 
+"  renttotal, " 
+"  mibannapcnt, " 
+"  delaymoney " 
+"FROM tbl_member A " 
+"JOIN tbl_member_detail B " 
+"ON A.userid     = B.fk_userid; " 
+"WHERE fk_userid = ?"

select *
from tbl_rentbook;

update tbl_rentbook set rentyn = 0
where rentbookno in (1,20)
commit;

select *
from tbl_rentlist;

select *
from tbl_returnlist;

insert into tbl_rentlist(fk_rentbookno, fk_userid, fk_bookcode)
values (1, 'skskrlwk', 'fiction001' );

insert into tbl_rentlist(fk_rentbookno, fk_userid, fk_bookcode)
values (12, 'skskrlwk', 'fiction002' );

insert into tbl_rentlist(fk_rentbookno, fk_userid, fk_bookcode)
values (20, 'skskrlwk', 'it001' );

insert into tbl_rentlist(fk_rentbookno, fk_userid, fk_bookcode, rent_date)
values (17, 'wonderwoman', 'fiction002', to_date('2018-03-09', 'yyyy-mm-dd') );

commit;

insert into tbl_returnlist(fk_rentbookno, fk_userid, fk_bookcode)
values (12, 'skskrlwk', 'fiction002' );
commit;

select *
from tbl_member_detail; 

select *
from tbl_book

update tbl_member_detail set renttotal = 3, mibannapcnt = 2
where fk_userid = 'skskrlwk';
commit;

update tbl_rentlist set rent_date = to_date('2018-03-01' , 'yyyy-mm-dd')
where fk_rentbookno = 1;

update tbl_rentlist set rent_date = to_date('2018-03-20' , 'yyyy-mm-dd')
where fk_rentbookno = 20
commit;

select *
from tbl_book;

select *
from tbl_rentbook;


select *
from tbl_rentlist;

select *
from tbl_returnlist;



delete from tbl_rentlist 
where fk_rentbookno = 12;
commit

select fk_userid,
       bookname,
       rentbookno,
       to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(B.rent_date, 'yyyy-mm-dd'), 'yyyy-mm-dd' ) - 13 AS day
from tbl_rentbook A join tbl_rentlist B
on A.rentbookno = B.fk_rentbookno
join
tbl_book C
on B.fk_bookcode = C.bookcode 
where to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(B.rent_date, 'yyyy-mm-dd'), 'yyyy-mm-dd' ) >= (select rent_range from setting_opt)
;

select *
from setting_opt;

select *
from tbl_member

select *
from tbl_member_detail







