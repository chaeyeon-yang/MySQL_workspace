drop table if exists db_item;
CREATE TABLE db_item (
	item_id int primary key auto_increment,
    item_name varchar(20),
    item_price long,
    img_name varchar(30),
    reg_date date,
    update_date date
);

INSERT INTO db_item VALUES (0, "Pants", 10000,"pant img", NOW(), NOW());
SELECT * FROM db_item;
set sql_safe_updates = 0;