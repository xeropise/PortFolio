<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	jQuery...  -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value="/resources/javascript/jquery.barrating.min.js" />"></script> 
    <script src="<c:url value="/resources/javascript/rater.min.js" />"></script> 

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
<!--      Star..Rating..을 위한 fontawesome ..  css.. js...-->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/fontawesome-stars.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/fontawesome-stars-o.css" />">

    <!-- fontawesome CDN -->
    <script src="https://kit.fontawesome.com/e464a52b8d.js" crossorigin="anonymous"></script>

<!-- 	SweetAlert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
<!-- 	Google web font -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
<!--     movie css -->
    <link rel="stylesheet" href="/resources/css/movieIcon.css?aedfr">
    
<!--     Common Css -->
    <link rel="stylesheet" href="/resources/css/common.css?aedfr">
     
    <style type="text/css">
    	.img-cs { max-width: 100%; height: auto; }
    	
    	.starR1{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
		}
		.starR2{
		    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		    background-size: auto 100%;
		    width: 15px;
		    height: 30px;
		    float:left;
		    text-indent: -9999px;
		    cursor: pointer;
		}
		.starR1.on{background-position:0 0;}
		.starR2.on{background-position:-15px 0;}
    	
/*     	.row { */
/* 		    width: 1200px;  */
/* 		    margin: 0 auto; */
/* 		} */
		.moviebody {
		    width: 700px;
		    margin: 0 auto;
		}
		
		button.swal2-confirm.swal2-styled {
			background-color: #fee50e;
			border-color : #fee50e;
			color : #222;
		}		
    </style>
    
	<script type="text/javascript">
	
	
	
// 	평점 내리기
	function fncDoRating(){
		var movieNo = $("button[name='wish-btn']").parent().children('input[name="movieNo"]').val();
		var starByUser = $("#starByUser").val();
		var starUserFlag = $('#starUserFlag').val();
		
		console.log('movieNo : '+ movieNo);
		console.log('starByUser : ' +  starByUser);
		console.log('starUserFlag : ' +  starUserFlag);
		
		var url;
		
// 		평점등록이 처음인 경우(등록)
		if (starUserFlag == 0) {
			url = "/movie/json/addStarRating";
		}
		
// 		평점등록을 한적이 있는 경우 (수정 or 삭제)
		if(starUserFlag == 1){
			url = "/movie/json/updateStarRating";
			console.log('updateStarRating')
		}
		
		$.ajax(
			{
				url : url,
				method : "POST",
				data : JSON.stringify({
					movieNo : movieNo,
					userNo : $('#userNo').val(),  // 이후에 고쳐야할  가능성이 다분하다 다분해!!^^^^^^^^
					starByUser : starByUser
				}) ,
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}
			}
		).done(function(responseJSON){
			console.log('responseJSON  : ' + JSON.stringify(responseJSON));
			console.log('starByUser   : ' + starByUser);
			console.log('변경 전 starUserFlag   : ' + starUserFlag);
			console.log(responseJSON.movie);
			console.log(responseJSON.movie.starRating);
			
			$('#starUserFlag').val(responseJSON.movie.starUserFlag);
			$('#starRating').text(responseJSON.movie.starRating);
			
			console.log('변경 후 starUserFlag   : ' + $('#starUserFlag').val());
		})	
	}/// end of fncDoRating
	
	
	
