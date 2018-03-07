------------ having �׷��Լ� ������ -----------------
select department_id, count(*)
from employees
group by department_id
having count(*) >= 10
order by 1;
      
      
select job_id, count(*)      
from employees
group by job_id;

-- �μ���ȣ�� ������ ���� 50000 �̻��� �μ���ȣ, ������ ���� ��Ÿ������.

select department_id AS �μ���ȣ,
       to_char(sum(monthsal), '$9,999,999,999') AS ��������
from(
select department_id,
       nvl(salary + (salary * commission_pct), salary ) AS MONTHSAL
from employees
)V
group by department_id
having sum(monthsal) >= 50000
order by 1;

select department_id AS �μ���ȣ,
       to_char( sum( nvl(salary + (salary * commission_pct), salary ) ), '$9,999,999,999' ) AS ��������
from employees
group by department_id
having sum(nvl(salary + (salary * commission_pct), salary )) >= 50000
order by 1;

-------- *** ������ ���ؼ� �˾ƺ��ô� *** ----------
create table tbl_panmae
(panmaedate date,
 jepumname varchar2(20),
 panmaesu number
);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2) , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+1 , '�����', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+2 , '���ڱ�', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-2)+3 , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1) , '������', 7 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+1 , '�����', 8 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+2 , '���ڱ�', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( add_months(sysdate,-1)+3 , '���ڱ�', 5 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -4 , '��Ϲ���Ĩ', 30 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -3 , '������', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -2 , '������', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate -1 , '��Ϲ���Ĩ', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '�����', 10 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '���ڱ�', 5 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '��Ϲ���Ĩ', 15 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '������', 20 );

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values( sysdate , '���ڱ�', 10 );

commit;

select *
from tbl_panmae;

select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss'),
       panmaesu
from tbl_panmae;

/*
-- �Ʒ��� ���� �������� �ϼ���
-------------------------------
��ǰ��   �Ǹ�����   �Ǹŷ�
�����   18/01/05  	10
�����   18/01/06  	15
�����   18/01/08  	10
�����   18/02/06  	8
�����   18/03/05  	20

-------------------------------
*/
select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm-dd') AS �Ǹ�����,
       sum(panmaesu) AS �Ǹŷ�
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
order by 2;

/*
-- �Ʒ��� ���� �������� �ϼ��� 
-------------------------------
��ǰ��   �Ǹſ�   �Ǹŷ�
�����   18/01  	  35
�����   18/02    	8
�����   18/03   	20
-------------------------------
*/
select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm') AS �Ǹſ�,
       sum(panmaesu) AS �����Ǹŷ�
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm')
order by 2;

----- �������ϱ� -------
select employee_id, hire_date, salary,
       sum(salary) over (order by employee_id )
from employees;


select jepumname AS ��ǰ��,
       pmonth AS �Ǹſ�,
       monthsu AS �����Ǹŷ�,
       sum(monthsu) over(order by pmonth) AS �Ǹŷ�����
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm') AS PMONTH,
       sum(panmaesu) AS MONTHSU
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm')
)V;

/*
-------------------------------
��ǰ��   �Ǹ�����   �Ǹŷ�    �Ǹ����ں�����
�����   18/01/05  	10          10
�����   18/01/06  	15          25
�����   18/01/08  	10          35 
�����   18/02/06  	8           43
�����   18/03/05  	20          63

-------------------------------
*/
select jepumname AS ��ǰ��,
       pdate AS �Ǹ�����,
       psum AS �Ǹŷ�,
       sum(psum) over(order by pdate) AS �Ǹ����ں�����  
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd') AS PDATE,
       sum(panmaesu) AS PSUM
from tbl_panmae
where jepumname = '�����'
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
)V;

/*
-------------------------------
��ǰ��   �Ǹ�����   �Ǹŷ�    �Ǹ����ں�����
���ڱ� 	2018-01-07	20	      20
���ڱ�	  2018-02-07	10	      30
���ڱ�	  2018-02-08	5	        5
���ڱ� 	2018-03-05	15      	20
������	2018-02-05	7       	7
������	2018-03-02	15      	22
������	2018-03-03	10	      32
...
*/

