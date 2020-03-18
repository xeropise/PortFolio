<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	 <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	position: absolute;
	width: 100%;
	height: 100%;
	font-size: 16px;
	left: 0;
	font-family: 'Noto Sans KR', sans-serif;
}


#contaniner{
	width: 800px;
	display: inline-block;
	vertical-align: middle;
} 

.col-left{
	text-align: left;
}
.movieTitle{
	font-weight : bold;
	overflow: hidden;
    width: 95%;
    color: #222;
    font-size: 16px;
    line-height: 16px;
    text-overflow: ellipsis;
}
.releaseDate{
	color: #999999;
    font-size: 12px;
}
.likebg{
	font-size : 15px;
	display:inline-block;
	width : 80px;
	height : 25px;
	background-image: url('/resources/image/likebg.png');
	background-repeat: no-repeat;
	background-size: 80px 25px;
}

.board-list-util:after, .board-list-util:before {
    content: '';
    display: table;
}
.board-list-util:after {
    clear: both;
}

.board-list-util:after, .board-list-util:before {
    content: '';
    display: table;
}

.board-list-util .result-count {
    position: relative;
    float: left;
    margin: 0;
    padding-top: 15px;
    padding-left: 30px;
    line-height: 1.1;
    vertical-align: top;
}

.mypage-infomation+.board-list-util {
    padding: 0;
    margin: 0;
}

.board-list-util .result-count b {
    color: #01738b;
}


.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}

.font-gblue {
    color: #01738b!important;
}

b, strong {
    font-weight: 700;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.cancleWishBtn{
	cursor: pointer;
}

</style> 
<script type="text/javascript">

function getWishMovieList(startRowNum, currentPage, pageSize){ // 위시리스트 가져오는 함수
	$.ajax({
		url : '/user/json/getWishMovieList',
		method : "post",
		datatype : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			startRowNum : startRowNum,
			currentPage : currentPage,
			pageSize : pageSize
		}),
		success : function(data) {
			
			$("#wishList").empty();
			$("#wishList").append(
				'<div id="1_line" class="row"></div><br>'+
				'<div id="2_line" class="row"></div><br>'+
				'<div id="3_line" class="row"></div>'		
			);
			
			console.log("=== getWishMovieList success ===");
			console.log(data); // data.wishMovieList => List<Movie>

			if(data.totalCnt > 0){
				
				$("#mySeenMovieCnt").html(data.totalCnt);

				var len = data.wishMovieList.length;
				var num = 0;
				
				for(var i=0; i<len; i++){
					var rowNum = Math.floor(num/3)+1;
					var row = "#"+rowNum+"_line";
					$(row).append(
						"<div class='col-md-4'>"
							+"<img src='"+data.wishMovieList[i].poster+"' width='185' height='260'>"
							+"<br><span class='movieTitle'>"+data.wishMovieList[i].movieTitle+"</span>"
							+"<br><span class='releaseDate'>"+data.wishMovieList[i].releaseDate+" 개봉</span>"
							+"<br><span class='cancleWishBtn' id='"+data.wishMovieList[i].movieNo+"'><img src='/resources/image/heart.png' width='20' height='20'></span> <span class='likebg text-center'>"+data.wishMovieList[i].wishCnt+"</span>"
						+"</div>"
					);
					num+=1;
				}
				
				pagination(startRowNum, currentPage, pageSize, data.totalCnt);
				
				return data.totalCnt;
				
			} else { // 조회된 위시 리스트가 없을때
				$("#wishList").append(
					'<div class="no-my-movie-list myLikeMovie myMovieStory" id="noDataDiv">'+
						'<i class="iconset ico-movie-see"></i>'+
						'<h3><p>보고싶은 영화를 담아주세요.</p></h3>'+
					'</div>'		
				)
			}

		}, error : function() {
			console.log("=== getWishMovieList error ===");
		}
	}); //ajax 끝
}