// 	좋아요 활성화 / 비활성화 함수 __________wishUserFlag로 처리한다.	
	function fncDoWish(wish_btn) {
// 		console.log(wish_btn);
		var movieNo = wish_btn.parent().children('input[name="movieNo"]').val();
		var wishUserFlag = wish_btn.parent().children('input[name=wishUserFlag]').val();

		console.log(movieNo);
		console.log(wishUserFlag);
		
		var url;
		
		if (wishUserFlag ==0) {
			url = "/movie/json/addWish";
		}if (wishUserFlag != 0) {
			url = "/movie/json/deleteWish";
			
		}
		
		$.ajax(
			{
				url : url,
				method : "POST",
				data : JSON.stringify({
					movieNo : movieNo
// 					userNo : $("#userNo").val() // 이후에 고쳐야할  가능성이 다분하다 다분해!!^^^^^^
				}),
				dataType : "json",	//data를 json으로 받았으면 좋겠다.
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}
			}		
		).done(function(responseJSON){
			console.log(wish_btn.parent().children("input[name='wishUserFlag']").val());	//기존의 flag
			console.log(responseJSON.movie.wishUserFlag);	//결과로 받는 flag
			
			if (wishUserFlag == 0) {		//좋아요 활성화시킬 경우 하트모양 변경
				$(wish_btn).html("<i class='fas fa-heart text-danger'></i> "+ responseJSON.movie.wishCnt);
			}if (wishUserFlag != 0) {		//좋아요 비활성화시킬 경우 하트모양 변경
				$(wish_btn).html("<i class='far fa-heart text-muted'></i> "+ responseJSON.movie.wishCnt)
			}
			
			
			$(wish_btn).parent().children("input[name='wishUserFlag']").val(responseJSON.movie.wishUserFlag);
			console.log(wish_btn.parent().children("input[name='wishUserFlag']").val());	//바뀐 flag
		}).fail(function(result, status){
			console.log(result, status);
		});
	};// end of fncDoWish()
	
	
// 	예매하기로 넘어가는 함수
	function fncTicketing(ticketing_btn){
// 		var movieName = $.trim($('#movieTitle').text()).replace(/ /g, '');;
		var movieName = $('#movieTitle').text();
// 		alert(movieName);
		self.location = "/ticketing/addTicketing?movieName="+movieName
	};
	
	
	
	$(function(){
		
// 		영화 번호 
		var movieNo = $("button[name='wish-btn']").parent().children('input[name="movieNo"]').val();
		console.log(' movieNo'+ movieNo)
		console.log(' starUserFlag : ' + $('#starUserFlag').val());
		
// 		load시 영상을 넣도록...
		$('#player').attr("src","http://www.youtube.com/embed/"+ "${movie.trailer}");
		
// 		평점 이벤트
		$("button[name='rate']").on("click", function(){
			console.log('rate')
			fncDoRating();
		});
		
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  var rateScore = ($(this).parent().children().index(this)+1);	//*****************************************************************************
			  $('#starByUser').val(rateScore);
			  return false;
			});
		
		
// 		좋아요 버튼 이벤트
		$("button[name='wish-btn']").on("click", function(){
			var wish_btn = $("button[name='wish-btn']");
// 			var wish_btn = $(this);
// 			console.log(userNo);
// 			console.log( wish_btn );
			
// 			if (wishUserFlag == 0) {
// 				fncAddWish(wish_btn);	
// 			}if (wishUserFlag == 1) {
// 				fncDeleteWish(wish_btn);
// 			}

			fncDoWish(wish_btn);
		});
		
// 		예매 버튼 이벤트
		$("button[name='ticketing-btn']").on("click", function(){
			var wish_btn = $(this);		
// 			console.log(userNo);
			
			fncTicketing();
		});
		
	});
	
// 	한줄평 등록 버튼 이벤트
	$(document).on("click", "button[name='btn-addOneline']", function(){
		var movieNo = $(this).parent().parent().find('input[name="movieNo"]').val();
		var commentContent = $("input[name='commentContent']").val();
		
		if(commentContent == null || commentContent.length <1){
			Swal.fire({
				text: '한줄평을 작성해주셔야 등록이 가능해요.',
				icon: 'error',
				confirmButtonText: "confirm"
			});
			return;
		}
		
		$.ajax(
			{
				url : "/movie/json/addOneline",
				method : "POST",
				data : JSON.stringify({
					movieNo : movieNo,
					commentContent : commentContent
				}),
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"					
				}
			}		
		).done(function(responseJSON){
			Swal.fire({
				text: '한줄평 등록이 완료되었어요.',
				icon: 'success',
				confirmButtonText: "confirm"
			});
			
			$('#modal-addOneline').modal("hide");
			
		}).fail(function(result, status){
			console.log(result, status);
		});
		
	});

	</script>
    
    <title>mmm</title>
  </head>
  <body>
  
  	<jsp:include page="/layout/header.jsp"></jsp:include>
    
    <!--     	임의로 userNo 심어주기... TEST 용  -->
