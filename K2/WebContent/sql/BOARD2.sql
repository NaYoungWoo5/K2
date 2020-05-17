CREATE TABLE BOARD2(
	idx number primary key not null,
	title varchar2(20) not null,
	writer varchar2(20) not null,
	content varchar2(20) not null
);
SELECT * FROM BOARD2

insert into BOARD2(idx, title, writer, content)
VALUES(board2_seq.NEXTVAL,'a','a','a');

DROP TABLE BOARD2;

CREATE SEQUENCE board2_seq START WITH 1 INCREMENT BY 1;

DROP SEQUENCE board2_seq;