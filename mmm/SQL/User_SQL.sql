DROP TABLE users;

DROP SEQUENCE seq_users_user_no;


CREATE SEQUENCE seq_users_user_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;
 
CREATE TABLE users ( 
	user_no			 	NUMERIC(5)		 	NOT NULL, 
	user_id 		 	VARCHAR2(20)	 	UNIQUE, 
	user_name 		 	VARCHAR2(50),	 	 
	password 		 	VARCHAR2(100)	 	NOT NULL, 
	role 			 	VARCHAR2(10)	 	DEFAULT 'user', 
	profile 		 	VARCHAR2(100), 
	birth			 	VARCHAR2(10), 
	gender 			 	VARCHAR2(5), 
	phone			 	VARCHAR2(13) 		NOT NULL UNIQUE, 
	email 			 	VARCHAR2(50)  		UNIQUE,  
	like_genre1		 	VARCHAR2(50), 
	like_genre2		 	VARCHAR2(50), 
	like_genre3		 	VARCHAR2(50), 
	like_theater1	 	VARCHAR2(50), 
	like_theater2	 	VARCHAR2(50), 
	like_theater3	 	VARCHAR2(50), 
	user_date		 	TIMESTAMP, 
	user_bye_date	 	TIMESTAMP, 
	last_login_date	 	TIMESTAMP, 
	update_user_date 	TIMESTAMP, 
	update_pw_date	 	TIMESTAMP, 
	identity 		  	NUMERIC(5), 
	user_status		 	NUMERIC(5)	 		DEFAULT 1, 
	user_grade		 	NUMERIC(5)	 		DEFAULT 0, 
	total_point		 	NUMERIC(15)	 		DEFAULT 10, 
	acc_point		 	NUMERIC(15)	 		DEFAULT 10, 
	PRIMARY KEY(user_no)
);


--user 더미더미 dummy data

INSERT
	INTO users(user_no , user_id , user_name , password ,ROLE, birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'admin', 'admin', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba','admin', NULL,'M',01000000000, NULL,
				 '드라마','멜로/로맨스','액션','CGV 강남','롯데시네마 가산디지털','메가박스 강남', SYSTIMESTAMP ,0);

INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user01', '조규비', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'M','01011111111','jo@naver.com',
				 '드라마','멜로/로맨스','성인물(에로)','CGV 강남','롯데시네마 가산디지털','메가박스 강남', SYSTIMESTAMP ,0);
			
INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user02', '윤대권', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'M','01022222222','yun@naver.com',
			'액션','범죄','코미디','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);
			
INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user03', '허지행', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'M','01033333333','heo@naver.com',
				 '스릴러','SF','미스터리','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);
			
INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user04', '김수정', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'F','01044444444','kim@naver.com',
				'가족','판타지','애니메이션','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);

INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user05', '엄지민', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'F','01055555555','ohm@naver.com',
				 '공포(호러)','어드벤처','뮤지컬','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);
			

INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user06', '김솔희', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'F','01066666666',' sol@naver.com',
				 '다큐멘터리','사극','전쟁','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);
	
	
INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email  , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user07', '홍길동', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'M','01077777777','hong@naver.com',
			 '공포(호러)','어드벤처','뮤지컬','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);	
			
INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user08', '강샛별', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'F','01088888888','gang@naver.com',
				 '공포(호러)','어드벤처','뮤지컬','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);
			

INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user09', '전지현', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'F','01099999999','jeon@naver.com',
				 '공포(호러)','어드벤처','뮤지컬','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);
			
INSERT
	INTO users(user_no , user_id , user_name , password , birth , gender , phone , email , like_genre1 , 
				like_genre2 , like_genre3 , like_theater1 , like_theater2 , like_theater3 , user_date, identity)
	VALUES	( seq_users_user_no.NEXTVAL , 'user10', '차은우', '5a8ef7d08c184f726cf77577dce32119affd1a1f9284c3e906bb0b9cc11dd5ba', NULL,'F','01012121212','cha@naver.com',
				 '다큐멘터리','사극','전쟁','CGV 강남','메가박스 강남','메가박스 강남', SYSTIMESTAMP ,0);
			
commit;



