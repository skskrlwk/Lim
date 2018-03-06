---- *** �׷��Լ�(�����Լ�) *** ----
 -- �߿�!! �׷��Լ������� null�� ������ �����ϰ� ������ �Ѵ�.
 
1. sum -- �հ�
2. avg -- ���
3. max -- �ִ밪
4. min -- �ּҰ�
5. count -- select �Ǿ ���� ������� ���� ����
6. variance -- �л�
7. stddev -- ǥ������

select count(salary)
from employees;

select count(commission_pct) 
from employees; -- null�� �ڵ����� ����

select sum(salary)
from employees;

select sum(salary * commission_pct)
from employees; -- null�� �ڵ����� ����

select sum(salary) / count(salary) , avg(salary)
from employees;

select sum(salary * commission_pct) / count(*)
from employees; -- null�� �ڵ����� ����

select sum(nvl(salary * commission_pct, 0)) / count(nvl(salary * commission_pct, 0)),
       avg(nvl(salary * commission_pct, 0))
from employees;

/*
employees ���̺��� �μ���ȣ�� �ο����� ��Ÿ������
-----------------------
�μ���ȣ       �ο���
-----------------------
  10
  20
  30
  40
  50
*/

select department_id AS �μ���ȣ, count(*) AS �ο���
from employees
group by department_id
order by 1;

/* ����
----------------------
����      �ο���
---------------------
��
��
*/

select gender AS ����, count(*) AS �ο���
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by gender;


select case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS ����,
       count(*) AS �ο���
from employees
group by case when substr(jubun,7,1) in ('1','3') then '��' else '��' end;

/*
------------------------------------------------
    ���ɴ�             �ο���
      0
      10
      20
      30
      40
      50
      60
*/

select age AS ���ɴ�, count(*) AS �ο��� 
from(
select jubun, trunc(to_number(to_char(sysdate, 'yyyy')) - to_number(case when substr(jubun,7,1) in ('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1, -1) AS AGE
from employees
)V
group by AGE
order by 1;


select age AS ���ɴ�, count(*) AS �ο��� 
from(
select jubun, trunc(to_number(to_char(sysdate, 'yyyy')) - to_number(case when substr(jubun,7,1) in ('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1, -1) AS AGE
from employees
)V
group by AGE
order by 1;

select age AS ���ɴ�, count(*) AS �ο���
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by age
order by 1;

---------------rollup-------------------

select department_id AS �μ���ȣ,
       count(*) AS �ο���
from employees
group by rollup(department_id);


select gender AS ����, count(*) AS �ο���
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by rollup(gender);


select age AS ���ɴ�, count(*) AS �ο���
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);


select department_id,
       grouping(department_id)  -- group by ���� rollup�� ������ ���� ��밡�� 0�̸� �׷�ȭ�� �͵�, 1�̸� �׷�ȭ �ƴ� ��ü
       ,count(*)
from employees
group by rollup(department_id);

select case grouping(department_id) when 0 then nvl(to_char(department_id),'����') else '��ü' end  AS �μ���ȣ
       ,count(*) AS �ο���
from employees
group by rollup(department_id);


select case grouping(gender) when 0 then gender else '��ü' end AS ����,
       count(*) AS �ο���       
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by rollup(gender);


select case grouping(age) when 0 then to_char(age) else '��ü' end AS ���ɴ�,
       count(*) AS �ο���
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);

------------ ������� ��Ÿ������--------------

select case grouping(department_id) when 0 then nvl(to_char(department_id),'����') else '��ü' end  AS �μ���ȣ
       ,count(*) AS �ο���,
       round(count(*)/(select count(*) from employees) *100 ,1)   || '%'  AS "�ۼ�Ƽ��(%)"
from employees
group by rollup(department_id);


select case grouping(gender) when 0 then gender else '��ü' end AS ����,
       count(*) AS �ο���,
       round((count(*) / (select count(*) from employees)) *100, 1) AS "�ۼ�Ƽ��(%)"
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end AS GENDER 
from employees
)V
group by rollup(gender);



select case grouping(age) when 0 then to_char(age) else '��ü' end AS ���ɴ�,
       count(*) AS �ο���,
       round((count(*) / (select count(*) from employees))*100, 1) AS "�ۼ�Ƽ��(%)"
       
from(
select  trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in ('3','4') then 2000 else 1900 end)+1 , -1) 
            AS AGE
from employees
)v
group by rollup(age);

/*
--------------------------------------------
  �μ���ȣ        ����          �ο���
----------------------------------------------
   10            ��
   10            ��
   20
   20
   30
  
*/

select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
group by rollup(department_id, gender)
order by 1,2;

-- cube --
select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
group by cube(department_id, gender)
order by 1,2;


---> *** ��ప(rollup, cube, grouping sets) *** <---

-- 1. rollup(a,b,c) == grouping sets( (a,b,c),(a,b),(a),() )        �ڿ��� �ϳ��� ��������.
      rollup(department_id, gender) == grouping sets((department_id, gender), (department_id), () )
-- 2. cube(a,b,c) == grouping sets( (a,b,c), (a,b), (b,c), (a,c), (a) ,(b), (c), () )  
      cube(department_id, gender) == grouping sets((department_id, gender), (department_id), (gender), () )



select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
-- group by rollup(department_id, gender)
   group by grouping sets( (department_id, gender), (department_id), () )
order by 1,2;


select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
-- group by cube(department_id, gender)
   group by grouping sets((department_id, gender), (department_id), (gender), () )
order by 1,2;


select nvl(case grouping(department_id)
              when 0 then to_char(department_id)
              else '�μ�����' end, '����') AS �μ���ȣ ,
       
       case grouping(gender)
            when 0 then gender
            else '��������' end AS ���� ,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' as �ۼ�Ʈ  
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER
      
from employees
)v
group by grouping sets( (department_id, gender), (gender) ) -- ���ϴ� ���� ��ȸ����
order by 1,2;


