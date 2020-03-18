<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>

<script type="text/javascript">


	function Pagination(currentPage) {
		$("#currentPage").val(currentPage);
		console.log($("#currentPage").val());
		$("form").attr("method","POST").attr("action", "/customer/getAskList").submit();
	}
	
	
	$(function(){
		
		$('.dropdown-toggle').dropdown('toggle')
		$('.dropdown-toggle').dropdown('hide')
		
		$(document).on("click",".getTranInfo td:nth-child(2)" ,function() { //로드 당시에 없었던 요소들도 이벤트 걸어줌
		
			console.log("눌렀어");
			console.log($($($(this).parent().parent()).find('.row')).last().html());
			var articleNo = $(this).parent().find('#articleNo').val();
			getAsk(articleNo)
		});
		
		$("button[name='ask']").on("click", function(){
			self.location="/customer/getAskList";
		});
		
		$("button[name='notice']").on("click", function(){
			self.location="/customer/getNoticeList";
		});
		
		$("button[name='contact']").on("click", function(){
			self.location="/customer/addContact";
		});
	});
	
</script>

<style type="text/css">
	
		@media (min-width: 768px) {
	 	 .container {
	     width: 750px;
	  }
	}
	
		@media (min-width: 992px) {
		 .container {
	     width: 940px;
	  }
	}
	
	body { 
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: bold;
		}
		
	.label {
	    display: inline-block;
	    text-align: center;
	    font-weight: 400;
	    border-radius: 4px;
	    text-decoration: none;
	    border: 1px solid #282828;
	    vertical-align: middle;
	    background-color: #fff;
	    cursor: pointer;
	    font-size: 90%;
	}
	
		.table{
			font-size: 13px;
			float: none;
		}
	
		.page-item .active {
	    z-index: 3;
	    color: #fff;
	    background-color: #feca0e;
	    border-color: #feca0e;
	}

	.page-link {
	    position: relative;
	    display: block;
	    padding: .5rem .75rem;
	    margin-left: -1px;
	    line-height: 1.25;
	    color: #414548;
	    background-color: #fff;
	    border: 1px solid #dee2e6;
	}
	
	.page-item.active .page-link {
	    z-index: 3;
	    color: #333 !important;
	    background-color: #fee50e !important;
	    border-color: #fee50e !important;
	}
	
	.page-link {
		color: #333 !important;
	}
	
	.table td {
		vertical-align: middle !important;
	}	
</style>
</head>
<body>
<jsp:include page="/layout/header.jsp"/>
<jsp:include page="/customer/customerToolBar.jsp" />
<%-- <jsp:include page="/layout/header.jsp"></jsp:include> --%>
<div class="container">

		<div class="page-header mt-3">
	       <span style="font-weight: bold; font-size:35px; color:black;">고객센터</span>
	    <hr>
	    </div>
	    
	 	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
		 <button type="button" name="ask" class="btn"><span style="font-size:20px;"><i class="fas fa-question-circle" style="font-style: normal;">자주찾는질문</i></span></button>
	    <button type="button" name="contact" class="btn"><span style="font-size:20px;"><i class="fas fa-comment"style="font-style: normal;">일대일문의</i></span></button>
	    <button type="button" name="notice" class="btn"><span style="font-size:20px;"><i class="fas fa-info-circle" style="font-style: normal;">공지사항</i></span></button>	
	  </div>
	</div>



	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
	    <button type="button" class="btn btn-default all">전체</button>
	    <button type="button" class="btn btn-default tick" name="">예매&매표</button>
	    <button type="button" class="btn btn-default store">스토어</button>
	    <button type="button" class="btn btn-default pay">결제</button>
	    <button type="button" class="btn btn-default disc">할인혜택</button>
	    <button type="button" class="btn btn-default home">홈페이지</button>
	    <button type="button" class="btn btn-default event">이벤트</button>
	  </div>
	</div>
	


