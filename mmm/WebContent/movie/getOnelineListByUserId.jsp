<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!doctype html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	jQuery...  -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value="/resources/javascript/jquery.barrating.min.js" />"></script> 
    <script src="<c:url value="/resources/javascript/rater.min.js" />"></script> 

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <!-- fontawesome CDN -->
    <script src="https://kit.fontawesome.com/e464a52b8d.js" crossorigin="anonymous"></script>

<!-- 	Google web font -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!--     Common Css -->
    <link rel="stylesheet" href="/resources/css/common.css?aaffr">
	    
    
<title>Insert title here</title>
</head>

<style>
	.page-item.active .page-link {
	    z-index: 3;
	    color: #212529;
	    background-color: #fee50e;
	    border-color: #fee50e;
	}
	
	.page-link {
		color: #333;
	}

</style>
<body>

<div class="container" style="margin-top : 47px;">
  <div class="">
     <form action="">
     
<!--      	pagination을 위한 hidden input -->
       <input type="hidden" id="currentPage" name="currentPage" value=""/>
       <div class="">
  	 	<h2><Strong>한줄평 조회</Strong></h2>
  	   </div>
  	  </form>
  	   <div class="text-right mb-2">
  	 		<h6 class="d-inline">"${user.userId}"</h6>
      		<p class="text-muted mb-0 d-inline">이 작성하신 댓글이에요.</p>
  	   </div>
  </div>
	<div>
		<table class="table table-hover text-center">
		  <thead class="thead-dark">
		    <tr >
		      <th scope="col">영화 제목</th>
		      <th scope="col">한줄평 내용</th>
		      <th scope="col">작성일자</th>
		      <th scope="col">비 고</th>
		    </tr>
		  </thead>
		  <tbody>
	          
	          
	<!--         list size만큼 for문으로 Point 내역 출력  -->
	        <c:forEach var="oneline" items="${list}">
		      <tr >
		        <th scope="col">${oneline.movieTitle}</th>
		        <td scope="col">${oneline.commentContent }</td>
		        <td scope="col">${oneline.commentDate }</td>
		        <td scope="col"></td>
		      </tr>
	        </c:forEach>  
	          
	          
		  </tbody>
		</table> 
		
<!-- 		Pagination -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination pagination-m justify-content-center">
		  
<!-- 		  previos -->
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		 		<li class="page-item page-item disabled">
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li class="page-item page-item">
			</c:if>
		      <a class="page-link page-link" href="javascript:fncGetList('${resultPage.currentPage-1}')"
		      	 aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    
<!-- 		    center -->
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
			
				<c:if test="${ resultPage.currentPage == i }">
			   		<li class="page-item page-item active " aria-current="page">
			   			<a class="page-link" href="javascript:fncGetList('${ i }');">
			   				${ i }<span class="sr-only">(current)</span></a>
			   		</li>
				</c:if>
				<c:if test="${ resultPage.currentPage != i}">	
			   		<li class="page-item page-item">
			   			<a class="page-link page-link" href="javascript:fncGetList('${ i }');">${ i }</a>
			   		</li>
				</c:if>
					
    		</c:forEach>
		    
		    
<!-- 		    Next -->
   		     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		  		<li class="page-item page-item disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
			    <li class="page-item page-item">
			</c:if>
		      <a class="page-link page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')"
		      	 aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
<!-- 		Pagination  END -->		
		
	</div>
</div>    
<%-- <jsp:include page="/layout/footer.jsp"></jsp:include> --%>

<script type="text/javascript">

function fncGetList(currentPage) {
	
// 	alert('pagination' + currentPage);
	
	$("#currentPage").val(currentPage);
// 	$("form").attr("method", "POST").attr("action", "/payment/getPointList").submit();
	$("#plusPage").load("/movie/getOnelineListByUserId",$("#currentPage").serialize());
}

</script>

</body>
</html>