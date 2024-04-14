
create table db_comment (
	comment_id int primary key auto_increment,
    cust_id varchar(40),
    comment_content varchar(1000),
    comment_regdate datetime,
    comment_update datetime,
    board_id int
);

# comment_of_parent .. 대댓글

alter table db_comment add constraint foreign key(cust_id) references db_cust(id);
alter table db_comment add constraint foreign key(board_id) references db_board(board_id);

select * from db_comment;
select * from db_board;

#comment_id

select b.*, (select count(*) from db_comment where board_id=b.board_id) as comment_cnt from db_board b;

select *, c.cust_id as a from db_board b 
left join db_comment c
on b.board_id = c.board_id
where b.board_id=3;

