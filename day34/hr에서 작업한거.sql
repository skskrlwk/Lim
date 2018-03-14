--- *** 테이블 생성하기 *** ---
--1.  1:1 관계의 테이블 생성하기

create table tbl_userlogin
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(30) not null,
 constraint PK_tbl_userlogin_userid primary key(userid)
);

create table tbl_userdetail
(userid varchar2(20) not null,
 gender number(1) not null,
 birth varchar2(10) not null,
 address varchar2(200) not null,
 tel varchar2(20),
 registerday date default sysdate, -- 값이 없으면 자동으로 sysdate 저장
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- 외래키 설정
            references tbl_userlogin(userid)
            on delete cascade,   -- 부모 테이블에서 어떤 행을 삭제하면 자식 테이블에서 자동삭제
                                 -- 테이블의 관계가 1:1 이라면 foreign key 생성시 on delete cascade 를 해준다.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ) -- check 제약          
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '정영광');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '서울시 동대문구', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '안지혜');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '서울시 구로구', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;

-- 회원탈퇴
delete from tbl_userlogin
where userid =  'superman';

rollback;

select *
from dictionary
where table_name like 'USER_%' and lower(comments) like '%sequence%'

select *
from USER_SEQUENCES;

create sequence seq_tbl_order
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table tbl_order 
(orderno varchar2(30) not null, -- 시퀀스
 userid varchar2(20) not null,
 orderday date default sysdate not null,
 constraint PK_tbl_order_orderno primary key(orderno),
 constraint FK_tbl_order_userid foreign key(userid)
            references tbl_userdetail(userid)
);

insert into tbl_order(orderno, userid, orderday)
values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);

commit

select *
from tbl_order;

-- 회원탈퇴
delete from tbl_userlogin
where userid =  'superman'; --에러

delete from tbl_userlogin
where userid =  'wonderwoman';

rollback;
---- *** 테이블 삭제하기 *** ---
-- 자식 테이브을 먼저 삭제한 후 부모 테이블을 삭제한다.

-- drop table tbl_userlogin -- 에러

drop table tbl_order purge;
drop table tbl_userdetail purge;
drop table tbl_userlogin purge;


create table tbl_userlogin
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(30) not null,
 status number(1) default 1 not null, -- 회원 탈퇴유무 체크 컬럼. 1이면 가입, 0이면 탈퇴
 constraint PK_tbl_userlogin_userid primary key(userid),
 constraint CK_tbl_userlogin_status check( status in(0,1) )
);

create table tbl_userdetail
(userid varchar2(20) not null,
 status number(1) default 1 not null,
 gender number(1) not null,
 birth varchar2(10) not null,
 address varchar2(200) not null,
 tel varchar2(20),
 registerday date default sysdate, -- 값이 없으면 자동으로 sysdate 저장
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- 외래키 설정
            references tbl_userlogin(userid)
            on delete cascade,   -- 부모 테이블에서 어떤 행을 삭제하면 자식 테이블에서 자동삭제
                                 -- 테이블의 관계가 1:1 이라면 foreign key 생성시 on delete cascade 를 해준다.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ), -- check 제약
 constraint CK_tbl_userdetail_status check( status in (0,1) ) 
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '정영광');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '서울시 동대문구', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '안지혜');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '서울시 구로구', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;
-- 로그인 처리
select count(*)
from tbl_userlogin
where status = 1 and
      userid = 'superman' and
      passwd = 'qwer1234$';

select case(select count(*)
            from tbl_userlogin
            where status = 1 and
                  userid = 'superman' and
                  passwd = 'qwer1234$' ) 
       when 1 then '로그인성공' 
       else '로그인실패' end AS 로그인결과
from dual;

-- 회원탈퇴
update tbl_userlogin set status = 0
where userid = 'superman';

update tbl_userdetail set status = 0
where userid = 'superman';

rollback;

