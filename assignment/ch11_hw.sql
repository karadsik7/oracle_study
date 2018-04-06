-- 1. Lion계정으로 테이블 6개 만들고 관계 형성 , 나머지 제약조건은 알아서
-- 2. 데이터를 임의로 집어넣고 join 연습
-- 테이블의 이름은 users(회원), product(상품), buy(구매내역), cart(장바구니)
-- kind of (상품 카테고리), color(상품 색상)
select * from tabs;

create table users(
    id varchar2(50) constraint users_id_pk primary key,
    name varchar2(50) constraint users_name_nn not null
);

-- 나중에 외래키화
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
insert into users values('abc', '홍길동');
insert into users values('def', '임꺽정');
insert into users values('brb', 'brbb');
--kindOf
insert into kindof values(1, '가전제품');
insert into kindof values(2, '생활용품');
insert into kindof values(3, '의류');
insert into kindof values(4, '식품');

--color
insert into color values(1, '기본');
insert into color values(2, '검정');
insert into color values(3, '빨강');
insert into color values(4, '파랑');
insert into color values(5, '노랑');

--product
insert into product values('노트북', 1600000, 1, 1);
insert into product values('스마트폰', 1050000, 1, 2);
insert into product values('TV', 2100000, 1, 4);
insert into product values('에어컨', 800000, 1, 1);
insert into product values('노트북-빨강', 1600000, 1, 3);

--buy
insert into buy values(1, 'abc', '노트북');
insert into buy values(2, 'def', '에어컨');
insert into buy values(3, 'brb', 'TV');
insert into buy values(4, 'abc', '스마트폰');

--cart
insert into cart values(1, 'abc', 'TV');
insert into cart values(2, 'def', '에어컨');

select * from users;
select * from product;
select * from buy;
select * from cart;
select * from kindOf;
select * from color;


-- 1. 어떤 회원이 구매한 상품의 이름과 색상
desc product;
desc color;
select pro.model, c.name from product pro, color c where pro.color_id = c.id;

-- 2. 어떤 회원이 장바구니에 담은 상품의 이름과 종류(카테고리)명
desc cart;
desc users;
desc kindof;
desc product;

select * from cart; 

select ca.users_id, ca.pro_mod, k.name from cart ca, kindof k, product pro where pro.kind_id = k.id and ca.pro_mod = pro.model;


-- 3. 빨간색 제품이 존재하는 상품 목록
desc color;
select * from color;
desc product;

select pro.model as "빨간색 상품" from product pro, color c where pro.color_id = c.id and c.id = 3;


-- 4. 종류명이 '가전제품'인 상품 목록
desc product;
desc kindof;
select pro.model from product pro, kindof k where pro.kind_id = k.id and k.id = 1;


-- 5. 특정이름의 상품을 구매한 회원들의 이름
desc users;
desc product;
desc buy;
select u.name from users u, buy b where b.users_id = u.id and b.pro_mod = '에어컨';



