/*
 ================= 3. ��¥�Լ� =================
 -- ���� ����Ŭ ������ �ý����� �ð��� �˷��ִ� ��.
*/
select sysdate, current_date, -- RR/MM/DD
       localtimestamp, current_timestamp
from dual;

select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
from dual;

-- 3.1
/*
  ��¥ + ���� = ��¥
  ��¥ - ���� = ��¥
  ���⼭ ������ ������ �ϼ� �̴�.
*/
select sysdate -1 as "�����ð�", sysdate as "����ð�", sysdate + 1 as "���Ͻð�"
from dual;


select to_char(sysdate -1,'yyyy-mm-dd hh24:mi:ss' ) as "�����ð�", to_char(sysdate -1,'yyyy-mm-dd hh24:mi:ss' ) as "����ð�",
               to_char(sysdate + 1, 'yyyy-mm-dd hh24:mi:ss') as "���Ͻð�" , to_char(sysdate + 1 + 2/24 + 3/(24*60) + 4/(24*60*60),'yyyy-mm-dd hh24:mi:ss')  as "1��2�ð�3��4�ʵ�"
from dual;

-- 3.2
/*
 ��¥ - ��¥ = ����(������ ������ �ϼ�)
*/
select (sysdate+2) - (sysdate+1) 
from dual;

-- 3.3 add_months
select add_months(sysdate, -2) as "2���� ��", sysdate as "����" , add_months(sysdate, 2) as "2���� ��"
from dual;
/*
 ���� ���úη� ��ÿ¾��� �� ���뿡 ��������.
 �������Ⱓ�� 21���� �����Ѵٸ�
 ù����, �������ڸ� ���Ͻð�,
 �ι���, �������ڱ��� �Ծ���� «���� �׸����� ���ϼ���
 (��, 1�� 3���� �Դ´�.)
*/

select add_Months(sysdate,21) as "��������" , (add_Months(sysdate,21) - sysdate + 1) * 3 as "�׸���"
from dual;

-- 1�� 2�ð� 3�� 4�ʸ� �ʷ� ��Ÿ���� ����
select 1*24*60*60 + 2*60*60 + 3*60 + 4
from dual;

-- 185��
select trunc(185/60) ||'��', mod(185,60) || '��'
from dual;

-- 93784�ʸ� 1�� 2�ð� 3�� 4�ʷ� ��Ÿ���� ����
select trunc(trunc(trunc(93784/60)/60)/24) || '��',mod(trunc(trunc(93784/60)/60),24) || '�ð�', mod(trunc(93784/60),60) || '��', mod(93784,60)|| '��'
from dual;

-- ����ð����� ���� ��������('2018-07-31 18:00:00') ���� ���� �Ⱓ�� �� �ð� �� �� �� ���³�����

select trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) ) || '��'
from dual;

select trunc(trunc(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60)/60)/24) || '��' ||
       mod(trunc(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60)/60),24) || '�ð�' ||
       mod(trunc(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) )/60),60) || '��' ||
       mod(trunc( (to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate) * (24*60*60) ),60)|| '��' as "����ñ��� ���� �Ⱓ"
from dual;

create table tbl_auction
(auction_no number,
 expire_date date
);

insert into tbl_auction(auction_no, expire_date)
       values(1, to_date('2018-02-26 20:00:00', 'yyyy-mm-dd hh24:mi:ss'));

insert into tbl_auction(auction_no, expire_date)
       values(2, to_date('2018-02-27 09:00:00', 'yyyy-mm-dd hh24:mi:ss'));

insert into tbl_auction(auction_no, expire_date)
       values(3, to_date('2018-03-01 12:00:00', 'yyyy-mm-dd hh24:mi:ss'));
 
 commit; 
 
select auction_no 
      , to_char(expire_date, 'yyyy-mm-dd hh24:mi:ss')
        as expire_date
      , trunc(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60)/24) || '�� ' ||
        mod(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60), 24) || '�ð� ' ||
        mod(trunc((trunc( (expire_date - sysdate ) * (24*60*60) ))/60), 60) || '�� ' ||
        mod((trunc( (expire_date - sysdate ) * (24*60*60) )),60) || '��' 
        as "������������Ⱓ"
 from tbl_auction;

desc employees;

select employee_id, first_name, hire_date, jubun
from employees; -

-- 3.4 extract -- ��¥���� ��, ��, ���� �������ִ� �Լ�

select sysdate,
       to_char(sysdate, 'yyyy') as "�⵵1",
       extract(year from sysdate) as "�⵵2",
       to_char(sysdate, 'mm') as "��1",
        extract(month from sysdate) as "��2",
        to_char(sysdate, 'dd') as "��1",
        extract(day from sysdate) as "��2"
from dual; -- �ڵ����� ���ڴ� �������� ���ڴ� ����������


-- employees ���̺��� �Ʒ��� ���� �������� �ϼ���.
-- �����ȣ, �����, �ֹι�ȣ, ����, ����, ���� ����

select employee_id as "�����ȣ" , first_name || ' ' || last_name as "�����",
       jubun as "�ֹι�ȣ", case when substr(jubun,7,1) in ('1' ,'3') then '��' else '��' end as "����" ,
       substr(jubun,1,2) as "���",
       extract(year from sysdate) - to_number(case  when  substr(jubun,7,1) in('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1 as "����" --to_number(����) ���ڷ� ����
from employees;

-- employees ���̺��� �Ʒ��� ���� �������� �ϼ���.
-- �����߿� ���̰� 20��� 40�븸 �����ȣ, �����, �ֹι�ȣ, ����, ����, ���� ����

/*
   ==========  VIEW(��) ��? ===============
   ���̺��� �ƴ����� select �Ǿ��� ������ ���������
   ���̺� ���� �����Ƿ� �� ������� ���̺�ó�� ���°�(�����ϴ� ��)�� ���Ѵ�.
*/
select V.*
from(
select employee_id , first_name || ' ' || last_name as "�����",
       jubun, case when substr(jubun,7,1) in ('1' ,'3') then '��' else '��' end as "GENDER" ,
       substr(jubun,1,2) as "���",
       extract(year from sysdate) - to_number(case  when  substr(jubun,7,1) in('3','4') then 20 || substr(jubun,1,2) else 19 || substr(jubun,1,2) end) + 1 as "AGE"
from employees
) V -- inline View��� �θ���
where V.GENDER = '��' and trunc(V.AGE, -1) in ('20','40');


-- 3.5 months_between -- �γ�¥�� ���� ���̸� �˷��ִ� ��.
select months_between (add_months(sysdate,5), sysdate)
from dual;

-- 3.6 last_day(Ư����¥) 
--   --> Ư����¥�� ���Ե� �޷¿��� �� ���������� �˷��ִ� ���̴�.
select last_day(sysdate),last_day(to_date('2016-02-09'))
from dual;
/*
    [����]
    employees ���̺���
    �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, ����,
    �Ի�����, ���������� �� ��Ÿ������
    
    -- �����������̶� ����[����������������];
      �ش� ����� ���� 3������ 8���� �¾ ����� �ش��� ����(�ѱ�����)��
      63���� �Ǵ� �⵵�� 8��31�Ϸ� �ϰ�,
      �ش� ����� ���� 9������ 2���� �¾ ����� �ش��� ����(�ѱ�����)��
      63���� �Ǵ� �⵵�� 2����(2��28�� �Ǵ� 2��29�� �� �Ѵ�.
      
*/
-- ����Ǭ ���� --
select v.employee_id AS "�����ȣ", v.ename AS "�����", v.jubun AS "�ֹι�ȣ", v.age AS "���糪��",
       v.salary as "����",v.hire_date as "�Ի�⵵",
       last_day ('20' ||substr(add_Months(sysdate, (63-v.age)*12),1,2) || '-' ||
          case when v.lmonth in ('9','10','11','12','1','2') then '02-02' else '08-08' end) as "���⵵"
       
from (
select employee_id , first_name || ' ' || last_name AS ename, jubun ,
       case when substr(jubun,7,1) in ('1','3') then '����' else '����' end AS gender,
       extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) + 1 AS age,
       salary + nvl(salary*commission_pct,0) AS salary, hire_date, to_number(substr(jubun,3,2)) AS lmonth,
       63 - (extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) +1)  AS lyear
       
          
from employees
)v;

-----  �ٸ� �ڵ� ----------
select employee_id AS "�����ȣ",
       ename AS "�����",
       jubun AS "�ֹι�ȣ",
       gender AS "����",
       age AS "���糪��",
       monthsal AS "����",
       to_char(hire_date, 'yyyy-mm-dd') AS "�Ի�����",
       to_char( last_day(to_char(add_months(sysdate , (63-V.age)*12),'yyyy-') || case when to_number(substr(v.jubun,4,1)) between 3 and 8 then '08-08' else '02-02' end),'yyyy-mm-dd' ) as "���⵵"
       
from (
select employee_id ,
       first_name || ' ' || last_name AS ENAME, 
       jubun,
       case when substr(jubun,7,1) in ('1','3') then '����' else '����' end AS GENDER,
       extract(year from sysdate) - to_number(case when substr(jubun,7,1) in ('3','4') then 20||substr(jubun,1,2) else 19||substr(jubun,1,2) end) + 1 AS AGE,
       nvl(salary + (salary*commission_pct), salary) AS MONTHSAL,
       hire_date
       
from employees
)V;

/*
    
*/
select sysdate, to_char(sysdate, 'day'), to_char(sysdate, 'dy'), -- 18/02/28 , ������, ��
       to_char(sysdate ,'d'), -- 4                  '1' '2' '3' '4' '5' '6' '7'  �� �� ȭ �� �� �� �� , linux ������ ���� ǥ��
       case to_char(sysdate, 'd') when '1' then '��'
                                  when '2' then '��'
                                  when '3' then 'ȭ'
                                  when '4' then '��'
                                  when '5' then '��'
                                  when '6' then '��'
                                  when '7' then '��'
       end AS "������ ���ϸ�"
from dual;


