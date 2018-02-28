
/*
�� ������ �Լ��� ����

1. �����Լ� 
2. �����Լ�
3. ��¥�Լ�
4. ��ȯ�Լ�
5. ��Ÿ�Լ�

----------------------------------------------

================= 1. �����Լ� =================
  1.1 lower
  1.2 upper
  1.3 initcap
  1.4 substr : ���ڿ��� Ư������ �Ǵ� ���ڿ��� �Ϻκ��� �����Ҷ� �����.
  1.5 lenth : ���ڿ� ���̸� �˷��ִ� ��.
  1.6 lengthb : ���ڿ��� byte���� �˷��ִ� ��.
  1.7 instr : � ���ڿ����� ���� ������ ��ġ�� �˷��ִ� ��.
  1.8 reverse : � ���ڿ��� �Ųٷ� �����ִ� ���̴�.
  1.9 lpad : ���ʺ��� ���ڸ� �ڸ�ä��
  1.10 rpad : �����ʺ��� ���ڸ� �ڸ�ä��
  1.11 ltrim : ���ʺ��� ���ڸ� �����ϴ� �Լ�
  1.12 rtrim : �����ʺ��� ���ڸ� �����ϴ� �Լ�
  1.13 translate 
  1.14 replace 
*/

select 'KH����������',
         substr('KH����������',3,2),
         substr('KH����������',3)
from dual;        

--1.4 substr
-- [����] employees ���̺��� ������ ���ڸ� �����ȣ, �����, �ֹι�ȣ�� ��Ÿ������

select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����", jubun as "�ֹι�ȣ" 
from employees
where substr(jubun,7,1) = 1 or substr(jubun,7,1) = 3;
1234561234567
--1.5 lenth
select length('KH����������'), length('Korea')
from dual;

--1.6 lengthb
select lengthb('KH����������'), lengthb('Korea')
from dual;

--1.7 instr

select instr('KH���������� ���������� ������ȭ��', '����', 1, 1),
      instr('KH���������� ���������� ������ȭ��', '����', 1, 2),
      instr('KH���������� ���������� ������ȭ��', '����', 4, 1),
      instr('KH���������� ���������� ������ȭ��', '����', 4, 3),
      instr('KH���������� ���������� ������ȭ��', '����', 1),
      instr('KH���������� ���������� ������ȭ��', '����', 4),
      instr('KH���������� ���������� ������ȭ��', '����', -1, 1), -- �Ųٷ� �о�´� 
      instr('KH���������� ���������� ������ȭ��', '����', -1, 2),
      instr('KH���������� ���������� ������ȭ��', '����', -4, 1),
      instr('KH���������� ���������� ������ȭ��', '����', -4, 3)
from dual;

--1.8 reverse
select 'ORACLE', reverse('ORACLE')
from dual;

select '�ѱ�', reverse('�ѱ�'), reverse(reverse('�ѱ�')) 
from dual;

create table tbl_files
(fileno number(3), --- -999~999 ���� ���� number(5) -> -99999 ~ 99999
 filepath varchar2(100));
 
 insert into tbl_files(fileno, filepath) values (1,'C:\document\resume.hwp');
 insert into tbl_files(fileno, filepath) values (2,'d:\mymusic.mp3');
 insert into tbl_files(fileno, filepath) values (3,'C:\myphoto\abc\def\face.jpg');
 
 commit;
 
 select *
 from tbl_files;
 
 /*
 -- [����] �Ʒ��� ���� �������� �ϼ���.
 ------------------------------------
  ���Ϲ�ȣ    ���ϸ�
------------------------------------ 
   1          resume.hwp
   2          mymusic.mp3
   3          face.jpg
*/

