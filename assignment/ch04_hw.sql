--합집합의 특성을 활용해서 사원테이블에서 사번, 이름을 조회하고 바로 밑에 부서테이블에서 부서번호, 부서명을 조회하시오.
select * from tabs;
desc employees;
desc departments;
select * from EMPLOYEES;
select employee_id, first_name from employees
union
select department_id, department_name from DEPARTMENTS;
--차집합의 특성을 활용해서 사원이 아무도 없는 부서테이블의 부서번호를 조회하시오.
select * from employees order by department_id asc;

select department_id from departments
minus
select department_id from employees;
--차집합의 특성을 활용해서 manager가 아닌 사원들의 사원번호를 조회하시오.
select * from employees;

select employee_id from employees
minus
select manager_id from employees;

--교집합의 특성을 활용해서 manager인 사원들의 사원번호를 조회하시오.
select employee_id from employees
intersect
select manager_id from employees;

