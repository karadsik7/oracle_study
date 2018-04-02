--union(중복 제거, 정렬) union all(중복제거x, 정렬x) 합집합
select department_id, salary from employees where department_id = 90
union
select department_id, salary from employees where department_id = 80;

--union은 컬럼명이 달라도 똑같은 자료형이라면 한꺼번에 조회 가능하다.
select department_id from departments
union
select salary from employees;

--중복제거 해야하면 안될 때
select department_id, salary from employees where department_id = 90 or department_id = 80 order by department_id, salary;

select department_id, salary from employees where department_id = 90
union all
select department_id, salary from employees where department_id = 80;

--intersect : 교집합
select salary from employees where department_id > 90
intersect
select salary from employees where department_id <= 80;

--minus : 차집합
select salary from employees where department_id = 100;

select salary from employees
minus
select salary from employees where department_id = 100;

-- 중복 제거 : distinct
select distinct salary from employees where department_id != 100;






