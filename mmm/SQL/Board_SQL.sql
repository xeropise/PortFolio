DROP TABLE likee;
DROP TABLE commentt;
DROP TABLE article;

DROP SEQUENCE seq_likee_like_no;
DROP SEQUENCE seq_article_article_no;
DROP SEQUENCE seq_commentt_cmt_no;

commit;

CREATE SEQUENCE seq_likee_like_no 			INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_article_article_no	   	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;
CREATE SEQUENCE seq_commentt_cmt_no	    	INCREMENT BY 1 START WITH 10000 maxValue 99999 NOCACHE;

commit;

CREATE TABLE article ( 
	article_no		 NUMERIC(5)	 	NOT NULL,
	article_status 	 NUMERIC(1)	 		,
	article_type	 NUMERIC(1) 		, 
	category	 	 NUMERIC(1) 		,
	user_id		 	 VARCHAR(10)	 	REFERENCES users(user_id),
	sup_art_no		 NUMERIC(5) 		REFERENCES article(article_no),
	article_title	 VARCHAR2(1000),
	article_content	 VARCHAR2(4000),
	article_date	 TIMESTAMP,
	file_name		 VARCHAR2(4000),
	view_count		 NUMERIC(20),
	blind_flag		 NUMERIC(1),
	blind_reason	 NUMERIC(1),
	blind_date	 	 TIMESTAMP,
	delete_date		 TIMESTAMP,
	qna_status		 NUMERIC(1),
	PRIMARY KEY(article_no)
);


CREATE TABLE commentt( 
	cmt_no			 NUMERIC(5)	 	NOT NULL,
	cmt_type	 	 NUMERIC(1)	 	,
	user_id			 VARCHAR2(10) 		REFERENCES users(user_id), 
	sup_cmt_no		 NUMERIC(5) 		REFERENCES commentt(cmt_no),
	article_no		 NUMERIC(5)	 		,
	movie_no		 NUMERIC(5) 		REFERENCES movie(movie_no),
	cmt_content	 	 VARCHAR2(300),
	cmt_date		 TIMESTAMP,
	cmt_count		 NUMERIC(10),
	blind_flag		 NUMERIC(1),
	blind_reason	 NUMERIC(1),
	blind_date	 	 TIMESTAMP,
	PRIMARY KEY(cmt_no)
);



CREATE TABLE likee ( 
	like_no		 	NUMERIC(5) 	 	NOT NULL,
	user_id	 		VARCHAR2(10) 	NOT NULL REFERENCES users(user_id),
	article_no	 	NUMERIC(5) 	 	REFERENCES article(article_no),
	cmt_no		 	NUMERIC(5)  	REFERENCES commentt(cmt_no),		 
	ref_type	 	NUMERIC(1) 	 	,
	PRIMARY KEY(like_no)
);


commit;


===========ASK article================================
### category 1 .. 예매/매표 ####
insert into article () values (포토티켓 취소 및 환불 규정은 어떻게 되나요 ?, 01. 취소
※ CGV포토티켓은 티켓으로 효력을 가지는 상품으로 영화 예매 취소 시 포토티켓은 함께 취소 처리 됩니다.
홈페이지/모바일 앱 취소는 포토티켓을 출력하지 않은 경우 결제 후 30일 이내에 취소 가능합니다. 기간 내 출력하지 않은 티켓은 환불되지 않습니다.
부분 취소는 불가합니다. (ex. 2장을 한번에 구매한 경우 2장 모두 취소만 가능)                
미성년자 권리보호 안내
미성년자인 고객께서 계약을 체결하시는 경우 법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있습니다
)
insert into article () values (아직 미취학인 자녀가 있는데 아이도 티켓팅을 해야 하나요?,
■ 공통 사항
  - 48개월 미만의 어린이는 별도의 관람료를 받지 않고, 보호자의 동반하에 관람 가능  > 보호자의 좌석에 함께 착석하여 관람 가능
  - 48개월 이상부터 고등학생까지 동일하게 청소년 요금이 적용

■ 특이 사항
 - 보호자 1명에 48개월 미만자녀 1명 동반 시, 별도의 관람료 없이 관람가능
 - 보호자 1명에 48개월 미만자녀 2명이상 동반 시,
    두 자녀 모두 48개월 미만이라 하더라도 청소년 요금으로 1매 티켓팅 필수 )
