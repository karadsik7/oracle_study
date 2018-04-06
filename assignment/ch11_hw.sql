-- 1. Lion�������� ���̺� 6�� ����� ���� ���� , ������ ���������� �˾Ƽ�
-- 2. �����͸� ���Ƿ� ����ְ� join ����
-- ���̺��� �̸��� users(ȸ��), product(��ǰ), buy(���ų���), cart(��ٱ���)
-- kind of (��ǰ ī�װ�), color(��ǰ ����)
select * from tabs;

create table users(
    id varchar2(50) constraint users_id_pk primary key,
    name varchar2(50) constraint users_name_nn not null
);

-- ���߿� �ܷ�Űȭ
create table product(
    model varchar2(50) constraint product_model_pk primary key,
    price number constraint product_price_nn not null,
    kind_id number,
    cart_id number
);
alter table product rename column cart_id to color_id;
alter table product add constraint product_toKindId_fk foreign key(kind_id)
references kindOf(id);
alter table product add constraint product_toColor_fk foreign key(color_id)
references color(id);

alter table product drop constraint product_toCartId_fk;

create table buy(
    id number constraint buy_id_pk primary key,
    users_id varchar2(50) constraint buy_toUsersId_fk references users(id),
    pro_mod varchar2(50) constraint buy_toProMod_fk references product(model)
);

create table cart(
    id number constraint cart_id_pk primary key,
    users_id varchar2(50) constraint cart_toUsersId_fk references users(id),
    pro_mod varchar2(50) constraint cart_toProMod_fk references product(model)
);

create table kindOf(
    id number constraint kindOf_pk primary key,
    name varchar2(50) constraint kindOf_name_nn not null
);

create table color(
    id number constraint color_pk primary key,
    name varchar2(50) unique
);



--users
insert into users values('abc', 'ȫ�浿');
insert into users values('def', '�Ӳ���');
insert into users values('brb', 'brbb');
--kindOf
insert into kindof values(1, '������ǰ');
insert into kindof values(2, '��Ȱ��ǰ');
insert into kindof values(3, '�Ƿ�');
insert into kindof values(4, '��ǰ');

--color
insert into color values(1, '�⺻');
insert into color values(2, '����');
insert into color values(3, '����');
insert into color values(4, '�Ķ�');
insert into color values(5, '���');

--product
insert into product values('��Ʈ��', 1600000, 1, 1);
insert into product values('����Ʈ��', 1050000, 1, 2);
insert into product values('TV', 2100000, 1, 4);
insert into product values('������', 800000, 1, 1);
insert into product values('��Ʈ��-����', 1600000, 1, 3);

--buy
insert into buy values(1, 'abc', '��Ʈ��');
insert into buy values(2, 'def', '������');
insert into buy values(3, 'brb', 'TV');
insert into buy values(4, 'abc', '����Ʈ��');

--cart
insert into cart values(1, 'abc', 'TV');
insert into cart values(2, 'def', '������');

select * from users;
select * from product;
select * from buy;
select * from cart;
select * from kindOf;
select * from color;


-- 1. � ȸ���� ������ ��ǰ�� �̸��� ����
desc product;
desc color;
select pro.model, c.name from product pro, color c where pro.color_id = c.id;

-- 2. � ȸ���� ��ٱ��Ͽ� ���� ��ǰ�� �̸��� ����(ī�װ�)��
desc cart;
desc users;
desc kindof;
desc product;

select * from cart; 

select ca.users_id, ca.pro_mod, k.name from cart ca, kindof k, product pro where pro.kind_id = k.id and ca.pro_mod = pro.model;


-- 3. ������ ��ǰ�� �����ϴ� ��ǰ ���
desc color;
select * from color;
desc product;

select pro.model as "������ ��ǰ" from product pro, color c where pro.color_id = c.id and c.id = 3;


-- 4. �������� '������ǰ'�� ��ǰ ���
desc product;
desc kindof;
select pro.model from product pro, kindof k where pro.kind_id = k.id and k.id = 1;


-- 5. Ư���̸��� ��ǰ�� ������ ȸ������ �̸�
desc users;
desc product;
desc buy;
select u.name from users u, buy b where b.users_id = u.id and b.pro_mod = '������';



