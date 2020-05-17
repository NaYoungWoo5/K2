CREATE TABLE member(
	id varchar2(20) primary key not null,
	password varchar2(20) not null
);
SELECT * FROM member

insert into member(id, password, verifide)
VALUES('a','a','y');

insert into member(id, name, password)
VALUES('c','c','n');


DROP TABLE member;

ALTER TABLE member add(verifide number);

ALTER TABLE member add(verifide char(1));