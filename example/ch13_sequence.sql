create sequence seq_member_id;
select seq_member_id.nextval from dual;
select seq_member_id.currval from dual;

drop sequence seq_member_id;
create sequence seq_member_id 
-- �⺻ �������� 1������ increment by �� �� ���� ����
increment by 2
start with 10 --������ ���� ����, �⺻�� 0
maxvalue 20 --�ִ� ����, 20�� �Ǹ� ����, �⺻�� : 10^27
cycle -- ��ȯ����, �⺻�� : nocycle
minvalue 5
cache 5; -- cycle�� �������� �� ���ư� ��

select seq_member_id.nextval from dual;

drop sequence seq_member_id;

create sequence seq_member_id;

create table member(
    id number primary key,
    name varchar(20)
);

insert into member values(seq_member_id.nextval, 'ȫ�浿');
insert into member values(seq_member_id.nextval, '��浿');

select * from member;



