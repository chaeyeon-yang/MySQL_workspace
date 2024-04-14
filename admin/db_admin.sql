create table admin_role (
	role_id int primary key auto_increment,
    role_name varchar(40)
);

insert into admin_role (role_name) values ("superadmin");
insert into admin_role (role_name) values ("opadmin");
insert into admin_role (role_name) values ("monitoradmin");

select * from admin_role;

create table admin_user (
	id varchar(30) primary key, 
    pwd varchar(50),
    arole int 
);

alter table admin_user add constraint foreign key(arole) references admin_role(role_id);

insert into admin_user values('sadmin', '111111', 1);
insert into admin_user values("oadmin",'111111',2);
insert into admin_user values("madmin",'111111',3);

select * from admin_user;