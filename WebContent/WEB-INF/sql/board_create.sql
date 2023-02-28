create table board(
	board_num int primary key not null auto_increment,
	email varchar(30) not null,
	nickname varchar(15) not null,
	title varchar(15) not null,
	category varchar(20) not null,
	content varchar(300) not null,
	viewer int not null,
	flag varchar(30) not null,
	point int not null,
	reg_date timestamp default current_timestamp
);

/* ���̺� �˻� */
show tables;

/* board ���̺� �˻� */
select * from board;

/* board ���̺� ���� */
drop table board;