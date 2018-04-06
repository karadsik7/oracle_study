--foreign key
--�ܷ�Ű, �ܺ�Ű, ����Ű��� �Ҹ��� �ٸ� ���̺��� �⺻Ű(PK)�Ǵ�
--����Ű(UK, unique)�� ���������ν� ���̺� ���� ���踦 �����Ѵ�.

select * from teacher;
-- ������ references �������̺��(���� �⺻Ű)
create table lecture(
    id number constraint id_pk primary key,
    name varchar2(50) not null,
    room varchar2(50), check(room in ('A', 'B', 'C', 'D', 'E')),
    t_id number constraint lecture_t_id_fk references teacher(id)
);

desc teacher;
desc lecture;
drop table lecture;

create table lecture(
    id number constraint id_pk primary key,
    name varchar2(50) not null,
    room varchar2(50), check(room in ('A', 'B', 'C', 'D', 'E')),
    t_id number
);

alter table lecture add foreign key(t_id) references teacher(id);
select * from user_constraints where table_name = 'LECTURE';

insert into lecture values(1, 'Oracle db', 'A', 1);
desc teacher;
--�ǽ� : ������ �̸��� �� ���Ǹ� ���� ������ �г����� ��ȸ�Ͻÿ�

select l.name, t.name from lecture l, teacher t where l.t_id = t.id;


--�ǽ� : room���̺� ����

create table room(
    id varchar2(50) constraint room_pk primary key,
    capacity number not null,
    l_id number
);
alter table room modify id varchar2(50);
desc lecture;
desc room;

insert into room values('A', '30', 1);

alter table lecture add foreign key(room) references room(id);
delete from room;

--default �ɼ�
--�����ϰ� �ִ� Ʃ���� �ִٸ� �������ϴ� Ʃ���� ���� �� ����
delete from room where id = 'A';
select * from lecture;
select * from room;

--on delete cascade : �����ϰ� �ִ� ���̺��� �⺻Ű Ʃ���� ����� �ܷ�Ű Ʃ�õ� ������
alter table lecture drop constraint SYS_C007098;
alter table lecture add foreign key(room) references room(id) on delete cascade;
select * from user_constraints where table_name = 'LECTURE';

--on delete set null : �����ϰ� �ִ� ���̺��� �⺻Ű Ʃ���� ����� �ܷ�Ű �÷��� ���� null�� ����
alter table lecture add foreign key(room) references room(id) on delete set null;
delete from room where id = 'A';
delete from lecture;

--�ǽ� : location ���̺� �����ϰ� �ܷ�Ű set null ��������

create table location(
    id number constraint loc_id_pk primary key,
    name varchar2(50) constraint loc_name_nn not null,
    phone_number varchar2(50) constraint loc_phone_chk check(phone_number like '___-____-____')
);

alter table locations rename to location;
select * from user_constraints where table_name = 'LOCATION';
alter table location drop constraint loc_phone_chk;

alter table location modify phone_number varchar2(50) constraint loc_phone_chk check(phone_number like '%__-%___-____'
and phone_number not like '%-%-%-%');

insert into LOCATION values(2, '����', '010-864-7984');
select * from LOCATION;
delete from location;
-- location ���̺� �ܷ�Ű �����

alter table room add constraint loc_id_FK foreign key(l_id) references location(id) on delete set null;

insert into location values(1, '����', '02-1234-5678');
insert into room values('A', 30, 1);

select * from tabs;

select * from teacher;
select * from LECTURE;

-- N:N ���� : �߰� ���̺��� ������ش� (�ܷ�Ű�� �����ϴ� �����ʹ� �ϳ����̹Ƿ�)

create table student(
    id number primary key,
    name varchar2(50) not null,
    age number
);

create table registration(
    id number primary key,
    stu_id number not null references student(id),
    lec_id number not null references lecture(id)
);

insert into student values(1, 'ȫ�浿', 20);
insert into student values(2, '������', 30);
select * from student;
select * from lecture;
insert into lecture values(2, 'JAVA', 'A', 1);
insert into lecture values(3, 'WEB', 'A', 1);

select * from registration;
insert into registration values(1, 1, 1);
insert into registration values(2, 1, 2);
insert into registration values(3, 2, 2);
insert into registration values(4, 2, 3);

--�ڹ� ������ ��� �ִ� �л��� ���
select stu.name, lec.name from student stu, lecture lec, registration r where stu.id = r.stu_id and lec.id = r.lec_id
and lec.name = 'JAVA'; -- �Ǵ� lec.id = '2'

--ȫ�浿�� ����ִ� ������ ���
select stu.name, lec.name from student stu, lecture lec, registration r where stu.id = r.stu_id and lec.id = r.lec_id
and stu.name = 'ȫ�浿';

