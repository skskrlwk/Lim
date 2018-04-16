-------- **** JSP & Servelt **** -----------

show user; -- USER��(��) "MYORAUSER"�Դϴ�.


-- ȸ�����̺� ���� --
create table jsp_member
(idx number(10) not null,        -- ȸ����ȣ(�������� �����Ͱ� ���´�.)
 userid varchar2(20) not null, -- ȸ�� ���̵�
 name varchar2(30) not null, -- ȸ����
 pwd varchar2(15) not null, -- ��й�ȣ
 email varchar2(50) not null, -- �̸���
 hp1  char(3),
 hp2  char(4),
 hp3  char(4),
 post1  char(3), -- �����ȣ
 post2 char(3),
 addr1  varchar2(200),  -- �ּ�
 addr2 varchar2(200),
 registerday  date default sysdate, -- ��������
 status number(1) default 1, -- ȸ��Ż������  1:��밡��(������) / 0:���Ұ�(ȸ��Ż��)
 constraint PK_jsp_member_idx primary key(idx),
 constraint UQ_jsp_member_userid unique(userid),
 constraint CK_jsp_member_status check( status in(0,1) )
 );
 
 
create sequence seq_jsp_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into jsp_member(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2)
values(seq_jsp_member.nextval, 'hansk', '�Ѽ���', 'qwer1234$', 'hansk@naver.com', '010', '111', '1234', '150', '010', '����� ���α� �λ絿', '1���� 201ȣ');

commit;

select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
order by idx desc;

select count(*) AS CNT
from jsp_member
where userid = 'hansk';

+"SELECT COUNT(*) AS CNT FROM jsp_member WHERE userid = 'hansk';"


---- *** �����ȣ ���̺� ���� *** ----
create table tbl_post
(zipcode  varchar2(20), -- ���� ��ȣ
 sido varchar2(40),     -- Ư����, ������, ��
 gugun  varchar2(40),    -- ��, ��, ��
 dong varchar2(400),  -- ��,��,��,��,�ǹ���
 bunji  varchar2(400), -- ����, ����Ʈ��, ȣ��
 seq  number,   -- ������ ����
 constraint PK_tbl_post_seq primary key(seq)
 );

select *
from tbl_post
order by seq;

select count(*)
from tbl_post
order by seq; -- 52144


create table jsp_tblpost
(post1  varchar2(10), -- ���� ��ȣ1
 post2  varchar2(10), -- ���� ��ȣ2
 sido varchar2(40),     -- Ư����, ������, ��
 gugun  varchar2(40),    -- ��, ��, ��
 dong varchar2(400),  -- ��,��,��,��,�ǹ���
 bunji  varchar2(400), -- ����, ����Ʈ��, ȣ��
 seq  number,   -- ������ ����
 constraint PK_jsp_tblpost_seq primary key(seq)
 );


insert into jsp_tblpost
select substr(zipcode,1 ,3), substr(zipcode, 5), sido, gugun, dong, bunji, seq
from tbl_post
order by seq asc;

commit;

select *
from jsp_tblpost
order by seq asc;


select post1, post2, sido|| ' ' || gugun || ' ' || dong || ' ' || bunji AS ADDRESS
from jsp_tblpost
where dong like '%'|| '����' || '%'
order by post1, post2

+"SELECT post1, " 
+"  post2, " 
+"  sido " 
+"  || ' ' " 
+"  || gugun " 
+"  || ' ' " 
+"  || dong " 
+"  || ' ' " 
+"  || bunji AS ADDRESS " 
+"FROM jsp_tblpost " 
+"WHERE dong LIKE '%' " 
+"  || '����' " 
+"  || '%' " 
+"ORDER BY post1, " 
+"  post2"

select *
from jsp_member;


select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
where status = 1
order by idx desc;

+"SELECT idx, " 
+"  userid, " 
+"  name, " 
+"  pwd, " 
+"  email, " 
+"  hp1, " 
+"  hp2, " 
+"  hp3, " 
+"  post1, " 
+"  post2, " 
+"  addr1, " 
+"  addr2, " 
+"  TO_CHAR(registerday, 'yyyy-mm-dd') AS registerday, " 
+"  status " 
+"FROM jsp_member " 
+"WHERE status = 1 " 
+"ORDER BY idx DESC"

----------------------------------------------------------------------------
--- *** ����¡ ó���� ���ؼ� ȸ���� ���� ���Խ��Ѻ���. *** ---

declare 
  v_cnt number(3) := 1;

begin
  loop 
    insert into jsp_member(idx, name, userid, pwd, email,
                           hp1, hp2, hp3, post1, post2,
                           addr1, addr2)
    values(seq_jsp_member.nextval, 'ȫ�浿'||v_cnt, 'hongkd'||v_cnt, 'qwer1234$', 'hongkd'||v_cnt||'@naver.com',
           '010','567','8979','150','017','����� ������ ��ġ��', v_cnt||'����');                       
    v_cnt := v_cnt + 1;
  exit when v_cnt > 80;
  end loop;
