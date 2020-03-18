
DROP TABLE participation;
DROP TABLE quiz;
DROP TABLE preview;

commit;

DROP SEQUENCE seq_participation_part_no;
DROP SEQUENCE seq_quiz_quiz_no;
DROP SEQUENCE seq_preview_preview_no;

commit;

CREATE SEQUENCE seq_participation_part_no   INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_quiz_quiz_no	   		INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_preview_preview_no     	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

commit;

CREATE TABLE preview ( 
	preview_no 		 NUMERIC(5)  		NOT NULL,
	preview_name  	 VARCHAR2(120) 	 	NOT NULL,
	preview_place 	 VARCHAR2(100) 	 	NOT NULL,
	preview_date 	 TIMESTAMP  		NOT NULL,
	image_file 	 	 VARCHAR2(4000)  	NOT NULL,
	start_date 		 TIMESTAMP 	 		NOT NULL,
	end_date 		 TIMESTAMP 	 		NOT NULL,
	winner_count  	 NUMERIC(3)	 		NOT NULL,
	winner_date  	 TIMESTAMP 	 		NOT NULL,
	preview_regdate  TIMESTAMP 	 		NOT NULL,
	preview_status 	 NUMERIC(2)  		DEFAULT 0,
	movie_no 		 NUMERIC(5),  
	PRIMARY KEY(preview_no)  
);

CREATE TABLE quiz ( 
	quiz_no 		 NUMERIC(5) 		NOT NULL,
	question 		 VARCHAR2(500) 	  	NOT NULL,
	option1 		 VARCHAR2(200) 	 	NOT NULL,
	option2 		 VARCHAR2(200) 	 	NOT NULL,
	option3  		 VARCHAR2(200) 	 	NOT NULL,
	option4 		 VARCHAR2(200) 		NOT NULL,
	answer 			 NUMERIC(2) 		NOT NULL,
	start_date 	 	 TIMESTAMP 	 		NOT NULL,
	quiz_date 		 TIMESTAMP 	 		NOT NULL,
	quiz_status      NUMERIC(2) 		DEFAULT 0,
	PRIMARY KEY(quiz_no)
);

CREATE TABLE participation ( 
	part_no  		 NUMERIC(5)  		NOT NULL, 
	quiz_no 	 	 NUMERIC(5)  		REFERENCES quiz(quiz_no) on delete cascade, 
	preview_no 		 NUMERIC(5)  		REFERENCES preview(preview_no) on delete cascade, 
	user_no	 		 NUMERIC(5)  		REFERENCES users(user_no) on delete cascade, 
	part_type 		 NUMERIC(1)  		NOT NULL, 
	winning_flag 	 NUMERIC(2)  		DEFAULT 0, 
	part_date 		 TIMESTAMP 			NOT NULL, 
	PRIMARY KEY(part_no)
);

set linesize 500;
set pagesize 500;

COMMIT;

INSERT INTO QUIZ
(QUIZ_NO, QUESTION, OPTION1, OPTION2, OPTION3, OPTION4, ANSWER, START_DATE, QUIZ_DATE, QUIZ_STATUS)
VALUES(seq_quiz_quiz_no.nextval, '다음 중 흑백판으로 개봉한 또는 개봉 예정인 영화가 아닌 것은?', '벌새', '기생충', '항거', '동주', 1, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)


INSERT INTO QUIZ
(QUIZ_NO, QUESTION, OPTION1, OPTION2, OPTION3, OPTION4, ANSWER, START_DATE, QUIZ_DATE, QUIZ_STATUS)
VALUES(seq_quiz_quiz_no.nextval, '영화 ‘수퍼 소닉’에서 세계정복을 꿈꾸는 천재 과학자 닥터 로보트닉을 분한 영화배우는?', '아담 샌들러', '짐캐리', '벤 스틸러', '아담 드바인', 2, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)


