--foreign key
--외래키, 외부키, 참조키라고도 불리며 다른 테이블의 기본키(PK)또는
--유일키(UK, unique)를 참조함으로써 테이블 간의 관계를 설정한다.

select * from teacher;
-- 문법은 references 참조테이블명(참조 기본키)
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
--실습 : 강의의 이름과 그 강의를 맡은 강사의 닉네임을 조회하시오

select l.name, t.name from lecture l, teacher t where l.t_id = t.id;


--실습 : room테이블 생성

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

--default 옵션
--참조하고 있는 튜플이 있다면 참조당하는 튜플을 지울 수 없다
delete from room where id = 'A';
select * from lecture;
select * from room;

--on delete cascade : 참조하고 있는 테이블의 기본키 튜플을 지우면 외래키 튜플도 지워짐
alter table lecture drop constraint SYS_C007098;
alter table lecture add foreign key(room) references room(id) on delete cascade;
select * from user_constraints where table_name = 'LECTURE';

--on delete set null : 참조하고 있는 테이블의 기본키 튜플을 지우면 외래키 컬럼의 값이 null로 변함
alter table lecture add foreign key(room) references room(id) on delete set null;
delete from room where id = 'A';
delete from lecture;

--실습 : location 테이블 생성하고 외래키 set null 제약조건

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

insert into LOCATION values(2, '본관', '010-864-7984');
select * from LOCATION;
delete from location;
-- location 테이블 외래키 만들기

alter table room add constraint loc_id_FK foreign key(l_id) references location(id) on delete set null;

insert into location values(1, '본관', '02-1234-5678');
insert into room values('A', 30, 1);

select * from tabs;

select * from teacher;
select * from LECTURE;

-- N:N 관계 : 중간 테이블을 만들어준다 (외래키에 대응하는 데이터는 하나뿐이므로)

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

insert into student values(1, '홍길동', 20);
insert into student values(2, '정도전', 30);
select * from student;
select * from lecture;
insert into lecture values(2, 'JAVA', 'A', 1);
insert into lecture values(3, 'WEB', 'A', 1);

select * from registration;
insert into registration values(1, 1, 1);
insert into registration values(2, 1, 2);
insert into registration values(3, 2, 2);
insert into registration values(4, 2, 3);

--자바 수업을 듣고 있는 학생의 목록
select stu.name, lec.name from student stu, lecture lec, registration r where stu.id = r.stu_id and lec.id = r.lec_id
and lec.name = 'JAVA'; -- 또는 lec.id = '2'

--홍길동이 듣고있는 수업의 목록
select stu.name, lec.name from student stu, lecture lec, registration r where stu.id = r.stu_id and lec.id = r.lec_id
and stu.name = '홍길동';