insert into article () values 1+1쿠폰을 구입했는데 확인이 어려워요. 어디서 확인하나요?,
쿠폰 사용기한 內 에는
CGV APP 또는 홈페이지 - MY CGV - CGV할인쿠폰 메뉴에서 구입한 쿠폰을 확인하실 수 있으며,
쿠폰 사용기한이 지난 이후에는 해당 메뉴에서도 확인되지 않습니다.

쿠폰 사용기한 內임에도 해당 메뉴에서 구입한 쿠폰이 확인이 되지 않으실 경우,
CGV고객센터(1544-1122) 또는 홈페이지 이메일 문의를 통해 남겨주시면 확인 도와 드리겠습니다.)

insert into article () values 아트하우스 아티스트 등급은 무엇인가요?,
아티스트란, 아트하우스 영화를 사랑하는 아트하우스 Club 회원님을 위한 스페셜 등급입니다.

■ 조건
- 2020년 상반기(1월~6월): 아트하우스 Club 회원 중 2019년 아트하우스 전용관에서 5회 이상 관람한 회원
- 2020년 하반기(7월~12월): 아트하우스 Club 회원 중 2020년 상반기 아트하우스 전용관에서 4회 이상 관람한 회원
※ 서로 다른 영화, 유료 관람 기준(CJ ONE 포인트 적립)
※ 신규 가입 회원의 경우 2019년 관람 조건 충족 시 가입 2일 후 자동 등급 부여
)


insert into article () values  아트하우스 클럽은 무엇인가요?,
CGV 아트하우스의 특별한 혜택을 누릴 수 있는 회원제 서비스로,
아트하우스 영화를 즐겨보고 좋아하는 사람이라면 누구나 가입할 수 있습니다.
▷ 아트하우스 클럽 페이지 바로 가기
)


insert into article () values  노블레스 프리미엄 멤버십(노블레스 블랙카드)은 무엇인가요?,
■ 이용 방법
- 노블레스 블랙 카드 판매 극장(클럽 페이지 내 '판매극장보기'로 확인) 방문, 구매하여 카드 등록 후 사용
- 연회비: 2만원
)

insert into article () values 멤버십 포인트가 적립되지 않았습니다,
포인트는 영화 관람 2~3일 후 확인 가능합니다.
현장 매표소에서 발급 시 '결제 전' 멤버십 카드를 제시해 주시면 포인트 적립을 도와드리고 있으며,
핸드폰번호를 통한 적립 진행 시에는 타인의 번호로 적립이 되지는 않았는지 다시 한번 확인 부탁드립니다. 
)



### 스토어
insert into article () values (영화관람/매점상품 기프트콘은 적립이 가능한가요?,
'- 영화관람 기프트콘 : 적립 불가
  매점상품 기프트콘 : 적립 가능

- 극장매점에서 기프트콘 사용 결제하여 영수증을 수령하신 후, 결제시간 기준 48시간 이내
  키오스크 구매 시 현장에서 적립하거나  [MY CGV] → [CJ ONE 포인트] → [매점이용 포인트 적립] 에서 적립 가능)

insert into article () values (영화관람/매점상품 기프트콘은 어디서 환불하나요?,
• 구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간 만료 후에는 수신자가 결제금액의 90%에 대해 환불 요청 가능합니다.
• 단, 이미 사용된 기프트콘에 대해서는 결제취소/환불 신청이 불가합니다.
 비회원의 경우 고객센터로 신청 가능합니다.
단 이 때, 본인 확인 및 계좌 확인 절차가 진행됩니다.
)


##결제
insert into article () values (CGV영화관람권(무비머니)은 어떻게 구매하나요?,
- CGV영화 관람권 : 전국 CGV 일반 영화관에서 상영하는 영화 중 1편을 선택하여 관람가능
- 세트구성 : 영화관람권10매 + 보너스 1매 + 콤보500원할인권 5매 = 100,000원 (관람기한 2년)
- 구매방법 : 1매 단위로 구매 가능 (10,000원/매)  단, 최소 10매 이상 구매 가능
- 구매장소 : 전국 CGV 매표소에서 구매하실 수 있습니다. (일부 사이트 제외))


