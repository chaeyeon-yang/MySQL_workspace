create table db_addr (
	addr_id int primary key auto_increment,
    addr_name varchar(40),
    addr_detail varchar(40),
    cust_id varchar(10)
);

alter table db_addr add constraint foreign key(cust_id) references db_cust(id);

select * from db_addr;