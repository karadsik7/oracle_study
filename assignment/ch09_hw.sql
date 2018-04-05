--사원명, 사원이 속한 부서명, 부서가 속한 도시명을 출력하되 조인을 사용하지 말고 subquery를 사용해서 출력하시오.

select first_name, department_name, city from employees, (select * from departments), (select * from locations);

--다음 두 쿼리는 같은 데이터를 출력한다. 두 쿼리를 비교할 때 어느 쿼리가 성능면에서 효율적인지를 판단하고 그 이유를 서술하세요.

select e.first_name, d.department_name from employees e, departments d 
    where e.department_id = d.department_id and d.department_id > 80;
    
--=> 우선 이 쿼리문은 테이블을 전부 불러온 후 where 절로 넘어가서 조인을하고 d의 id가 80이상을 찾아옴
    
select e.first_name, d.department_name from employees e, (select * from departments where department_id > 80) d 
    where e.department_id = d.department_id;
    
--=> 이 쿼리문은 e테이블과 서브쿼리를 사용해서 걸러진 테이블을 불러 온 후 조인을 했기 때문에 불러오는 정보의 양이 좀 더 적으므로
-- cpu의 처리량이 다소 줄어드는 효과가 있다


--사원테이블에서 부서별 급여가 가장 높은 사원의 이름과 급여와 부서아이디를 출력하세요.
select department_id, max(salary) from employees group by department_id;

select first_name, salary, department_id from employees 
    where salary in((select max(salary) from employees group by department_id));
    

select first_name, salary, department_id from (select max(salary) from employees group by department_id);
select * from jobs;
select * from employees;
--사원을 출력하는데 salary가 자기가 속한 부서의 최대값과 일치
select first_name, salary, department_id from employees 
where (select max(salary), department_id from employees group by department_id);



--dept테이블은 department_id가 10씩 증가하는 구조이다. 이 규칙을 깨뜨리지 않도록 빈칸을 채우시오. (계속사용이 가능한 쿼리여아만 함)
--insert into dept values (------------,'research and development', 200, 1500)
select * from dept;
insert into dept values((select max(department_id) from dept) + 10, 'research and development', 200, 1500);


--dept테이블은 department_id가 10씩 증가하는 구조이다. dept테이블에서 가장 최근에 추가된 두개의 튜플을 삭제하는 쿼리를 작성하시오.

delete from dept
where department_id = (select max(department_id) from dept) or department_id = (select max(department_id) from dept) - 10;