<!-- 	<input id="userNo" type="hidden" value="11111"> -->
    
	    <div class="container">
	    	<div class="col moviebody mt-5">
			    <div class="row border-bottom pb-3">
	   		        <div class="col-md-4 text-center">
			        	<img class="img-cs" id="poster" src="${movie.poster}" alt="">
			        </div>
			    
			        <div class="col-md-8">
			        	<div class="row border-bottom">
				        	<div class="col-md">
					        	<h3 id="movieTitle" class="blog-post-title d-inline">${movie.movieTitle}</h3>
					        		        	 <!--  					       관람등급 -->
									<c:choose>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='전체관람가'}">
											<em class = "ico_movie allrating">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='12세이상관람가'}">
											<em class = "ico_movie rating12">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='15세이상관람가'}">
											<em class = "ico_movie rating15">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='청소년관람불가'}">
											<em class = "ico_movie rating19">${movie.movieRating}</em>
										</c:when>
									</c:choose>
					        	<p class="blog-post-meta">${movie.movieTitleEng }</p>
					        	
				        	</div>
				        	<c:if test="${user.role eq 'user' || user.role eq 'admin' }">
<!-- 				        	상영예정작은 평점을 내릴 수 없도록.. 분기문 처리  -->
				        	<c:if test="${movie.onBoxOfficeFlag == 1}">
					        	<div class="col-md text-center my-auto">
						        		<div class="col starRev">
										  <span class="starR1 on">별1_왼쪽</span>
										  <span class="starR2">별1_오른쪽</span>
										  <span class="starR1">별2_왼쪽</span>
										  <span class="starR2">별2_오른쪽</span>
										  <span class="starR1">별3_왼쪽</span>
										  <span class="starR2">별3_오른쪽</span>
										  <span class="starR1">별4_왼쪽</span>
										  <span class="starR2">별4_오른쪽</span>
										  <span class="starR1">별5_왼쪽</span>
										  <span class="starR2">별5_오른쪽</span>
										</div>
										<div class="rating" data-rate-value=6></div>