<br>
<div class="categoryBtn">
    	<div><p class="text-dark" style="font-size:15px;"> 
 			전체 <i style='color:#5da3d9'> ${resultPage.totalCount} </i>건 </p> 
 		</div>
 		<div> 
	      <table class="table table-hover table-sm text-center" >
	        <thead class="table-active">
	          <tr>
	            <th  scope="col" class="align-middle text-left">구분</th>
	            <th  scope="col" class="align-middle text-left" >질문</th>
	          </tr>
	        </thead>
			<tbody class="getTranInfo">
			  <c:set var="i" value="0" />
			  <c:forEach var="ask" items="${list}">
				<c:set var="i" value="${ i+1 }"/>
				<tr>
				 
				  <td scope="col" class="align-middle" >
					  <c:if test="${ask.category==1}"><div class="text-center"><label class="btn btn-sm p-1 font-size-5" style="background-color:#fee00e;">예매/매표</label></div></c:if>
					  <c:if test="${ask.category==2}"><div class="text-center"><label class="btn btn-sm p-1 font-size-5" style="background-color:#fee00e;">스토어</label></div></c:if>
					  <c:if test="${ask.category==3}"><div class="text-center"><label class="btn btn-sm p-1 font-size-5" style="background-color:#fee00e;">결제</label></div></c:if>
					  <c:if test="${ask.category==4}"><div class="text-center"><label class="btn btn-sm p-1 font-size-5" style="background-color:#fee00e;">할인혜택</label></div></c:if>
					  <c:if test="${ask.category==5}"><div class="text-center"><label class="btn btn-sm p-1 font-size-5" style="background-color:#fee00e;">홈페이지</label></div></c:if>
					  <c:if test="${ask.category==6}"><div class="text-center"><label class="btn btn-sm p-1 font-size-5" style="background-color:#fee00e;">이벤트</label></div></c:if>
				  
		  	    	<input type="hidden" id="articleNo" value="${ask.articleNo}"/>
				  </td>
				  <td scope="col" class="align-middle text-left" id="" >${ask.articleTitle}</td>
				</tr>
				<tr id="${ask.articleNo}">
				</tr>
	          </c:forEach>
	        </tbody>
	      </table>
	      </div>
	  <div class="askDetail"></div>
      </div>


 <div class="pagination row">
			  		<div class="col-4"></div>
			  		<div class="col-4">
					  <ul class="pagination justify-content-center">
		   				 <!--  <<== 좌측 nav -->
		  				<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		  					    <li class="page-item disabled">
     								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true">«</a>
   								 </li>
		  				</c:if>
		  				<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					   		<li class="page-item">
					   				 <a class="page-link" href="javascript:Pagination('${resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true">«</a>
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
					    		<a class="page-link" href="#">»</a>
    						</li>
					      </c:if>
					      <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
					      	    <li class="page-item">
     							 <a class="page-link" href="javascript:Pagination('${resultPage.endUnitPage+1}') ">»</a>
    							</li>
						 </c:if>	
					  </ul><!-- end of pagination -->
					 </div><!-- end of middle col --> 
					 <div class="col-4"></div>
					 <form>
					 	<input type="hidden" id="currentPage" name="currentPage" value=""/>
					 	<input type="hidden" id="category" name="category" value="${search.category}"/></form>
			  </div><!-- end of ticketingPagination -->
	</div>
	

