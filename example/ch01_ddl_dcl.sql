--사용자 락 해제
alter user hr account unlock;

--사용자 비밀번호 변경
alter user hr identified by 1111;

--사용자 생성 + 비밀번호 지정
create user tiger identified by 1111;

--사용자에게 권한 부여
--grant 권한명[, 권한명 ...] to 사용자명
--(대괄호는 붙여도되고 안붙여도 된다는 뜻) 
grant create user, drop user to tiger;

--사용자에게 권한 박탈
--revoke 권한명[, 권한명 ...] to 사용자명

revoke drop user, create user from tiger;
 
--권한 종류
select * from dba_sys_privs;

--사용자에게 롤 부여(모든 권한)
grant dba to tiger;

--사용자에게 롤 박탈
revoke dba from tiger;

--사용자 삭제
--drop user 사용자명

drop user tiger;