-- *** 제품카테고리 테이블 ***
create table tbl_category 
(categoryno number(5) not null,
 categoryname varchar2(100) not null, -- 유추 가능한 것은 코드화
 constraint PK_tbl_category_categoryno primary key(categoryno)
);

insert into tbl_category(categoryno, categoryname)
values(1, '전자제품');

insert into tbl_category(categoryno, categoryname)
values(2, '의류');

insert into tbl_category(categoryno, categoryname)
values(3, '도서');

commit;

-- *** 제품 테이블 *** --
create table tbl_product
(productcode varchar2(20) not null,
 fk_categoryno number(5) not null,
 produckname varchar2(100) not null,
 price number not null, -- 단가
 releaseday date, -- 출시일 
 constraint PK_tbl_product_productcode primary key(productcode),
 constraint FK_tbl_product_fk_categoryno foreign key(fk_categoryno)
            references tbl_category(categoryno)
            on delete cascade
);

insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('ss12345', 1, '싱싱냉장고', 700000, to_date('2017-05-01', 'yyyy-mm-dd') );


insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('jj12345', 2, 'LED 와이드 TV', 900000, to_date('2018-03-01', 'yyyy-mm-dd') );

commit;

drop sequence seq_tbl_order; -- 시퀀스 삭제

create sequence seq_tbl_order
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table tbl_order 
(orderno varchar2(30) not null, -- 시퀀스
 userid varchar2(20) not null,
 orderday date default sysdate not null,
 constraint PK_tbl_order_orderno primary key(orderno),
 constraint FK_tbl_order_userid foreign key(userid)
            references tbl_userdetail(userid)
);

insert into tbl_order(orderno, userid, orderday)
values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);


select *
from tbl_order;

-- 회원 탈퇴

update tbl_userlogin set status = 0
where userid = 'superman';

update tbl_userdetail set status = 0
where userid = 'superman';

create sequence seq_tbl_order_detail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

--  *** 주문상세 테이블 ***
create table tbl_order_detail
( orderdetailno number not null, -- 시퀀스 일련번호
  fk_orderno varchar2(30) not null,
  fk_productcode varchar2(30) not null,
  quantity number not null,  -- 주문량
  price number not null, -- 역정규화(단가)
  constraint PF_tbl_order_detail primary key(orderdetailno),
  constraint FK_tbl_order_detail_orderno foreign key (fk_orderno)
             references tbl_order(orderno)
             on delete cascade,
  constraint FK_tbl_order_detail_fk_pcode foreign key(fk_productcode)
             references tbl_product -- 제품은 사라져도 기록이 남아야하기 떄문에 on delete cascade X 
);


insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
values (seq_tbl_order_detail.nextval,
        (select max(orderno)
          from tbl_order
          where userid = 'superman'),
        'ss12345',
        2,
        (select price
          from tbl_product
          where productcode = 'ss12345'
         )
       );

insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
values (seq_tbl_order_detail.nextval,
        (select max(orderno)
          from tbl_order
          where userid = 'superman'),
        'jj12345',
        1,
        (select price
          from tbl_product
          where productcode = 'jj12345'
         )
       );
       
commit; 

select *
from tbl_order;

select *
from tbl_order_detail;

/*
------------------------------------
전표  제품명   주문량   단가    주문액
-----------------------------------
*/

select A.orderno AS 전표,
       C.produckname AS 제품명, 
       B.quantity As 주문량,
       B.price AS 단가,
       B.quantity * B.price AS 주문액
from tbl_order A join tbl_order_detail B
on A.orderno = B.fk_orderno
join tbl_product C
on B.fk_productcode = C.productcode
where A.userid = 'superman';

update tbl_product set price = price + (price * 0.1)
where productcode = 'ss12345';

commit;

insert into tbl_order(orderno, userid, orderday)
values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);

insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
values (seq_tbl_order_detail.nextval,
        (select max(orderno)
          from tbl_order
          where userid = 'superman'),
        'ss12345',
        2,
        (select price
          from tbl_product
          where productcode = 'ss12345'
         )
       );

