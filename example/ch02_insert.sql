create table teacher(
    id number primary key,
    nickname VARCHAR2(20),
    name varchar2(20) not null,
    gender char(1) not null
);

desc teacher;

--[insert]

insert into teacher(id, nickname, name, gender) values(1, 'flynn', '장동혁', 'm');

select * from teacher;

--실습 : 자신을 테이블에 저장하세요

insert into teacher(nickname, gender, name, id) values('jang', 'm', '장진수', 2);
select * from teacher;

--제약조건 위반 - primary key
--컬럼명을 생략하면 모든 컬럼값을 지정해야하고 순서도 맞춰야함
insert into teacher values(2, 'hong', '홍길동', 'm');
insert into teacher values(3, 'hong', '홍길동', 'm');

--제약조건 위반 - not null
insert into teacher(id, nickname, gender) values(4, 'lim', 'm');
insert into teacher(id, name, gender) values(4, '임꺽정', 'm');

--자료형 위반
insert into teacher values(5, 'lee', '이순신', 'male');
insert into teacher values(5, 'lee', '이순신', 'm');

--실습 : 가족을 테이블에 저장

insert into teacher(id, nickname, name, gender) values(6, 'gang', '강감찬', 'm');
insert into teacher values(7, 'sejong', '세종대왕', 'm');

