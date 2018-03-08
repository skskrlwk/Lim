---- SQL (Structured Query Language) -- ����ȭ�� ���Ǿ� ------
----------------  *** ������ ����(Query) *** --------------------------
-- �� start with connect by prior �� -- (�Խ��ǿ��� �亯�� �Խ��ǿ��� ���� ����)

select level 
       employee_id,
       first_name || ' '  || last_name AS ENAME,
       job_id,
       manager_id
from employees
start with employee_id = 106
-- connect by prior employee_id = manager_id
connect by prior manager_id = employee_id;
-- connect by prior ������ ������ manager_id �÷��� ����
-- start whit employee_id �� ���ε� ���� �÷����̴�.
-- �� �����ȣ 106 ���� manager_id �÷��� ���̴�.
-- connect by prior 103 = employee_id �̴�.
-- 106 -- 103 103 -- 102  102 -- 100


select level 
       employee_id,
       first_name || ' '  || last_name AS ENAME,
       job_id,
       manager_id
from employees
start with employee_id = 100
connect by prior  employee_id = manager_id
order by level, employee_id ;


select level 
       employee_id,
       lpad(' ', (level-1)*3, ' ' ) ||  first_name || ' '  || last_name AS ENAME,
       job_id,
       manager_id
from employees
start with employee_id = 100
connect by prior  employee_id = manager_id
order by level, employee_id ;



--------------- *** Sub Query(��������) *** ----------------------

-- Sub Query(��������)��?
select �� �ӿ� �� �ٸ� select ���� ���ԵǾ��� ������
���ԵǾ��� select ���� Sub Query(��������)��� �θ���.

select ....
from ....                --> Main Query == �ܺ�����
where .... in (select ...
               from ...) --> Sub Query == ��������

-- employees ���̺��� �⺻�޿��� ���ϸ��� �����  �������� ����� ������
-- �����ȣ, �����, �⺻�޿��� ��Ÿ������

select employee_id AS �����ȣ,
       first_name || ' ' || last_name AS �����,
       salary AS �⺻�޿�
from employees
where salary = (select max(salary) from employees)
      or salary = (select min(salary) from employees);

�ְ�޿� ==> select max(salary) from employees
�����޿� ==> select min(salary) from employees
/*
    employees ���̺��� �μ���ȣ�� 60��, 80�� �μ��� �ٹ��ϴ� ������߿�
    ������ 50�� �μ� �������� '��տ���' ���� ���� ����鸸 �μ���ȣ, �����ȣ
    �����,������ ��Ÿ������
*/

select department_id AS �μ���ȣ,
       employee_id AS �����ȣ,
       ename AS �̸�,
       monthsal AS ���� 
from
(
select department_id,
       employee_id,
       first_name || ' ' || last_name AS ENAME,
       nvl(salary + (salary*commission_pct), salary) AS MONTHSAL
from employees
where department_id = 60 or department_id = 80
)V
where monthsal > (select avg(nvl(salary + (salary*commission_pct), salary)) from employees where department_id = 50)

select department_id 
       employee_id,
       first_name || ' ' || last_name,
       nvl(salary + (salary*commission_pct), salary)
from employees
where (department_id = 60 or department_id = 80)
       and nvl(salary + (salary*commission_pct), salary) > (select avg(nvl(salary + (salary*commission_pct), salary)) from employees where department_id = 50)
       
-------- *** ANY, ALL *** ----------
 Sub Query������ ���Ǿ����� ANY �� OR �� ����ϰ�
 ALL �� AND �� ����ϴ�.
 
-- employees ���̺��� salary �� �μ���ȣ 30���� salary ������ ����鸸 �����ϼ���
              
select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary in (select salary
                from employees
                where department_id = 30)

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary = (select salary
                from employees
                where department_id = 30) -- single-row subquery returns more than one row �����߻�

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary = any(select salary
                from employees
                where department_id = 30)


-- �⺻�޿�(salary)�� ���ϲ����� ������ ��� ����鸸
-- �����ȣ, �⺻�޿��� ��Ÿ������

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary > (select min(salary) from employees)
order by 3;

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary > any(select salary from employees)
order by 3;

-- �⺻�޿��� �ְ��λ��

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary = (select max(salary) from employees);

select employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where salary >= all(select salary from employees);

---- �ְ�����λ��
select employee_id,
       first_name || ' ' || last_name,
       salary * commission_pct AS COMM
from employees
where salary * commission_pct = (select max(salary * commission_pct) from employees);

select employee_id,
       first_name || ' ' || last_name,
       salary * commission_pct AS COMM
from employees
where nvl(salary * commission_pct, 0) >= all( (select salary * commission_pct
                                               from employees
                                               where commission_pct is not null);
                                               



2100    3000
3000    2375
2375
2250
1600
1500
1050
3500
3325
3150
2400
2250                         
620


------ *** Pairwise SubQuery *** -----

/*
  employees ���̺���
  �μ���ȣ���� salary �� �ִ��� ����� �ּ��� ����� ������ 
  �μ���ȣ, �����ȣ, �����, �⺻�޿��� ��Ÿ������.
*/
select department_id, max(salary)
from employees
group by department_id;

select department_id, min(salary)
from employees
group by department_id;


select department_id, employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where (nvl(department_id, 0), salary) in (select department_id , min(salary)
                                          from employees
                                          group by department_id)
      or
      (nvl(department_id,0), salary) in (select department_id, max(salary)
                                         from employees
                                         group by department_id)
order by 1, 4; -- null���� �ȳ���

select department_id, employee_id,
       first_name || ' ' || last_name,
       salary
from employees
where (nvl(department_id, -9999), salary) in (select nvl(department_id,-9999) , min(salary)
                                          from employees
                                          group by department_id)
      or
      (nvl(department_id,-9999), salary) in (select nvl(department_id,-9999), max(salary)
                                         from employees
                                         group by department_id)
order by 1, 4;

/*
-------- *** ���Sub Query(== ����������) ***----------
 ��� Sub Query �̶� ���� Main Query(== �ܺ�����) ���� ����
 ���̺�(��)�� �����ϴ� �÷��� Sub Query�� ������(where��, having��)��
 ���Ǿ������� ���Ѵ�.
*/

select department_id, employee_id,
       rank() over(order by salary desc) AS RANKING
from employees;

select department_id, employee_id,
       (select count(*)+1
        from employees
        where salary > E.salary ) AS RANKING
from employees E
order by E.salary desc;


select department_id, employee_id,
       rank() over(order by salary desc) AS TOTALRNAKING,
       rank() over(partition by department_id
                   order by salary desc) AS DEPTRANKING
from employees;

select department_id, employee_id,
       (select count(*)+1
        from employees
        where salary > E.salary ) AS TOTALRNAKING,
        (select count(*)+1
        from employees
        where department_id = E.department_id 
              and salary > E.salary ) AS DEPTRANKING
from employees E
order by 3,4 desc;

--- *** ������������� �̿��� UPDATE ó�� *** ---

--- ���̺� �����ϱ� ---
create table tbl_empcopy
as
select * from employees; 

select *
from tbl_empcopy;

update employee set first_name = '�ӱ���';
commit

select *
from employees;