-- ����.
---------------------------------------------------------
    ���ɴ�     ����     �ο���     �ۼ�Ƽ��
---------------------------------------------------------

select nvl(to_char(age), '��ü���ɴ�') AS ���ɴ�,
       nvl(gender, '��ü����') AS ����,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' AS �ۼ�Ƽ��
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER,
       trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end),  -1) AS AGE
      
from employees
)v
group by grouping sets( (age,gender), (age), ())
order by 1;

select case grouping(age) when 0 then to_char(age) else '��ü���ɴ�' end  AS ���ɴ�,
       case grouping(gender) when 0 then gender else '��ü����' end  AS ����,
       count(*) AS �ο���,
       round(count(*) / (select count(*) from employees) *100, 1) || '%' AS �ۼ�Ƽ��
from(
select department_id,
       case when substr(jubun,7,1) in (1,3) then '��' else '��' end  AS GENDER,
       trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end),  -1) AS AGE
      
from employees
)v
group by grouping sets( (age,gender), (age), ())
order by 1;
/* ����
----------------------------------------
    �μ���ȣ          �������հ�
-----------------------------------------
    10
    20
    30
    ��ü
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '����' end , '����') AS �μ���ȣ,
        to_char( sum(monthsal), '$999,999,999,999') AS �������հ�
from(
select department_id,
       nvl(salary +(commission_pct*salary), salary) AS MONTHSAL
from employees
)v
group by rollup(department_id)
order by 1;


select nvl(case grouping(department_id) when 0 then to_char(department_id) else '����' end , '����') AS �μ���ȣ,
        to_char( sum(nvl(salary +(commission_pct*salary), salary)), '$999,999,999,999' ) AS �������հ�
from employees
group by rollup(department_id)
order by 1;


/* ����
----------------------------------------
    �μ���ȣ         ��տ���     �ۼ�Ƽ��
-----------------------------------------
    10
    20
    30
    ��ü
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '����' end , '����') AS �μ���ȣ,
      to_char( sum(monthsal) / count(monthsal), '$999,999,999,999') AS ��տ���,
      round( (sum(monthsal) / count(monthsal) )  / ( select sum( nvl(salary +(commission_pct*salary), salary) )  from employees ) *100, 1 ) AS �ۼ�Ƽ��
from(
select department_id,
      nvl(salary +(commission_pct*salary), salary) AS MONTHSAL
from employees
)
group by grouping sets(department_id,())
order by 1;

/*
---------------------------------------------
 ��ü�����      10��̸�   10��   20��   30��
---------------------------------------------
*/

select count(*) AS ��ü�����,
       sum(case age when 0 then 1 else null end) AS "10�� �̸�",
       sum(case age when 10 then 1 else null end) AS "10��",
       sum(case age when 20 then 1 else null end) AS "20��",
       sum(case age when 30 then 1 else null end) AS "30��",
       sum(case age when 40 then 1 else null end) AS "40��",
       sum(case age when 50 then 1 else null end) AS "50��",
       sum(case age when 60 then 1 else null end) AS "60��"
from(
select trunc(extract(year from sysdate) - (to_number(substr(jubun,1,2)) + case when substr(jubun,7,1) in (3,4) then 2000 else 1900 end) +1, -1)  AS AGE
from employees
)v;

/* ����
------------------------------------------
  �μ���ȣ    ����     ����     ���ο���
------------------------------------------
*/
select nvl(case grouping(department_id) when 0 then to_char(department_id) else '��ü�ѿ�' end, '����') AS �μ���ȣ ,
       sum(case gender when '����' then 1 else 0 end) AS ����,
       sum(case gender when '����' then 1 else 0 end) AS ����,
       nvl(to_char(sum(case gender when '����' then 1 else null end)), 'X') AS ����,
       count(*) AS ���ο���
from(
select department_id,
       case when substr(jubun,7,1) in ('1','3') then '����' else '����' end AS GENDER
from employees
)v
group by rollup(department_id);