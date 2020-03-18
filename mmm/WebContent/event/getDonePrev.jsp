<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/javascript" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">
		
		
		function Pagination(currentPage) {
			$("#currentPage").val(currentPage);
			console.log($("#currentPage").val());
			$("form").attr("method","POST").attr("action", "/event/getPreviewList").submit();
		}	
		

		$(function(){
			
			$("select#order").on("change", function(){
			var order = $("#order").val();
			alert(order);
				Pagination(1);		
				});
			
			$('div[name="thumbImage"]').on('click',function(){
				console.log('thumbImage클릭')
				var previewNo = $(this).parent().find("input[name='pn']").val();
				alert(previewNo)
				self.location = "/event/getPreview?previewNo="+previewNo;
				
			});
			
			
			$('button[name="winBtn"]').on('click',function(){
				console.log('winBtn클릭')
				var previewNo = $(this).parent().find("#pn").val();
				self.location = "/event/getWinnerList";
				
			});
			
			
			
		})
</script>

	<style>
	
	img.doneImg{
	width:40px;
	height:55px;
	}

	body{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight bold;
		}

	h5{
		font-family: 'Noto Sans KR', sans-serif;
	}
	*{
		margin:0; 
		padding:0; 
		border:0;
		}
	
	.owl-carousel{}
	
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
	        background: rgba(0, 0, 0, 0.6);
	        -webkit-transition: .6s ease;
	        transition: .6s ease;
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
	    
	    figure:hover h4 {
	        display: none;
	    }   
	    
	    figure:hover .overlay {
	        display: block;
	        height: 100%;
	    }
	    button.btn.btn-primary {
		  display: block;
		  margin-left: 10;
		}
		
		img {
		
		}
		
     	div{
        width: 100%;
   	  	}
    
    
    	div.left {
        width: 40%;
        float: left;
        height: 300px;
        }
     
     	div.right {
        width: 40%;
        float: right;
        height: 300px;
     	 }
 
		ul{
		   list-style:none;
	 	  }


		.doneImg {
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
		}
	
		.doneImg:hover {
		  transform: scale(1.2);
		  -webkit-transform: scale(1.2);
		  -moz-transform: scale(1.2);
		  -ms-transform: scale(1.2);
		  -o-transform: scale(1.2);
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
		
		#doneMore{
		font-size : 20px;
		}
	  body > div.container{
            padding-top : 150px;
            font-family: 'Do Hyeon', sans-serif;
        }
        
		.thumbnail{        
		    width: 290px; 
		    // width : 100%;
		    height: 400px;
		    text-align :center;
		}

		.img-thumbnail.mx-auto.d-block{
		    width: 280px;
		    height: 350px;
		    display: block;
		    text-align :center;
		}
		
		#thumbImage {
			width: 290px;
			height: 250px;
			margin: 0px auto;
			text-align : center;
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
	        background: rgba(0, 0, 0, 0.6);
	        -webkit-transition: .6s ease;
	        transition: .6s ease;
	    }
	    
	    figure .overlay .description {
	        font-size: 18px;
	        position: relative;
	        top: 50%;
	        left: 50%;
	        padding: 0px;
	        -webkit-transform: translate(-50%, -50%);
	        -ms-transform: translate(-50%, -50%);
	        transform: translate(-50%, -50%);
	        text-align: center;
	    }
	    
	    figure:hover h4 {
	        display: none;
	    }   
	    
	    figure:hover .overlay {
	        display: block;
	        height: 100%;
	    }
	    button.btn.btn-primary {
		  display: block;
		  margin-left: 10;
		}
		
		img {
		
		}
    
	   </style>
</head>

<body>



<div class="container">
<br/><br/>
<h4><i class="fas fa-trophy"></i>마감된 이벤트</h4>
<p class="lbtxt">지난 시사회 </p>
<hr>
<br/>

<div class="row">
	    <div class="second mt-6">
        <div class="row">
	    	
		<c:set var="i" value="0" />
		 <c:forEach var="preview" items="${doneList}">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
	    	<div name="thumbImage">
	    	<figure>
	    	
	    	
		 		<img class="img-thumbnail mx-auto d-block" src= "/resources/image/${preview.previewImage}" >
		        <div class="overlay">
		        	<div class="description">
		        	${preview.previewName}<br>
		        	${preview.previewPlace}<br>
		        	${preview.preDate}
		        	${preview.previewTime}
		     <input type="hidden" name="pn" value="${preview.previewNo}">
		        	</div>
		        </div>
		 	</figure>
		 
		 	</div> 
		 ${preview.previewFlag}     
		   </div> 
		  </div>
		   </c:forEach>
		</div>
		
    </div>




</div>



</div>

 <div class="ticketingPagination row">
			  		<div class="col-4"></div>
			  		<div class="col-4">
					  <ul class="pagination">
		   				 <!--  <<== 좌측 nav -->
		  				<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		  					    <li class="page-item disabled">
     								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
   								 </li>
		  				</c:if>
		  				<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					   		<li class="page-item">
					   				 <a class="page-link" href="javascript:Pagination('${resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true">Previous</a>
   							</li>
						</c:if>
						
					    <!--  중앙  -->
						<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
							<c:if test="${ resultPage.currentPage == i }">
								<!--  현재 page 가르킬경우 : active -->
							    <li class="page-item active" aria-current="page">
      								<a class="page-link" href="javascript:Pagination('${ i }')">${ i }<span class="sr-only">(current)</span></a>
   								 </li>
							</c:if>	
							
							<c:if test="${ resultPage.currentPage != i}">	
								<li class="page-item">
									<a class="page-link" href="javascript:Pagination('${ i }')">${ i }</a>
								</li>
							</c:if>
						</c:forEach>
					     <!--  우측 nav==>> -->
					     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">						
					    	<li class="page-item disabled">
					    		<a class="page-link" href="#">Next</a>
    						</li>
					      </c:if>
					      <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
					      	    <li class="page-item">
     							 <a class="page-link" href="javascript:Pagination('${resultPage.endUnitPage+1}') ">Next</a>
    							</li>
						 </c:if>	
					  </ul><!-- end of pagination -->
					 </div><!-- end of middle col --> 
					 <div class="col-4"></div>
					 	<input type="hidden" id="currentPage" name="currentPage" value=""/>
					 	
			  </div><!-- end of ticketingPagination -->
					 	</form>
			  
	    
 </body>
 




</html>