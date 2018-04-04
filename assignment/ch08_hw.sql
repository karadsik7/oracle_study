--employees 테이블의 복사본인 empl테이블을 만드시오 (이미 존재한다면 삭제하고 생성)
create table empl as select * from employees;
drop table empl;
--empl 테이블의 모든 튜플을 삭제하시오.완료 후 empl테이블 자체를 삭제 후 다시 생성
--완료 후 원상태로 복원
delete from empl;
--empl 테이블의 튜플 중 사번이 짝수인 사원들을 삭제하시오.
--완료 후 원상태로 복원
delete from empl where mod(employee_id, 2) = 0;
select * from empl;

--empl 테이블의 튜플 중 사번이 commission_pct가 null인사원을 삭제하시오.
--완료 후 원상태로 복원
delete from empl where commission_pct is null;

--empl 테이블의 튜플 중 commtion_pct의 값이 null인 사원의 commission_pct를 
--월급이 15000 이상이라면 0.15, 10000이상 15000미만이라면 0.1, 5000이상 10000미만이라면 0.07, 5000미만은 0.05로 수정하시오.
--완료 후 원상태로 복원
update empl set 
    case
        when salary >= 15000 then commission_pct = 0.15
        when salary >= 10000 then commission_pct = 0.11
        when salary >= 5000 then commission_pct = 0.07
        else commission_pct = 0.05
    end
where commission_pct is null;
--empl테이블의 튜플중 근속년수가 12년이 지난 사원은 월급을 10% 증가시키고 commission_pct를 2배로 수정하시오.
--완료 후 원상태로 복원

update empl set commission_pct = commission_pct * 2, salary = salary * 1.1 where months_between(sysdate, hire_date) >= 144;