use shopdb;

create table db_cust (
	id varchar(10) primary key,
    pwd varchar(20),
    name varchar(10)
);
insert into db_cust values("id01","pwd05","dday6");
insert into db_cust values("id02","pwd06","dowoon");

insert into db_cust values("id03","pwd07","wonpil");

-- 암호화를 위해 저장 한도를 넓힌다.
alter table db_cust modify column pwd varchar(60);
desc db_cust;

SELECT * FROM db_cust;
