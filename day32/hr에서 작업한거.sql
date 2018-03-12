---- **** Multi Table JOIN(���� ���̺� ����) *** ----
--> 3�� �̻��� ���̺��� ������ ���� �����ִ� ���̴�.
--------------------------------------------------------------------------
�μ���ȣ     �μ���       �μ��ּ�      �����ȣ       �����      �⺻�޿�
---------------------------------------------------------------------------
departments  dep        locations     emp           emp         emp
employees

  ���̺��              ���������÷���
----------------------------------------------
departments D           location_id   department_id
locations   L           location_id
employees   E                         department_id


select E.department_id,
       D.department_name,
       L.city || ' ' || L.street_address AS DEPTADDRESS,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       E.salary
from departments D join locations L 
on D.location_id = L.location_id
right join employees E
on D.department_id = E.department_id

--------------------------------------------------------------------------
�μ���ȣ     �μ���       ������       �μ��ּ�     �����ȣ       �����      �⺻�޿�
---------------------------------------------------------------------------
departemnt  dep         countries

  ���̺��              ���������÷���
-------------------------------------------------------------------
departments D           location_id   department_id     country_id 
locations   L           location_id
countries   C                                           country_id 
employees   E                         department_id
       

select E.department_id,
       D.department_name,
       C.country_name,
       L.city || ' ' || L.street_address AS DEPTADDRESS,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       E.salary
from departments D join locations L 
on D.location_id = L.location_id
join countries C
on L.country_id = C.country_id
right join employees E
on D.department_id = E.department_id 

select *
from countries

---------------1992 code ���-----------------------

select E.department_id,
       D.department_name,
       C.country_name,
       L.city || ' ' || L.street_address AS DEPTADDRESS,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       E.salary
from countries C, locations L, departments D , employees E
where C.country_id(+) = L.country_id and
      L.location_id = D.location_id and
      D.department_id = E.department_id
      
--------- **** NON-EQUI JOIN **** ------------
--> � �ķ��� ���� Ư�� ������ ���� �� ����ϴ� JOIN

-- �ҵ漼�� ��ǥ ���� ���̺� �����Ѵ�.
create table tbl_taxindex
(lowerincome  number, -- ������ ����
 highincome  number,  -- ������ �ִ�
 taxpercent number(2,2)  -- ���� -0.99 ~ 0.99
); 

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (1, 99999, 0.02);

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (100000, 149999, 0.05);

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (150000, 199999, 0.08);

insert into tbl_taxindex(lowerincome, highincome, taxpercent)
values (200000, 10000000000000, 0.10);

commit;

select employee_id ,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL     
from employees; -- A

select *
from tbl_taxindex;

------------------------------------------------------
create table tbl_imsi
( no   number,
  name  varchar2(20),
  addr  varchar2(100)
);

insert into tbl_imsi(no, name, addr) values (1,'������','����');
insert into tbl_imsi(no, name, addr) values (1,'������','����');
insert into tbl_imsi(no, name, addr) values (1,'������','����');
insert into tbl_imsi(no, name, addr) values (2,'�̹���','���');

select rowid, no, name, addr
from tbl_imsi;

delete from tbl_imsi
where no = 1 and rowid !=  'AAAE9hAAEAAAAHbAAA'; 
---------------------------------------------

select rowid, lowerincome, highincome, taxpercent
from tbl_taxindex;

update tbl_taxindex set lowerincome = 1 , highincome = 109999 ,
                        taxpercent = 0.025
where rowid = 'AAAE9gAAEAAAAHTAAA';


update tbl_taxindex set lowerincome = 110000 , highincome = 169999 ,
                        taxpercent = 0.053
where rowid = 'AAAE9gAAEAAAAHTAAB';


update tbl_taxindex set lowerincome = 170000 , highincome = 230000 ,
                        taxpercent = 0.09
where rowid = 'AAAE9gAAEAAAAHTAAC' ;

update tbl_taxindex set lowerincome = 230001 , highincome = 10000000000000 ,
                        taxpercent = 0.15
where rowid = 'AAAE9gAAEAAAAHTAAD';

commit




--- 1992 code ---

select A.*, B.taxpercent,
       to_char(A.yearsal * B.taxpercent, '$999,999,999,999,999') AS �ҵ漼
