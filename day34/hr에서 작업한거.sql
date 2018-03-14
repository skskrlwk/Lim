--- *** ���̺� �����ϱ� *** ---
--1.  1:1 ������ ���̺� �����ϱ�

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
 registerday date default sysdate, -- ���� ������ �ڵ����� sysdate ����
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- �ܷ�Ű ����
            references tbl_userlogin(userid)
            on delete cascade,   -- �θ� ���̺��� � ���� �����ϸ� �ڽ� ���̺��� �ڵ�����
                                 -- ���̺��� ���谡 1:1 �̶�� foreign key ������ on delete cascade �� ���ش�.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ) -- check ����          
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '����� ���빮��', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '����� ���α�', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;

-- ȸ��Ż��
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
(orderno varchar2(30) not null, -- ������
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

-- ȸ��Ż��
delete from tbl_userlogin
where userid =  'superman'; --����

delete from tbl_userlogin
where userid =  'wonderwoman';

rollback;
---- *** ���̺� �����ϱ� *** ---
-- �ڽ� ���̺��� ���� ������ �� �θ� ���̺��� �����Ѵ�.

-- drop table tbl_userlogin -- ����

drop table tbl_order purge;
drop table tbl_userdetail purge;
drop table tbl_userlogin purge;


create table tbl_userlogin
(userid varchar2(20) not null,
 passwd varchar2(20) not null,
 name varchar2(30) not null,
 status number(1) default 1 not null, -- ȸ�� Ż������ üũ �÷�. 1�̸� ����, 0�̸� Ż��
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
 registerday date default sysdate, -- ���� ������ �ڵ����� sysdate ����
 constraint PK_tbl_userdetail_userid primary key(userid),
 constraint FK_tbl_userdetail_userid foreign key(userid) -- �ܷ�Ű ����
            references tbl_userlogin(userid)
            on delete cascade,   -- �θ� ���̺��� � ���� �����ϸ� �ڽ� ���̺��� �ڵ�����
                                 -- ���̺��� ���谡 1:1 �̶�� foreign key ������ on delete cascade �� ���ش�.    
 constraint CK_tbl_userdetail_gender check( gender in (1,2) ), -- check ����
 constraint CK_tbl_userdetail_status check( status in (0,1) ) 
);

insert into tbl_userlogin(userid, passwd, name)
values('superman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('superman', 1, '1993-05-05', '����� ���빮��', '010-345-6789');

insert into tbl_userlogin(userid, passwd, name)
values('wonderwoman','qwer1234$', '������');

insert into tbl_userdetail(userid, gender, birth, address, tel)
values('wonderwoman', 2, '1986-06-01', '����� ���α�', '010-2222-3333');

commit;

select *
from tbl_userlogin;

select *
from tbl_userdetail;
-- �α��� ó��
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
       when 1 then '�α��μ���' 
       else '�α��ν���' end AS �α��ΰ��
from dual;

-- ȸ��Ż��
update tbl_userlogin set status = 0
where userid = 'superman';

update tbl_userdetail set status = 0
where userid = 'superman';

rollback;

-- *** ��ǰī�װ� ���̺� ***
create table tbl_category 
(categoryno number(5) not null,
 categoryname varchar2(100) not null, -- ���� ������ ���� �ڵ�ȭ
 constraint PK_tbl_category_categoryno primary key(categoryno)
);

insert into tbl_category(categoryno, categoryname)
values(1, '������ǰ');

insert into tbl_category(categoryno, categoryname)
values(2, '�Ƿ�');

insert into tbl_category(categoryno, categoryname)
values(3, '����');

commit;

-- *** ��ǰ ���̺� *** --
create table tbl_product
(productcode varchar2(20) not null,
 fk_categoryno number(5) not null,
 produckname varchar2(100) not null,
 price number not null, -- �ܰ�
 releaseday date, -- ����� 
 constraint PK_tbl_product_productcode primary key(productcode),
 constraint FK_tbl_product_fk_categoryno foreign key(fk_categoryno)
            references tbl_category(categoryno)
            on delete cascade
);

insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('ss12345', 1, '�̳̽����', 700000, to_date('2017-05-01', 'yyyy-mm-dd') );


insert into tbl_product(productcode, fk_categoryno, produckname, price, releaseday)
values ('jj12345', 2, 'LED ���̵� TV', 900000, to_date('2018-03-01', 'yyyy-mm-dd') );

commit;

drop sequence seq_tbl_order; -- ������ ����

create sequence seq_tbl_order
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table tbl_order 
(orderno varchar2(30) not null, -- ������
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

-- ȸ�� Ż��

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

--  *** �ֹ��� ���̺� ***
create table tbl_order_detail
( orderdetailno number not null, -- ������ �Ϸù�ȣ
  fk_orderno varchar2(30) not null,
  fk_productcode varchar2(30) not null,
  quantity number not null,  -- �ֹ���
  price number not null, -- ������ȭ(�ܰ�)
  constraint PF_tbl_order_detail primary key(orderdetailno),
  constraint FK_tbl_order_detail_orderno foreign key (fk_orderno)
             references tbl_order(orderno)
             on delete cascade,
  constraint FK_tbl_order_detail_fk_pcode foreign key(fk_productcode)
             references tbl_product -- ��ǰ�� ������� ����� ���ƾ��ϱ� ������ on delete cascade X 
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
��ǥ  ��ǰ��   �ֹ���   �ܰ�    �ֹ���
-----------------------------------
*/

select A.orderno AS ��ǥ,
       C.produckname AS ��ǰ��, 
       B.quantity As �ֹ���,
       B.price AS �ܰ�,
       B.quantity * B.price AS �ֹ���
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
  constraint PK_tbl_sawon_sano primary key(sano,saname)  -- Composite Primary Key(���� �����̸Ӹ�Ű)
);

drop table tbl_sawon purge;

create table tbl_sawon
( sano varchar2(20),
  saname varchar2(30),
  jubun varchar2(13) not null,
  constraint PK_tbl_sawon_sano primary key(sano),  -- Composite Primary Key(���� �����̸Ӹ�Ű)
  constraint UQ_tbl_sawon_jubun unique(jubun),
  constraint UQ_tbl_sawon_saname unique(saname)
); -- �� ���̺�� unique key ������ ������ �����ϴ�.
   -- ������ primary key ������ �ѹ��� �����ϴ�.


insert into tbl_sawon(sano, saname, jubun)
values('kh1001', '�̼���', '9003091234567');

insert into tbl_sawon(sano, saname, jubun)
values('kh1002', '�Ѽ���', '9003091234567'); -- ���� 

insert into tbl_sawon(sano,saname, jubun)
values('kh1003', '�̼���', '8703091234567'); -- ����

insert into tbl_sawon(sano, saname, jubun)
values('kh1004', null, '8703091234567'); 

insert into tbl_sawon(sano,saname, jubun)
values('kh1005', null, '7703091234567');  -- ����Ŭ�� null�� ������ ��� 
 
insert into tbl_sawon(sano,saname, jubun)
values('kh1006', '����ȭ', null);  -- ����

commit;

select *
from tbl_sawon

/*
-- *** ���������� ��ȸ *** ---
 << ���������� ���� >> 
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

-- ���������� ��ȸ�� ������ ���� JOIN �� �ؼ� ����.
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERDETAIL';

-- ** ���������� �߰� ** --
alter table tbl_userlogin
add constraint CK_tbl_userlogin_passwd check( 8 < length(passwd) and length(passwd) <= 20 );

select *
from tbl_userlogin;

update tbl_userlogin set passwd = 'abc123$'
where userid = 'superman'; -- �н����� üũ���࿡ �ɷ��� ����

update tbl_userlogin set passwd = 'abcd1234$'
where userid = 'superman'; 

commit

desc tbl_userdetail;

alter table tbl_userdetail
add constraint NN_tbl_userdetail tel not null; -- ����
/*
 ���������� �߰��� primary key, unique, check, foregin key ������ �߰���
 alter table ���̺��
 add constraint ����Ʈ����Ʈ�̸� primary key(�÷���);
 add constraint ����Ʈ����Ʈ�̸� unique(�÷���);
 add constraint ����Ʈ����Ʈ�̸� check(�÷���);
 add constraint ����Ʈ����Ʈ�̸� foreign key(�÷���);
                references �θ����̺��(�����޴� �÷Ÿ�)

���������� �߰��� not null �� �Ʒ��� ���� �Ѵ�.
alter table ���̺��
modify �÷��� not null;
*/

alter table tbl_userdetail
modify tel not null;
                
desc tbl_userdetail;

--- *** ���������� ���� *** ---
select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

alter table tbl_userlogin
drop constraint ck_tbl_userlogin_passwd;

-- ** not null ������ ������ 2���� ����� �ִ�. --
alter table tbl_userlogin
drop constraint SYS_C007039 ;

alter table tbl_userlogin
modify name null;

select *
from user_constraints A JOIN user_cons_columns B
on A.constraint_name = B.constraint_name
where A.table_name = 'TBL_USERLOGIN';

-- ** ���̺� �÷� �߰��ϱ� ** --
alter table tbl_sawon
add email varchar2(30);

desc tbl_sawon;

select *
from tbl_sawon;

-- not null ������ �ְ��� �ҋ�
alter table tbl_sawon
add email varchar2(30) not null; -- ����
-- �̹� tbl_sawon ���̺��� �����Ͱ� �� �ִ� �����ε�
-- email �÷��� �־����ڸ��� not null �� �ؾ��ϴµ� ���� �־��ټ��� ����.

alter table tbl_sawon
add email varchar2(30) default ' ' not null; 

desc tbl_sawon;

select *
from tbl_sawon;

-- ** ���̺� �÷� �����ϱ� ** --
alter table tbl_sawon
drop column email;

desc tbl_sawon;

select *
from tbl_sawon;

-- ** Ư�� ���̺� default ���� ������ �ִ��� ��ȸ�ϱ� ** --
select *
from user_tab_columns
where table_name = 'TBL_SAWON'

select *
from user_tab_columns
where table_name = 'TBL_ORDER'

-- ** default �� �����ϱ� ** --
alter table tbl_sawon
modify email default ' ';

alter table tbl_order
modify orderday default sysdate;

-- ** ���̺� �÷��� �����ϱ� ** --
alter table tbl_sawon
rename column email to mail;

select *
from tbl_sawon;

-- ** ���̺�� �����ϱ� ** --
rename tbl_sawon to tbl_emp;

select *
from tbl_emp;

rename tbl_emp to tbl_sawon;

-- �÷��� ������ Ÿ�� ũ�� �����ϱ� 

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
�̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

desc tbl_mber2

/*
�̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

insert into tbl_mber(id, name) values ('lee', '�̼���');
insert into tbl_mber2(id, name) values ('lee', '�̼���');
commit;

create table tbl_mber_copy
as
select *
from tbl_mber
where 1=2; -- ���̺� �÷������� ī���Ҷ�

create table tbl_mber2_copy
as
select *
from tbl_mber2
where 1=2;

desc tbl_mber_copy;

/*
�̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 

*/
desc tbl_mber2_copy;

/*
�̸�   ��        ����           
---- -------- ------------ 
ID            VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

-- ** ���̺� �����ϱ�(�����뿡 ������) ** --
drop table tbl_empcopy1;

drop table tbl_empcopy2;

drop table tbl_empcopy3;


select *
from tab;
-- BIN$~~~~~ �� �����°��� �����뿡 ������ ���̺�

select *
from "BIN$+cJi+3iHT5aM6ni5+MfrGA==$0";

select *
from "BIN$/j2GmVVTTniBa5hOA5+v1Q==$0"

select *
from "BIN$2GpPfldgQ1Cr31OIRRnLTA==$0"

-- ** ������ ���� ** --
select *
from user_recyclebin

-- ** �����뿡 ������ ���̺� �����ϱ� ** --
flashback table TBL_EMPCOPY1 to before drop;
flashback table TBL_EMPCOPY2 to before drop;
flashback table TBL_EMPCOPY3 to before drop;

-- ** �����뿡 ������ ���̺� �����ϱ� ** --
purge table TBL_EMPCOPY1;

-- ���̺� ������ �����뿡 ������ �ʰ� ������ �����ϱ�

drop table tbl_empcopy4 purge;