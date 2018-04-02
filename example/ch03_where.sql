--조건으로 검색 => where

--대소비교
select first_name, salary from employees where salary > 10000;
select first_name, salary from employees where salary >= 10000;
select first_name, salary from employees where 3000 > salary;
select first_name, salary from employees where salary <= 10000;

--같다
select first_name, salary from employees where salary = 10000;

--같지 않다 !=, <> 둘다 같은 기능
select first_name, salary from employees where salary != 10000;
select first_name, salary from employees where salary <> 10000;


--실습 사원번호가 150이상인 사람의 사번, 성, 입사일을 출력
describe employees;
select employee_id as 사번, last_name as 성, hire_date as 입사일 from employees
where employee_id >= 150;

--문자열 조건
select first_name, hire_date from employees where first_name = 'Steven';
--사전표기 순서대로 대소비교를 할 수 있다.
select first_name from employees where first_name < 'Alex';
select first_name from employees where first_name < 'B';

--이름의 맨 앞 글자가 H보다 사전순으로 뒤에 위치한 모든 사원의 정보 조회
select first_name from employees where first_name > 'Hz';
select first_name from employees where first_name >= 'I';

--null비교

--select first_name, salary from employees where commission_pct = null; 이거아님
select first_name, salary from employees where commission_pct is null;
select first_name, salary from employees where commission_pct is not null;
--실습 : 매니저가 없는 사원들의 모든 정보를 조회
desc employees;
select * from employees where manager_id is null;

--다중조건
-- select * from employees where salary > 5000 && salary <= 10000; 이거 아님
select * from employees where salary > 5000 and salary <= 10000;
select * from employees where salary > 5000 or salary <= 10000;
--실습 월급이 10000 이상, 15000미만인 사원의 모든 정보를 조회
select * from employees where salary >= 10000 and salary < 15000;
--실습2 : 월급이 5000미만이거나 20000이상인 사원들의 정보 조회
select * from employees where salary < 5000 or salary >= 20000;
select * from employees where hire_date >= '03/01/01';

--실습3 : 입사가 05년 이후면서 06년 이전에  사원들의 정보 조회
select * from employees where hire_date >= '05/01/01' and hire_date < '06/01/01';

--실습 : job_id가 'Sa_man'이거나 'it_prog'인 사원의 모든 정보 조회
select * from employees where job_id = 'SA_MAN' or job_id = 'IT_PROG';
--실습2 : 이름의 맨 앞글자가 H인 사원들의 모든 정보 조회
select * from employees where first_name >= 'H' and first_name < 'I';

--In : 동비교를 할때 or을 사용해야 할 경우 효율적
select * from employees where job_id in('SA_MAN', 'IT_PROG', 'HR_REP');

--실습 : 사번이 100, 102, 104, 106번인 사원의 모든 정보 조회
select * from employees where employee_id in(100, 102, 104, 106);
select * from employees where employee_id = 100 or employee_id = 102 or employee_id = 104 or employee_id = 106;

--between : 대소비교시 and를 사용할 경우
select * from employees where salary >= 5000 and salary <= 6000;
select * from employees where salary between 5000 and 6000;

--실습 05년도에 입사한 사원의 모든 정보 조회(between사용)
select * from employees where hire_date between '05/01/01' and '05/12/31';

--like % -> 임의의 여러 문자
--like _ -> 임의의 한 문자
select * from employees where first_name like 'H%';
select * from employees where first_name like 'Ha%';
select * from employees where first_name like 'H____'; --자리수가 h제외 4글자
--실습 : 이름이 a로 끝나는 사원의 모든 정보를 조회
select * from employees where first_name like '%a';
--실습2 : 이름이 h로 시작하면서 6글자 이상인 사원의 모든 정보를 조회
select * from employees where first_name like 'H_____%';
--실습 이름에 o가 들어가면서 이름이 a로 끝나는 사원의 정보를 조회
select * from employees where first_name like '%o%a';
select * from employees where phone_number like '011%';

--실습 전화번호가 6으로 시작해서 중간에 2가 들어가고 9로 끝나는 사원 조회
select * from employees where phone_number like '6%2%9';
--실습 전화번호에 44가 들어가는 사원 조회
select * from employees where phone_number like '%44%';
--실습 전화번호가 4개의 그룹으로 이루어진 사원 조회
select * from employees where phone_number like '%.%.%.%';

--not
select * from employees where job_id not in('SA_MAN', 'IT_PROG', 'HR_REP');

--실습 위의 결과를 or 또는 and를 활용해서 똑같이 조회하세요.
select * from jobs;
select * from employees where job_id != 'SA_MAN' and job_id != 'IT_PROG' and job_id !='HR_REP';

--not like
select * from employees where phone_number not like '%44%';

--실습 : 44가 중간에만 들어있는 사원의 모든 정보를 조회

select * from employees where phone_number like '%44%' and phone_number not like '44%' and phone_number not like '%44';

--order by
select * from employees;
desc employees;
--오름차순
select * from employees order by salary; -- asc는 끝에 붙여도되고 안붙여도 기본값 오름차순
--내림차순
select * from employees order by salary desc;

--실습 월급이 15000달러 이상인 사원들의 모든 정보를 입사일이 빠른 순으로 조회
select * from employees where salary >= 15000 order by hire_date;

--같은 조건하에서 2순위 정렬을 하고 싶다면 : hire_date 우선정렬 hire_date가 같을 때 first_name정렬
select * from employees order by hire_date, first_name desc;


