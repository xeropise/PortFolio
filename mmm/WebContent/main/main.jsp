<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
 
    
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 
    <!-- font Awesome -->
  <script src="https://kit.fontawesome.com/b435a047df.js" crossorigin="anonymous"></script>
    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
<style>
 html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center; }
 
 
 body {
 	height : 3000px;
 	font-family: 'Noto Sans KR', sans-serif !important;
 
 }
 
 .prevCarousel{
  width:450px;
  height:auto;
  margin-top:0;
  margin-left:15px;
 }
 .d-block{
  width:450px;
  height:auto;
  margin-top:0;
 }
 .carousel-inner > .item > img {
  width:640px;
  height:360px;
}

 div#trailer{
 	width : 620px;
 
 }
 
 h3.mainPage {
 	height: 41px;
    background: url(../resources/image/mainPage/bg_h3_line.jpg) repeat-x 0 50%;
    line-height: 41px;
    text-align: center;
    font-weight: 500;
 
 }
 
 div#movieInfo{
 	width : 190px;
 
 }
 
 a.more {
 	float : right;
 
 }
 
 div.postContent p {
 	 white-space: nowrap; 
 	 overflow: hidden;
 	 text-overflow: ellipsis; 
 	 word-wrap: break-word; 
 	 -webkit-box-orient: vertical;
 }
 
 	.img.quiz{
        position: relative;
        width: 480px;
        height: 345px;
        background-image: url(/resources/image/mainPage/preview/quiz_img.jpg);                                                               
        background-size: cover;
    }
 	.img.attend{ 									
        position: relative;
        width: 480px;
        height: 345px;
        background-image: url(/resources/image/mainPage/preview/attend.jpg);                                                               
        background-size: cover;
    }

    .img-cover{
       position: absolute;
       height: 100%;
       width: 100%;
       background-color: rgba(0, 0, 0, 0.7);                                                                 
       z-index:1;
    }

    .img .content{
         position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         font-size:6rem;
         color: white;
         font-weight: 600px;
         z-index: 2;
         text-align: center;
    }
/* 슬라이더 */
 	
    
    .clearfix:after { content: ''; display: block; clear: both; float: none; }
    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }
    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }
    .link:hover, .link:focus { color: #9fd6c2; }
	 #movieSelectList { width: 1000px; margin: auto; }
	.slide_wrap { position: relative; width: 1000px; margin: auto; padding-bottom: 30px; }
	.slide_box { width: 100%; margin: auto; overflow-x: hidden; }
	.slide_content { display: table; float: left; width: 184px; height: 200px; }
													/* mr-3 값이 16px임*/
	.slide_content > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }
	/*
	.slide_content.slide01 { background: #ddbdff; }
	.slide_content.slide02 { background: #9fd6c2; }
	.slide_content.slide03 { background: #abe2f7; }
	.slide_content.slide04 { background: #f08c78; }
	.slide_content.slide05 { background: #fbdb65; }
	*/
	.slide_btn_box > button { position: absolute; top: 50%; margin-top: -45px; width: 60px; height: 60px; font-size: 16px; color: #999; background: none; border: 1px solid #ddd; cursor: pointer; }
	.slide_btn_box > .slide_btn_prev { left: -100px; }
	.slide_btn_box > .slide_btn_next { right: -100px; }
	.slide_pagination { position: relative; left: 50%; bottom: -20px; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
	.slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
	.slide_pagination .dot.dot_active { background: #333; }
	.slide_pagination .dot a { display: block; width: 100%; height: 100%; }
 
	.carousel{
/* 		pointer-events: none; */
		z-index : 500;
	}
	.mb-8{
		margin-bottom: 7rem!important;
	}
	
	#cancelToast {
		width : 300px;
		position:fixed;
		right:160px;
		bottom:0px;
		z-index:2000;
		cursor : pointer;
	}
	
	
	#cancelToast > div.toast-header > i {
			position : relative;
			top : 1px;	
			right : 2px;
	}
	
	#cancelToast > div.toast-header {
			background-color : #fee50e;
			color: #333;
	}
	
	.carousel-indicators > li.active{	
		background-color: #fee50e;	
	}
