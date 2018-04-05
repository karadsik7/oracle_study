--lion테이블로 접속하시오.

--country라는 테이블을 작성하시오.(타입과 제약조건명은 본인이 정할 것)
--컬럼명 : code, 예시 : [kor chn eng usa] , 조건 : 기본키
--컬럼명 : name, 예시 : [korea, china, england], 조건 : 중복x,
--컬럼명 : continent, 예시 : [asia, europe] 조건 : null 금지
--컬럼명 : ideology, 예시 : [democracy, socialism] 조건 democracy, socialism 둘 중 하나

create table country(
    code varchar(3) constraint code_pk primary key,
    name varchar(20) constraint name_nn not null
    constraint name_uni unique,
    continent varchar(20) constraint con_nn not null,
    ideology varchar(20) constraint ide_chk check(ideology in('democracy', 'socialism'))
);
drop table country;
desc country;
select * from user_constraints where table_name = 'COUNTRY_BACKUP';

insert into country values('KOR', 'korea', 'asia', 'democracy');
insert into country values('KO', 'koreb', 'asia', 'demo');
delete from country where CODE = 'KO';
delete from country;
select * from country;
--ideology컬럼의 조건이 [demo, soci 둘 중 하나]로 변경되도록 제약조건을 수정

alter table country drop constraint name_uni;
alter table country add constraint name_uni unique(name);

alter table country drop constraint ide_chk;
alter table country add constraint ide_chk check(ideology in('demo', 'soci'));


--country 테이블에 한국, 중국, 영국, 북한을 추가하시오.(국가코드와 체제이념은 구글링)

insert into COUNTRY values('KOR', 'Korea', 'asia', 'demo');
insert into COUNTRY values('CHN', 'China', 'asia', 'soci');
insert into COUNTRY values('UK', 'United Kingdom', 'europe', 'demo');
insert into COUNTRY values('NK', 'North korea', 'asia', 'soci');


--country테이블의 내용을 백업하는 country_backup이라는 테이블을 작성하시오.

create table country_backup as (select * from country);
select * from country_backup;
desc country_backup;
alter table country_backup modify code varchar(3) primary key;
alter table country_backup drop constraint SYS_C007083;
select * from user_constraints where table_name = 'COUNTRY_BACKUP';


