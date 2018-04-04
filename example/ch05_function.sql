--[문자열 함수]
--[initcap : 첫글자만 대문자 나머진 소문자]
select job_id, initcap(job_id) from employees;

--[upper, lower]
select upper(first_name), lower(job_id) from employees;
select first_name from employees where lower(first_name) like '%a%';

--[length, lengthb]
select first_name, length(first_name), job_id, lengthb(job_id)
from employees;
select length('바나나'), lengthb('바나나') from dual;
select first_name from employees where length(first_name) > 6;
--실습 전화번호의 길이가 9글자 이상인 사원의 이름과 전화번호를 조회
select first_name, phone_number 
from employees where length(phone_number) >= 9;

--[substr(문자열, 추출을 시작할 위치, 추출할 문자수)]
select hire_date, substr(hire_date, 1, 2) from employees;
--실습 월만 추출하시오.
select hire_date, substr(hire_date, 4, 2) from employees;
--실습 일만 추출하시오.
select hire_date, substr(hire_date, -2, 2) from employees;
--실습 사원테이블에서 전화번호 마지막 4자리를 조회
select phone_number, substr(phone_number, -4, 4) from employees;

--[instr : 찾는 문자열의 위치를 반환
--(문자열, 찾는문자, 시작할위치, 몇번째인지]
select first_name, instr(first_name, 'ar') from employees;
--실습 instr을 사용해서 이름에 'ra'라는 문자가 들어있는 사원의 이름을 조회
select first_name from employees where instr(first_name, 'ra') != 0;
select hire_date, instr(hire_date,'/'), instr(hire_date,'/',4,2)
from employees;
select phone_number from employees;
select phone_number, instr(phone_number, '.',-1,1) from employees;

select substr(phone_number, instr(phone_number, '.',-1,1)+1, 6) 
from employees;

--[lpad, rpad]
select first_name, lpad(first_name, 10, '*') from employees;
select first_name, rpad(first_name, 10, '*') from employees;
select '910323-1234567', rpad('910323-',14, '*') from dual;
--실습 first_name의 마지막 2글자를 **로 대체하시오.
select first_name, 
rpad(substr(first_name,1, length(first_name)-2),
length(first_name), '**')
from employees;

select first_name, 
rpad(substr(first_name,1, 2),
length(first_name), '**')
from employees;

--[replace]
select hire_date, replace(hire_date,'/','-') from employees;
--실습 사원테이블에서 전화번호의 구분자를 .이 아닌 %로 조회하시오.


--[숫자 함수]
--[round : 반올림, trunc : 버림]
select 123.456, round(123.456, 2), trunc(123.456, 2)+0.01 from dual;

select 123.456, round(123.456, 0), round(123.456), round(123.456,-1)
from dual;

select 123.456, trunc(123.456) + 1 from dual;

--[ceil : 주어진 숫자와 가장 가까운 큰 정수]
--[floor : 주어진 숫자와 가장 가까운 작은 정수]
select 123.456, ceil(123.456), floor(123.456) from dual;
select -123.456, ceil(-123.456), floor(-123.456) from dual;

--[mod : 나눈나머지]
select mod(11, 3) from dual;
select mod(11.5, 3) from dual;
--실습 짝수 사원번호를 가진 사원들의 모든정보 조회
select * from employees where mod(employee_id, 2) = 0;

--[power : 제곱, sqrt : 제곱근]
select power(2, 3) from dual;
select power(2, -3) from dual;

select sqrt(2) from dual;

--[날짜 함수]
--[sysdate, systimestamp]
select sysdate from dual;
select systimestamp from dual;

--[months_between]
select sysdate, hire_date, months_between(sysdate, hire_date) 
from employees;
--실습 : 입사기간이 160개월 이상인 사원들의 이름, 입사일, 일사후 지난 개월수
--       를 조회하시오(단, 입사후 개월수는 정수로 표현할 것)
select first_name, hire_date, 
        trunc(months_between(sysdate, hire_date)) 입사개월
from employees where months_between(sysdate, hire_date) >= 160;

--[add_months]
select hire_date, add_months(hire_date, 6) from employees;
--실습 사번이 120번인 사원이 입사후 3년 6개월이 되는날에 파티를 하려고한다.
--     날짜를 구하시오.
select add_months(hire_date,3*12+6) from employees where employee_id = 120;

--[next_day : 특정 날짜를 기준으로 가장 빨리 돌아오는 요일을 반환]
select hire_date, next_day(hire_date, '월') from employees;

--실습 월급일은 매달 첫째주 월요일이다. 다음달 월급일을 구하시오.
select next_day('18/04/30','월') from dual;

--[last_day : 해당 월의 마지막 날]
select last_day(sysdate) from dual;

--[형변환 함수]

--[숫자] ==to_char()==> [문자] <==to_char()== [날짜]
--[숫자] <==to_number()== [문자] ==to_date()==> [날짜]

--[숫자 ==> 문자]
select salary*12, to_char(salary*12) from employees;
select salary*12, to_char(salary*12, '$999,999.99') from employees;
select salary*12, to_char(salary*12, '$99,9999.99') from employees;

--[날짜 ==> 문자]
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;
select sysdate, to_char(sysdate, 'YY-MM-DD') from dual;
select sysdate, to_char(sysdate, 'YEAR-MM-DD') from dual;

select sysdate, to_char(sysdate, 'YY-MONTH-DD') from dual;

select sysdate, to_char(sysdate, 'YY-MM-DD DAY') from dual;
--실습 사원테이블에서 사원의 이름과 입사년도를 조회하시오(요일까지 출력)
select first_name, to_char(hire_date, 'YY-MM-DD DAY') from employees;

select sysdate, to_char(sysdate, 'YY-MM-DD HH:MI:SS') from dual;
select sysdate, to_char(sysdate, 'YY-MM-DD HH24:MI:SS') from dual;

--[숫자형태의 문자 ==> 숫자]
select '114455', to_number('114455') from dual;
select to_number('1234a') from dual;

--[날짜형태의 문자 ==> 날짜]
select to_date('20180403') from dual;
select to_char(to_date('00011225'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('19910323'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('1991 03 23'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('1991.03.23'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('91/03/23'), 'YYYY-MM-DD DAY') from dual;

--[기타함수]
--[nvl, nvl2]
select * from departments;
select manager_id, nvl(manager_id,0) from departments;
select manager_id, nvl2(manager_id,1,0) from departments;
--실습 사원테이블에서 이름, 월급, 보너스를 출력하시오
--     보너스 = salary * commssion_pct
select first_name, salary, salary*nvl(commission_pct,0) bonus
from employees;

--[decode]
select decode(manager_id, null, 0, manager_id) from departments;
select first_name, decode(job_id, 'IT_PROG', '개발자', '비개발자') 
from employees;
select first_name, decode(job_id, 'IT_PROG', '개발자', 
                           decode(job_id,'SA_MAN','영업담당자','나머지')) 
from employees;
--[decode응용]
select first_name,
    decode(substr(hire_date, 1, 2), '02', 1, 0) "2002년도",
    decode(substr(hire_date, 1, 2), '03', 1, 0) "2003년도",
    decode(substr(hire_date, 1, 2), '04', 1, 0) "2004년도",
    decode(substr(hire_date, 1, 2), '05', 1, 0) "2005년도",
    decode(substr(hire_date, 1, 2), '06', 1, 0) "2006년도"
from employees;

select
    sum(decode(substr(hire_date, 1, 2), '02', 1, 0)) "2002년도",
    sum(decode(substr(hire_date, 1, 2), '03', 1, 0)) "2003년도",
    sum(decode(substr(hire_date, 1, 2), '04', 1, 0)) "2004년도",
    sum(decode(substr(hire_date, 1, 2), '05', 1, 0)) "2005년도",
    sum(decode(substr(hire_date, 1, 2), '06', 1, 0)) "2006년도"
from employees;

--[case]
select first_name,
    case 
        when job_id = 'IT_PROG' then '개발자'
        when job_id = 'SA_MAN' then '영업담당자'
        else '나머지' 
    end
from employees;
--회사에서 입사일에따라 퇴직금을 지급할려고 한다. 퇴직금을 구하시오.
-- 04년도 이전에 입사한 직원 : salary * 100
-- 04년도 ~ 06년도에 입사한 직원 : salary * 50
-- 07년도 이후에 입사한 직원 : salary * 20
select first_name, hire_date, salary,
        case
            when hire_date < '04/01/01' then salary * 100
            when hire_date < '07/01/01' then salary * 50
            else salary * 20
        end 퇴직금
from employees;

select * from tabs;
select * from employees;
select * from departments;
select * from locations;






















