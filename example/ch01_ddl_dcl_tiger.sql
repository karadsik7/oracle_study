--���̺� ����
--create table ���̺��( �÷��� �ڷ��� [��������], [�÷���....])
create table person(
    id number(2) primary key,
    name varchar2(20) not null
);

--���̺� �ο�(Ʃ��)��ȸ
select * from PERSON;

--���̺� �÷�(�Ӽ�)��ȸ
describe person;

--���̺� ����
--�÷� �߰�
-- alter table ���̺�� add �÷��� �ڷ���;
alter table person add birth date;
desc person;

--�÷��� ����
-- alter table ���̺�� rename column �÷Ÿ� to �����÷���;
alter table person rename column birth to birthday;

--�÷� �Ӽ�(�ڷ���, ��������) ����
--alter table ���̺�� modify �÷��� �ڷ���(byte) (null����)
alter table person modify name varchar2(30) null;

--�÷� ����
--alter table ���̺�� drop column �÷���;
alter table person drop column birthday;
desc person;

--���̺� ����
--drop table ���̺��;
drop table person;
desc person;

