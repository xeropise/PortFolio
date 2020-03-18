DROP TABLE cart;
DROP TABLE inventory;
DROP TABLE product;
DROP TABLE purchase;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_cart_cart_no;
DROP SEQUENCE seq_purchase_purchase_no;
DROP SEQUENCE seq_inventory_inventory_no;

CREATE SEQUENCE seq_product_prod_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE SEQUENCE seq_cart_cart_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE SEQUENCE seq_purchase_purchase_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE SEQUENCE seq_inventory_inventory_no INCREMENT BY 1 START WITH 10000 MAXVALUE 99999
NOCACHE;

CREATE TABLE product (
	prod_no 	NUMERIC(5) 	NOT NULL,
	prod_name 	VARCHAR2(50),
	prod_date 	TIMESTAMP,
	prod_price 	NUMERIC(10),
	prod_detail	 VARCHAR2(60),
	prod_image 	VARCHAR2(100),
	fran_type 	NUMERIC(5),
	prod_type 	NUMERIC(5),
	quantity   	NUMERIC(5),
	PRIMARY KEY(prod_no)
);

CREATE TABLE cart (
	cart_no		 		 NUMERIC(5)	 	NOT NULL,
	cart_user_no  	 	 NUMERIC(5)	 	NOT NULL REFERENCES users(user_no),
	cart_prod_no 		 NUMERIC(5) 	NOT NULL,
	card_prod_quantity   NUMERIC(5)     NOT NULL,
	cart_reg_date 		 TIMESTAMP        NOT NULL,	
PRIMARY KEY(cart_no)
);

CREATE TABLE purchase (
	purchase_no	 		NUMERIC(5)	 	NOT NULL,
	purchase_user_no 		NUMERIC(5)	 	NOT NULL REFERENCES users(user_no),
	purchase_product_No 		    VARCHAR(1000) 	NOT NULL,
	purchase_product_Quantity 	VARCHAR(500)     NOT NULL,
	purchase_Status 		NUMERIC(3)      NOT NULL,
	purchase_Price 		NUMERIC(13)	  	NOT NULL,
	purchase_Date 		TIMESTAMP 		NOT NULL,
	cancel_Date		    TIMESTAMP,
PRIMARY KEY(purchase_no)
);

CREATE TABLE inventory (
	inventory_no	 	 	 NUMERIC(5) 	NOT NULL,
	inventory_user_no 	  	 NUMERIC(5)	 	NOT NULL REFERENCES users(user_no),
	inventory_prod_no 	  	 NUMERIC(5)	 	NOT NULL REFERENCES product(prod_no),
	inventory_purchase_no    NUMERIC(5)   	NOT NULL REFERENCES purchase(purchase_no),
	inventory_prod_pin_no    VARCHAR(25),
	inventory_reg_date       TIMESTAMP 		NOT NULL,
	inventory_used_date      TIMESTAMP, 
	inventory_status         VARCHAR(5)     NOT NULL,
PRIMARY KEY(inventory_no)
);

commit;
	
col purchase_Date for a15 		
col receiver_phone for a15 		
col receiver_name for a15    
col sender_message	 for a15



INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '5천원권', SYSTIMESTAMP , 5000 , '5천원권', 'ocheonwon.png', 0, 0 ,null); 

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '1만원권', SYSTIMESTAMP , 10000 , '1만원권', 'manwwon.png', 0, 1 ,null);



INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '블루베리에이드(L)', SYSTIMESTAMP , 4500 , '블루베리에이드(L)', 'cgv_bluebarry.jpg', 0, 2 ,null);


INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '콜라(L)', SYSTIMESTAMP , 2700 , '탄산음료(L)', 'cgv_colra.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '콜라(M)', SYSTIMESTAMP , 2200 , '탄산음료(M)', 'cgv_colraM.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '아메리카노(HOT)', SYSTIMESTAMP , 3500 , '아메리카노(HOT)', 'cgv_iceam.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '자몽에이드(L)', SYSTIMESTAMP , 4500 , '자몽에이드(L)', 'cgv_jamong.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '달콤팝콘(L)', SYSTIMESTAMP , 6000 , '달콤팝콘(L)', 'cgv_dalcom.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '달콤팝콘(M)', SYSTIMESTAMP , 5500 , '달콤팝콘(M)', 'cgv_dalcomM.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '더블치즈팝콘(L)', SYSTIMESTAMP , 6000 , '더블치즈팝콘(L)', 'cgv_doublecheeze.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '더블치즈팝콘(M)', SYSTIMESTAMP , 5500 , '더블치즈팝콘(M)', 'cgv_doublecheezeM.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '더블초콜렛 팝콘(L)', SYSTIMESTAMP , 6500 , '더블초콜렛 팝콘(L)', 'cgv_doublechoco.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '더블초콜렛 팝콘(M)', SYSTIMESTAMP , 5000 , '더블초콜렛 팝콘(M)', 'cgv_doublechocoM.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '크리미갈릭핫도그', SYSTIMESTAMP , 4500 , '크리미갈릭핫도그', 'cgv_garic.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '고소팝콘(L)', SYSTIMESTAMP , 5000 , '고소팝콘(L)', 'cgv_goso.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '고소팝콘(M)', SYSTIMESTAMP , 4500 , '고소팝콘(M)', 'cgv_gosoM.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '죠스튀김범벅', SYSTIMESTAMP , 4500 , '죠스튀김범벅', 'cgv_jouse.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '맛밤', SYSTIMESTAMP , 3500 , '맛밤', 'cgv_mocbom.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '칠리치즈나쵸', SYSTIMESTAMP , 4500 , '칠리치즈나쵸', 'cgv_nacho.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '플레인핫도그', SYSTIMESTAMP , 4000 , '플레인핫도그', 'cgv_plain.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '스위트랜치 팝콘(L)', SYSTIMESTAMP , 6500 , '스위트랜치 팝콘(L)', 'cgv_realcheeze.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '스위트랜치 팝콘(M)', SYSTIMESTAMP , 5000 , '스위트랜치 팝콘(M)', 'cgv_realcheezeM.jpg', 0, 2 ,null);

INSERT INTO product 
VALUES ( seq_product_prod_no.NEXTVAL , '스쿨푸드 스팸계란말이', SYSTIMESTAMP , 4500 , '스쿨푸드 스팸계란말이', 'cgv_schoolfood.jpg', 0, 2 ,null);

commit;
