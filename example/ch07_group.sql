--count : null이 아닌 컬럼의 갯수
select count(employee_id) from employees;
select count(commission_pct) from employees;
select first_name, job_id from employees;
--해당 컬럼의 데이터가 몇종류인지만 알고 싶을 때 중복 제거를 활용
select count(distinct commission_pct) from employees;
--프라이머리 키의 카운트를 센것과 동일한 결과(널제거 때문)
select count(*) from employees;

--그룹함수와 일반 컬럼은 동시 사용 불가능
select count(*), first_name from employees;

--예외 : group by 절에 쓰인 컬럼은 그룹함수와 쓰일 수 있다
select job_id, count(*) from employees group by job_id;

--실습 : 매니저별 담당하는 사원수 조회

select manager_id, count(*) from employees group by manager_id;

--sum
select sum(salary) from employees;
select department_id, sum(salary) from employees group by department_id;
select d.department_name, sum(e.salary) from employees e, departments d
group by d.department_name;

--실습 : 직종별로 월급의 합산을 조회

select job_id, sum(salary) from employees group by job_id;

--실습 : 직종별 월급 평균
select job_id, avg(salary) from employees group by job_id;

select * from employees;

--max
select max(salary) from employees;

--MIN
select department_id, min(salary) from employees group by department_id;
select job_id, min(salary) from employees group by job_id;

--variance : 분산
select job_id, trunc(variance(salary)) from employees group by job_id;

--stddev, 표준편차
select department_id, trunc(stddev(salary)) from employees group by department_id order by stddev(salary);

--having : 그룹함수 조건절
select job_id, max(salary) from employees where max(salary) > 5000 group by job_id;

select job_id, max(salary) from employees group by job_id having max(salary) > 5000 order by max(salary);

--실습 : 각 부서별 평균 월급을 조회 단, 평균 월급이 10000 미만인 그룹만
desc employees;
select department_id, trunc(avg(salary)) from employees group by department_id 
having avg(salary) < 10000 order by avg(salary);

select department_id, trunc(avg(salary)) from employees where department_id < 50 group by department_id; 

--group by 절에서 사용한 컬럼은 having절에서 비교 컬럼으로 사용 할 수 있지만 효율상 컬럼조건은 where절에 그룹조건은
--having절에서 사용하도록 한다

select department_id, job_id, sum(salary) from employees group by department_id, job_id
order by department_id;





