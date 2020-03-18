DROP TABLE pointt;
DROP TABLE payment;


DROP SEQUENCE seq_pointt_point_no;
DROP SEQUENCE seq_payment_payment_no;

CREATE SEQUENCE seq_payment_payment_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE SEQUENCE seq_pointt_point_no	   	
INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

CREATE TABLE payment (
		payment_no	 	 	NUMERIC(5)	 	NOT NULL, 
		user_no		 	 	NUMERIC(5)	 	NOT NULL, 
		impUid		 	 	VARCHAR(20)	 	NOT NULL, 
		ticketing_no 	 	NUMERIC(5)	 	UNIQUE, 
		purchase_no	 	 	NUMERIC(5)	 	UNIQUE, 
		pay_status	 	 	NUMERIC(2) 	 	DEFAULT 0, 
		pay_method	 	 	NUMERIC(2)	 	NOT NULL, 
		pay_price	 	 	NUMERIC(20, 0) 	NOT NULL, 
		pay_date	 	 	Timestamp	 	NOT NULL, 
		cancel_date	 	 	Timestamp,  
		pay_Object_Flag 	NUMERIC(2)	 	NOT NULL, 
		cash	 			NUMERIC(20), 
		using_point 		NUMERIC(15, 0), 
		saving_point 		NUMERIC(15, 0), 
		using_first_prod_pin_no 	NUMERIC(25), 
		using_second_prod_pin_no  	NUMERIC(25), 
		using_third_prod_pin_no 	NUMERIC(25), 
		PRIMARY KEY(payment_no)
);
 

CREATE TABLE pointt (
		point_no 			NUMERIC(5) 		NOT NULL, 
		user_no 	 		NUMERIC(5) 		NOT NULL, 
		payment_no	 		NUMERIC(5) 		REFERENCES payment(payment_no), 
		point_status 		VARCHAR2(3) 	NOT NULL, 
		part_point	 		NUMERIC(20) 	NOT NULL, 
		point_date	 		Timestamp 		NOT NULL, 
		point_cancle_date 	Timestamp,  
		point_cancel_flag 	NUMERIC(3),  
		PRIMARY KEY(point_no)
);

COMMIT;


INSERT INTO PAYMENT
VALUES(seq_payment_payment_no.nextval, 11111, 10000, NULL, NULL,  0, 16000,  SYSDATE, NULL,0, 16000, NULL, 160, NULL, NULL, NULL);

INSERT INTO PAYMENT
VALUES(seq_payment_payment_no.nextval, 22222, 10001, NULL, NULL,  0, 8000, SYSDATE, NULL, 0,8000, NULL, 80, NULL, NULL, NULL);

INSERT INTO PAYMENT
VALUES(seq_payment_payment_no.nextval, 22222, 10002, 90001, NULL,  3, 6000, SYSDATE, NULL,2 , 6000, 2000, 60, NULL, NULL, NULL);

INSERT INTO PAYMENT
VALUES(seq_payment_payment_no.nextval, 33333, NULL, 90002, NULL,  2, 8000, SYSDATE, NULL,1 , 0, 0, 0, 9999988887777, NULL, NULL);

INSERT INTO PAYMENT
VALUES(seq_payment_payment_no.nextval, 33333, 10003, 90005, NULL,  6, 30000, SYSDATE, NULL,2 , 15000, 5000, 150, 9999988887577, 9999988887778, 9999988887770);


INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10000,	NULL, 's0',	10000000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10000,	NULL, 'u0',	-1000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10000,	NULL, 'u0',	-5000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10001,	NULL, 's0',	10000000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10001,	NULL, 'u0',	-1000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10001,	NULL, 'u0',	-5000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10002,	NULL, 's0',	10000000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10002,	NULL, 'u0',	-1000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10002,	NULL, 'u0',	-5000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10003,	NULL, 's0',	10000000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10003,	NULL, 'u0',	-1000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10003,	NULL, 'u0',	-5000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10004,	NULL, 's0',	10000000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10004,	NULL, 'u0',	-1000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10004,	NULL, 'u0',	-5000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10005,	NULL, 's0',	10000000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10005,	NULL, 'u0',	-1000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10005,	NULL, 'u0',	-5000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10006,	NULL, 's0',	10000000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10006,	NULL, 'u0',	-1000,	SYSDATE		);

INSERT INTO 
POINTT(point_no, USER_NO, PAYMENT_NO, POINT_STATUS, PART_POINT, POINT_DATE)
VALUES(seq_pointt_point_no.nextval, 10006,	NULL, 'u0',	-5000,	SYSDATE		);


COMMIT;


