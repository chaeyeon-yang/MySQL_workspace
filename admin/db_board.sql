create table db_board (
	board_id int primary key auto_increment,
    cust_id varchar(40),
    board_title varchar(40),
    board_content varchar(1000),
    board_regdate datetime,
    board_update datetime,
    board_cnt int
);

alter table db_board add constraint foreign key(cust_id) references db_cust(id);

select * from db_board;

update db_board set board_cnt = board_cnt +1
where board_id = 3;

select * from db_board order by board_cnt desc limit 3;