------------------------------------------------------------ choco 데이터베이스 사용

use choco;

------------------------------------------------------------ 테이블 생성

create table user(
	user_no int auto_increment primary key,
    id varchar(100),
    password varchar(100),
    username varchar(100),
    email varchar(100)
);

create table cart(
	cart_no int auto_increment primary key,
    quantity int,
    cart_date date,
    user_no int,
    pd_no int,
    foreign key (user_no) references user(user_no),
    foreign key (pd_no) references product(pd_no)
);

create table user_order(
	order_no int auto_increment primary key,
    order_date date,
    pay_price int,
    pay_card varchar(100),
    sale_per int,
    order_price int,
    user_no int,
    foreign key (user_no) references user(user_no)
);

create table deli_address(
	address_no int auto_increment primary key,
    myaddress int,
    addr1 varchar(200),
    addr2 varchar(200),
    addr3 varchar(200),
    zipcode int,
    user_no int,
    foreign key (user_no) references user(user_no)
);

create table user_like(
	like_no int auto_increment primary key,
    like_date date,
    user_no int,
    pd_no int,
    foreign key (user_no) references user(user_no),
    foreign key (pd_no) references product(pd_no)
);

create table delivery(
	deli_no int auto_increment primary key,
    deli_start date,
    deli_end date,
    deli_check varchar(10),
    deli_name varchar(10),
    deli_phone varchar(20),
    order_no int,
    deli_comment varchar(400) default '문 앞에 두세요'
);

create table order_detail (
	order_detailno int auto_increment primary key,
    order_no int,
    pd_no int,
    pd_cnt int,
    pd_totalsum int
);

create table product (
	pd_no int auto_increment primary key,
    pd_name varchar(100),
    original_price int,
    price int,
    stock int,
    soldout int,
    cate_no int,
    receive_date date,
    img varchar(200)
);

create table category (
	cate_no int auto_increment primary key,
    brand varchar(30),
    pd_type varchar(30)
);



alter table delivery add constraint foreign key(order_no)
    references user_order(order_no) on update cascade;

alter table order_detail add constraint foreign key(order_no)
    references user_order(order_no) on update cascade;

alter table order_detail add constraint foreign key(pd_no)
    references product(pd_no);
    
alter table product add constraint foreign key(cate_no)
references category(cate_no);
alter table delivery modify column deli_name varchar(400);
alter table product modify column receive_date date;

------------------------------------------------------------ 데이터 삽입

insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (1, '2024-01-14', '2024-12-26', 'Vincenz Jentzsch', '996-635-4320', 1, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (2, '2024-03-06', '2025-04-23', 'Maximo Dybald', '759-238-1936', 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (3, '2023-06-10', '2025-01-03', 'Noam Cadney', '612-106-7258', 3, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (4, '2021-01-10', '2025-03-31', 'Grantham Barthelmes', '544-561-7075', 4, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (5, '2021-08-12', '2025-02-23', 'Giuseppe Pether', '900-228-7483', 5, 'In eleifend quam a odio.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (6, '2023-04-02', '2025-12-04', 'Nevsa Greene', '796-172-7491', 6, 'Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (7, '2022-10-29', '2025-02-06', 'Elwin Stennet', '183-254-0605', 7, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (8, '2022-02-01', '2024-10-12', 'Nikolai Thompsett', '891-698-7488', 8, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (9, '2021-01-12', '2026-02-08', 'Nertie Durand', '342-960-4991', 9, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (10, '2021-09-05', '2025-05-13', 'Reynold Munkley', '730-428-9922', 10, 'Proin eu mi.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (11, '2023-07-22', '2025-07-24', 'Louise Morgan', '974-891-8838', 11, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (12, '2022-04-24', '2025-06-02', 'Urbanus Siege', '180-272-3506', 12, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (13, '2021-02-28', '2025-10-13', 'Vasili Andreix', '385-447-8933', 13, 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (14, '2024-12-10', '2025-08-02', 'Nell Castenda', '561-905-9084', 14, 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (15, '2023-11-27', '2025-02-17', 'Felic Cheltnam', '642-760-1965', 15, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (16, '2023-07-03', '2025-02-14', 'Abbott Leverson', '603-642-3455', 16, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (17, '2024-01-16', '2024-09-22', 'Gaston Andreotti', '166-420-6531', 17, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (18, '2023-07-08', '2026-02-07', 'Fidelio Cawthra', '306-373-3262', 18, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (19, '2021-07-15', '2024-11-07', 'Tomkin Kleimt', '231-772-0635', 19, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (20, '2024-12-17', '2026-03-27', 'Ronald Jirieck', '506-443-1617', 20, 'Ut at dolor quis odio consequat varius. Integer ac leo.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (21, '2023-05-01', '2025-03-07', 'Kelli Cafe', '141-679-1238', 21, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (22, '2021-06-29', '2024-07-09', 'Sosanna Dudson', '348-812-1531', 22, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (23, '2021-03-20', '2025-05-07', 'Ed Lockner', '198-700-5592', 23, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (24, '2021-01-16', '2024-06-03', 'Chancey Hallwell', '524-483-8642', 24, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (25, '2024-08-23', '2024-12-31', 'Georgine Jellicorse', '552-195-5699', 25, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (26, '2022-01-05', '2024-07-23', 'Bevan Durston', '451-234-0053', 26, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (27, '2023-11-02', '2024-06-09', 'Rolando Varrow', '776-374-5250', 27, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (28, '2021-08-29', '2025-04-01', 'Esmaria Matley', '780-689-0765', 28, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (29, '2023-12-03', '2026-01-06', 'Barbabas Winterscale', '730-712-1875', 29, 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (30, '2021-08-22', '2025-03-24', 'Galvin Saywell', '160-290-3565', 30, 'Fusce consequat. Nulla nisl. Nunc nisl.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (31, '2021-12-06', '2025-05-27', 'Maxine Braithwaite', '382-899-8096', 31, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (32, '2023-02-21', '2025-09-06', 'Christina Mills', '203-815-4202', 32, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (33, '2021-09-16', '2026-02-06', 'Eleonora Aingell', '149-555-1174', 33, 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (34, '2022-04-24', '2024-05-07', 'Gallard Hufton', '287-450-8453', 34, 'Cras non velit nec nisi vulputate nonummy.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (35, '2021-02-08', '2025-10-13', 'Derek Swinford', '366-936-6654', 35, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (36, '2021-10-31', '2024-04-14', 'Barbee Tourle', '909-156-2053', 36, 'Suspendisse accumsan tortor quis turpis. Quisque id justo sit amet sapien dignissim vestibulum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (37, '2023-11-22', '2024-08-05', 'Neal Allbon', '803-487-7792', 37, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (38, '2023-04-22', '2026-01-14', 'Pammi Schuler', '702-898-0684', 38, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (39, '2021-03-20', '2024-11-06', 'Mirilla Mansell', '595-149-6143', 39, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (40, '2021-09-22', '2024-06-02', 'Sheryl Rame', '260-440-3377', 40, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (41, '2022-03-25', '2025-12-08', 'Akim Itter', '916-159-5559', 41, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (42, '2021-12-30', '2026-02-23', 'Silvester Revel', '676-232-2831', 42, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (43, '2024-05-13', '2025-06-18', 'Caleb Guyon', '837-354-1914', 43, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (44, '2024-11-19', '2026-04-08', 'Danny Sells', '521-722-7510', 44, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (45, '2021-02-26', '2025-12-31', 'Ganny Duester', '657-976-0052', 45, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (46, '2021-08-19', '2025-06-14', 'Carmelle Leaton', '228-744-8378', 46, 'Aenean lectus. Pellentesque eget nunc.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (47, '2021-06-16', '2025-05-24', 'Juliet MacNish', '294-515-3805', 47, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (48, '2022-04-15', '2025-10-04', 'Wadsworth Maffey', '529-790-5270', 48, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (49, '2024-01-12', '2025-12-01', 'Cornelle Davage', '612-275-4653', 49, 'Phasellus id sapien in sapien iaculis congue.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (50, '2021-12-19', '2025-11-14', 'Charlene Abercromby', '530-559-4952', 50, 'Proin eu mi.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (51, '2024-09-17', '2025-04-22', 'Claiborne Horribine', '212-464-4772', 51, 'Donec ut mauris eget massa tempor convallis. Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (52, '2022-07-31', '2024-10-25', 'Raffarty Oakenford', '575-609-5073', 52, 'Praesent lectus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (53, '2024-02-29', '2024-04-05', 'Ariel Tunnadine', '578-409-7083', 53, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (54, '2021-04-02', '2025-05-30', 'Linzy Stuttman', '399-838-2120', 54, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (55, '2022-07-02', '2024-08-21', 'Luciano Brack', '873-438-7014', 55, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (56, '2021-04-22', '2024-08-16', 'Rubie Dunkinson', '227-720-4415', 56, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (57, '2023-05-29', '2025-11-26', 'Julina Kochl', '247-585-3322', 57, ' Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (58, '2023-05-29', '2025-10-25', 'Farrah Anshell', '719-900-5594', 58, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (59, '2021-02-14', '2025-02-19', 'Nonnah Dammarell', '876-123-6558', 59, 'Donec dapibus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (60, '2023-11-16', '2025-11-28', 'Christiana Neeve', '860-160-3105', 60, 'Suspendisse potenti.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (61, '2023-06-03', '2025-11-19', 'Mariele Papez', '796-845-7011', 61, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (62, '2023-12-17', '2024-10-07', 'Alley Cerith', '704-294-2610', 62, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (63, '2021-07-11', '2025-12-01', 'Estel Scholar', '475-208-1374', 63, 'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (64, '2024-02-14', '2026-01-30', 'Nicolle Doniso', '806-973-1649', 64, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (65, '2023-09-13', '2024-08-07', 'Pace Halvosen', '186-194-4306', 65, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (66, '2024-10-30', '2025-11-17', 'Franky Corro', '164-273-2469', 66, 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (67, '2023-04-20', '2025-07-09', 'Alexa Buterton', '695-340-8129', 67, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (68, '2021-05-10', '2024-05-08', 'Gertrude Grenshiels', '277-348-8203', 68, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (69, '2024-01-30', '2025-04-18', 'Torr Seneschal', '767-602-2541', 69, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (70, '2022-09-01', '2024-12-12', 'Denyse MacArdle', '996-875-4576', 70, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (71, '2024-05-21', '2025-08-07', 'Reinaldo Farthing', '443-696-9461', 71, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (72, '2022-03-06', '2024-08-10', 'Emilee Scimoni', '939-140-3920', 72, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (73, '2022-01-11', '2024-08-01', 'Marya Zambon', '734-852-6688', 73, 'In sagittis dui vel nisl. Duis ac nibh.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (74, '2021-11-26', '2025-03-03', 'Reiko Zylberdik', '770-525-7759', 74, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (75, '2023-05-06', '2026-02-26', 'Lyn Trowsdale', '403-895-9947', 75, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (76, '2021-02-13', '2024-12-12', 'Millard Heinle', '343-588-6255', 76, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (77, '2021-10-23', '2026-04-18', 'Kitty Chatan', '582-764-4195', 77, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (78, '2022-12-11', '2025-02-01', 'Greer Studart', '591-916-7614', 78, 'Aliquam sit amet diam in magna bibendum imperdiet.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (79, '2022-09-03', '2025-10-09', 'Haleigh Ofer', '181-970-5753', 79, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (80, '2023-06-30', '2025-08-10', 'Tommi Izakov', '140-431-5238', 80, 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (81, '2021-03-29', '2026-04-21', 'Sean Jedrych', '324-711-5979', 81, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (82, '2021-06-30', '2025-03-09', 'Persis Brabben', '506-970-4892', 82, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (83, '2024-12-22', '2025-04-06', 'Fernando Berrey', '707-299-3010', 83, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (84, '2022-05-06', '2025-12-21', 'Harper Skirvin', '485-305-5715', 84, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (85, '2023-03-01', '2025-05-24', 'Selina Bailie', '716-169-5179', 85, 'In sagittis dui vel nisl. Duis ac nibh.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (86, '2023-04-23', '2026-04-23', 'Linc Espinazo', '988-517-1683', 86, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (87, '2022-04-14', '2024-06-17', 'Addi McDavitt', '965-365-8724', 87, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (88, '2022-01-27', '2025-08-16', 'Nanine Deshorts', '663-729-0349', 88, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (89, '2022-05-17', '2025-07-15', 'Antonietta Romain', '830-158-7873', 89, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (90, '2023-11-05', '2024-06-27', 'Ambrose Morstatt', '750-306-6692', 90, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (91, '2024-11-08', '2024-09-10', 'Dana Jesteco', '460-555-9605', 91, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (92, '2023-04-19', '2025-09-15', 'Rhonda Massy', '301-400-1852', 92, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (93, '2022-10-07', '2024-06-16', 'Fey Checcuzzi', '708-294-9629', 93, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (94, '2024-04-29', '2025-02-03', 'Layne Isacke', '444-700-4894', 94, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (95, '2024-06-23', '2026-02-03', 'Christos Pabel', '612-432-4762', 95, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (96, '2022-09-02', '2025-05-29', 'Panchito Schiesterl', '418-132-6304', 96, 'Nulla ut erat id mauris vulputate elementum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (97, '2024-08-24', '2025-10-10', 'Thaxter Loughrey', '773-874-8363', 97, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (98, '2022-09-04', '2025-12-23', 'Tierney Frisdick', '925-887-6232', 98, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (99, '2022-07-15', '2024-08-15', 'Ozzie Schubbert', '739-752-3056', 99, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.');
insert into delivery (deli_no, deli_start, deli_end, deli_name, deli_phone, order_no, deli_comment) values (100, '2023-07-13', '2025-11-01', 'Stu Saffrin', '602-512-6198', 100, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');

select * from user_order;
select * from delivery;
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (1, '2021-03-23', 854098, 50, 756057);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (2, '2024-08-30', 904639, 5, 18180);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (3, '2022-02-13', 58672, 35, 927721);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (4, '2023-11-24', 347988, 45, 327248);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (5, '2021-02-09', 439144, 27, 502771);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (6, '2021-12-17', 829228, 16, 370076);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (7, '2023-03-05', 866532, 10, 435205);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (8, '2022-08-20', 764659, 16, 509024);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (9, '2022-08-21', 835525, 37, 652775);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (10, '2023-09-28', 69001, 33, 446558);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (11, '2023-08-11', 497128, 36, 820358);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (12, '2021-07-20', 63558, 13, 663498);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (13, '2021-02-09', 15998, 6, 537687);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (14, '2022-04-30', 127253, 45, 422569);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (15, '2023-05-22', 640753, 15, 282018);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (16, '2023-08-23', 667396, 33, 712188);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (17, '2021-11-26', 323320, 40, 291843);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (18, '2022-10-04', 856630, 33, 922156);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (19, '2024-08-01', 542811, 11, 256746);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (20, '2024-05-15', 795630, 27, 836967);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (21, '2023-05-29', 175648, 6, 104012);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (22, '2023-11-07', 878784, 47, 145579);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (23, '2022-04-25', 344548, 37, 612095);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (24, '2024-12-19', 114737, 23, 456321);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (25, '2024-08-20', 768434, 2, 253560);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (26, '2023-09-17', 82929, 49, 633318);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (27, '2023-11-24', 285872, 11, 799943);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (28, '2024-11-10', 98194, 49, 723690);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (29, '2024-06-03', 664771, 14, 576377);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (30, '2022-07-20', 825903, 43, 40333);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (31, '2021-06-06', 311257, 11, 878040);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (32, '2023-12-14', 363277, 32, 287030);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (33, '2024-12-22', 449671, 35, 661243);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (34, '2022-06-09', 645077, 42, 866377);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (35, '2024-03-25', 119260, 40, 272062);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (36, '2022-03-16', 97976, 9, 913120);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (37, '2024-08-28', 93757, 6, 137620);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (38, '2022-06-17', 350304, 13, 401518);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (39, '2021-07-09', 634582, 42, 684228);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (40, '2024-04-08', 933267, 49, 623276);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (41, '2022-02-19', 731063, 34, 640750);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (42, '2022-11-08', 221509, 1, 648236);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (43, '2024-09-03', 925106, 11, 678616);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (44, '2024-02-07', 122969, 44, 288749);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (45, '2022-03-12', 605034, 40, 689945);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (46, '2021-01-25', 348674, 21, 623612);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (47, '2021-11-04', 94304, 41, 230696);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (48, '2021-05-13', 57023, 1, 853211);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (49, '2024-12-12', 322571, 11, 803386);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (50, '2024-07-19', 473980, 11, 519744);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (51, '2023-12-29', 749206, 48, 45926);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (52, '2023-07-19', 645581, 32, 798802);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (53, '2021-02-19', 45036, 29, 751819);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (54, '2024-09-12', 449184, 18, 851977);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (55, '2023-01-03', 714481, 3, 517213);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (56, '2024-03-29', 271163, 2, 971350);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (57, '2022-07-12', 439540, 21, 518010);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (58, '2022-11-08', 821706, 50, 354398);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (59, '2023-04-25', 943725, 45, 124087);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (60, '2023-02-25', 471966, 5, 680282);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (61, '2023-09-27', 23913, 2, 887409);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (62, '2021-08-25', 948676, 18, 855575);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (63, '2024-05-29', 201166, 33, 23807);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (64, '2021-04-10', 601896, 24, 838947);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (65, '2023-04-09', 148039, 20, 339546);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (66, '2021-04-09', 91755, 31, 277156);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (67, '2021-06-25', 678030, 34, 122778);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (68, '2024-02-27', 709795, 6, 202796);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (69, '2024-07-16', 565957, 10, 821912);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (70, '2024-03-30', 863436, 37, 783730);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (71, '2021-07-13', 511325, 26, 194783);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (72, '2021-05-10', 981988, 29, 647149);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (73, '2022-07-16', 842439, 29, 187731);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (74, '2024-05-04', 977107, 14, 839674);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (75, '2024-11-18', 985735, 13, 337432);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (76, '2022-05-14', 242497, 6, 429982);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (77, '2024-06-20', 254622, 1, 362033);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (78, '2021-07-18', 63446, 31, 580082);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (79, '2023-12-13', 985255, 33, 943647);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (80, '2024-11-18', 184238, 4, 889490);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (81, '2021-05-04', 615270, 46, 929912);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (82, '2021-06-01', 744374, 39, 362028);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (83, '2023-10-20', 313818, 33, 217354);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (84, '2024-07-03', 547619, 7, 718436);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (85, '2021-03-30', 675880, 32, 168799);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (86, '2023-04-12', 347022, 12, 72803);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (87, '2024-05-18', 590629, 31, 447110);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (88, '2022-03-31', 208918, 26, 269768);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (89, '2021-12-20', 463808, 27, 499523);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (90, '2023-07-20', 561899, 47, 11292);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (91, '2024-01-01', 813082, 12, 471105);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (92, '2023-04-16', 356899, 1, 528561);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (93, '2023-09-17', 232539, 33, 795977);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (94, '2021-07-24', 821754, 27, 298384);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (95, '2024-07-11', 592269, 50, 558296);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (96, '2023-12-03', 735438, 37, 451946);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (97, '2024-09-27', 182118, 20, 723572);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (98, '2024-11-06', 729136, 48, 210754);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (99, '2022-04-13', 444336, 41, 958673);
insert into user_order (user_no, order_date, pay_price, sale_per, order_price) values (100, '2022-11-04', 119946, 43, 799438);
rollback;
update product set pd_no = 14 where pd_no = 90;
update product set pd_no = 15 where pd_no = 91;
update product set pd_no = 16 where pd_no = 92;
update product set pd_no = 17 where pd_no = 93;
update product set pd_no = 18 where pd_no = 94;
update product set pd_no = 24 where pd_no = 112;
update product set pd_no = 25 where pd_no = 113;
update product set pd_name = '킨더 초콜릿 딥 다크맛 카카오 함류 96%' , original_price = 5300 , price = 5000 where pd_no = 11;

select * from product;
update user_order set pay_card = '우리카드' where order_no between 51 and 60;
update delivery set deli_check = 'Y' where deli_no between 1 and 5;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`choco`.`order_detail`, CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`pd_no`) REFERENCES `product` (`pd_no`))
select * from order_detail;
select * from product;
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (1, 50, 38, 1613, 431900);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (2, 36, 18, 286, 1719649);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (3, 34, 44, 517, 4716740);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (4, 50, 29, 1443, 6213246);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (5, 39, 3, 492, 1996839);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (6, 44, 4, 391, 8752498);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (7, 33, 43, 2103, 286747);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (8, 28, 47, 672, 5189636);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (9, 58, 57, 1278, 8698421);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (10, 13, 43, 50, 996432);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (11, 52, 14, 902, 6703261);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (12, 34, 10, 14, 7135107);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (13, 55, 34, 1174, 5508639);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (14, 46, 14, 379, 6349726);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (15, 49, 46, 122, 1883193);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (16, 30, 51, 2149, 687403);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (17, 13, 17, 1900, 5707513);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (18, 46, 49, 2047, 3445795);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (19, 39, 25, 2201, 8720835);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (20, 34, 50, 2983, 4692223);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (21, 53, 51, 454, 1615672);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (22, 7, 58, 2342, 377681);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (23, 10, 34, 2306, 5007106);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (24, 12, 51, 1051, 1878985);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (25, 24, 4, 2068, 1097728);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (26, 27, 57, 498, 255675);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (27, 37, 33, 2947, 132190);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (28, 13, 25, 2804, 3858883);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (29, 47, 47, 1381, 747721);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (30, 34, 24, 436, 8472133);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (31, 12, 44, 1889, 8381006);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (32, 24, 3, 144, 202598);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (33, 9, 10, 2526, 6528550);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (34, 8, 37, 1311, 8414145);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (35, 10, 46, 1644, 2263267);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (36, 52, 1, 1000, 1453037);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (37, 18, 21, 889, 3836044);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (38, 37, 19, 1532, 3128888);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (39, 1, 2, 282, 6389856);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (40, 4, 37, 1491, 8301404);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (41, 49, 31, 2844, 5438776);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (42, 54, 49, 1487, 3209929);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (43, 44, 7, 171, 3406452);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (44, 59, 25, 152, 2771962);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (45, 12, 6, 2109, 1939899);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (46, 11, 53, 2790, 2351428);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (47, 6, 15, 2607, 8975258);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (48, 22, 54, 1114, 7763736);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (49, 34, 33, 1197, 8177426);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (50, 6, 57, 820, 591275);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (51, 21, 3, 1743, 5355210);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (52, 53, 46, 1466, 4476723);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (53, 57, 44, 2178, 4807964);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (54, 17, 51, 1445, 4630715);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (55, 19, 24, 125, 1020885);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (56, 23, 37, 737, 2990443);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (57, 23, 6, 2760, 5312634);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (58, 26, 44, 947, 2088410);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (59, 28, 8, 2078, 1132058);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (60, 47, 45, 636, 4311519);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (61, 25, 25, 843, 6164590);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (62, 34, 47, 2933, 382562);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (63, 49, 8, 447, 8092228);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (64, 17, 51, 334, 5499008);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (65, 36, 56, 1713, 2244962);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (66, 6, 3, 1716, 7188643);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (67, 45, 6, 362, 4752104);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (68, 20, 44, 1631, 4560788);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (69, 12, 17, 2183, 7476312);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (70, 45, 51, 787, 666847);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (71, 30, 19, 2783, 1658225);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (72, 44, 38, 1979, 5664386);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (73, 38, 56, 2872, 3435731);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (74, 17, 23, 954, 4214684);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (75, 40, 54, 311, 3743799);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (76, 44, 51, 869, 8860541);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (77, 38, 12, 323, 8351720);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (78, 56, 8, 2653, 7600255);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (79, 5, 13, 1359, 1185411);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (80, 31, 60, 342, 200793);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (81, 48, 4, 44, 1580622);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (82, 13, 37, 1972, 806060);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (83, 21, 11, 2790, 4922709);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (84, 36, 30, 1043, 1482591);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (85, 53, 20, 1269, 6083416);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (86, 27, 9, 2533, 978630);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (87, 53, 46, 377, 8783895);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (88, 2, 58, 1285, 933434);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (89, 37, 18, 303, 1649267);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (90, 47, 23, 2464, 855685);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (91, 36, 20, 88, 1394730);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (92, 8, 33, 1066, 2512082);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (93, 53, 41, 1642, 3625213);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (94, 51, 22, 2413, 1456812);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (95, 21, 30, 812, 1692838);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (96, 48, 25, 1464, 1414412);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (97, 12, 40, 1610, 6188609);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (98, 40, 18, 1808, 1648982);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (99, 8, 59, 1417, 432997);
insert into order_detail (order_detailno, order_no, pd_no, pd_cnt, pd_totalsum) values (100, 11, 23, 71, 2125765);
select * from order_detail;
select * from category;
insert into category (brand, pd_type) values ('고디바', '생');
insert into category (brand, pd_type) values ('고디바', '밀크');
insert into category (brand, pd_type) values ('고디바', '다크');
insert into category (brand, pd_type) values ('고디바', '아몬드');
insert into category (brand, pd_type) values ('고디바', '화이트');
insert into category (brand, pd_type) values ('고디바', '카라멜');
delete from product where pd_no = 114;
select * from user;
select * from product;
insert into product(pd_no, pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
(30, '고디바 녹차 초콜릿', 8900, 11700, 52, 0, 58, '2022-02-02', 'data:image/jpeg;base64,/56VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('고디바 다크', 133000, 10900, 430, 0, 56, '2023-11-11', 'data:image/jpeg;base64,/2833VFdVsw//Z');

select * from user_like;
insert into user_like (like_date, user_no, pd_no) values
('2011-10-02', 1, 1);
insert into user_like (like_date, user_no, pd_no) values
('2023-12-12', 10, 21);
insert into user_like (like_date, user_no, pd_no) values
('2012-09-14', 32, 17);
insert into user_like (like_date, user_no, pd_no) values
('2011-05-08', 54, 11);
insert into user_like (like_date, user_no, pd_no) values
('2008-01-18', 33, 18);
insert into user_like (like_date, user_no, pd_no) values
('2002-11-13', 41, 9);
insert into user_like (like_date, user_no, pd_no) values
('2009-07-03' , 18, 3);
insert into user_like (like_date, user_no, pd_no) values
('2010-03-10', 29, 7);
insert into user_like (like_date, user_no, pd_no) values
('2023-12-19', 47, 7);
insert into user_like (like_date, user_no, pd_no) values
('2022-12-19', 12, 12);
insert into user_like (like_date, user_no, pd_no) values
('2012-10-16', 33, 8);
insert into user_like (like_date, user_no, pd_no) values
('2011-07-10', 48, 21);


---------------- 분석 ------------------



drop table deli_address;
drop table user_order;
select * from deli_address;
select * from user_order;
select * from user;
select * from cart;
select * from user_like;

insert into user(user_no, id, password, username, email) values (1,'gayoeeee', '009989', '전하렴', 'gayoeeee@gmail.com');

insert into user(id, password, username, email) values ('star123', '1823', '김성철', 'realstar@gmail.com'),
('rteow', 's213019', '최우식', 'ssrs@naver.com'),
('dori082', 'as1823!', '이도현', 'dori082@naver.com'),
('bradpitt', 'oror1021', '강영현','bradpitt@example.com'),
('tomhanks', 'zdzd112', '김원필', 'tomhanks@daum.co.kr'),
('rorolee','qwe09890','박성진','rorolee@gmail.com'),
('nothanks','aas121','윤도운','nothanks@naver.com'),
('cutegirl','1212','이지후','cutegirl@naver.com'),
('lovee','1223','양채연','lovvee@naver.com'),
('mylifegood','as23w','송강','mylifegood@naver.com'),
('gogo','ass!!!ew','황혜림','dd221@snu.ac.kr'),
('agbo','ggggsew','곽준영','agbo@gmail.com'),
('gogobaba','122121212','신지연','dd221@naver.com'),
('happyperson','090827','유다영','happyperson@naver.com'),
('goodtoyou','as083082','유민아','goodtoyou@naver.com'),
('hihi','hi0101','김민표','hihi@naver.com'),
('yubu','yubu0101','소지섭','yubu@naver.com'),
('happycat','assewhappycat','박보영','happycat@naver.com'),
('hihelloho','hihelloho0101','이다혜','hihelloho@naver.com'),
('cool','aascool121','이도연','cool@naver.com'),
('goodgilr','1211212','김민희','goodgilr@naver.com'),
('lovedobey','lovedobey12','이재준','lovedobey@naver.com'),
('gogogogogo','as23w1212','황행복','gogogogogo@naver.com'),
('software','asoftware12','유고리','software@snu.ac.kr'),
('hardware','hw123','임은상','hardware@gmail.com'),
('hahoragho','hahoragho12','전지현','hahoragho@naver.com'),
('hope123','hope123!!!','한가인','hope123@naver.com'),
('goat','as08308211','황광희','goat@naver.com'),
('hahaha','hahaha0101','조영광','hahaha@naver.com'),
('minsicklove','minsicklove123','오민식','minsicklove@naver.com'),
('really12','really12','박주영','really12@naver.com'),
('hohoho','hohoho111!!!','황희찬','hohoho@naver.com');

select * from category;
insert into category(brand, pd_type) values('킨더','밀크'),
('킨더','다크'),
('킨더','화이트'),
('킨더','카라멜'),
('킨더','생'),
('킨더','아몬드'),
('킨더','녹차'),
('킨더','헤이즐넛'),
-- 9
('로이스','밀크'),
('로이스','다크'),
('로이스','화이트'),
('로이스','카라멜'),
('로이스','생'),
('로이스','아몬드'),
('로이스','녹차'),
('로이스','헤이즐넛'),
-- 17
('가나','밀크'), 
('가나','다크'),
('가나','화이트'),
('가나','카라멜'),
('가나','생'),
('가나','아몬드'),
('가나','녹차'),
('가나','헤이즐넛'),
-- 25
('허쉬','밀크'),
('허쉬','다크'),
('허쉬','화이트'),
('허쉬','카라멜'),
('허쉬','생'),
('허쉬','아몬드'),
('허쉬','녹차'),
('허쉬','헤이즐넛'),
('트윅스','아몬드'),
('트윅스','카라멜'),
('스니커즈','아몬드'),
('스니커즈','카라멜'),
('스니커즈','헤이즐넛'),
('스니커즈','녹차'),
('휘태커스','밀크'),
('휘태커스','다크'),
('휘태커스','화이트'),
('휘태커스','카라멜'),
('휘태커스','생'),
('휘태커스','아몬드'),
('휘태커스','녹차'),
('휘태커스','카라멜');

select * from category;
select * from product;
-- Error Code: 1370. execute command denied to user 'user03'@'%' for routine 'date.now'
-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'nsert into product(pd_name, original_price, price, stock, soldout, cate_no, rece' at line 1
-- Error Code: 1264. Out of range value for column 'receive_date' at row 1
-- Error Code: 1265. Data truncated for column 'receive_date' at row 1


insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('휘태커스 카라멜 초콜릿', 2500, 2000, 78, 0, 46, '2020-08-27', 'data:image/jpeg;base64,/lopop//Z'),
('휘태커스 녹차 초콜릿', 2500, 2200, 100, 0, 45, '2024-01-11', 'data:image/jpeg;base64,/9VFdVsw//Z'),
('휘태커스 아몬드 초콜릿', 3900, 3800, 20, 0, 44, '2024-01-23', 'data:image/jpeg;base64,/9VFdVsw//Z'),
('휘태커스 생 초콜릿', 2500, 2100, 10, 0, 43, '2024-02-11', 'data:image/jpeg;base64,/9VFdVsw//Z'),
('휘태커스 밀크 초콜릿', 3500, 2900, 728, 0, 39, '2024-02-11', 'data:image/jpeg;base64,/dsfdsfFdVsw//Z'),
('휘태커스 다크 초콜릿', 2500, 2500, 23, 1, 40, '2023-12-11', 'data:image/jpeg;base64,/9ddVFdVsw//Z');

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('킨더 초콜릿 밀크맛', 4500, 4500, 180, 0, 1, NOW(), 'data:image/jpeg;base64,/9VFdVsw//Z');

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('킨더 초콜릿 딥 다크맛 카카오 함류 98%', 3500, 2700, 38, 0, 2, NOW(), 'data:image/jpeg;base64,/kokodVsw//Z'); 
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('킨더 초콜릿 딥 다크맛 카카오 함류 94%', 3000, 3000, 98, 0, 2, NOW(), 'data:image/jpeg;base64,/9VFdVsw//Z');

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('가나 milk 초콜릿', 1500, 1500, 238, 0, 17, NOW(), 'data:image/jpeg;base64,/9VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('가나 dark 초콜릿', 1500, 1500, 9, 0, 18, NOW(), 'data:image/jpeg;base64,/kokodVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('hush 화이트 쿠앤트 맛', 5500, 2700, 318, 0, 27, NOW(), 'data:image/jpeg;base64,/9VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('hush 다크 초콜릿', 3000, 2900, 198, 1, 26, NOW(), 'data:image/jpeg;base64,/9VFdVsw//Z');

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('hush amond 초콜릿', 7000, 7000, 838, 0, 40, '2023-12-11', 'data:image/jpeg;base64,/9VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('hush milk lovely 초콜릿', 2800, 2600, 120, 0, 26, NOW(), 'data:image/jpeg;base64,/9VFdVsw//Z');

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('로이스 생초콜릿 2종 묶음', 8500, 8000, 318, 0, 13, NOW(), 'data:image/jpeg;base64,/9VFdVsw//Z');

select * from product;

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('ROYCE 로이스 초콜릿 카라멜밀크 크리미', 7000, 7000, 68, 0, 20, '2023-04-28', 'data:image/jpeg;base64,/9VFdVsw//Z');
insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('로이스 퓨어 포콜릿 스위트앤 밀크', 2800, 2600, 99, 0, 9, '2023-07-07', 'data:image/jpeg;base64,/9VFdVsw//Z');
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`choco`.`product`, CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cate_no`) REFERENCES `category` (`cate_no`))

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('ROYCE 로이스 초콜릿 말차', 3000, 2900, 190, 1, 15, '2023-10-19', 'data:image/jpeg;base64,/2922VFdVsw//Z');

insert into product(pd_name, original_price, price, stock, soldout, cate_no, receive_date, img) values
('twix 카라멜퐁당 3박스', 20000, 19000, 500, 1, 34, '2023-10-19', 'data:image/jpeg;base64,/2922VFdVsw//Z');


select * from deli_address;
select * from user;
insert into deli_address (myaddress, addr1, addr2, addr3, zipcode, user_no) values
(1, '서울시 서대문구','남가좌동','거북골로 33-21', 03665, 2);
insert into deli_address (myaddress, addr1, addr2, addr3, zipcode, user_no) values
(1, '서울시 마포구','서교동','와우산로 98-1', 09624, 1),
(1, '서울시 동작구','동작동','고리고로 97-91', 89665, 3);

insert into deli_address (myaddress, addr1, addr2, addr3, zipcode, user_no) values
(1, '서울시 마포구','서교동','와우산로 98-1', 09624, 5),
(1, '서울시 동작구','동작동','고리고로 97-91', 89665, 4),
(1, '수원시 영통구','이의동','에듀타운로 28-1', 03624, 9),
(0, '안산시 동구','하리동','그리로 56-91', 06350, 6),
(0, '군포시 하구','자리동','이리로 243-1', 29624, 7),
(1, '제주시 서귀포구','구동','고로 927-91', 88665, 8),
(1, '제주시 서귀포구','하로동','와로 18-1', 09684, 10),
(1, '부산시 서구','서일동','맘로 17-91', 19665, 12),
(1, '서울시 마포구','서교동','하이로 98-1', 09629, 11),
(0, '광주시 동명구','동명동','고고로 97-91', 00615, 23),
(1, '서울시 구로구','그리동','안드로메다로 298-1', 71624, 21),
(0, '서울시 종로구','호로동','호호로 197-1', 09665, 30),
(1, '수원시 팔달구','화라동','우산로 8-1', 34624, 34),
(0, '창원시 리리구','원필동','하고로 02-1', 89005, 40),
(0, '여수시 로구','교동','오산로 38-1', 09624, 51),
(1, '강릉시 순두부구','맛있동','꼭고로 72-91', 00665, 43),
(1, '여수시 하구','해동','데식로 938-1', 09024, 39),
(1, '사랑시 데식구','마이데이동','행복로 138-1', 02024, 37);
(1, '로로시','려로동','려림로 97-91', 81665, 44),
(1, '서울시 마포구','서교동','와로 9-1', 67624, 55),
(1, '안산시 호구','아니동','천재로 97-91', 89665, 54),
(1, '군포시 소구','도동','바보로 98-1', 99624,32),
(1, '서울시 동작구','동작동','바다의보배로 97-91', 10665, 33),
(1, '서울시 마포구','서교동','데이식스로 98-1', 11624, 19),
(1, '서울시 동작구','동작동','하피로 97-91', 11265, 20);

select * from user;
select * from cart;
select * from product;

insert into cart(quantity, cart_date, user_no, pd_no) values
(2, '2024-03-04',3,1);

insert into cart(quantity, cart_date, user_no, pd_no) values
(1, '2024-03-04',3, 2);

insert into cart(quantity, cart_date, user_no, pd_no) values
(5, '2024-03-01',2, 10),
(10, '2024-03-02',2, 13),
(2, '2024-03-14',10, 30),
(2, '2024-03-14',10,29),
(3, '2024-03-14',10, 28),
(4, '2024-02-28', 4, 23),
(1, '2024-01-19', 45, 18),
(2, '2023-12-31', 40, 6),
(2, '2023-12-31', 40, 7),
(20, '2023-08-31', 34, 13);

------------------------------------------------------------ 테이블 조회

select * from user;
select * from cart;
select * from user_order;
select * from product;
select * from order_detail;
select * from delivery;
select * from category;
select * from deli_address;

------------------------------------------------------------ 분석

-- 브랜드별 초콜릿 종류 개수
select brand, count(brand)
from category
group by brand;

# 배송완료된 고객 정보
select u.username, o.order_date, o.order_price, d.deli_name, d.deli_comment from user u , user_order o , delivery d
where u.user_no = o.user_no
and o.order_no = d.order_no
and d.deli_check = 'Y';

# 브랜드별 주문건수
select c.brand , count(c.brand) from user u , user_order o , order_detail d, product p, category c
where u.user_no = o.user_no
and o.order_no = d.order_no
and d.pd_no = p.pd_no
and p.cate_no = c.cate_no
group by c.brand;

# 종류별 주문금액
select c.pd_type , sum(d.pd_cnt*p.price*(o.sale_per*0.01)) as 종류별총주문금액_할인포함 from user u , user_order o , order_detail d, product p, category c
where u.user_no = o.user_no
and o.order_no = d.order_no
and d.pd_no = p.pd_no
and p.cate_no = c.cate_no
group by c.pd_type;

-- 특정 고객이 장바구니에 담은 상품 정보 출력
select u.username, p.pd_name, p.price, c.quantity
from cart c, user u, product p
where c.user_no = u.user_no and p.pd_no = c.pd_no and u.username='김성철';

-- 특정 고객이 장바구니의 제품 당 총 금액 조회
select u.username, p.pd_name, p.price, c.quantity, p.price*c.quantity as price_per_product 
from cart c, user u, product p
where c.user_no = u.user_no and p.pd_no = c.pd_no and u.username='김성철'
group by p.price, p.pd_name, p.price, c.quantity;


-- 특정 고객이 장바구니에 담은 제품의 전체 금액 조회
SELECT u.username 사용자명, SUM(p.price * c.quantity) AS 장바구니총금액
FROM cart c
JOIN user u ON c.user_no = u.user_no
JOIN product p ON p.pd_no = c.pd_no
WHERE u.username = '김성철'
GROUP BY u.username;


-- 찜한 것 중에 실제 주문한 제품 조회
SELECT d.order_no 주문번호, u.username 주문한_고객, p.pd_name 주문한_제품, c.brand 주문한_제품_브랜드, d.pd_cnt 주문_수량, d.pd_totalsum 주문_가격
FROM user_like l
JOIN product p ON l.pd_no = p.pd_no 
JOIN user u ON l.user_no = u.user_no
JOIN category c ON p.cate_no = c.cate_no
JOIN user_order o ON l.user_no = o.user_no
JOIN order_detail d ON o.order_no = d.order_no;