create table tbl_sawon
( sano varchar2(20),
  saname varchar2(30) not null,
  jubun varchar2(13) not null,
  constraint PK_tbl_sawon_sano primary key(sano,saname)  -- Composite Primary Key(복합 프라이머리키)
);

drop table tbl_sawon purge;

create table tbl_sawon
( sano varchar2(20),
  saname varchar2(30),
  jubun varchar2(13) not null,
  constraint PK_tbl_sawon_sano primary key(sano),  -- Composite Primary Key(복합 프라이머리키)
  constraint UQ_tbl_sawon_jubun unique(jubun),
  constraint UQ_tbl_sawon_saname unique(saname)
); -- 한 테이블당 unique key 제약은 여러번 가능하다.
   -- 하지만 primary key 제약은 한번만 가능하다.


insert into tbl_sawon(sano, saname, jubun)
values('kh1001', '이순신', '9003091234567');

insert into tbl_sawon(sano, saname, jubun)
values('kh1002', '한석규', '9003091234567'); -- 오류 

insert into tbl_sawon(sano,saname, jubun)
values('kh1003', '이순신', '8703091234567'); -- 오류

insert into tbl_sawon(sano, saname, jubun)
values('kh1004', null, '8703091234567'); 

insert into tbl_sawon(sano,saname, jubun)
values('kh1005', null, '7703091234567');  -- 오라클은 null을 여러번 허용 
 
insert into tbl_sawon(sano,saname, jubun)
values('kh1006', '엄정화', null);  -- 오류

commit;

select *
from tbl_sawon

/*
-- *** 제약조건의 조회 *** ---
 << 제약조건의 종류 >> 
 1. Primary Key   (P)
 2. Unique        (U)
 3. Check         (C)
 4. Foreign Key   (R)
 5. Not null      (C)
 
*/

select *
from user_constraints
where table_name = 'TBL_SAWON'

select *
from user_constraints
where table_name = 'TBL_USER'

select *
from user_cons_columns
where table_name = 'TBL_USER'

select *
from user_constraints
where table_name = 'TBL_USERDETAIL'

select *
from user_cons_columns   
where table_name = 'TBL_USERDETAIL'

-- 제약조건의 조회는 다음과 같이 JOIN 을 해서 본다.
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERDETAIL';

-- ** 제약조건의 추가 ** --
alter table tbl_userlogin
add constraint CK_tbl_userlogin_passwd check( 8 < length(passwd) and length(passwd) <= 20 );

select *
from tbl_userlogin;

update tbl_userlogin set passwd = 'abc123$'
where userid = 'superman'; -- 패스워드 체크제약에 걸려서 오류

update tbl_userlogin set passwd = 'abcd1234$'
where userid = 'superman'; 

commit

desc tbl_userdetail;

alter table tbl_userdetail
add constraint NN_tbl_userdetail tel not null; -- 오류
/*
 제약조건의 추가시 primary key, unique, check, foregin key 제약의 추가는
 alter table 테이블명
 add constraint 컨스트레인트이름 primary key(컬럼명);
 add constraint 컨스트레인트이름 unique(컬럼명);
 add constraint 컨스트레인트이름 check(컬럼명);
 add constraint 컨스트레인트이름 foreign key(컬럼명);
                references 부모테이블명(참조받는 컬렴명)

제약조건의 추가시 not null 은 아래와 같이 한다.
alter table 테이블명
modify 컬럼명 not null;
*/

alter table tbl_userdetail
modify tel not null;
                
desc tbl_userdetail;

--- *** 제약조건의 삭제 *** ---
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

alter table tbl_userlogin
drop constraint ck_tbl_userlogin_passwd;

-- ** not null 제약의 삭제는 2가지 방법이 있다. --
alter table tbl_userlogin
drop constraint SYS_C007039 ;

alter table tbl_userlogin
modify name null;

select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