INSERT INTO QUIZ
(QUIZ_NO, QUESTION, OPTION1, OPTION2, OPTION3, OPTION4, ANSWER, START_DATE, QUIZ_DATE, QUIZ_STATUS)
VALUES(seq_quiz_quiz_no.nextval, '28년 전 첫사랑 때문에 절교한 두 남자 해효와 제문이 귀신 같은 여자 소담과 이곳을 여행하며 벌어지는 이야기를 다룬 영화는?', '오사카', '오키나와', '삿뽀로', '후쿠오카', 4, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)


INSERT INTO QUIZ 
VALUES(seq_quiz_quiz_no.nextval, '지난 12일에 개봉한 영화 수퍼 소닉은 1991년 발매된 이 게임을 기반으로 한 영화다. 이 게임은?', '소닉 더 그레이트', '소닉 더 퓨처', '소닉 더 수퍼', '소닉 더 헤지혹', 4, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)


INSERT INTO QUIZ 
VALUES(seq_quiz_quiz_no.nextval, '지푸라기라도 잡고 싶은 짐승들’에 출연하지 않는 배우는?', '정우성', '전도연', '윤여정', '이정재', 4, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)

INSERT INTO QUIZ 
VALUES(seq_quiz_quiz_no.nextval, '분노의 질주의 새로운 빌런이 공개됐다. WWE 슈퍼스타 이기도한 이 배우는?', '랜디 오튼', '브록 레스너', '바티스타', '존 시나', 4, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)


INSERT INTO QUIZ 
VALUES(seq_quiz_quiz_no.nextval, '영화 ‘기생충’이 오스카 레이스 막바지에 접어들었다. 제92회 아카데미 최고 영예상인 작품상 후보가 아닌 작품은?', '포드 V 페라리', '결혼 이야기', '겨울왕국2', '아이리시맨', 3, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)

INSERT INTO QUIZ 
VALUES(seq_quiz_quiz_no.nextval, '분노의 질주가 9탄으로 돌아온다! 이번 영화의 타이틀은?', '분노의 질주: 더 울트라', '분노의 질주: 더 라스트 드라이빙', '분노의 질주:더 얼티메이트', '분노의 질주: 더 그레이트', 3, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)

INSERT INTO QUIZ 
VALUES(seq_quiz_quiz_no.nextval, '영화 ‘조조 래빗’을 연출한 타이카 와이티티 감독이 연기에 도전해 화제를 모은다. 타이카 와이티티 감독이 연기한 인물은?', '처칠', '조조', '히틀러', '아인슈타인', 3, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)

INSERT INTO QUIZ 
VALUES(seq_quiz_quiz_no.nextval, '샘 멘데스 감독의 작품 1917에서 열연을 펼친 두 주연 배우 중, 드라마 왕좌의 게임에서 극중 심약한 왕자 토멘 바라테온을 연기한 배우는?', '조지 맥케이', '딘 찰스 채프먼', '로저 디킨', '베네딕트 컴버배치', 2, TIMESTAMP '2020-02-24 00:00:00.000000', sysdate, 0)



INSERT INTO MMM.PREVIEW
(PREVIEW_NO, PREVIEW_NAME, PREVIEW_PLACE, PREVIEW_DATE, IMAGE_FILE, START_DATE, END_DATE, WINNER_COUNT, WINNER_DATE, PREVIEW_REGDATE, PREVIEW_STATUS, MOVIE_NO)
VALUES(10004, '돌아온 ㅇㅇㅇㅇ시사회', 'CGV 송파', TIMESTAMP '2020-02-28 13:30:00.000000', 'http://file.koreafilm.or.kr/thm/02/00/05/47/tn_DPF020074.jpg', TIMESTAMP '2020-02-24 00:00:00.000000', TIMESTAMP '2020-02-25 00:00:00.000000', 2, TIMESTAMP '2020-02-26 00:00:00.000000', TIMESTAMP '2020-02-24 04:35:44.000000', 2, 10038);