function pagination(startRowNum, currentPage, pageSize, totalCnt){ // 페이징 하는 함수
	console.log("pagination 함수 호출");
	console.log("> startRowNum : "+startRowNum);
	console.log("> currentPage : "+currentPage);
	console.log("> pageSize : "+pageSize);
	console.log("> totalCnt : "+totalCnt);
	$("#pagination").empty();
	var maxPage = Math.ceil(totalCnt/pageSize); // 페이지의 수
	$("#pagination").append("<button class='btn btn-default pageBtn'>«</button>");
	for(var i=1; i<=maxPage; i++){ // 페이지 찍기
		if(currentPage==i){
			$("#pagination").append("<button class='btn btn-default pageBtn' style='background-color: #fee50e'>"+i+"</button>");
		} else {
			$("#pagination").append("<button class='btn btn-default pageBtn'>"+i+"</button>");
		}
	}
	$("#pagination").append("<button class='btn btn-default pageBtn'>»</button>");
}

$(function(){ // => 이 페이지가 로딩될때 이 영역 안에 있는 자바스크립트는 구동되라
	
	var startRowNum = 1;
	var currentPage = 1;
	var pageSize = 9;
	
	getWishMovieList(startRowNum, currentPage, pageSize); // 초기 1 페이지 호출
	
	$(document).on("click", ".cancleWishBtn", function(){ // 위시리스트 취소 이벤트
		
		Swal.fire({
	           icon: 'warning', //"info,success,warning,error" 중 택1
	          title: '취소하시겠습니까?',
	      }).then((result) => { 
	    	  
			if(confirm("취소 하시겠습니까?")){
	
				var movieNo = $(this).attr("id");
				
				$.ajax({
					url : "/movie/json/deleteWish",
					method : "POST",
					data : JSON.stringify({
						movieNo : movieNo,
						userNo : '${user.userNo}' // 이후에 고쳐야할  가능성이 다분하다 다분해!!
					}),
					dataType : "json",	//data를 json으로 받았으면 좋겠다.
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}
				}).done(function(responseJSON){
					getWishMovieList(startRowNum, currentPage, pageSize);
				}).fail(function(result, status){
					console.log(result, status);
				});
			} else {
				console.log("안취소!");
			}
		
		 });//스윗얼랏
	});
	
	$(document).on("click", ".pageBtn", function(){ // 페이지 버튼 이벤트
		
		var pageVal = $(this).html(); // 선택한 페이지 버튼의 값 가져오기
		var totalCnt = parseInt($("#mySeenMovieCnt").html()); // 전체 위시리스트 건수 가져오기
		var maxPage = Math.ceil(totalCnt/pageSize); // 마지막 페이지
		
		if(pageVal == "«"){ // < 버튼 일때
			if(currentPage > 1){
				currentPage = currentPage - 1;
				pagination(startRowNum, currentPage, pageSize, totalCnt); // 페이지 함수 호출
				getWishMovieList(startRowNum, currentPage, pageSize); // 위시리스트 호출	
			}
		} else if (pageVal == "»"){ // > 버튼 일때
			if(currentPage < maxPage){
				currentPage = currentPage + 1;
				pagination(startRowNum, currentPage, pageSize, totalCnt); // 페이지 함수 호출
				getWishMovieList(startRowNum, currentPage, pageSize); // 위시리스트 호출
			}
		} else { // 숫자 버튼 일때
			currentPage = parseInt(pageVal); // 선택한 페이지 번호 가져오기
			pagination(startRowNum, currentPage, pageSize, totalCnt); // 페이지 함수 호출
			getWishMovieList(startRowNum, currentPage, pageSize); // 위시리스트 호출
		}
	})
	
});
</script>
</head>
<body>
	<!--container-->
	<div id="contaniner" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-12">
				<div>
					<h2 style="font-size : 28px;"><strong>위시 리스트</strong></h2>
					<p><strong>총 <b class="font-gblue" id="mySeenMovieCnt">0</b> 건</strong></p>
				</div>
			</div>
		</div>
		
		<div id="wishList"></div>
		
		<br>
		
		<div id="pagination" style="text-align: center"></div>

	</div><!--container end-->
</body>
