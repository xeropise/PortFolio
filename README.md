# PortFolio

안녕하세요 갓 국비학원을 졸업한 31살 남자 포트폴리오 입니다.
누군가 볼지 모르겠습니다. 제 모듈만 설명하려합니다.

프로젝트 주제 : 영화 프랜차이즈 3사 통합 예매 서비스 MOVMOVMOV

서류를 제외한 프로젝트 실 개발 기간 : 2020.01.28 ~ 2020.03.07

총 개발 인원 : 6명

시스템 개요 : 기존의 잘 알려진 영화 예매 사이트 ( CGV, 롯데시네마, 메가박스 )는 해당 프랜차이즈사 웹페이지를 이용하지 않으면,
             예매정보 확인이 불가능하므로, 이 불편함을 해소하고자, 이 3사의 영화 예매 정보를 한눈에 비교하고, 영화를 예매할 수 있는                서비스 제공을 목표로하는 웹을 만들기로하였습니다.

 기술적 고려사항 :
 
    ■ Web Application Architecture  
      – 2Layer / MVC 
    ■ Front End  
      – HTML5 / CSS3 / Bootstrap / javascript / jQuery / Ajax / Datepicker / FulCalendar / summernote/ Moment.js 
        Font Awesome / DWL Carousel / Google Font / sweet Alert  
    ■ Back End 
      – Java / Spring Framework / Mybatis / Apache / ApacheTomcat 
    ■ DB / Tool  
      – selenium / oracle / starUML / OvenApp.io / eclipse / GitHub / DBeaver  
    ■ Open API  
      – SNS로그인 : 네이버 / 카카오 / 구글  
      –SMS(문자서비스) : 청기와랩  
      –Email : javaMail  
      –결제 : 아임포트  
      –Map : 카카오맵 
      –영화정보 : KMDb (한국영화데이터베이스) / KOBIS(한국영화진흥원) / 네이버(서치) / Youtube 
             
업무 영역 :
     ■ 회원 관리 시스템 
     ■ 마이페이지 
     ■ 영화 관리 시스템 
     ■ 영화 예매 시스템    
     ■ 스토어 시스템 
     ■ 결제 시스템 
     ■ 이벤트 시스템  
     ■ 고객센터 시스템
   
 그 중 저는 시스템 핵심인 극장별 비교예매가 있는 영화 예매 시스템을 맡았습니다. 간단한 특징은 다음과 같습니다. 
 
  ■ 영화 예매 시스템  
   -- 예매 정보 선택 --
    1. 일반 예매, 극장별 비교 예매기능을 제공합니다.
    2. 영화, 상영관, 프랜차이즈, 날짜를 자유롭게 선택하고, 모두 선택하는 경우 상영시간 선택이 가능합니다.
    3. 특정 항목 선택 시, 다른 항목들이 정렬됩니다.
      ( 예로 영화를 선택했는데, 그 영화를 상영하지 않는 프랜차이즈 혹은 날짜는 OPACITY가 변하고, 하단 정렬됩니다. )
    4. 상영시간 데이터는 일주일을 기준으로 합니다. (크롤링 1번 할 경우)
    5. 지속적으로 데이터를 추가 할 경우, 상영시간 중복처리를 하지않았습니다.
    6. 모든 영화 데이터는 맥스무비 https://ticket.maxmovie.com/Reserve/Date 의 날짜 선택 영역에서 모두 크롤링해왔습니다.
       ( 하단 상세 언급합니다 )
       
   -- 좌석 선택 --    
    1. 관객 타입은 청소년, 일반, 우대가 있습니다
    2. 좌석 타입은 economy, standard, prime, sweetBox가 있습니다.
    3. 좌석은 총 130석 고정 구현하였습니다, 각 프랜차이즈별 그리고 상영관별로 총 좌석수와 타입이 전부 다르나, 이것이 로직이
       있는게아니라, 실제 건물에 맞춰 제작됐기때문에 규칙성이 없다는것을 파악했습니다. 수동입력입니다. 구현이 더 중요했고,
       중요한게 아니라서 모두 고정 좌석수를 가집니다.
    4. 좌석 선택 시 인원수가 1명이나 혹은 2명이상이냐에 따라 마우스 온오버, 클릭 이벤트가 다르게 작동합니다.
    5. 1명은 자유롭게 다시선택 가능하나, 2명이상은 중간에는 다시선택가능하나 모두 선택했다면, 다시 선택 버튼 혹은 인원수를 재 선택하여       
       초기화 해야합니다. 
    6. 인원수 재 선택시 선택한것이 초기화됩니다.
    7. 청소년, 일반, 우대가 다수 선택됐다면 앞에서부터 2명씩 처리합니다. 로직은 아래에서 자세히 설명합니다.
    8. 지금 선택하려는 관객타입, 좌석타입에 따라서 가격을 다르게 저장합니다. 로직은 아래에서 자세히 설명합니다.
  
  
  
 
