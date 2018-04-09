create sequence seq_member_id;
select seq_member_id.nextval from dual;
select seq_member_id.currval from dual;

drop sequence seq_member_id;
create sequence seq_member_id 
-- 기본 증가량은 1이지만 increment by 로 값 조절 가능
increment by 2
start with 10 --시작할 값을 지정, 기본값 0
maxvalue 20 --최댓값 지정, 20이 되면 멈춤, 기본값 : 10^27
cycle -- 순환여부, 기본값 : nocycle
minvalue 5
cache 5; -- cycle이 설정됐을 때 돌아갈 값

select seq_member_id.nextval from dual;

drop sequence seq_member_id;

create sequence seq_member_id;

create table member(
    id number primary key,
    name varchar(20)
);

insert into member values(seq_member_id.nextval, '홍길동');
insert into member values(seq_member_id.nextval, '고길동');

select * from member;



