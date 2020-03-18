<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>


<script type="text/javascript">


	function Pagination(currentPage) {
		$("#currentPage").val(currentPage);
		console.log($("#currentPage").val());
		$("form").attr("method","POST").attr("action", "/customer/getNoticeList").submit();
	}


	
	$(function(){
	
		$(".getTranInfo td:nth-child(2)").on("click",function(){
			var articleNo = $(this).parent().find('#articleNo').val();
			console.log(articleNo);
			self.location="/customer/getNotice?articleNo="+articleNo;	
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
		
		
	  body {
		font-family: 'Noto Sans KR', sans-serif;
		}
		
		.table{
		font-size: 14px;
		}
		
		td{
			background-color: #f9f9f9;
		}
		
	.page-item.active .page-link {
	    z-index: 3;
	    color: #333 !important;
	    background-color: #fee50e !important;
	    border-color: #fee50e !important;
	}	
</style>

</head>
<body>
<body>

<jsp:include page="/layout/header.jsp"></jsp:include>

<div class="container">

	

<br>
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

	<br>
<br>
<!-- 		<div class="row"> -->
	<div><p class="text-dark">
	전체 <i style='color:#5da3d9'>${resultPage.totalCount}</i> 건 </p>
	</div>
	
	
	<form>
	  <input type="hidden" id="currentPage" name="currentPage" value=""/> 
      <table class="table table-hover table-bordered table-sm" >
        <thead class="table-active">
          <tr>
            <th align="center">번호</th>
            <th align="left" >제목</th>
            <th  align="left">등록일시</th>
            <th align="left"><i class="far fa-eye"></i>조회수</th>
          </tr>
        </thead>
       
		<tbody class="getTranInfo">
		  <c:set var="i" value="0" />
		  <c:forEach var="notice" items="${list}">
			<c:set var="i" value="${ i+1 }"/>
			<tr>
			 
			  <td class="" align="left" style="width:50px;" >${ i }
	  	    	<input type="hidden" id="articleNo" value="${notice.articleNo}"/>
			  </td>
			  <td  align="left" id="" style="width:450px;" >  ${notice.articleTitle} 
			  </td>
			  <td  align="left" id="" style="width:150px;">  ${notice.articleDate}
				</td>
			  <td align="left" id="" style="width:50px;"> ${notice.viewCount}
				</td>
			</tr>
			<tr id="${notice.articleNo}">
			</tr>
          </c:forEach>
        </tbody>
      </table>
       <div class="askDetail"></div>
	   <input type="hidden" id="currentPage" name="currentPage" value=""/>
 	</form>
<!--           </div> -->
<!-- 	  </div> -->

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
			  </div>
			  
			  </div> 
<jsp:include page="/layout/footer.jsp"></jsp:include>			  
</body>
</html>