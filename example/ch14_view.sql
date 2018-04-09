--view 임시 테이블, 쿼리의 재사용성

select * from empl;
insert into empl (select * from employees);

--사원의 이름과 연봉을 출력하시오
create view empl_view as
select first_name||' '||last_name 이름, salary*(1 + nvl(commission_pct, 0)) as 연봉 from empl;

select * from empl_view;
delete from empl_view where 이름 = 'Steven King';
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
insert into score values(seq_score_id.nextval, '홍길동', 100, 70, 50);
insert into score values(seq_score_id.nextval, '정도전', 70, 90, 90);
insert into score values(seq_score_id.nextval, '임꺽정', 80, 60, 40);
select * from score;

--read only 옵션을 주지 않으면 view에서 수정해도 원본 테이블에 영향을 미침 
create or replace view score_view as
select name, kor, eng, math, kor + eng + math as total,
round((kor + eng + math) / 3, 2) as avg from score
with read only;

select * from score_view where name = '정도전';
select * from score_view;
update score set math = math + 5 where name = '정도전';

