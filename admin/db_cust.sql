use shopdb;

create table db_cust (
	id varchar(10) primary key,
    pwd varchar(20),
    name varchar(10)
);
insert into db_cust values("id01","pwd05","dday6");
insert into db_cust values("id02","pwd06","dowoon");

insert into db_cust values("id03","pwd07","wonpil");
SELECT * FROM db_cust;