INSERT INTO MMM.PREVIEW
(PREVIEW_NO, PREVIEW_NAME, PREVIEW_PLACE, PREVIEW_DATE, IMAGE_FILE, START_DATE, END_DATE, WINNER_COUNT, WINNER_DATE, PREVIEW_REGDATE, PREVIEW_STATUS, MOVIE_NO)
VALUES(10010, '테스트용', 'CGV 송파', TIMESTAMP '2020-02-28 13:30:00.000000', 'http://file.koreafilm.or.kr/thm/02/00/05/47/tn_DPF020074.jpg', TIMESTAMP '2020-02-24 00:00:00.000000', TIMESTAMP '2020-02-25 00:00:00.000000', 2, TIMESTAMP '2020-02-26 00:00:00.000000', TIMESTAMP '2020-02-24 04:35:44.000000',2, 10038);

INSERT INTO MMM.PREVIEW
(PREVIEW_NO, PREVIEW_NAME, PREVIEW_PLACE, PREVIEW_DATE, IMAGE_FILE, START_DATE, END_DATE, WINNER_COUNT, WINNER_DATE, PREVIEW_REGDATE, PREVIEW_STATUS, MOVIE_NO)
VALUES(10001, '돌아온 ㅇㅇㅇㅇ시사회', 'CGV 송파', TIMESTAMP '2020-02-28 13:30:00.000000', 'http://file.koreafilm.or.kr/thm/02/00/05/47/tn_DPF020074.jpg', TIMESTAMP '2020-02-24 00:00:00.000000', TIMESTAMP '2020-02-25 00:00:00.000000', 2, TIMESTAMP '2020-02-26 00:00:00.000000', TIMESTAMP '2020-02-24 04:35:44.000000', 2, 10038);

INSERT INTO MMM.PREVIEW
(PREVIEW_NO, PREVIEW_NAME, PREVIEW_PLACE, PREVIEW_DATE, IMAGE_FILE, START_DATE, END_DATE, WINNER_COUNT, WINNER_DATE, PREVIEW_REGDATE, PREVIEW_STATUS, MOVIE_NO)
VALUES(10010, '테스트용', 'CGV 송파', TIMESTAMP '2020-02-28 13:30:00.000000', 'http://file.koreafilm.or.kr/thm/02/00/05/47/tn_DPF020074.jpg', TIMESTAMP '2020-02-24 00:00:00.000000', TIMESTAMP '2020-02-25 00:00:00.000000', 2, TIMESTAMP '2020-02-26 00:00:00.000000', TIMESTAMP '2020-02-24 04:35:44.000000',2, 10038);

INSERT INTO MMM.PREVIEW
(PREVIEW_NO, PREVIEW_NAME, PREVIEW_PLACE, PREVIEW_DATE, IMAGE_FILE, START_DATE, END_DATE, WINNER_COUNT, WINNER_DATE, PREVIEW_REGDATE, PREVIEW_STATUS, MOVIE_NO)
VALUES(10005, '돌아온 ㅇㅇㅇㅇ시사회', 'CGV 송파', TIMESTAMP '2020-02-28 13:30:00.000000', 'http://file.koreafilm.or.kr/thm/02/00/05/47/tn_DPF020074.jpg', TIMESTAMP '2020-02-24 00:00:00.000000', TIMESTAMP '2020-02-25 00:00:00.000000', 2, TIMESTAMP '2020-02-26 00:00:00.000000', TIMESTAMP '2020-02-24 04:35:44.000000', 2, 10038);

INSERT INTO MMM.PREVIEW
(PREVIEW_NO, PREVIEW_NAME, PREVIEW_PLACE, PREVIEW_DATE, IMAGE_FILE, START_DATE, END_DATE, WINNER_COUNT, WINNER_DATE, PREVIEW_REGDATE, PREVIEW_STATUS, MOVIE_NO)
VALUES(10011, '테스트용', 'CGV 송파', TIMESTAMP '2020-02-28 13:30:00.000000', 'http://file.koreafilm.or.kr/thm/02/00/05/47/tn_DPF020074.jpg', TIMESTAMP '2020-02-24 00:00:00.000000', TIMESTAMP '2020-02-25 00:00:00.000000', 2, TIMESTAMP '2020-02-26 00:00:00.000000', TIMESTAMP '2020-02-24 04:35:44.000000',2, 10038);