insert into article () values (관람권 사용해서 예매했는데 현금영수증 발행을 못했어요!,
관람권 권종에 따라 현금영수증 발급 가능 여부가 상이하기 때문에
현금영수증 발급 가능 여부 확인 후, 발급 가능한 사항 관람권일 경우에 자진발급 번호 안내해 드리고 있습니다.
이후 국세청 홈페이지 접속하시어, 해당 자진발급 번호 입력하여 발급 받으실 수 있습니다.

자세한 사항은 CGV고객센터(1544-1122)로 문의주시면 안내 드리겠습니다.)


##할인헤택

insert into article () values (CJ 임직원 할인 시 적립율은 어떻게 되나요?,
■ CJ 임직원 할인시 적립율
  - 매표 : 0.5%
  - 매점,씨네샵, 롤롤,V-BUSTERS : 0.1%
  - CGV 투썸 : 해당없음.)

insert into article () values (할인되는 카드는 어떤게 있나요?,
■ 신용카드 및 체크카드 할인
  - 400여종 이상의 다양한 할인 카드가 준비되어 있습니다.
    자세한 안내는 홈페이지 내 '알뜰한 영화관람법'에서 확인 가능합니다. 알뜰한 영화관람법 (할인카드 확인하러 가기)>>)

insert into article () values (어린이 할인은 어떻게 받을 수 있나요??,
어린이(만 48개월 이상) 관람의 경우, 청소년과 동일한 요금이 적용됩니다.

※ 기존 '키즈패밀리클럽' 일부 혜택이었던 어린이 요금은 
   '키즈패밀리클럽'을 신규 혜택 제공과 함께 2019년 7월 1일자로 혜택 종료 되었습니다.)


insert into article () values (경찰할인은 어떻게 되나요?,
■ 경찰 할인
  - 경찰공무원(경찰청/해양경찰청, 주무관, 전의경) 본인 및 동반 3인 일반 영화(2D) 7천 원 / 입체영화(3D) 8천 원 관람 가능
  - 경찰대학생, 중앙경찰학교 교육생, 경찰교육원 간부 후보생 본인 및 동반 1인 일반 영화(2D) 7천 원 / 입체영화(3D) 8천 원 관람 가능
  - 매점 모든 콤보 2천 원 할인 구매 가능 
    ※ 프로모션(이벤트) 콤보 제외
.)

###홈페이지



insert into article () values (인터넷 예매 후 CGV 현장에서 환불(예매 취소)이 가능한가요?,
인터넷 예매하신 부분은 상영시간 전까지는 CGV 현장에서 환불 가능합니다.
단, 부분 환불은 되지 않습니다.

- 신용카드 환불의 경우 익일에 승인 취소를 확인하실 수 있습니다.
- 예매일과 취소일이 다른 경우에 취소 확인 시까지 시일이 소요될 수 있습니다.
.)
   

insert into article () values (인터넷 예매 후 CGV 현장에서 환불(예매 취소)이 가능한가요?,
예매 건 취소 후 재결제 진행해 주셔야 하며, 부분 취소 및 부분 변경은 불가합니다.
.)



##이벤트
   

insert into article () values (영화관람/매점이용/씨네샵이용의 정확한 VIP 적립 기준을 알고 싶어요,
VIP 선정 반영되는 적립 포인트 기준은 VIP선정 기준 적립일이며, CJ ONE 가용일자와 상이할 수 있습니다
자세한 포인트 적립조회는 MY CGV > CJ ONE포인트 이력조회를 통해 확인하시기 바랍니다

■ 매표 구매 누적 포인트
 - CGV영화 관람을 통해 적립되는 포인트로 상영일 기준으로 누적 적립되며 온라인 상에서 실제 누적포인트 반영까지 최대 3일 소요됩니다 (30시간 기준)
.)
   
insert into article () values (VIP 선정 포인트는 VIP가 되고 나서 유지 되나요?,
VIP가 선정된 이후 선정 포인트는 0으로 리셋되며 선정된 달부터 다시 선정 포인트가 누적 됩니다 
.)