from (select employee_id ,
             first_name || ' ' || last_name AS ENAME,
             nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL     
      from employees) A, tbl_taxindex B
where A.yearsal between B.lowerincome and B.highincome

--- 1998 code ---

select employee_id, ename, yearsal, 
       case when 1 <= yearsal and yearsal <= 99999 then 0.02 * yearsal
            when 100000 <= yearsal and yearsal <= 149999 then 0.05 * yearsal
            when 150000 <= yearsal and yearsal <= 199999 then 0.08 * yearsal
            else 0.1 * yearsal end AS �ҵ漼
from
(select employee_id ,
        first_name || ' ' || last_name AS ENAME,
        nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL     
 from employees
)V --- ���� ���ҽ� �ڵ���ü�� ����

----------------- *** �ڱ�����(self join) *** -------------------------
 
create table tbl_authorbook
(bookname   varchar2(100),
 authorname  varchar2(20),
 loyalty    number(5)
);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('���ΰ��ٴ�', '������', 1000);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('����������', '�����', 800);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('����������', '������', 500);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('�����������', '������', 2500);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('�ظ�����', '�ӱ���', 1200);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('�ظ�����', '������', 1400);

insert into tbl_authorbook(bookname, authorname, loyalty)
values('���̾���ȭ���Ǳ���', '������', 1700);

commit;

select *
from tbl_authorbook;

------ tbl_authorbook ���� ������ ������ ���������� �����ϼ���.

-- ��������

select bookname, count(*)
from tbl_authorbook
group by bookname

select *
from tbl_authorbook
where bookname in ( select bookname
                    from tbl_authorbook
                    group by bookname
                    having count(*) > 1
                    )
                    
                    
select A1.*
from tbl_authorbook A1, tbl_authorbook A2 -- self join
where A1.bookname = A2.bookname and
      A1.authorname != A2.authorname
      
-- ��������      
---------------------------------------------------------------------
�μ���ȣ  �����ȣ  �����  �Ի�����  ���ӻ�������ȣ   ���ӻ����
 60       105      
----------------------------------------------------------------------
select *
from employees

-- 1992 code
select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 ,employees E2
where E1.manager_id = E2.employee_id(+)
order by 1,2


select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 ,employees E2
where E1.manager_id = E2.employee_id(+)
and E1.department_id in (20,50,60)
order by 1,2

-- 1998 code

select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 left join employees E2
on E1.manager_id = E2.employee_id
order by 1,2

select E1.department_id, E1.employee_id, E1.first_name || ' ' || E1.last_name AS ENAME,
       E1.manager_id AS ���ӻ�������ȣ,
       E2.first_name || ' ' || E2.last_name AS ���ӻ��
from employees E1 left join employees E2
on E1.manager_id = E2.employee_id
where E1.department_id in (20,50,60)
order by 1,2

-----------!!!!!!! ���� ------------------(107���� ���;���!!)
-------------------------------------------------------------------------------------------
�μ���ȣ  �μ��� �μ��ּ�  �μ����  �����ȣ  ����� ����  �ҵ漼��  �μ������������  �μ����������        
-------------------------------------------------------------------------------------------
select *
from tbl_taxindex;

select *
from employees
order by department_id;

select *
from departments;

select *
from locations;

select department_id,
       trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSALAGE
from employees
group by department_id;

------------------------------------------------------------------------

select D.department_id AS �μ���ȣ, D.department_name AS �μ���,
       L.street_address AS �μ��ּ�,
       E1.first_name || ' ' || E1.last_name AS �μ����,
       E2.employee_id AS �����ȣ,
       E2.first_name || ' ' || E2.last_name AS �����,
       nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12 AS ����,
       ( nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12 ) - V.yearsalage AS �μ������������,
       dense_rank() over(partition by E2.department_id
                         order by nvl(E2.salary + (E2.salary * E2.commission_pct),E2.salary) desc) AS �μ����⺻�޿�����,
       to_char( (nvl(E2.salary + (E2.salary * E2.commission_pct), E2.salary) * 12) * T.taxpercent, '$999,999,999,999,999') AS �ҵ漼
       
from employees E1 join departments D
on E1.employee_id = D.manager_id
right join employees E2
on D.department_id = E2.department_id
left join locations L
on L.location_id = D.location_id
join (select department_id,
             trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) *12 AS YEARSALAGE
      from employees
      group by department_id)V