--   number(4) -->  -9999~9999   number(4,2)  --> -99.99 ~ 99.99   number(2,2) --> -0.99 ~ 0.99   
create table tbl_loan
(gejanum  varchar2(10),
 loanmoney  number,         -- �����
 interestrate number(2,2),    -- ������      
 paymentdate  varchar2(2),         -- ���ڸ� ���� ��¥
 constraint PK_tab_loan_gejanum primary key(gejanum)
);

insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-01', 5000, 0.03, '05');
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-02', 5000, 0.03, '07');
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-03', 5000, 0.03, '15');
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-04', 5000, 0.03, '00'); 
insert into tbl_loan(gejanum, loanmoney, interestrate, paymentdate)
  values('10-1234-05', 5000, 0.03, '10'); 
commit;
  

/* ���� 1
 ���¹�ȣ    ����� ����������    �̹��޻�ȯ����
10-1234-01	5000	  0.03	    2018-02-05
10-1234-02	5000	  0.03	    2018-02-07
10-1234-03	5000	  0.03	    2018-02-15
10-1234-04	5000	  0.03	    2018-02-28
*/

select gejanum AS "���¹�ȣ",
       loanmoney AS "�����",
       interestrate AS "����������",
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS "�̹��޻�ȯ����"
from tbl_loan;

/* ���� 2
 ���¹�ȣ    ����� ����������    �̹��޻�ȯ����     �̹��� ��ȯ���ϸ�
10-1234-01	5000	  0.03	    2018-02-05            2
10-1234-02	5000	  0.03	    2018-02-07            4
10-1234-03	5000	  0.03	    2018-02-15            5
10-1234-04	5000	  0.03	    2018-02-28            4
10-1234-05	5000	  0.03	    2018-02-10	          7
*/
select gejanum AS "���¹�ȣ",
       loanmoney AS "�����",
       interestrate AS "����������",
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS "�̹��޻�ȯ����",
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(sysdate), 'yyyy/mm/dd')
                       else to_char(sysdate, 'yyyy/mm/') || paymentdate
                       end)
                       ,'d') as "�̹��� ��ȯ���ϸ�"
from tbl_loan;

/* ���� 3 (�����, �Ͽ����̸� �����ϳ� ��ȯ)
 ���¹�ȣ    ����� ����������    �̹��޻�ȯ����     �̹��� ��ȯ���ϸ�
10-1234-01	5000	  0.03	    2018-02-05            2
10-1234-02	5000	  0.03	    2018-02-07            4
10-1234-03	5000	  0.03	    2018-02-15            5
10-1234-04	5000	  0.03	    2018-02-28            4
10-1234-05	5000	  0.03	    2018-02-12	          7
*/

select gejanum AS "���¹�ȣ",
       loanmoney AS "�����",
       interestrate AS "����������",
       to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end) AS "�̹��޻�ȯ��¥"
from(
select gejanum,
       loanmoney,
       interestrate,
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS monthday,
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(sysdate), 'yyyy/mm/dd')
                       else to_char(sysdate, 'yyyy/mm/') || paymentdate
                       end)
                       ,'d') AS dayname
from tbl_loan
)v;

select gejanum AS ���¹�ȣ,
       loanmoney AS �����,
       interestrate AS ����������,
       to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end) AS �̹��޻�ȯ��¥,
       to_date(add_months(Monthday,-1)) + (case to_number(bfdayname) when 1 then 1 when 7 then 2 else 0 end) AS �����޻�ȯ����,
       ( (to_date(Monthday) + (case to_number(dayname) when 1 then 1 when 7 then 2 else 0 end)) 
                            -  (to_date(add_months(Monthday,-1)) + (case to_number(bfdayname) when 1 then 1 when 7 then 2 else 0 end)) ) * (loanmoney * interestrate) as ���ڱݾ�
from(

select gejanum,
       loanmoney,
       interestrate,
       case paymentdate when '00' then to_char(last_day(sysdate), 'yyyy-mm-dd') else to_char(sysdate, 'yyyy-mm-') || paymentdate end AS monthday,
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(sysdate), 'yyyy/mm/dd')
                       else to_char(sysdate, 'yyyy/mm/') || paymentdate
                       end)
                       ,'d') AS dayname,
       to_char(to_date(
                       case paymentdate 
                       when '00' then to_char(last_day(add_months(sysdate,-1)), 'yyyy/mm/dd')
                       else to_char(add_months(sysdate,-1), 'yyyy/mm/') || paymentdate 
                       end)
                       ,'d') AS bfdayname
from tbl_loan
)v;

-- 3.7 next_day
   -- ���ƿ��� ���ϸ��� ���� �������� �˷��ִ� ��.

select sysdate,
       next_day(sysdate, '��'),
       next_day(sysdate, '��'),
       next_day(sysdate, '��')
from dual;

-- 3.8 to_yminterval, to_dsinterval
-- �����Ϸ� ���� 1�� 2���� 3�� 4�ð� 5�� 6�� �ڸ� ��Ÿ������.

select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
       to_char(add_months(sysdate , 1*12+2) + 3 + 4/24 + 5/(24*60) + 6/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') ,
       to_char(sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'),'yyyy-mm-dd hh24:mi:ss' )
from dual;

select 
from dual;