<script>

	$(function(){
		
		$("div > div> div > button.all").on("click", function(){
			$("#category").val(0);  //예매/매표 카테고리
			category(0)
		}); 
		
		$("div > div> div > button.tick").on("click", function(){
			$("#category").val(1);  //예매/매표 카테고리
			category(1)
		}); 

		$("div > div> div > button.store").on("click", function(){
			$("#category").val(2); //스토어
			category(2);
		});
		
		$("div > div> div > button.pay").on("click", function(){

			$("#category").val(3); //결제
			category(3);
		});
		
		$("div > div> div > button.disc").on("click", function(){

			$("#category").val(4); //할인혜택
			category(4);
		});
		
		$("div > div> div > button.home").on("click", function(){

			$("#category").val(5); //홈페이지
			category(5);
		});
		
		$("div > div> div > button.event").on("click", function(){

			$("#category").val(6); //이벤트
			category(6);
		});
		
		
		
	}); //end of function

	function getAsk(data) {
		
		var datas = JSON.stringify ({
			articleNo : new String(data) //articleNo는 숫자니까..
		})
			console.log(datas)
		
		ajaxPromise("/customer/json/getAsk", datas).then(
			data=> {
				
				var resultData = data;
				
				console.log(resultData) //
				console.log(data.article.articleNo) //
				console.log(data.article.articleTitle)
				console.log(data.article.content)
			
				$(".askDetail").empty();
				
				var html ="<td colspan='2' class='p-2'><div class='inner p-2 text-left'>"+data.article.content
					html +="</div></td>"
			
				$("#"+data.article.articleNo).html(html)
				$("#"+data.article.articleNo).css('background-color','#fee00e');
				$("div.inner").css('background-color','white');
				
				
			}
		
		
		)
		
	}
	
	function category(data) {
		
		var datas = JSON.stringify({
			currentPage : "1",
			category : new String(data),
		})
		
		ajaxPromise("/customer/json/getAskList", datas).then(
			data=> {
				console.log(data)
				$(".categoryBtn").empty();
				
				if(data.askList.length!=0){
					
					var html ="	<div><p class='text-dark' style='font-size:15px;'>전체 <i style='color:#5da3d9'>"+ data.resultPage.totalCount+"</i> 건 </p></div>"
						html +="<div><table class='table table-hover table-sm'>"
			        	html +="<thead class='table-active'><tr>"		
			         	html +="<th scope='col' align='center'>구분</th><th scope='col' align='left'>질문</th></tr></thead>"
						html +="<tbody class='getTranInfo'>"
				
					for (var i = 0; i < data.askList.length; i++) {
						   
						html +="<tr><td scope='col' align='left'>";
						
						if (data.askList[i].category==1) {
							html += "<div class='text-center'><label class='btn btn-sm p-1 font-size-5' style='background-color:#fee00e'> 예매/매표</label></div>";
						}else if (data.askList[i].category==2) {
							html += "<div class='text-center'><label class='btn btn-sm p-1 font-size-5' style='background-color:#fee00e'> 스토어</label></div>";
						}else if (data.askList[i].category==3) {
							html +=  "<div class='text-center'><label class='btn btn-sm p-1 font-size-5' style='background-color:#fee00e'> 결제</label></div>";
						}else if (data.askList[i].category==4) {
							html +=  "<div class='text-center'><label class='btn btn-sm p-1 font-size-5' style='background-color:#fee00e'> 할인혜택</label></div>";
						}else if (data.askList[i].category==5) {
							html += "<div class='text-center'><label class='btn btn-sm  p-1 font-size-5' style='background-color:#fee00e'> 홈페이지</label></div>";
						}else if (data.askList[i].category==6) {
							html += "<div class='text-center'><label class='btn btn-sm p-1 font-size-5' style='background-color:#fee00e'> 이벤트</label></div>";
						}
						
						html +="<input type='hidden' id='articleNo' value='"+data.askList[i].articleNo+"'/>"
						html +="</td><td scope='col' align='left'>"+data.askList[i].articleTitle  
						html +="</td></tr><tr id='"+data.askList[i].articleNo+"'></tr>"
					
					}
					
					html += "</tbody></table></div><td colspan='2' class='hee'></td></div>";
					
							$(".categoryBtn").append(html);
					
					
							
				} //end of for
				
				
				//페이지네이션 추가
				$("div.pagination.row").empty();
				
				Element = "<div class='col-4'></div>"
		  		Element +="<div class='col-4'>"
				Element +="<ul class='pagination justify-content-center'>"
	   			if(data.resultPage.currentPage <= data.resultPage.pageUnit){
	   				Element +="<li class='page-item disabled'>"
	   				Element +="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'>«</a>"
	   				Element +="</li>"
	   			}else if(data.resultPage.currentPage > data.resultPage.pageUnit){
	   				Element +="<li class='page-item'>"
	   				Element +="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.beginUnitPage)-1)+")' tabindex='-1' aria-disabled='true'>«</i></a>"
	   				Element +="</li>"
	   			}
				
	  			for(var i=data.resultPage.beginUnitPage; i<=data.resultPage.endUnitPage; i++){
	  				if(data.resultPage.currentPage==i){
	  					Element+="<li class='page-item active' aria-current='page'>"
	  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"<span class='sr-only'>(current)</span></a>"
	  					Element+="</li>"
	  				}else{
	  					Element+="<li class='page-item'>";
	  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"</a>"
	  					Element+="</li>"
	  				}
	  				
	  			}//end of for
				
	  			if(data.resultPage.endUnitPage >= data.resultPage.maxPage){
	  				Element+="<li class='page-item disabled'>"
	  				Element+="<a class='page-link' href='#'>»</a>"
	  				Element+="</li>"
	  			}else if(data.resultPage.endUnitPage < data.resultPage.maxPage){
	  				Element+="<li class='page-item'>"
	  				Element+="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.endUnitPage)+1)+") '>»</a>"
	  				Element+="</li>"
	  			}
				
	  			Element+= "</ul>"
				Element+= "</div>"
				Element+= "<div class='col-4'></div>"
				Element+= "<form>"
				Element+= "<input type='hidden' id='currentPage' name='currentPage' value=''/>"
				Element+= "<input type='hidden' id='category' name='category' value='"+data.search.category+"'/>"
				Element+= "</form>"
				
				$("div.pagination").append(Element);
				
				$("#searchCondition").val(data.search.category);
				
				
			} //end of arrow function	
		
		); //end of then
		
		
	} 
	
	function ajaxPromise(url, datas) {
		return new Promise(function (resolve, reject) {
			
			$.ajax({
				type: "POST",
				url: url,				
				data: datas,
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json",
				},
				success : function(result, status) {
					//데이터를 받으면 resolve()호출
					resolve(result);
					console.log(status)
				}//end of success
			
			})//end of ajax
			
		}) //end of Promise
		
	}//end of function - ajaxPromise
</script>

<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>

</html>