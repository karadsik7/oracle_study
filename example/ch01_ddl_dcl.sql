--����� �� ����
alter user hr account unlock;

--����� ��й�ȣ ����
alter user hr identified by 1111;

--����� ���� + ��й�ȣ ����
create user tiger identified by 1111;

--����ڿ��� ���� �ο�
--grant ���Ѹ�[, ���Ѹ� ...] to ����ڸ�
--(���ȣ�� �ٿ����ǰ� �Ⱥٿ��� �ȴٴ� ��) 
grant create user, drop user to tiger;

--����ڿ��� ���� ��Ż
--revoke ���Ѹ�[, ���Ѹ� ...] to ����ڸ�

revoke drop user, create user from tiger;
 
--���� ����
select * from dba_sys_privs;

--����ڿ��� �� �ο�(��� ����)
grant dba to tiger;

--����ڿ��� �� ��Ż
revoke dba from tiger;

--����� ����
--drop user ����ڸ�

drop user tiger;