<%-- 						        		<span id="starRating"> ${movie.starRating}</span> --%>
						        		<input id="starUserFlag" type="hidden" value="${movie.starUserFlag}">
						        	   <input id="starByUser" type="hidden" value="${movie.starByUser}" placeholder="평점 0~10">
						    </c:if>    	
						        	<!-- Button trigger modal -->
						        	<div class="mt-1">
						        		<c:if test="${user.role eq 'user' || user.role eq 'admin' }">
							        	    <button type="button" class="btn btn-sm btn-yellow-cs" name="rate">평점 등록</button>
											<button type="button" class="btn btn-sm btn-yellow-cs" data-toggle="modal" data-target="#modal-addOneline">
											  한줄평 작성
											</button>
										</c:if>
						        	</div>
						        	
						        	
					        	</div>
				        	</c:if>
				        </div>
				        <div class="row">
							<div class="col-md  text-center mt-1 p-1">
								<div class="row m-2">
									<div class="col"><h6><i class="fas fa-chart-pie font-yellow-cs"></i> 예매율 : ${movie.ticketingRate}%</h6></div>
									<div class="col"><h6><i class="fas fa-star font-yellow-cs"></i> 평점 : ${movie.starRating}</h6></div>
								</div>
								<div class="text-left p-2">
									<p class="mb-2">- <span class="font-weight-bold">감독 :</span> ${movie.director}</p>
									<p class="mb-2">- <span class="font-weight-bold">배우 :</span> ${movie.actor}</p>
									<p class="mb-2">- <span class="font-weight-bold">장르 :</span> ${movie.genreString} 
									<p class="mb-2">- <span class="font-weight-bold">런닝타임 :</span>${movie.runningTime} 분 
									<p class="mb-2">- <span class="font-weight-bold">개봉일자 :</span> ${movie.releaseDate}</p>
								</div>
								
								<div>
									<input name="movieNo" type="hidden" value="${movie.movieNo}"/>
									<input name="wishUserFlag" type="hidden" value="${movie.wishUserFlag}"/>
									<button type="button" name="ticketing-btn" class="btn btn-yellow-cs"><i class="fas fa-ticket-alt"></i>예매</button>
	<!-- 			                  	좋아요 버튼 --------------------------------------------------------------->
	<!-- 								wishUserFlag 가 1인 경우==> 좋아요가 눌린 상태 -->
	<!-- 								wishUserFlag 가 0인 경우==> 좋아요가 눌리지 않은 상태 -->
									<c:if test="${user.role eq 'user' || user.role eq 'admin' }">
				                  		<button type="button" name="wish-btn" class="btn btn-outline-secondary">
				                  	
				                 	 <c:if test="${movie.wishUserFlag ne null}">
					                 	 <c:choose>
					                 	 	<c:when test="${movie.wishUserFlag eq 1}">
					                 	 		<i class="fas fa-heart text-danger"></i> ${movie.wishCnt}
					                 	 	</c:when>
					                 	 	<c:otherwise><i class="far fa-heart text-muted"></i> ${movie.wishCnt}</c:otherwise>
					                 	 </c:choose>
				                 	 </c:if>
				                  		</button>
				                  </c:if>
								</div>
							</div>
				        </div>
			        </div>
	
			    </div>
			    <div class="row border-bottom pb-3 mt-3">
			        <div class="col-md-6 embed-responsive embed-responsive-16by9">
			        	<h4>무비 트레일러</h4>
			        	<iframe id="player" class="embed-responsive-item" width="640" heigth="390
			        		src=""></iframe>
			        </div>
			        <div class="col-md-6" style="padding:20px">
			        	<div>
			        		<div><h6>줄거리</h6></div>
			        		<p>${movie.summary}</p>
			        	</div>
			        </div>
			    </div>
<!-- 			    한줄평 및 리뷰  -->
				<div class="row border-bottom pb-3 mt-3">
					<div class="col-8 div-center-cs">
					  <div id="cmt-table" class="bg-dark-cs p-3 text-center  mb-3"><h6 class="m-0">한줄평</h6></div>
					  
						<table class=" table table-sm table-hover text-center col-9 div-center-cs">
						  <tbody>
					          
					<!--         list size만큼 for문으로 Point 내역 출력  -->
						   <c:if test="${empty resultCmtMap.list}">
						   <c:if test="${user.role eq 'user' || user.role eq 'admin' }">
							   	<div class="border-bottom text-center my-auto" style="height: 100px;">
							   		<p>처음으로 한줄평을 남겨보세요.</p>
							   		<button type="button" class="btn btn-sm btn-yellow-cs" data-toggle="modal" data-target="#modal-addOneline">
											  한줄평 작성
									</button>
							   	</div>
						   	</c:if>
						   </c:if>
						   <c:if test="${! empty resultCmtMap.list}">
					        <c:forEach var="oneline" items="${resultCmtMap.list}">
						      <tr >
						        <th scope="col" class="text-left"> ${oneline.commentContent}</th>
						        <td scope="col" class="text-muted">- ${oneline.userId}
						        
						        </td>
						      </tr>
					        </c:forEach>  
					       </c:if>
					          
						  </tbody>
						</table>
						
				
					  
					</div>
				</div>
			</div>
		</div>
		
				<!-- 한줄평 등록 Modal -->
		<div class="modal fade" id="modal-addOneline" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header bg-yellow-cs">
		        <h5 class="modal-title" id="exampleModalCenterTitle">한줄평 작성</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
			      <div class="modal-body">
			        <input class="form-control form-control-lg" name="commentContent" type="text" placeholder="한줄평을 작성하세요.">
			        <input type="hidden" name="movieNo" value="${movie.movieNo}">
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button type="button" name="btn-addOneline" class="btn btn-yellow-cs">등록</button>
			      </div>
		    </div>
		  </div>
		</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>	
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!--     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->
  </body>
</html>