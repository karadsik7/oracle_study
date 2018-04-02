--테이블 생성
--create table 테이블명( 컬럼명 자료형 [제약조건], [컬럼명....])
create table person(
    id number(2) primary key,
    name varchar2(20) not null
);

--테이블 로우(튜플)조회
select * from PERSON;

--테이블 컬럼(속성)조회
describe person;

--테이블 수정
--컬럼 추가
-- alter table 테이블명 add 컬럼명 자료형;
alter table person add birth date;
desc person;

--컬럼명 수정
-- alter table 테이블명 rename column 컬렴명 to 변경컬럼명;
alter table person rename column birth to birthday;

--컬럼 속성(자료형, 제약조건) 수정
--alter table 테이블명 modify 컬럼명 자료형(byte) (null여부)
alter table person modify name varchar2(30) null;

--컬럼 삭제
--alter table 테이블명 drop column 컬럼명;
alter table person drop column birthday;
desc person;

--테이블 삭제
--drop table 테이블명;
drop table person;
desc person;

