------------- ======   *** DICTIONARY ��ȸ�ϱ� *** ======== ----------------------
select *
from dictionary;

USER_CONS_COLUMS -- ���� ����Ŭ ������ ������(HR) ���� ���� user 
ALL_CONS_COLUMNS -- �ٸ� ����ڰ� ���� �ͱ��� ���δ�.

select *
from dictionary
where table_name like 'USER_%' and  -- ���̺� �̸��߿� USER �ν����ϴ� �͵� �߿� comments���뿡 table�� ������ �� ���
      lower(comments) like '%table%';
      
select *
from USER_TABLES;      

select *
from dictionary
where table_name like 'USER_%' and 
      lower(comments) like '%database link%';
      
select *
from USER_DB_LINKS
      

---------- **** �����ͺ��̽� ��ũ �����ϱ� **** -------------
/* tnsnames.ora �� �߰�

ORATEACHER =                   -- net server name
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.50.42)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE) --������ �̸� select *from global_name; �� �˼��ִ�. 
    )
  )
*/

create database link teacherlink
connect to hr identified by eclass
using 'ORATEACHER';

select *
from employees;

select *
from employees@teacherlink;

update employees ME set first_name = (select first_name 
                                           from employees@teacherlink
                                           where employee_id = ME.employee_id); 
commit;

select *
from global_name;

--- *** �����ͺ��̽� ��ũ �����ϱ� *** ----

drop database link teacherlink;




------------------------------------------------------------------------------
             ---------- *** JOIN(����)  *** -----------
------------------------------------------------------------------------------

JOIN(����)�� ���̺�(��)�� ���̺�(��)�� ��ġ�� ���� ���ϴµ�
��(ROW)�� ��ġ�� �;� �ƴ϶�, �ó�(COLUMN)�� �÷�(COLUMN)�� ��ġ�� ���� ���Ѵ�.
�׸���, ���� �ٸ� ���̺�(��)�� ��(ROW)�� ��(ROW)�� ��ġ�� ���� UNION �����ڸ� ����ϴ� ���̴�.

A = {1,2,3} ���� 3��
B = {a,b}   ���� 2��

A �� B = { {1,a}, {1,b},
           {2,a}, {2,b},
           {3,a}, {3,b} } 
��ī��Ʈ�� => ������ �� : 3*2 = 6(��� ����� ��)
--> ��ī��Ʈ���� �����ͺ��̽������� Catersian Product ��� �θ���

INNER JOIN(= ��������)

OUTER JOIN(= �ܺ�����)

UNION
UNION ALL
INTERSECT
MINUS


select count(*)
from employees; -- 107

select *
from departments

select count(*)
from departments; -- 27

select *
from employees, departments

--> JOIN : SQL 1992 code ���(�����ͺ��̽� ������� ������ �ٸ�)��
--         SQL 1999 code ���(ANSI SQL ǥ��ȭ)

-- 1. SQL 1992 CODE ��� => ���̺�(��)�� ���̺�(��)���̿� �޸�(,)�� ����ش� ��
-- 2. SQL 1999 CODE ��� => ���̺�(��)�� ���̺�(��)���̿� ���ν� JOIN �̶�� �ܾ �־��ִ� ��.

-- 1.  SQL 1992 CODE ���
select *
from employees, departments  -- ��� ����� ��(Catersian Product) 2889

select *
from employees E, departments D
where E.department_id = D.department_id -- join ������
-- EQUI JOIN �̶� �θ���.

select *
from employees E, departments D
where E.department_id = D.department_id(+) -- left outer join �� ����

select *
from employees E, departments D
where E.department_id(+) = D.department_id -- right outer join �� ����

select *
from employees E, departments D
where E.department_id(+) = D.department_id(+) -- ����. ���Ұ�

-- 2. SQL 1999 CODE ���
select *
from employees cross join departments  -- ��� ����� ��(Catersian Product) 2889