</style>
</head>
<body>

	<jsp:include page="/layout/header.jsp"></jsp:include>

	
	<div class="container-fluid px-0 mb-8">
		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="../resources/image/mainPage/main_image03.png" class="d-block w-100" alt="..." width=1048 height=518 >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>팝콘을 기다리는 동안 코로나 걸려버린다면?</h5>
		        <p>MovMovMov의 QuickOrder Service를 이용해보세요. 누구보다 빠르게 팝콘을 입에 넣으실 수 있어요!</p>
		      </div>
		    </div>
		    <div class="carousel-item ">
		      <img src="../resources/image/mainPage/main_image01.png" class="d-block w-100" alt="..." width=1048 height=518 >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>3사 예매 사이트를 비교하시기 번거롭지 않으신가요?</h5>
		        <p>mmm에서는 CGV, 롯데시네마, 메가박스 3사의 예매 정보를 한눈에 확인할 수 있어요!</p>
		      </div>
		    </div>

		    <div class="carousel-item">
		      <img src="../resources/image/mainPage/main_image04.png" class="d-block w-100" alt="..." width=1048 height=518 >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>당신을 위한 맞춤형 영화 추천</h5>
		        <p>당신의 취향에 맞는 작품을 선별하여 추천해드려요 :)</p>
		      </div>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	<div class="mb-5 mx-5">
		<h3 class="mainPage"><img class="introTag" src="http://img.cgv.co.kr/R2014/images/title/h3_movie_selection.gif" alt="MOVIE SELECTION"></h3>
	</div>
	
	<div class="container-fluid mb-8">
		<div class="pageContent row">
			<div class="col-12 movieSelection row mr-3">
				<div id="movieSelected" class="col-12 row mb-5">
					<div class="col-1"></div>
					<div class="col-5 pr-0" id="movieInfo">
						 <img name="poster" class="img-thumbnail"  src=""  width="500" alt="">
					</div>
					<div class="col-5 pl-0" id='trailer'>
						<div class="row mx-0 mb-5">
							<div id='trailer' class="col-12 embed-responsive embed-responsive-16by9">
					  			<iframe id="player" class="embed-responsive-item"  allowfullscreen></iframe>
							</div>
						</div>
						<div class="row mx-0">					
							<div id='movieInfo' class="col-12">
								<div class="card">
								  <div class="card-body">
								    <h5 class="card-title"></h5>
								    <h6 class="card-subtitle mb-3 text-muted"> <span id="starRating"></span></h6>
								    <h6 class="card-subtitle mb-3 text-muted"> <span id="releaseDate"></span></h6>
								    <p class="card-text"></p>
								  </div>
								</div>
							</div><!-- end of movieInfo -->
						</div>
					</div><!-- end of trailer -->
					<div class="col-1"></div>
				</div><!-- end of movieSelected -->
				<div id="movieSelectList" class="col-12 row mb-5">
				    <div class="slide_wrap">
				      <div class="slide_box">
				        <div class="slide_list clearfix">
				        <!-- 
				          <div class="slide_content slide01 mr-3">
				            <p>1</p>  
				          </div>
				          <div class="slide_content slide02 mr-3">
				            <p>2</p>
				          </div>
				          <div class="slide_content slide03 mr-3">
				            <p>3</p>
				          </div>
				          <div class="slide_content slide04 mr-3">
				            <p>4</p>
				          </div>
				          <div class="slide_content slide05 mr-3">
				            <p>5</p>
				          </div>
				         -->
				        </div>
				        <!-- end of slide_list -->
				      </div>
				      <!-- end of slide_box -->
				      <div class="slide_btn_box">
				        <button type="button" class="slide_btn_prev">≪</button>
				        <button type="button" class="slide_btn_next">≫</button>
				      </div>
				      <!-- end of slide_btn_box -->
				      <ul class="slide_pagination text-center"></ul>
				      <!-- end of slide_pagination -->
				    </div> <!-- end of slide_wrap -->
				</div>
				<div id="movieList" class="col-12 row">
					<div class="col-1"></div>
					<div class="col-10">
					
					</div>
					<div class="col-1"></div>				
				</div><!-- end of movieList -->
			</div><!-- end of movieSelection -->
		</div> <!-- end of pageContent -->
	</div> <!-- end of container-fluid -->
	
	<div class="mb-5 mx-5">
	<h3 class="mainPage"><img class="introTag" src="http://img.cgv.co.kr/R2014/images/title/h3_event.gif" alt="EVENT"></h3>
	</div>
	
	<div class="container-fluid">
		<div class="pageContent row">
			<div class="col-12 row mr-3">
				<div class="col-12 row mb-5">
					<div class="col-1"></div>
					<div id="issueContent" class="col-5">
						
						<hr>
						<div class="row mx-0">
							<div class="col-12 row">
								<div class="postImage col-12 mb-2 text-center">
								<div class="img quiz" style="cursor:pointer;">
								   <div class="content">
									<h4>이런 퀴즈 어때요?</h4>
								  </div>
								<div class="img-cover"></div>
								</div>
								</div>
								
								<div class="postHeader col-12 mb-2 text-center">
									<h4>
										<a style="color:black;" href="/event/getQuizList"> </a>
									</h4>
								</div>
								<div class="postContent col-12 mb-2">
									<p></p>
								</div>
							</div>
							<br><br>
							<div class="col-12 row">
								<div class="postImage col-12 mb-2 text-center">
									<div class="img attend">
								   <div class="content">
									<h4>매일매일 출석체크</h4>
								  </div>
								<div class="img-cover" style="cursor:pointer;"></div>
								</div>
								</div>
								
								<div class="postHeader col-12 mb-2 text-center">
								</div>
								
								<div class="postContent col-12 mb-2">
									<p></p>
								</div>
							</div>							
						</div>	
						
					</div><!-- end of issueContent -->
					
					<div id="eventContent" class="col-5">
						<h5><a style="color:black;" href="/event/getPreviewList" class="more">이벤트 더보기</a></h5>
						
						<hr>
						<div class="col-12">
							<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							      <img src="" class="prevCarousel" id="preview1" alt="...">
							    	<input type="hidden" name="previewNo1" value=""> 
							    </div>
							    <div class="carousel-item">
							      <img src="" class="prevCarousel" id="preview2" alt="...">
							    	<input type="hidden" name="previewNo2" value=""> 
							    </div>
							    <div class="carousel-item">
							      <img src="" class="prevCarousel" id="preview3" alt="...">
							    	<input type="hidden" name="previewNo3" value=""> 
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div><!-- end of carousel -->
						</div>
					</div><!-- end of eventContent -->
					<div class="col-1"></div>
				</div>
			</div>
		</div> <!-- end of pageContent -->
	</div> <!-- end of container-fluid -->	
	
