-- 4. ��ȯ�Լ�
  -- 4.1 to_char -- ����, ��¥�� ����Ÿ������ ��ȯ�����ִ� ��.

select to_char(sysdate, 'yyyy') AS "�⵵",
       to_char(sysdate, 'mm') AS "��",
       to_char(sysdate, 'dd') AS "��",
       to_char(sysdate, 'hh') AS "24�ð�",
       to_char(sysdate, 'hh am') AS "12�ð�" ,
       to_char(sysdate, 'hh pm') AS "12�ð�",
       to_char(sysdate, 'mi') AS "��",
       to_char(sysdate, 'ss') AS "��",
       to_char(sysdate, 'q') AS "�б�", -- 1��~3�� : 1, 4��~6�� : 2, 7��~9�� : 3, 10��~12�� : 4
       to_char(sysdate, 'day') AS "���ϸ�",
       to_char(sysdate, 'dy') AS "���ϸ�",
       to_char(sysdate, 'd') AS "���ϸ�"
from dual;

select to_char(sysdate, 'ddd'), -- ���غ��� ���� sysdate���� ���Ϥ�����
       to_char(sysdate, 'dd'), -- ������� ������ ��
       to_char(sysdate, 'dd')
from dual;

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
       ,to_char(sysdate, 'yyyy-mm-dd') -- ����ϸ� �̾ƿ��� 0��0��-��
from dual;

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
       ,to_char(to_date(to_char(sysdate, 'yyyy-mm-dd')), 'yyyy-mm-dd hh24:mi:ss')  -- ����ϸ� �̾ƿ��� 0��0��-��
from dual;

select (sysdate - to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')) * (24*60*60),
       to_char(sysdate,'sssss') -- ���������� ������� �귯�� ��
from dual;

select 123456789
       ,to_char(123456789, '999,999,999')
       ,to_char(123456789, 'L999,999,999') -- ������ ��ȣ
       ,to_char(123456789, '$999,999,999') -- �޷�
from dual;

select employee_id,
       to_char(nvl(salary + (salary * commission_pct), salary)*12, '$9,999,999,999,999') AS YEARSAL,
       nvl(salary + (salary * commission_pct), salary)*12/13 AS YEARSAL1,
       round(nvl(salary + (salary * commission_pct), salary)*12/13, 1) AS YEARSAL2,
       to_char(round(nvl(salary + (salary * commission_pct), salary)*12/13, 1), '99999.0') AS YEARSAL3

from employees;


select round(nvl(salary + (salary * commission_pct), salary)*12/13, 1) AS YEARSAL
from employees;


desc employees;

-- 4.2 to_date -- ���ڸ� ��¥Ÿ������ ��ȯ���ִ� ��.
-- 4.3 to_number -- ���ڸ� ����Ÿ������ ��ȯ���ִ� ��.
select '2', to_number('2'), 2
from dual;

/*
 ================= 5. ��Ÿ�Լ� =================
 -- 5.1 case when then else endf
 -- 5.2 decode
*/

select case 5-2 when 4 then '5-2=4 �Դϴ�' when 1 then '5-2=1 �Դϴ�' when 3 then '5-2=3 �Դϴ�'
       else '���� ������ ����� �̤�' end
from dual;

select decode(5-2, 4, '5-2=4 �Դϴ�',
                   1, '5-2=1 �Դϴ�',
                   3, '5-2=3 �Դϴ�',
                      '���� ������ ����� �̤�') as ��� -- decode�� �ؿ� ������ ���� �������� �����Ҽ� ����.
from dual;

select case  when 4>5 then '4�� 5���� Ů�ϴ�' when 5>7 then '5�� 7���� Ů�ϴ�' when 3>2 then '3�� 2���� Ů�ϴ�'
       else '���� ������ ����� �̤�' end
from dual;


select case (select count(*)
              from tbl_user
              where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
              'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')) when 1 then '�α��� ����' else '�α��� ����' end as "�α��� ���"
from dual;

select decode((select count(*)
                 from tbl_user
                 where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')),1, '�α��� ����'
                 ,'�α��� ����') as ���
from dual;



select case( select count(*)
             from tbl_user
             where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
              'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210'))
       when 1 then '�α��� ����' else(case ( select count(*) 
                                            from tbl_user
                                            where userid = 'batman')
                               when 1 then '�н����尡 Ʋ�Ƚ��ϴ�' else '���̵� �����ϴ�.' end  )
       end as "�α��� ���"
from dual;

select decode((select count(*)
                 from tbl_user
                 where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')),1, '�α��� ����'
                 , decode(( select count(*) 
                            from tbl_user
                            where userid = 'batman'),1, '��й�ȣ�� Ʋ�Ƚ��ϴ�'
                            ,'���̵� �����ϴ�')) as ���
from dual;

select employee_id, first_name || ' ' || last_name, jubun, 
       case(substr(jubun,7,1)) when '1' then '��' when '3' then '��' else '��' end as ����1,
       case when substr(jubun,7,1) in ('1','3') then '��' else '��' end as ����2,
       decode(substr(jubun,7,1),'1','��'
                               ,'3','��'
                               ,'��') as ����3
from employees;

-- 5.3 ��� rank, ���� dense_rank
select department_id AS �μ���ȣ, 
       employee_id AS �����ȣ,
       first_name || ' ' || last_name AS �����,
       salary AS �⺻�޿�,
       rank() over(order by salary desc) AS ��ü�⺻�޿����,
       dense_rank() over(order by salary desc) AS ��ü�⺻�޿�����,
       rank() over(partition by department_id
                    order by salary desc) AS �μ����޿����,
       dense_rank() over(partition by department_id
                         order by salary desc) AS �μ����⺻�޿�����
       
from employees
order by 1;

select *
from(
select department_id AS �μ���ȣ, 
       employee_id AS �����ȣ,
       first_name || ' ' || last_name AS ENAME,
       salary,
       rank() over(order by salary desc) AS RANKING
from employees
-- where rank() over(order by salary desc) <= 10;  ����!!!! where������ ���Ұ�
)v
where ranking <= 10;

-- ���� ���μ��� 1� ���--

select *
from(
select department_id AS �μ���ȣ, 
       employee_id AS �����ȣ,
       first_name || ' ' || last_name AS ENAME,
       salary,
       rank() over(order by salary desc) AS RANKING,
       rank() over(partition by department_id
                    order by salary desc) AS DEPTRANKING
from employees
-- where rank() over(order by salary desc) <= 10;  ����!!!! where������ ���Ұ�
)v
where deptranking = 1;

-- 5.4 -- greatest, lesast : �����ȼ� �߿�  ū��, ������

select greatest(10, 90, 100, 80), least(10, 90, 100, 80)
from dual;

select greatest('������', '������', '����', '��ν�'),
       least('������', '������', '����', '��ν�')
from dual;