select jepumname AS ��ǰ��,
       pdate AS �Ǹ�����,
       psum AS �Ǹŷ�,
       sum(psum) over(partition by jepumname order by psum) AS �Ǹ����ں�����  
from(
select jepumname,
       to_char(panmaedate, 'yyyy-mm-dd') AS PDATE,
       sum(panmaesu) AS PSUM
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd')
)V;

select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm-dd')  AS �Ǹ�����,
       sum(panmaesu) AS �Ǹŷ�,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS �Ǹ����ں�����  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm-dd');



create or replace view view_panmae -- view_pname�� ������ �����ϰ� ������ ���������ش�. 
as
select jepumname AS jepumname,
       to_char(panmaedate, 'yyyy-mm')  AS PANMAEMONTH,
       sum(panmaesu) AS panmaesu,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS TOTAL  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm');


select *
from view_panmae
where jepumname in ('���ڱ�','�����');



-- ���� ����Ŭ ������ ������ �����(������ HR) ������ ���̺��� ����� ��ȸ���ִ� ������.
select *
from tab;


--- *** Stored View ��ȸ�ϱ� *** ---
select *
from user_views;

select text
from user_views
where view_name= 'VIEW_PANMAE'; -- ��ҹ��� ������

create or replace view view_panmae -- view_pname�� ������ �����ϰ� ������ ���������ش�. 
as
select jepumname AS jepumname,
       to_char(panmaedate, 'yyyy-mm')  AS PANMAEMONTH,
       sum(panmaesu) AS MONTHTOTAL,
       sum(sum(panmaesu)) over(partition by jepumname order by sum(panmaesu)) AS NUGAE  
from tbl_panmae
group by jepumname, to_char(panmaedate, 'yyyy-mm');




---- ==== �м��Լ� ==== ----
-- �� ntile �Լ�
select first_name || ' ' || last_name AS ENAME
    , salary
from employees
where department_id = 50; -- 45�� ��


select first_name || ' ' || last_name AS ENAME
    , salary
from employees
where department_id = 80; -- 34�� ��


select first_name || ' ' || last_name AS ENAME
    , salary
    , ntile(4) over(order by salary desc) AS CLASS -- 45���� 4���� �η��� ������. 
    /*
    trunc(45/4) ==> 11 (������������ 1~4�� �ָ� 1�� ���� ��� ������������ �߰� �����ش�.)
    111111111111  => 1�η��� 12��
    22222222222   => 2�η��� 11��
    33333333333   => 3�η��� 11��
    44444444444   => 3�η��� 11��
    */
from employees
where department_id = 50; -- 45�� ��

 /*
    trunc(34/4) ==> 8 (������������ 1~4�� �ָ� 1�� ���� ��� ������������ �߰� �����ش�.)
    111111111  => 1�η��� 9��
    222222222   => 2�η��� 9��
    33333333   => 3�η��� 8��
    44444444   => 3�η��� 8��
    */

-- �� row_number �Լ�
-- �� rownum

create table tbl_board
(writeno number not null,        -- �۹�ȣ
 userid varchar(20) not null,    -- ����� ID
 title varchar(20) not null,     -- ���ۼ�����
 writeday date default sysdate not null,
 constraint PK_tbb_board_writeno primary key(writeno)
);

--- ������ �����ϱ� ---
create sequence seq_tbl_board
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '�̼����Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hansk', '�Ѽ��� �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hong', 'ȫ�浿 �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '�湫�� �̼���.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hongkd', '���� ȫ�浿');

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITENDAY
from tbl_board;

delete from tbl_board where writeno = 2;
delete from tbl_board where writeno = 4;

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'dusk', '�μ���');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'eom', '����ȭ');

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITENDAY
from tbl_board
order by writeno desc;

select rownum, -- �ǻ��÷�(pseudo colunm)
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

-- �� lag, read �Լ� (�Խ��ǿ��� ��Ϻ���� ������, ������ �ۼ��� ����)

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
������������ �۹�ȣ userid ������ �ۼ����� �������� ����
----------------------------------------------------

select (select title
        from tbl_board
        where writeno = v.bfwriteno) AS �������Ǳ�����,
        v.bfwriteno,
        v.writeno, v.title, v.writeday,
       (select title
        from tbl_board
        where writeno = v.afwriteno) AS �������Ǳ�����,
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