create table member(
	member_num int not null auto_increment,
	nickname varchar(10) not null,
	email varchar(15) not null,
	number varchar(30) not null,
	passwd varchar(30) not null,
	admin_auth int(0) not null,
	point int(0),
	reg_date timestamp default current_timestamp,
	primary key(member_num, email)
);

/* 테이블 검색 */
show tables;

/* member 테이블 검색 */
select * from member;

/* member 테이블 삭제 */
drop table member;