-- ** 테이블에 컬럼 추가하기 ** --
alter table tbl_sawon
add email varchar2(30);

desc tbl_sawon;

select *
from tbl_sawon;

-- not null 제약을 주고자 할떄
alter table tbl_sawon
add email varchar2(30) not null; -- 오류
-- 이미 tbl_sawon 테이블에는 데이터가 들어가 있는 상태인데
-- email 컬럼을 넣어주자마자 not null 로 해야하는데 값을 넣어줄수가 없다.

alter table tbl_sawon
add email varchar2(30) default ' ' not null; 

desc tbl_sawon;

select *
from tbl_sawon;

-- ** 테이블에 컬럼 삭제하기 ** --
alter table tbl_sawon
drop column email;

desc tbl_sawon;

select *
from tbl_sawon;

-- ** 특정 테이블에 default 값이 무엇이 있는지 조회하기 ** --
select *
from user_tab_columns
where table_name = 'TBL_SAWON'

select *
from user_tab_columns
where table_name = 'TBL_ORDER'

-- ** default 값 변경하기 ** --
alter table tbl_sawon
modify email default ' ';

alter table tbl_order
modify orderday default sysdate;

-- ** 테이블에 컬럼명 변경하기 ** --
alter table tbl_sawon
rename column email to mail;

select *
from tbl_sawon;

-- ** 테이블명 변경하기 ** --
rename tbl_sawon to tbl_emp;

select *
from tbl_emp;

rename tbl_emp to tbl_sawon;

-- 컬럼의 데이터 타입 크기 변경하기 

alter table tbl_sawon
modify saname varchar2(50)


create table tbl_empcopy1
as
select *
from employees

create table tbl_empcopy2
as
select *
from employees;

create table tbl_empcopy3
as
select *
from employees;

create table tbl_empcopy4
as
select *
from employees;

create table tbl_empcopy5
as
select *
from employees;

select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_EMPCOPY5';

create table tbl_mber
(id varchar2(10) not null,
 name varchar2(20) not null,
 constraint PK_tbl_mber_id primary key(id)
);

create table tbl_mber2
(id varchar2(10),
 name varchar2(20) not null,
 constraint PK_tbl_mber2_id primary key(id)
);

desc tbl_mber

/*
이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

desc tbl_mber2

/*
이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

insert into tbl_mber(id, name) values ('lee', '이순신');
insert into tbl_mber2(id, name) values ('lee', '이순신');
commit;

create table tbl_mber_copy
as
select *
from tbl_mber
where 1=2; -- 테이블 컬럼구조만 카피할때

create table tbl_mber2_copy
as
select *
from tbl_mber2
where 1=2;

desc tbl_mber_copy;

/*
이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 

*/
desc tbl_mber2_copy;

/*
이름   널        유형           
---- -------- ------------ 
ID            VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

-- ** 테이블 삭제하기(휴지통에 버리기) ** --
drop table tbl_empcopy1;

drop table tbl_empcopy2;

drop table tbl_empcopy3;


select *
from tab;
-- BIN$~~~~~ 로 나오는값이 휴지통에 버려진 테이블

select *
from "BIN$+cJi+3iHT5aM6ni5+MfrGA==$0";

select *
from "BIN$/j2GmVVTTniBa5hOA5+v1Q==$0"

select *
from "BIN$2GpPfldgQ1Cr31OIRRnLTA==$0"

-- ** 휴지통 보기 ** --
select *
from user_recyclebin

-- ** 휴지통에 버려진 테이블 복구하기 ** --
flashback table TBL_EMPCOPY1 to before drop;
flashback table TBL_EMPCOPY2 to before drop;
flashback table TBL_EMPCOPY3 to before drop;

-- ** 휴지통에 버려진 테이블 삭제하기 ** --
purge table TBL_EMPCOPY1;

-- 테이블 삭제시 휴지통에 버리지 않고 영구히 삭제하기

drop table tbl_empcopy4 purge;