select * from empl;

--트랜잭션 시작 (commit or rollback or connection)

delete from empl;
select * from empl;
rollback;

delete from empl;
select * from empl;
commit;

--connection to tiger

select * from tabs;

create table account(
    account_number varchar(20) primary key,
    name varchar2(20),
    money number
);

rollback; --영향 받는 것은 update delete insert 인 select를 제외한 dml쿼리만

insert into account values('1111', '홍길동', 0);
insert into account values('2222', '임꺽정', 0);
commit;
select * from account;

update account set money = money + 10000 where account_number = '1111';
commit;

--계좌이체

update account set money = money - 1000 where account_number = '1111';
--천재지변으로 쿼리 실행x
rollback;
update account set money = money + 1000 where account_number = '2222';

--계좌번호 오류
select * from account;
update account set money = money - 1000 where account_number = '1111';
update account set money = money + 1000 where account_number = '2222';
rollback;
commit;


