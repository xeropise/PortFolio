CREATE SEQUENCE seq_users_user_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;



CREATE TABLE users ( 
	user_no			NUMERIC(5)		NOT NULL,
	user_id 			VARCHAR2(20)		UNIQUE,
	user_name 		VARCHAR2(50),		
	password 		VARCHAR2(20)		NOT NULL,
	role 			VARCHAR2(5)		DEFAULT 'user',
	profile 			VARCHAR2(100),
	birth			VARCHAR2(8),
	gender 			VARCHAR2(5),
	phone			VARCHAR2(13)		NOT NULL UNIQUE,
	email 			VARCHAR2(50)		 UNIQUE,
	addr 			VARCHAR2(100),
	like_genre1		VARCHAR2(50),
	like_genre2		VARCHAR2(50),
	like_genre3		VARCHAR2(50),
	like_theater1		VARCHAR2(50),
	like_theater2		VARCHAR2(50),
	like_theater3		VARCHAR2(50),
	user_date			TIMESTAMP,
	userbye_date		TIMESTAMP,
	identity 		 	NUMERIC(5),
	user_status		NUMERIC(5)		DEFAULT 1,
	user_grade		NUMERIC(5)		DEFAULT 0,
	total_point		NUMERIC(15),
	acc_point			NUMERIC(15),
	PRIMARY KEY(user_no)
);

DROP TABLE star_rating;
DROP TABLE movie_genre;
DROP TABLE wish;
DROP TABLE genre;
DROP TABLE movie;


DROP SEQUENCE seq_movie_movie_no;
DROP SEQUENCE seq_genre_genre_no;
DROP SEQUENCE seq_movie_genre_movie_genre_no;
DROP SEQUENCE seq_star_rating_star_rating_no;
DROP SEQUENCE seq_wish_wish_no;


CREATE SEQUENCE seq_movie_movie_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_genre_genre_no	   	
INCREMENT BY 1 START WITH 1 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_movie_genre_movie_genre_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_star_rating_star_rating_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_wish_wish_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;


CREATE TABLE movie (
		movie_no			NUMERIC(5)		NOT NULL,
		MOVIE_title			VARCHAR2(200)	NOT NULL,
		release_date		DATE		NOT NULL,
		kobis_code			VARCHAR2(20)		UNIQUE,
		naver_code			VARCHAR2(20)		UNIQUE,
		kmdb_code			VARCHAR2(20)		UNIQUE,
		movie_rating		NUMERIC(10),
		onBoxOffice_flag	NUMERIC(2),
		PRIMARY KEY(movie_no)
);

CREATE TABLE movie_genre(
	movie_genre_no		NUMERIC(5)		NOT NULL,
	movie_no			NUMERIC(5)		NOT NULL	REFERENCES MOVIE(movie_no),
	genre				VARCHAR2(30)	NOT NULL,
	PRIMARY	KEY(movie_genre_no)
);

CREATE TABLE star_rating(
	star_rating_no		NUMERIC(5)		NOT NULL,
	movie_no			NUMERIC(5)		NOT NULL REFERENCES MOVIE(movie_no),
	user_no				NUMERIC(5)		NOT NULL,
	star_rate			NUMERIC(10)		NOT NULL,
	rate_date			TIMESTAMP		NOT NULL,
	PRIMARY KEY(star_rating_no)
);

CREATE TABLE wish(
	wish_no			NUMERIC(5)		NOT NULL,
	movie_no		NUMERIC(5)		NOT NULL REFERENCES MOVIE(movie_no),
	user_no			NUMERIC(5)		NOT NULL,
	wish_date		TIMESTAMP		NOT NULL,
	PRIMARY	KEY(wish_no)
);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목', '2020-05-21', NULL, NULL, '111111', 0, NULL);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목02', '2020-01-01', '11111', NULL, '555555', 0, NULL);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목03', '2020-02-11', NULL, '11111', NULL, 0, NULL);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목04', '2020-01-17', NULL, NULL, '222222', 0, 1);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목05', '2020-11-01', '222222', NULL, '33333', 0, 1);

INSERT INTO movie
VALUES(seq_movie_movie_no.nextval, '시험용 영화제목06', '2020-12-02', NULL, '222222', NULL, 0, 1);


INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10000,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10000,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10000,
		'뮤지컬'				);

	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10001,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10001,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10002,
		'드라마'				);	
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10002,
		'액션'				);	

INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10002,
		'뮤지컬'				);	

	INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10003,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10003,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10003,
		'뮤지컬'				);

	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10004,
		'드라마'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10004,
		'액션'				);
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10005,
		'드라마'				);	
	
INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10005,
		'액션'				);	

INSERT
INTO movie_genre
VALUES(seq_movie_genre_movie_genre_no.nextval,
		10005,
		'뮤지컬'				);	

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 22222, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 33333, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 44444, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10000, 55555, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10003, 33333, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10003, 44444, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10003, 55555, SYSDATE);

INSERT
INTO WISH
VALUES(seq_wish_wish_no.nextval, 10004, 33333, SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 11111, 6,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 22222, 4,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 33333, 8,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10000, 44444, 2,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10002, 55555, 9,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10005, 44444, 2,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10005, 55555, 10,SYSDATE);

INSERT
INTO STAR_RATING
VALUES(seq_STAR_RATING_STAR_RATING_no.nextval, 10005, 33333, 1,SYSDATE);


COMMIT;

DROP TABLE ticketing;
DROP TABLE date_time;

DROP SEQUENCE seq_ticketing_ticketing_no;
DROP SEQUENCE seq_date_time_date_time_no;

CREATE SEQUENCE seq_ticketing_ticketing_no	   	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_date_time_date_time_no    INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;



CREATE TABLE date_time ( 
	date_time_no	 VARCHAR2(5)		 NOT NULL,
	movie_Name	 	 VARCHAR2(100) 	  NOT NULL,	
	franchise		 VARCHAR2(15) 		 NOT NULL,
	theater_name		 VARCHAR2(50)		 NOT NULL,
	screen_name  	 VARCHAR2(100)   NOT NULL,
	screen_date		 TIMESTAMP			 NOT NULL,
	screen_time		 TIMESTAMP			 NOT NULL,
	remaining_seat	 NUMERIC(5,0) DEFAULT 130,
	selected_Seat    VARCHAR2(1000),
	PRIMARY KEY(date_time_no)
);

CREATE TABLE ticketing ( 
	ticketing_no	 VARCHAR2(5)	 	NOT NULL,
	movie_Name 	 VARCHAR2(100)	 	NOT NULL,
	theater_name	 VARCHAR2(50)	  	NOT NULL, 
	date_time_no	 VARCHAR2(5)	 	NOT NULL REFERENCES date_time(date_time_no),
	audience_type	 VARCHAR2(300) 	 	NOT NULL,
	seat_type		 VARCHAR2(300)	 	NOT NULL,
	seat_no		 VARCHAR2(100)	 	NOT NULL,
	head_count	 NUMERIC(5,0)	 	NOT NULL,
	ticketing_price	 NUMERIC(15,0)	 	NOT NULL,
	ticketing_pin_no	 VARCHAR2(25)	 	NOT NULL,
	ticketer_phone	 VARCHAR2(15)	 	NOT NULL,
	ticketing_date	 TIMESTAMP	 		NOT NULL,
	cancel_date	 TIMESTAMP,
	ticketing_status	 NUMERIC(5,0) 		NOT NULL,
	PRIMARY KEY(ticketing_no)
);

set linesize 500;
set pagesize 500;

col  date_time_no for a15;
col  movie_Name for a30;
col  franchise for a15;
col  theater_name for a30;
col  screen_name for a18;
col  screen_date for a15;
col  screen_time for a15;
col  selected_Seat for a15;

commit;

CREATE SEQUENCE seq_product_prod_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE TABLE product (
	prod_no 	NUMERIC(5) 	NOT NULL,
	prod_name 	VARCHAR2(50),
	prod_date 	TIMESTAMP,
	prod_price 	NUMERIC(10),
	prod_detail	VARCHAR2(60),
	prod_image 	VARCHAR2(70),
	fran_type 	NUMERIC(5),
	prod_type 	NUMERIC(5),
	PRIMARY KEY(prod_no)
);

commit;

