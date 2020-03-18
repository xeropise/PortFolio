<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title> 

 <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

 
 <!-- 부트스트랩4 를 위한 것 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>






<!-- carousel -->
<script src="../resources/javascript/owl.carousel.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>

<script type="text/javascript">


		$(document).ready(function(){
			$('.dropdown-toggle').dropdown('toggle')
			$('.dropdown-toggle').dropdown('hide')
		    $(".owl-carousel").owlCarousel();
		});


		$(function(){
			$('div[name="cardImg"]').on('click',function(){
				
				console.log('이미지클릭클릭')

				var previewNo = $(this).parent().find("input[name='pn']").val();
				
				//alert(previewNo)
				
				self.location = "/event/getPreview?previewNo="+previewNo;
			
			});
			
/*			
 			$('ul li').on('click',function(){
				var previewNo = $(this).parent().next().val();
				//alert(previewNo)
				self.location = "/event/getPreview?previewNo="+previewNo;
				
			}); 
*/
			
			$("div[name='thumbImage']").on("click", function(){
				
				var doneNo = $(this).parent().find("input[name='pn']").val();
				self.location = "/event/getPreview?previewNo="+doneNo;
				
			})
		})
</script>
<style>

	img.doneImg{
	width:40px;
	height:55px;
	}

	div.previewList{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight bold;
	}

	
	.owl-carousel .item{
		width: 290px;
		height: 400px;
		margin: 0px auto;
		text-align : center;
		line-height:250px; 
		margin:10px;
		}
		
		img.card-img-top{
			width: 290px;
			height:350px;
		}
		
		figure {
	        width: 100%;
	        position: relative;
	   	}
		    
		    
	    figure img {
	        display: block;
	        width: 100%;
	        height: auto;
	    }   
	    
	    figure h4 {
	        position: absolute;
	        top: calc(100% - 50px);
	        left: 0;
	        width: 100%;
	        height: 50px;
	        color: #fff;
	        background: rgba(0, 0, 0, 0.6);
	        margin: 0;
	    }   
	    
	    figure .overlay {
	        position: absolute;
	        bottom: 0;
	        left: 0;
	        right: 0;
	        overflow: hidden;
	        width: 100%;
	        height: 0;
	        color: #fff;
	        background: rgba(0, 0, 0, 0.8);
	        -webkit-transition: .5ms ease;
	        transition: .5ms ease;
	    }
	    
	    figure .overlay .description {
	        font-size:13px;
	        position: relative;
	        top: 50%;
	        left: 50%;
	        padding: 0px;
	        -webkit-transform: translate(-50%, -50%);
	        -ms-transform: translate(-50%, -50%);
	        transform: translate(-50%, -50%);
	        text-align: center;
	    }
	    
	  
	    
	    figure:hover .overlay {
	        display: block;
	        height: 100%;
	    }
	    
	    
	    button.btn.btn-primary {
		  display: block;
		  margin-left: 10;
		}
		
     	body#previewList div{
       	 width: 100%;
   	  	}
    

		body#previewList ul{
		   list-style:none;
	 	  }


		.doneImg {
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 0.5s ease-in-out;   /* 부드러운 모션을 위해 추가*/
		}
		
		.img {
			width:325px; 
			height:280px;
		}  
		
		p.lbtxt{	
		letter-spacing: -0.05em !important;
		font-family: 'Nanum Gothic';
		margin: 0;
		padding: 0;
		padding-bottom: 17px;
		line-height: 19px;
		font-size: 14px;
		color: #666;
		}
		
		.thumbnail{        
	    width: 300px; 
	    // width : 100%;
	    height: auto;
	    text-align :center;
		}

		.img-thumbnail.mx-auto.d-block{
	    width: 300px;
	    height: auto;
	    display: block;
	    text-align :center;
		}
		
		#thumbImage {
		width: 300px;
		height: auto;
		margin: 0px auto;
		text-align : center;
		}
</style>

</head> 

<body>
<jsp:include page="/event/eventToolBar.jsp" />
<%-- <jsp:include page="/layout/header.jsp"></jsp:include> --%>

<div class="container previewList">
<br/><br/>
<h4><span style="font-size:30px; font-weight:bold;"><i class="fas fa-trophy"></i>시사회 이벤트</span></h4>
<p class="lbtxt">개봉 전  누구보다 먼저 영화를 만나는 방법</p>
<hr>
<br/>

<div class="container previewList">
		<div>
		<h5 style="font-weight:bold;">진행중인 이벤트</h5>
		<br/><br/>
	<div class="row">
	
		<div class="col-1 nav">
			<button type="button" class="btn btn-light" id="popularPrev"><i class="fa fa-angle-double-left" style="font-size:48px"></i></button>
		</div>
		
		
		<div class="col-10">
			<!-- owl-carousel 시작 -->
			<div class="owl-carousel owl-theme" id="owl-popular">
				<c:set var="i" value="0" />
				 <c:forEach var="preview" items="${doingList}">
				
				<div class="item">
		      	<div class="card" name="cardImg">
		     	<figure>
          		  <img name="preImg" src= "${preview.previewImage}" alt="" class="card-img-top" />
                  <div class="overlay">
		        	<div class="description" style="line-height:170%">
		        	<span style="font-size:1.5em;">${preview.previewName}</span><br>
		        	<span style="font-size:1.5em;">${preview.previewPlace}</span><br>
		        	<span style="font-size:1.5em;">${preview.preDate}</span><br>
		        	<span style="font-size:1.5em;">${preview.previewTime}</span>
		     <input type="hidden" name="pn" value="${preview.previewNo}">
		        	</div>
		        </div>
		        
            <div name="moreInfo" class="card-body">
              <a href="#" class="btn btn-warning">More</a>
            </div>
            </figure>
          </div>
	    	
	
		  </div>
		   </c:forEach>
				
			</div>

			<!-- owl-carousel 끝 -->
		</div>
		
		<div class="col-1 nav">
			<button type="button" class="btn btn-light" id="popularNext"><i class="fa fa-angle-double-right" style="font-size:48px"></i></button>
		</div>
		
	</div>

</div>
<br><br><br><br><br>
 <div class="second mt-6">
        <h5 style="font-weight:bold;">마감된 이벤트</h5>
        <br>
        
	<div class="row text-align-center ">

		<c:set var="i" value="0" />
		 <c:forEach var="preview" items="${doneList}">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
	    	<div name="thumbImage">
	    	<figure>
	    	
		 		<img class="img-thumbnail mx-auto d-block" src= "${preview.previewImage}" >
		        <div class="overlay">
		        	<div class="description">
		        	<span style="font-size:1.2em;">${preview.previewName}</span><br>
		        	<span style="font-size:1.2em;">${preview.previewPlace}</span><br>
		        	<span style="font-size:1.2em;">${preview.preDate}</span><br>
		        	<span style="font-size:1.2em;">${preview.previewTime}</span>
		        
		     <input type="hidden" name="pn" value="${preview.previewNo}">
		        	</div>
		        </div>
		 	</figure>
		 
		 	</div> 
		   </div> 
		  </div>
		   </c:forEach>
        </div>
    </div>


</div>
</div>
<jsp:include page="/layout/footer.jsp"></jsp:include>
 </body>
 
 </html>