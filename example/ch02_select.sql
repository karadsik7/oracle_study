desc employees;
select * from EMPLOYEES;
select * from departments;

--계정이 소유한 테이블의 목록 출력
--select * from tabs;
select * from tabs;

--테이블의 전체 컬럼 조회
--select * from 테이블명;
select * from employees;

--실습 : 부서테이블의 모든 컬럼 조회
select * from departments;

--테이블의 일부 컬럼 조회;
select employee_id, first_name, last_name from employees;

--실습 부서테이블에서 부서아이디, 부서이름을 조회하시오
desc departments;
select department_id, department_name from departments;

--select문을 실행한 결과도 임시테이블로 활용될 수 있다.
select first_name from (select first_name, last_name from EMPLOYEES);

--여러개의 테이블에서 컬럼조회
--그러나 바로 아랫줄처럼 해버리면 테이블간 관계 형성이 되지 않아
--그냥 모든 경우의 수를 출력해버림
select employee_id, first_name, department_name from employees, departments;
-- 테이블 간 department_id가 서로 같은 것이라고 join을 해주면 원하는 정보를 가져옴
select employee_id, first_name, department_name from employees, departments
where employees.department_id = departments.department_id;

--별칭 : 컬럼명 뒤에 as 별칭 혹은 띄어쓰기하면 별칭으로 보여짐
select employee_id as 사원번호, first_name 이름 from employees;

--실습 : 부서테이블에서 부서명과 매니저 아이디를 조회하되 각각 부서명, 매니저 아이디로 별칭 변경
-- 주의 : 띄어쓰기가 들어갈 땐 ""로 묶어야 함
select * from departments;
select department_name 부서명, manager_id  "매니저 아이디" from departments;

--문자열 이어붙이기
select first_name || ' ' || last_name full_name from employees;

--실습 : 지역테이블에서 거리명과 우편번호를 붙여서 주소별칭으로 출력
select * from locations;

select street_address || ' ::: ' || postal_code as 주소 from locations;

--사칙연산
select first_name as 이름, salary*12 as 연봉 from employees;
select * from employees;
--실습 : 실월급 = 월급 + 월급 * commission_pct
select first_name as 이름, (salary + (salary*commission_pct)) * 12 as 실연봉 from employees;

--날짜 사칙연산
--단위는 1일
select hire_date, hire_date + 1 from employees;

select hire_date, hire_date + 365 from employees;