CREATE SEQUENCE seq_purchase_purchase_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE TABLE purchase (
purchase_no			NUMERIC(5)		NOT NULL,
user_no				NUMERIC(5)	NOT NULL REFERENCES users(user_no),
prod_no				NUMERIC(5)		NOT NULL REFERENCES product(prod_no),
purchase_status		NUMERIC(5),
purchase_price		NUMERIC(10),
purchase_date		TIMESTAMP,
rc_phone			NUMERIC(13)		NOT NULL UNIQUE,
rc_name				VARCHAR2(50),
message				VARCHAR2(100),
prod_pin_no			NUMERIC(5)		NOT NULL REFERENCES issued_prod(prod_pin_no),
PRIMARY KEY(purchase_no)
);

commit;

CREATE SEQUENCE seq_cart_cart_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE TABLE cart (
cart_no			NUMERIC(5)		NOT NULL,
user_no			NUMERIC(5)	NOT NULL REFERENCES users(user_no),
prod_no			NUMERIC(5)		NOT NULL REFERENCES product(prod_no),
quantity		NUMERIC(5),
cart_date		TIMESTAMP,	
PRIMARY KEY(cart_no)
);



commit;

CREATE SEQUENCE seq_issued_prod_prod_pin_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE TABLE issued_prod (
prod_pin_no		NUMERIC(5)		NOT NULL,
user_no			NUMERIC(5)	NOT NULL REFERENCES users(user_no),
owner_id		VARCHAR2(20),
prod_status		NUMERIC(5),
message			VARCHAR2(100),
issued_date		TIMESTAMP		NOT NULL,
used_date		TIMESTAMP,
sender_id		VARCHAR2(20),
used_status		NUMERIC(5)		DEFAULT 0,
PRIMARY KEY(prod_pin_no)
);

commit;

DROP TABLE quiz;
DROP TABLE preview;
DROP TABLE participation;


DROP SEQUENCE seq_quiz_quiz_no;
DROP SEQUENCE seq_preview_preview_no;
DROP SEQUENCE seq_participation_part_no;


CREATE SEQUENCE seq_quiz_quiz_no	   		INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_preview_preview_no     	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_participation_part_no   INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;


CREATE TABLE preview ( 
	preview_no		 NUMERIC(5)	 		NOT NULL,
	preview_name 	 VARCHAR2(120)	 	NOT NULL,
	preview_place	 VARCHAR2(100)	 	NOT NULL,
	preview_date	 TIMESTAMP 			NOT NULL,
	image_file	 	 VARCHAR2(4000) 	NOT NULL,
	start_date		 TIMESTAMP	 		NOT NULL,
	end_date		 TIMESTAMP	 		NOT NULL,
	winner_count 	 NUMERIC(3)	 		NOT NULL,
	winner_date	 	 TIMESTAMP	 		NOT NULL,
	preview_regdate	 TIMESTAMP	 		NOT NULL,
	preview_status	 NUMERIC(2)	 		DEFAULT 0,
	PRIMARY KEY(preview_no)
);

CREATE TABLE quiz ( 
	quiz_no			 NUMERIC(5)	 		NOT NULL,
	question		 VARCHAR2(500)	 	NOT NULL,
	option1			 VARCHAR2(200)	 	NOT NULL,
	option2			 VARCHAR2(200)	 	NOT NULL,
	option3	 		 VARCHAR2(200)	 	NOT NULL,
	option4			 VARCHAR2(200)		NOT NULL,
	answer			 NUMERIC(2)			NOT NULL,
	start_date	 	 TIMESTAMP	 		NOT NULL,
	end_date		 TIMESTAMP	 		NOT NULL,
	quiz_date		 TIMESTAMP	 		NOT NULL,
	quiz_status	     NUMERIC(2)		 	DEFAULT 0,
	PRIMARY KEY(quiz_no)
);

CREATE TABLE participation ( 
	part_no			 NUMERIC(5)	 		NOT NULL,
	quiz_no	 		 NUMERIC(5)	 		REFERENCES quiz(quiz_no),
	preview_no		 NUMERIC(5)	 		REFERENCES preview(preview_no),
	user_no			 NUMERIC(5)	 		REFERENCES users(user_no),
	part_type		 NUMERIC(1)	 		NOT NULL,
	winning_flag	 NUMERIC(2)	 		DEFAULT 0,
	part_date		 TIMESTAMP 			NOT NULL,
	PRIMARY KEY(part_no)
);

set linesize 500;
set pagesize 500;