end;

select *
from jsp_member

declare 
  v_cnt number(3) := 1;

begin
  loop 
    insert into jsp_member(idx, name, userid, pwd, email,
                           hp1, hp2, hp3, post1, post2,
                           addr1, addr2)
    values(seq_jsp_member.nextval, '������'||v_cnt, 'kimth'||v_cnt, 'qwer1234$', 'kimth'||v_cnt||'@gmail.com',
           '010','234','5678','159','123','����� ���ϱ� �̾Ƶ�', v_cnt||'����');                       
    v_cnt := v_cnt + 1;
  exit when v_cnt > 37;
  end loop;
end;

Commit;

declare 
  v_cnt number(3) := 1;

begin
  loop 
    insert into jsp_member(idx, name, userid, pwd, email,
                           hp1, hp2, hp3, post1, post2,
                           addr1, addr2)
    values(seq_jsp_member.nextval, '����ȭ'||v_cnt, 'eom'||v_cnt, 'qwer1234$', 'eom'||v_cnt||'@naver.com',
           '010','789','6666','369','258','����� ������ õȣ��', v_cnt||'����');                       
    v_cnt := v_cnt + 1;
  exit when v_cnt > 80;
  end loop;
end;

insert into jsp_member(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2)
values(seq_jsp_member.nextval, 'dusk', '�μ���', 'qwer1234$', 'dusk@naver.com', '010', '222', '1234', '150', '010', '����� ���α� �λ絿', '2���� 202ȣ');

insert into jsp_member(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2)
values(seq_jsp_member.nextval, 'sesk', '������', 'qwer1234$', 'sesk@naver.com', '010', '333', '1234', '150', '010', '����� ���α� �λ絿', '3���� 203ȣ');

insert into jsp_member(idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2)
values(seq_jsp_member.nextval, 'nesk', '�׼���', 'qwer1234$', 'nesk@naver.com', '010', '444', '1234', '150', '010', '����� ���α� �λ絿', '4���� 204ȣ');

commit;

update jsp_member set status = 1
where idx in(199,201);

commit;

select rownum as RNO ,idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday
from
(
select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
where status = 1
order by idx desc
)V

select count(*) AS cnt
from jsp_member
where status = 1


+"SELECT COUNT(*) AS cnt FROM jsp_member WHERE status = 1"


select RNO ,idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status
from
(
  select rownum as RNO ,idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status
  from
  (
  select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
         to_char(registerday, 'yyyy-mm-dd') as registerday,
         status
  from jsp_member
  where status = 1
  order by idx desc
  )V
)T
where T.rno between 1 and 10


update jsp_member set status = 1

commit
rollback

select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
order by idx desc

select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
where idx = 200

+"SELECT idx, " 
+"  userid, " 
+"  name, " 
+"  pwd, " 
+"  email, " 
+"  hp1, " 
+"  hp2, " 
+"  hp3, " 
+"  post1, " 
+"  post2, " 
+"  addr1, " 
+"  addr2, " 
+"  TO_CHAR(registerday, 'yyyy-mm-dd') AS registerday, " 
+"  status " 
+"FROM jsp_member " 
+"WHERE idx = 200"

select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
where idx = 'aasdasdas' -- ORA-01722: invalid number ���� �߻�


select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
where userid = ?

select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
       to_char(registerday, 'yyyy-mm-dd') as registerday,
       status
from jsp_member
where name = 'ȫ�浿1';

select count(*)
from jsp_member
where name like '%��%';


+"SELECT idx, " 
+"  userid, " 
+"  name, " 
+"  pwd, " 
+"  email, " 
+"  hp1, " 
+"  hp2, " 
+"  hp3, " 
+"  post1, " 
+"  post2, " 
+"  addr1, " 
+"  addr2, " 
+"  TO_CHAR(registerday, 'yyyy-mm-dd') AS registerday, " 
+"  status " 
+"FROM jsp_member " 
+"WHERE name LIKE '%��%'"

update jsp_member set registerday = sysdate-30
where idx between 1 and 10;

----------------------------------------------------


select *
from jsp_member
order by 1 desc;

select RNO ,idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status
from
(
  select rownum as RNO ,idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2, registerday, status
  from
  (
  select idx, userid, name, pwd, email, hp1, hp2, hp3, post1, post2, addr1, addr2,
         to_char(registerday, 'yyyy-mm-dd') as registerday,
         status
  from jsp_member
  where to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(registerday,'yyyy-mm-dd'), 'yyyy-mm-dd') <= 3
  order by idx desc
  )V
)T
where T.rno between 1 and 10

update jsp_member set registerday = '2018-03-30'
where idx between 6 and 30;

select *
from jsp_member

commit