<jsp:include page="/layout/footer.jsp"></jsp:include>
	
<c:if test="${ user.role eq 'user' || user.role eq 'admin'  }">	
	<jsp:include page="/layout/sideBar.jsp"></jsp:include>
</c:if>
<div style="" class="toast" role="alert" aria-live="assertive" aria-atomic="true" id="cancelToast" data-animation="true" data-delay="10000">
  <div class="toast-header">
    <i class="far fa-bell"></i>
    <strong class="mr-auto">알림</strong>
    <small>방금</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
  		<c:if test="${alarm eq '0'}">
  			<strong>로그인이 완료되었습니다.</strong>
  		</c:if>
  		<c:if test="${alarm eq '1'}">
           <strong>로그아웃이 완료되었습니다.</strong>
        </c:if>   
        <c:if test="${status=='failed'}">
        	<strong><span style="color:red;">비회원</span>으로는 접근불가합니다.</strong>
        </c:if>
  </div>
</div>
<!-- 슬라이더 -->
  <script>
  function slider(){
    (function () {
      var slideList = document.querySelector('.slide_list');  // Slide parent dom
      var slideContents = document.querySelectorAll('.slide_content');  // each slide dom
      var slideBtnNext = document.querySelector('.slide_btn_next'); // next button
      var slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
      var pagination = document.querySelector('.slide_pagination');
      var slideLen = slideContents.length;  // slide length
      var slideWidth = 200; // slide width
      var slideSpeed = 300; // slide speed
      var startNum = 0; // initial slide index (0 ~ 4)
      
      slideList.style.width = slideWidth * (slideLen + 8) + "px";
      
      // Copy first and last slide
      let firstChild = slideList.firstElementChild;
      let secondChild = slideList.firstElementChild.nextElementSibling; 
      let thirdChild = secondChild.nextElementSibling;
      let fouthChild = thirdChild.nextElementSibling;
      
      let lastChild = slideList.lastElementChild;
      let lastChildB4 = slideList.lastElementChild.previousElementSibling; 
      let lastChildB4B4 = lastChildB4.previousElementSibling; 
      let lastChildB4B4B4 = lastChildB4B4.previousElementSibling;
      
      let clonedFirst = firstChild.cloneNode(true);
      let clonedSecond = secondChild.cloneNode(true);
      let clonedThird = thirdChild.cloneNode(true);
      let clonedFouth = fouthChild.cloneNode(true);
      
      let clonedLast = lastChild.cloneNode(true);
      let clonedLastB4 = lastChildB4.cloneNode(true);
      let clonedLastB4B4 = lastChildB4B4.cloneNode(true);
      let clonedLastB4B4B4 = lastChildB4B4B4.cloneNode(true);
      
      // Add copied Slides
      slideList.appendChild(clonedFirst);  
      slideList.insertBefore(clonedLast, slideList.firstElementChild);
        
      slideList = document.querySelector('.slide_list')
        
      slideList.appendChild(clonedSecond);  
      slideList.insertBefore(clonedLastB4, slideList.firstElementChild);  
      
      slideList = document.querySelector('.slide_list')
      
      slideList.appendChild(clonedThird);  
      slideList.insertBefore(clonedLastB4B4, slideList.firstElementChild); 
      
      slideList = document.querySelector('.slide_list')
      
      slideList.appendChild(clonedFouth);  
      slideList.insertBefore(clonedLastB4B4B4, slideList.firstElementChild);       
        
      // Add pagination dynamically
      let pageChild = '';
      for (var i = 0; i < slideLen; i++) {
        pageChild += '<li class="dot';
        pageChild += (i === startNum) ? ' dot_active' : '';
        pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
      }
      pagination.innerHTML = pageChild;
      const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

      slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

      let curIndex = startNum; // current slide index (except copied slide)
      let curSlide = slideContents[curIndex]; // current slide dom
      curSlide.classList.add('slide_active');

      /** Next Button Event */
      slideBtnNext.addEventListener('click', function() {
        if (curIndex <= slideLen - 1) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
        }
        if (curIndex === slideLen - 1) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
          }, 300);
          curIndex = -1;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[++curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Prev Button Event */
      slideBtnPrev.addEventListener('click', function() {
        if (curIndex >= 0) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
        }
        if (curIndex === 0) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
          }, 10);
          curIndex = slideLen;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[--curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Pagination Button Event */
      let curDot;
      Array.prototype.forEach.call(pageDots, function (dot, i) {
        dot.addEventListener('click', function (e) {
          e.preventDefault();
          curDot = document.querySelector('.dot_active');
          curDot.classList.remove('dot_active');
          
          curDot = this;
          this.classList.add('dot_active');

          curSlide.classList.remove('slide_active');
          curIndex = Number(this.getAttribute('data-index'));
          curSlide = slideContents[curIndex];
          curSlide.classList.add('slide_active');
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
        });
      });
    })();
  }
  </script>
  
  <script>
  function ajaxPromise(urls,datas){
		return new Promise(function (resolve, reject){
		  $.ajax({
			  type: "POST",
			  url: urls,
			  data: JSON.stringify(datas),
			  dataType : "json",
			      headers: { 
			        "Accept" : "application/json",
			        "Content-Type": "application/json"
			      },
			      success : function(result,status){
			    	  // 데이터를 받으면 resolve() 호출
				      resolve(result);			      		
			    	  
			      }//end of success	
		
		  })//end of ajax
		})//end of Promise
	}//end of function-ajaxPromise
	
	
  
  getMovieInfo();

	
  async function getMovieInfo(){
	   var result =await ajaxPromise("/movie/json/getBoxOfficeList",{ } );
	  
	   //console.log(result);
	   //console.log(result[1]);
	   //console.log(result[1].movieTitle);
	   
	   var movieNo = result[1].movieNo;
	   //console.log(movieNo);
	   
	   ajaxPromise("/movie/json/getMovie" , {movieNo : movieNo}
		).then(function(movie){
			//console.log(movie)						
			//console.log(movie.summary)		
			
//			포스터 갈아끼기
			$("img[name='poster']").attr('src',movie.poster );
			
//			영상갈아끼기
			$('#player').attr("src","http://www.youtube.com/embed/"+movie.trailer);
			
//			제목, 평점, 개봉일, 줄거리 갈아끼기
			$("#movieInfo > div > div > h5").text(movie.movieTitle);
			$("#starRating").text('예매율: '+movie.starRating);
			$("#releaseDate").text('개봉일: '+movie.releaseDate);
			$("#movieInfo > div > div > p").text(movie.summary);
			
		})
	   
	   
	   
	   result.forEach( (value,index)=> {
		   
		   var Element= "<div class='slide_content slide01 mr-3'>"
			   Element+="<p><img name='bottom-poster' src='"+value.poster+"' width=184 height=250>"
			   Element+= "<input name='movieNo' type='hidden' value='"+value.movieNo+"'></input></p>"
			   Element+="</div>"
		   
		   $("div.slide_list").append(Element)
		   
		   
	   });
	   
	   slider();
  }
  
