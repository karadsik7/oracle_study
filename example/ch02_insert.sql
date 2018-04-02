create table teacher(
    id number primary key,
    nickname VARCHAR2(20),
    name varchar2(20) not null,
    gender char(1) not null
);

desc teacher;

--[insert]

insert into teacher(id, nickname, name, gender) values(1, 'flynn', '�嵿��', 'm');

select * from teacher;

--�ǽ� : �ڽ��� ���̺� �����ϼ���

insert into teacher(nickname, gender, name, id) values('jang', 'm', '������', 2);
select * from teacher;

--�������� ���� - primary key
--�÷����� �����ϸ� ��� �÷����� �����ؾ��ϰ� ������ �������
insert into teacher values(2, 'hong', 'ȫ�浿', 'm');
insert into teacher values(3, 'hong', 'ȫ�浿', 'm');

--�������� ���� - not null
insert into teacher(id, nickname, gender) values(4, 'lim', 'm');
insert into teacher(id, name, gender) values(4, '�Ӳ���', 'm');

--�ڷ��� ����
insert into teacher values(5, 'lee', '�̼���', 'male');
insert into teacher values(5, 'lee', '�̼���', 'm');

--�ǽ� : ������ ���̺� ����

insert into teacher(id, nickname, name, gender) values(6, 'gang', '������', 'm');
insert into teacher values(7, 'sejong', '�������', 'm');

