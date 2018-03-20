show user;

select *
from tab;

select *
from user_sequences;

select *
from tbl_memo;

drop table tbl_memo purge;
drop sequence seq_memo;

insert into tbl_memo (no, name, msg) values (seq_memo.nextval, '임규하', '호호호');

select *
from tbl_memo;

insert into tbl_memo(no, name, msg)
values(seq_memo.nextval, '나기자', '안녕하세요 나기자입니다.');

insert into tbl_memo(no, name, msg)
values(seq_memo.nextval, '홍기자', '안녕하세요 홍홍.');

commit;

desc tbl_memo;