select fileno as "���Ϲ�ȣ", reverse(substr(reverse(filepath) , 1, instr(reverse(filepath),'\',1)-1)) as "���ϸ�"
from tbl_files
order by 1;

select fileno as "���Ϲ�ȣ", substr(filepath ,instr(filepath, '\', -1, 1)+1)
from tbl_files
order by 1;

-- 1.9 1.10 lpad rpad

select lpad('����������', 20, '����������'), -- 20����Ʈ
       rpad('����������', 20, '*')
from dual;

select lpad('���ѹα�',length('���ѹα�')*2*5,'���ѹα�') ,lengthb('���ѹα�')
from dual;
         
-- 1.11 1.12 ltrim rtrim

select ltrim('aabccdadsabcd', 'abcd'), -- ���ʺ��� a�Ǵ�b�Ǵ�c�Ǵ�d�������� �������Ť�
       rtrim('aabbbtddabca', 'abcd')
from dual;

select 'kH' || '                        ����           ������              ',
        'kH' || ltrim('                       ����           ������              ') -- ���������� �����ָ� �������
from dual;

1.13 translate  
 
select translate('010-3456-0987','0123456789', '�����̻�����ĥ�ȱ�')
from dual;

select *
from tbl_user;

insert into tbl_user(userid, passwd, name, addr) values ('superman' , 'qwer1234', '���۸�', '����� ���α�');
commit;

insert into tbl_user(userid, passwd, name, addr)
    values ('batman' , translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789','ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210'), '��Ʈ��', '��⵵ �����ν�');

select userid, translate(passwd,'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789')as "passwd"
from tbl_user;


select count(*)
from employees
where department_id = 50;

select count(*)
from employees
where department_id = 777;



select count(*)
from tbl_user
where userid = 'batman' and passwd = translate('qwEr1234$','abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789','ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210');

-- 1.14 replace

select replace('KH���������� ��������� ���ﱳ�����б�','����', 'education')
from dual;

insert into tbl_user(userid, passwd, name , addr) values ('kimys', 'abcd', '������', '����');
insert into tbl_user(userid, passwd, name , addr) values ('leesa', 'abcd', '�̿���', '����');
insert into tbl_user(userid, passwd, name , addr) values ('yong', 'abcd', '�̿�����', '����');
insert into tbl_user(userid, passwd, name , addr) values ('park', 'abcd', '�ھƴ�', '����');
insert into tbl_user(userid, passwd, name , addr) values ('leebon', 'abcd', '�̺�', '����');
insert into tbl_user(userid, passwd, name , addr) values ('leess', 'abcd', '�̼���', '����');
commit;

select *
from tbl_user;
-- ���� ���� '��'���� ����� ���� '��'���� �����ϼ���


-- update tbl_user set name = replace(substr(name, 1,1),'��','��') || substr(name,2) where substr(name, 1,1) = '��';  

update tbl_user set name = '��'|| substr(name,2)  where name like '��%';

select *
from tbl_user;

rollback;

/*
  ========== 2.�����Լ� ==============
  
  -- 2.1 mod : �������� �����ִ� ��
  -- 2.2 round : �ݿø��� ���ִ� ��
  -- 2.3 trunc : ���� ���ִ� ��
  -- 2.4 poer : �ŵ�����
  -- 2.5 sqrt : ������
  -- 2.6 sign : ������� ����̶�� 1, 0�̶�� 0, ������� -1�� ����
  -- 2.7 ascii
  -- 2.8 sin, cos, tan, asin, acos, atan
  -- 2.9 log
*/

-- 2.1 mod

select 5/2, mod(5,2), trunc(5/2)
from dual;

-- 2.2 round

select 94.547, round(94.547) , --95
               round(94.547,0), -- 95
               round(94.547, 1), -- 94.5
               round(94.547, 2), -- 94.55
               round(94.547, -1), -- 90 
               round(94.547, -2) -- 100
from dual;

-- 2.3 trunc

select 94.547, trunc(94.547) , --94
               trunc(94.547,0), -- 94
               trunc(94.547, 1), -- 94.5
               trunc(94.547, 2), -- 94.54
               trunc(94.547, -1), -- 90 
               trunc(94.547, -2) -- 0
from dual;

create table tbl_sungjuk
(hakbun varchar2(20) not null,
 name varchar(20),
 kor number(3),
 eng number(3),
 math number(3),
 constraint PK_tbl_sungjuk_hakbun primary key(hakbun));
 
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0001' , '�Ѽ���', 100, 100, 100);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0002' , '�μ���', 80, 83, 87);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0003' , '������', 90, 91, 99);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0004' , '�׼���', 60, 50, 59);
insert into tbl_sungjuk(hakbun, name, kor, eng, math) values ('KH0005' , '������', 82, 80, 80);

select *
from tbl_sungjuk;

select hakbun as "�й�", name as "�л���", kor as "����", eng as "����", math as "����",
       (kor +eng +math) as "����", round((kor +eng +math)/3) as "���",
       case(trunc(round((kor +eng +math)/3)/10)) when 10 then 'A' when 9 then 'A' when 8 then 'B'
            when 7 then 'C' when 6 then 'D' else 'F' end as ����1,
       decode(trunc(round((kor +eng +math)/3)/10),10,'A',
                                                  9,'A',
                                                  8,'B',
                                                  7,'C',
                                                  6,'D',
                                                    'F')
       
from tbl_sungjuk;



-- 2.4 power

select 2*2*2*2*2, power(2,5)
from dual;

-- 2.5 sqrt

select sqrt(4), sqrt(2), sqrt(3)
from dual;

-- 2.6 sign 

select sign(5-2), sign(5-5), sign(2-5)
from dual;

-- 2.7 ascii
select ascii('a'), ascii('a'), ascii('0'), ascii(' ')
from dual;

select chr(65), chr(97), chr(48), chr(32) 
from dual;

-- 2.8 sin, cos, tan, asin, acos, atan

select sin(90), cos(90), tan(90),
       asin(0.3), acos(0.3), atan(0.3)
from dual;

-- 2.9 log
select log(10,100)
from dual;