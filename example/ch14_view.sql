--view �ӽ� ���̺�, ������ ���뼺

select * from empl;
insert into empl (select * from employees);

--����� �̸��� ������ ����Ͻÿ�
create view empl_view as
select first_name||' '||last_name �̸�, salary*(1 + nvl(commission_pct, 0)) as ���� from empl;

select * from empl_view;
delete from empl_view where �̸� = 'Steven King';
select * from empl;
rollback;

create table score(
    id number primary key,
    name varchar2(30) not null,
    kor number(3) check(kor <= 100 and kor >= 0),
    eng number(3) check(eng <= 100 and eng >= 0),
    math number(3) check(math <= 100 and math >= 0)
);
drop table score;
create sequence seq_score_id;
drop sequence seq_score_id;
insert into score values(seq_score_id.nextval, 'ȫ�浿', 100, 70, 50);
insert into score values(seq_score_id.nextval, '������', 70, 90, 90);
insert into score values(seq_score_id.nextval, '�Ӳ���', 80, 60, 40);
select * from score;

--read only �ɼ��� ���� ������ view���� �����ص� ���� ���̺� ������ ��ħ 
create or replace view score_view as
select name, kor, eng, math, kor + eng + math as total,
round((kor + eng + math) / 3, 2) as avg from score
with read only;

select * from score_view where name = '������';
select * from score_view;
update score set math = math + 5 where name = '������';

