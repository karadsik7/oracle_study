drop table teacher;
create table teacher(
    --primary key : unique + not null
    id number constraint teacher_id_pk primary key,
    
    --unique : 중복 불가
    nickname varchar2(20) constraint teacher_nickname_unique unique,
    
    -- (constraint 제약조건명 제약조건) 문법에서 제약조건만 적어도 오라클이 알아서
    -- 써주기는 하지만 제약조건명을 정하고 싶다면 적어야함
    -- not null : 널이 될 수 없음
    name varchar2(20) constraint teacher_name_nn not null,
    
    --check : 특정한 값인지 확인
    --제약조건을 복수로 주고 싶으면 띄어쓰고 제약조건을 적음
    gender char(1) constraint teacher_gender_check check(gender in('f', 'm'))
    constraint teacher_gender_nn not null
);

select * from user_constraints where table_name = 'TEACHER';
select * from teacher;

--primary key 제약 조건 : 널이 되지도 못하며 중복되지도 못한다.
insert into teacher values(null, 'flynn', '장동혁', 'm');
insert into teacher values(1, 'flynn', '장동혁', 'm');
insert into teacher values(1, 'john', '존', 'm');
insert into teacher values(2, 'john', '존', 'm');

--unique 제약조건 : 중복 불가능
update teacher set nickname = 'flynn' where id = 2;

--not null 제약조건 : 널 불가능
insert into teacher values(3, 'mike', null, 'm');
insert into teacher values(3, 'mike', '마이크', 'm');

--check위반 : 정해진 조건 안에서 데이터의 값을 정해야함

insert into teacher values(4, 'jane', '제인', 'F');
select * from user_constraints where table_name = 'TEACHER' and constraint_name = 'TEACHER_GENDER_CHECK';


--제약조건 삭제

alter table teacher drop constraint teacher_gender_check;
update teacher set gender = 'f' where id = 4;

--제약조건 추가
--제약조건을 어기는 튜플이 있으면 제약조건 추가가 안됨
alter table teacher add constraint teacher_gender_chk check(gender in('m', 'f'));

--:::제약조건 수정은 없으므로 삭제하고 추가해야함:::