INSERT INTO QUIZ
(QUIZ_NO, QUESTION, OPTION1, OPTION2, OPTION3, OPTION4, START_DATE, END_DATE, QUIZ_DATE, QUIZ_STATUS)
VALUES(10001, '내가 좋아하는 영화가 아닌것은?', '죽은 시인의 사회', '트루먼쇼', '인셉션', '앤트맨1', TIMESTAMP '2020-02-02 13:30:00.000000', TIMESTAMP '2020-02-19 13:30:00.000000', TIMESTAMP '2020-01-28 17:51:47.000000', 0);
INSERT INTO QUIZ
(QUIZ_NO, QUESTION, OPTION1, OPTION2, OPTION3, OPTION4, ANSWER, START_DATE, END_DATE, QUIZ_DATE, QUIZ_STATUS)
VALUES(10002, '내가 좋아하는 동물은?', '강아지', '고양이', '사자', '호랑이', 1, TIMESTAMP '2020-02-02 13:30:00.000000', TIMESTAMP '2020-02-19 13:30:00.000000', TIMESTAMP '2020-01-28 18:24:33.000000', 0);


INSERT INTO PREVIEW
VALUES(seq_preview_preview_no.nextval, '<수정된>시사회이름', '우리집', TIMESTAMP '2020-02-20 17:17:00.000000', 'ddddddddd.jpg', TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2030-03-15 15:30:00.000000', 30, TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2020-01-28 17:33:35.000000', 0);
INSERT INTO PREVIEW
VALUES(seq_preview_preview_no.nextval, '<니니>시사회', 'CGV강남', TIMESTAMP '2020-02-20 17:17:00.000000', 'ddddddddd.jpg', TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2030-03-15 15:30:00.000000', 30, TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2020-01-28 21:03:17.000000', 1);
INSERT INTO PREVIEW
VALUES(seq_preview_preview_no.nextval, '<야호야호>시사회', 'CGV운정', TIMESTAMP '2020-02-20 17:17:00.000000', 'ddddddddd.jpg', TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2030-03-15 15:30:00.000000', 30, TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2020-01-29 12:48:06.000000', 1);
INSERT INTO PREVIEW
VALUES(seq_preview_preview_no.nextval, '<비트캠프>시사회', 'CGV랄라', TIMESTAMP '2020-02-20 17:17:00.000000', 'ddddddddd.jpg', TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2030-03-15 15:30:00.000000', 30, TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2020-01-29 12:48:36.000000', 1);
INSERT INTO PREVIEW
VALUES(seq_preview_preview_no.nextval, '<인셉션>시사회', 'CGV홍대', TIMESTAMP '2020-02-20 17:17:00.000000', 'ddddddddd.jpg', TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2030-03-15 15:30:00.000000', 30, TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2020-01-28 17:37:49.485000', 0);
INSERT INTO PREVIEW
VALUES(seq_preview_preview_no.nextval, '<가나다라>시사회', 'CGV강남', TIMESTAMP '2020-02-20 17:17:00.000000', 'ddddddddd.jpg', TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2030-03-15 15:30:00.000000', 30, TIMESTAMP '2020-01-28 00:30:00.000000', TIMESTAMP '2020-01-28 17:38:04.139000', 1);



/*part_type이 1이면 시사회 이벤트 응모!*/
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10005, 10003, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10000, 10003, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10004, 10003, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10006, 10003, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10002, 10003, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10005, 10004, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10000, 10004, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10004, 10004, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10006, 10004, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10002, 10004, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10005, 10005, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10000, 10005, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10004, 10005, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10006, 10005, 1, sysdate);
INSERT INTO PARTICIPATION (PART_NO,  PREVIEW_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10002, 10005, 1, sysdate);




/*part_type이 0이면 퀴즈 참여!*/
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10001, 10003, 0, sysdate);
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10002, 10003, 0, sysdate);
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10001, 10004, 0, sysdate);
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10002, 10004, 0, sysdate);
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10001, 10005, 0, sysdate);
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10002, 10005, 0, sysdate);
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10001, 10006, 0, sysdate);
INSERT INTO PARTICIPATION (PART_NO, QUIZ_NO, USER_NO, PART_TYPE, PART_DATE) VALUES(seq_participation_part_no.NEXTVAL, 10002, 10006, 0, sysdate);

COMMIT;
