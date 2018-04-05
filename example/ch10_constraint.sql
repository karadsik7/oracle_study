drop table teacher;
create table teacher(
    --primary key : unique + not null
    id number constraint teacher_id_pk primary key,
    
    --unique : �ߺ� �Ұ�
    nickname varchar2(20) constraint teacher_nickname_unique unique,
    
    -- (constraint �������Ǹ� ��������) �������� �������Ǹ� ��� ����Ŭ�� �˾Ƽ�
    -- ���ֱ�� ������ �������Ǹ��� ���ϰ� �ʹٸ� �������
    -- not null : ���� �� �� ����
    name varchar2(20) constraint teacher_name_nn not null,
    
    --check : Ư���� ������ Ȯ��
    --���������� ������ �ְ� ������ ���� ���������� ����
    gender char(1) constraint teacher_gender_check check(gender in('f', 'm'))
    constraint teacher_gender_nn not null
);

select * from user_constraints where table_name = 'TEACHER';
select * from teacher;

--primary key ���� ���� : ���� ������ ���ϸ� �ߺ������� ���Ѵ�.
insert into teacher values(null, 'flynn', '�嵿��', 'm');
insert into teacher values(1, 'flynn', '�嵿��', 'm');
insert into teacher values(1, 'john', '��', 'm');
insert into teacher values(2, 'john', '��', 'm');

--unique �������� : �ߺ� �Ұ���
update teacher set nickname = 'flynn' where id = 2;

--not null �������� : �� �Ұ���
insert into teacher values(3, 'mike', null, 'm');
insert into teacher values(3, 'mike', '����ũ', 'm');

--check���� : ������ ���� �ȿ��� �������� ���� ���ؾ���

insert into teacher values(4, 'jane', '����', 'F');
select * from user_constraints where table_name = 'TEACHER' and constraint_name = 'TEACHER_GENDER_CHECK';


--�������� ����

alter table teacher drop constraint teacher_gender_check;
update teacher set gender = 'f' where id = 4;

--�������� �߰�
--���������� ���� Ʃ���� ������ �������� �߰��� �ȵ�
alter table teacher add constraint teacher_gender_chk check(gender in('m', 'f'));

--:::�������� ������ �����Ƿ� �����ϰ� �߰��ؾ���:::