-- inner join --
select *
from employees E inner join departments D 
on E.department_id = D.department_id; -- join ������

select *
from employees E join departments D -- inner join���� inner�� ��������
on E.department_id = D.department_id; -- join ������


-- outer join --
select *
from employees E left outer join departments D
on E.department_id = D.department_id;

select *
from employees E left join departments D -- outer join���� outer�� ��������
on E.department_id = D.department_id; 

select *
from employees E right outer join departments D
on E.department_id = D.department_id;

select *
from employees E right join departments D -- outer join���� outer�� ��������
on E.department_id = D.department_id; 

select *
from employees E full outer join departments D
on E.department_id = D.department_id; 


/*
 ���� 
-----------------------------------------------------------
 �μ���ȣ   �����ȣ   ����   ��ü��տ���    �������
-----------------------------------------------------------
*/
select department_id, employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
from employees

select trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
from employees

select department_id, employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) AS MONTHSAL,
       nvl(salary + (salary * commission_pct), salary) - V.avgmonthsal AS �������
from  employees cross join
      (select trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
       from employees) V
order by 5 desc;

/*
 ����
-----------------------------------------------------------
 �μ���ȣ        �μ���     �����ȣ     �����       ����
-----------------------------------------------------------
 departments departments  employees  employees  employees
 employees
*/

select D.department_id,
       D.department_name,
       E.employee_id,
       E.first_name || ' ' || E.last_name AS ENAME,
       nvl(E.salary + (E.salary * E.commission_pct), E.salary) AS MONTHSAL
from departments D right join employees E
on D.department_id = E.department_id

/*
 ���� 
------------------------------------------------------------------------
 �μ���ȣ      �μ���      �μ���տ���   �����ȣ   �����    ����  �μ��������
------------------------------------------------------------------------
*/

select V.department_id,  D.department_name, V.monthsal,
       E.employee_id, E.first_name || ' ' || E.last_name AS ENAME,
       nvl(E.salary + (E.salary * E.commission_pct), E.salary) - v.monthsal
      
from  (select department_id, trunc( avg(nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSAL
        from employees
        group by department_id
       )V     
left join departments D
on V.department_id = D.department_id 
join employees E
on nvl(D.department_id, -9999) = nvl(E.department_id, -9999) 
order by 1

------- ���� �������  SQL 1992 CODE ������� ��ȯ�ϼ��� -------------

select V.department_id,  D.department_name, V.monthsal,
       E.employee_id, E.first_name || ' ' || E.last_name AS ENAME,
       nvl(E.salary + (E.salary * E.commission_pct), E.salary) - v.monthsal
from (select department_id, trunc( avg(nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSAL
        from employees
        group by department_id
       )V , departments D, employees E
where V.department_id =  D.department_id(+) and
      nvl(D.department_id,-9999) = nvl(E.department_id,-9999) 
order by 1

-----

select department_id, trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS MONTHSAL
from employees
group by department_id -- V

select V.department_id, D.department_name, V.AVGMONTHSAL
from departments D right join (select department_id,
                                      trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
                               from employees
                               group by department_id)V
on D.department_id = V.department_id -- A


select department_id,
       employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
from employees --B

select A.department_id ,A.department_name,
       B.employee_id, B.ename, A.avgmonthsal,  B.monthsal,
       B.monthsal - A.avgmonthsal  AS �μ��������
from ( select V.department_id, D.department_name, V.AVGMONTHSAL
       from departments D right join (select department_id,
                                      trunc( avg( nvl(salary + (salary * commission_pct), salary) ) ) AS AVGMONTHSAL
                                      from employees
                                        group by department_id)V
       on D.department_id = V.department_id ) A 
       join (select department_id,
                    employee_id,
                    first_name || ' ' || last_name AS ENAME,
                    nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
              from employees) B
      on nvl(A.department_id, -9999) = nvl(B.department_id,-9999)       
order by 1, 5 desc       