//   포스터 클릭 이벤트
  $(document).on("click", "img[name='bottom-poster']", function(){
	  
	  //console.log(this);
	  var movieNo = $(this).parent().children("input[name='movieNo']").val();
	  //console.log('--- movieNo:  ' + movieNo);
	  
	  var result = ajaxPromise("/movie/json/getMovie" , {movieNo : movieNo}
					).then(function(movie){
						//console.log(movie)						
						//console.log(movie.summary)		
						
// 						포스터 갈아끼기
						$("img[name='poster']").attr('src',movie.poster );
						
// 						영상갈아끼기
						$('#player').attr("src","http://www.youtube.com/embed/"+movie.trailer);
						
// 						제목, 평점, 개봉일, 줄거리 갈아끼기
						$("#movieInfo > div > div > h5").text(movie.movieTitle);
						$("#starRating").text('예매율: '+movie.starRating);
						$("#releaseDate").text('개봉일: '+movie.releaseDate);
						$("#movieInfo > div > div > p").text(movie.summary);
						
					}) 
  });
  
  
  getPreviewInfo();
  
  async function getPreviewInfo(){
	  
	  var result = await ajaxPromise("/event/json/getPreviewInfo", {});
	 
	  $("#preview1").attr("src", result[0].previewImage);
	  $("#preview2").attr("src", result[1].previewImage);
	  $("#preview3").attr("src", result[2].previewImage);
  }
  
  $(".img.attend").on("click", function(){
	 self.location="/event/addAttendance"; 
  });
  
  $(".img.quiz").on("click", function(){
	 self.location="/event/getQuizList"; 
  })
  
  
  $(function(){
	  <c:if test="${status=='failed'}">
	  	$('#cancelToast').toast('show')
	  </c:if>
	  <c:if test="${alarm eq '1'}">
	  $('#cancelToast').css("right","30px");
	  </c:if>
	<c:if test="${alarm eq '1' || alarm eq '0'}">
		$('#cancelToast').toast('show')
	</c:if>
	 
		$('.dropdown-toggle').dropdown('toggle')
		$('.dropdown-toggle').dropdown('hide')	
  });
  </script>
  

</body>
</html>