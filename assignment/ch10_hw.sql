--lion���̺�� �����Ͻÿ�.

--country��� ���̺��� �ۼ��Ͻÿ�.(Ÿ�԰� �������Ǹ��� ������ ���� ��)
--�÷��� : code, ���� : [kor chn eng usa] , ���� : �⺻Ű
--�÷��� : name, ���� : [korea, china, england], ���� : �ߺ�x,
--�÷��� : continent, ���� : [asia, europe] ���� : null ����
--�÷��� : ideology, ���� : [democracy, socialism] ���� democracy, socialism �� �� �ϳ�

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
--ideology�÷��� ������ [demo, soci �� �� �ϳ�]�� ����ǵ��� ���������� ����

alter table country drop constraint name_uni;
alter table country add constraint name_uni unique(name);

alter table country drop constraint ide_chk;
alter table country add constraint ide_chk check(ideology in('demo', 'soci'));


--country ���̺� �ѱ�, �߱�, ����, ������ �߰��Ͻÿ�.(�����ڵ�� ü���̳��� ���۸�)

insert into COUNTRY values('KOR', 'Korea', 'asia', 'demo');
insert into COUNTRY values('CHN', 'China', 'asia', 'soci');
insert into COUNTRY values('UK', 'United Kingdom', 'europe', 'demo');
insert into COUNTRY values('NK', 'North korea', 'asia', 'soci');


--country���̺��� ������ ����ϴ� country_backup�̶�� ���̺��� �ۼ��Ͻÿ�.

create table country_backup as (select * from country);
select * from country_backup;
desc country_backup;
alter table country_backup modify code varchar(3) primary key;
alter table country_backup drop constraint SYS_C007083;
select * from user_constraints where table_name = 'COUNTRY_BACKUP';


