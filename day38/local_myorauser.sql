show user;

select *
from tab;

select *
from user_sequences;

select *
from tbl_memo;

drop table tbl_memo purge;
drop sequence seq_memo;

insert into tbl_memo (no, name, msg) values (seq_memo.nextval, '�ӱ���', 'ȣȣȣ');

select *
from tbl_memo;

insert into tbl_memo(no, name, msg)
values(seq_memo.nextval, '������', '�ȳ��ϼ��� �������Դϴ�.');

insert into tbl_memo(no, name, msg)
values(seq_memo.nextval, 'ȫ����', '�ȳ��ϼ��� ȫȫ.');

commit;

desc tbl_memo;

