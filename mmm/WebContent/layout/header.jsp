<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
  <title>mmm</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
   
   <!-- google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
  <!-- 카카오 맵 api key -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e195c747986bcc9e0da58dd2ded5409c"></script>
  
    <!-- summer notes -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>

	<!-- carousel -->
  <script src="../resources/javascript/owl.carousel.min.js"></script>
  <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
  
  <!-- datepicker -->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
	
  
  <style>
  body {
  	font-family: 'Noto Sans KR', sans-serif !important;
  }
  
  div.navBar {
  	box-sizing : border-box;
  }
  ul.header {
  	background-color : #fee50e;
  	margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-weight: inherit;
    font-style: inherit;
    font-size: 100%;
    font-family: inherit;
    list-style: none;
    
  }
  
  ul.header li {
  	line-height : 17px;
  	
  }
  
  ul.header li a {
  	font-size : 12px;
  	font-weight : 700;
  }
  
  ul.header li a.borderRight {
  	padding-right : 10px;
  	border-right: 2px solid #fe9558;
  	color : #333;
  	
  }
  
  div.navMain div {
  	background-color : #333;
  	
  }
  
  div.headerLogo {
  	background-color : #fee50e !important;
  }
  
  #firstDropdown,#secondDropdown,#thirdDropdown,#fouthDropdown {
  	background-color : #333 !important;
  	border : none !important;

  }
	
  #firstDropdownMenu,#secondDropdownMenu,#thirdDropdownMenu,#fouthDropdownMenu {
    position : absolute !important;
  	top : -7px !important;
  	left : -8px !important;
   
  }
  
  #firstDropdownMenu a,#secondDropdownMenu a,#thirdDropdownMenu a,#fouthDropdownMenu a {
  	color : white !important;
  }	
  
  button.swal2-confirm.swal2-styled {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #222;
  }
  	
  </style>
<title>mmm</title>

</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<ul class="col-12 header">                
					<li style="text-align: right; padding-top: 7px; padding-bottom: 7px; padding-right: 5px;"> 
					<c:choose> 
					    <c:when test="${not empty sessionScope.user }">   
					       <a href="/user/logout" class="login borderRight">LOGOUT</a>
					    </c:when>
					    <c:otherwise>    
					       <a href="/user/login" id=mainLoginBtn class="login borderRight"><span>LOGIN</span></a>
					    </c:otherwise>                  
					</c:choose>
						<a href="/user/userAuthorization.jsp?type=addUser" class="join borderRight"><span style="margin-left: 5px;">JOIN</span></a>
						<a href="/mypage/mypage?condition=99" class="myPage borderRight"><span style="margin-left: 7px;">MY PAGE</span></a>
						<a href="/customer/getAskList" class="customer" style="color: #242424; padding-left: 1px;"><span style="margin-left: 4px;">CUSTOMER CENTER</span></a>
					</li>
			</ul>
		</div>	<!-- end of navBar --> 
		
		<div class="row navMain">
			<div class="col-3">
				<div class="row">
					<div class="col-6 px-0"></div>
					<div class="col-6 px-0 headerLogo text-center">
						<span>
							<a href="/" title="MMM">
								<img src="/resources/image/logo/logo.png" alt="MMM" width=68>
							</a>	
						</span>
					</div><!-- endof headerLogo -->
				</div>
			</div>
			<div class="col-6 pt-3">
				<div class="row">
					<div class="col-3 text-center">
						  <div class="dropdown mr-1">
						    <button type="button" class="btn btn-secondary dropdown-toggle" id="firstDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
						      MOVIE
						    </button>
						    <div class="dropdown-menu" aria-labelledby="firstDropdown" id="firstDropdownMenu">
						      <a class="dropdown-item" href="/movie/getBoxOfficeList">박스 오피스</a>
						      <a class="dropdown-item" href="/movie/getExpectedMovieList">상영 예정작</a>
						    </div>
						  </div><!-- end of First Dropdown -->
					</div>
					<div class="col-3 text-center">
						  <div class="dropdown mr-1">
						    <button type="button" class="btn btn-secondary dropdown-toggle" id="secondDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
						      TICKETING
						    </button>
						    <div class="dropdown-menu" aria-labelledby="secondDropdown" id="secondDropdownMenu">
						      <a class="dropdown-item" href="/ticketing/addTicketing">일반예매</a>
						      <a class="dropdown-item" href="/ticketing/addCompareTicketing">극장별 비교예매</a>
						    </div>
						  </div><!-- end of Second Dropdown -->					
					</div>
					<div class="col-3 text-center">
						  <div class="dropdown mr-1">
						    <button type="button" class="btn btn-secondary dropdown-toggle" id="thirdDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
						      STORE
						    </button>
						    <div class="dropdown-menu" aria-labelledby="thirdDropdown" id="thirdDropdownMenu">
						      <a class="dropdown-item" href="/product/getVoucherList">상품권</a>
						      <a class="dropdown-item" href="/product/getSnackProductList">스낵</a>
						      <a class="dropdown-item" href="/product/getCartList ">장바구니</a>
						    </div>
						  </div><!-- end of Third Dropdown -->						
					</div>
					<div class="col-3 text-center">
						  <div class="dropdown mr-1">
						    <button type="button" class="btn btn-secondary dropdown-toggle" id="fouthDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20">
						      EVENT
						    </button>
						    <div class="dropdown-menu" aria-labelledby="fouthDropdown" id="fouthDropdownMenu">
						      <a class="dropdown-item" href="/event/getPreviewList">시사회이벤트</a>
						      <a class="dropdown-item" href="/event/getQuizList">퀴즈풀기</a>
						      <a class="dropdown-item" href="/event/addAttendance">출석체크</a>
						    </div>
						  </div><!-- end of Fouth Dropdown -->						
					</div>
				</div>
			</div>
			<div class="col-3">
			</div>		
		</div>	<!-- end of navMain -->
	</div>
	
<script>
$(function(){
	

	
});
$("#firstDropdownMenu a,#secondDropdownMenu a,#thirdDropdownMenu a,#fouthDropdownMenu a").on("mouseenter",function(){
	$(this).attr("style","color : #333 !important")
});
$("#firstDropdownMenu a,#secondDropdownMenu a,#thirdDropdownMenu a,#fouthDropdownMenu a").on("mouseleave",function(){
	$(this).attr("style","color : white !important")
})

</script>
</body>
</html>