on nvl(V.department_id, -9999) = nvl(D.department_id, -9999)
join tbl_taxindex T
on E2.salary between T.lowerincome and T.highincome

-------------- *** UNION / UNION ALL / INTERSECT / MINUS *** ----------------

1. UNION �� ���̺�(��)�� ���̺�(��)�� ���ļ� �����ִµ�
   �̰��� ��� ���� ��ģ ����� �����ִ� ���̴�.
   
   A = { a, x, b, e, g}
   B = { c, d, a, b, y, k, m}
   
   A �� B = {}  ==> UNION  {a,b,c,d,e,g,k,m,x,y} �ߺ�X ���� O.
                    UNION ALL  {a,x,b,e,g,c,d,a,b,y,j,m} �ߺ�O ����X
   A �� B = {} ==> INTERSECT {a,b}
   A - B = {} ==> MINUS {x,e,g}
   B - A = {} ==> MINUS {c,d,y,k,m}
   
   
select *
from tbl_panmae;

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '�����', 15);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '���ڱ�', 10);

insert into tbl_panmae(panmaedate, jepumname, panmaesu)
values(sysdate, '�����', 5);
commit;

select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) = to_char(sysdate , 'yyyy-mm' );

create table tbl_2018_02
as
select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) = to_char(add_months(sysdate,-1) , 'yyyy-mm' );

create table tbl_2018_01
as
select *
from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) = to_char(add_months(sysdate,-2) , 'yyyy-mm' );

select *
from tbl_2018_01

select *
from tbl_2018_02

delete from tbl_panmae
where to_char(panmaedate, 'yyyy-mm' ) != to_char(sysdate , 'yyyy-mm' );

select *
from tbl_panmae

-- ���̺�� �����ϱ�
rename tbl_2018_01 to tbl_panmae_2018_01;
rename tbl_2018_02 to tbl_panmae_2018_02;


--------------------------------
  ��ǰ��    �Ǹſ�     ���Ǹŷ�
--------------------------------
           2018-01
           2018-02
           2018-03

select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm') AS �Ǹſ�,
       sum(panmaesu) AS ���Ǹŷ�
from
(
select *
from tbl_panmae_2018_01
union
select *
from tbl_panmae_2018_02
union
select *
from tbl_panmae
)V
group by rollup( jepumname,to_char(panmaedate, 'yyyy-mm') )

select jepumname AS ��ǰ��,
       to_char(panmaedate, 'yyyy-mm') AS �Ǹſ�,
       sum(panmaesu) AS ���Ǹŷ�
from
(
select *
from tbl_panmae_2018_02
union all
select *
from tbl_panmae_2018_01
union all
select *
from tbl_panmae
)V
group by rollup( jepumname,to_char(panmaedate, 'yyyy-mm') );


select *
from tbl_panmae_2018_02
union
select *
from tbl_panmae_2018_01
union
select *
from tbl_panmae;

insert into tbl_panmae
select *
from tbl_panmae_2018_01
where jepumname = '�����';

select *
from tbl_panmae
intersect
select *
from tbl_panmae_2018_01;

select *
from tbl_panmae
minus
select *
from tbl_panmae_2018_01;

select *
from tbl_panmae_2018_01
minus
select *
from tbl_panmae;


select *
from tbl_panmae_2018_01
union
select panmaedate AS �Ǹ�����,  -- ���Ұ� AS�� �׻� ������
       jepumname AS ��ǰ��,
       panmaesu AS �Ǹŷ�
from tbl_panmae_2018_02
union
select *
from tbl_panmae;

select panmaedate AS �Ǹ�����, 
       jepumname AS ��ǰ��,
       panmaesu AS �Ǹŷ�
from tbl_panmae_2018_01
union
select *
from tbl_panmae_2018_02
union
select *
from tbl_panmae;

select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss' ) AS �Ǹ�����, 
       jepumname AS ��ǰ��,
       panmaesu AS �Ǹŷ�
from tbl_panmae_2018_01
union
select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss'),
       jepumname ,
       panmaesu
from tbl_panmae_2018_02
union
select to_char(panmaedate, 'yyyy-mm-dd hh24:mi:ss'),
       jepumname,
       panmaesu
from tbl_panmae;