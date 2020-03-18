<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>




<script type="text/javascript">

	$(function(){
		
		$('#applyBtn').on('click', function(){
			
			console.log('userNo  : '+ $("#un").val());
			console.log('previewNo  : '+ $("#pn").val());
			
			if($("#un").val()==0){
				return;
			}
			if($("#pn").val()==null){
				return;
			}
			
			$.ajax({
				
				url: "/event/json/checkPart",
				method: "POST",
				data: JSON.stringify({
					userNo  :  $("#un").val(),
					previewNo : $("#pn").val(),
					}),
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					
					//alert(status);
					console.log(JSONData.result);
					if(JSONData.result==0){
						
						Swal.fire({
							text: '응모가 완료되었습니다.',
							icon: 'success',
							confirmButtonText: "confirm",
						}).then((confirm)=>{
							$("form").attr("method","POST").attr("action", "/event/addPartPrev").submit();
			    		});
					}else{
						Swal.fire({
							text: '이미 응모하신 이벤트입니다.',
							icon: 'error',
							confirmButtonText: "confirm"
						});
					}
				}	
				
				
			})
			
			
		});
		

		$('#updateBtn').on('click', function(){
			
			self.location = "/mypage/mypage?condition=98";
		
		});	
		
		
		
	})


</script>
<style>
		
		img.prevImg {
			width : 180px;
			max-width :100%;
			height : auto;
		}
	
		div.text-dark {
			font-size: 2rem;
		}
			
		div.text-muted {
			font-size:1rem;
		}	
	
		.btn.btn-dafault.write{ 
			background-color: #fee50e!important;
	   		color: #212529;
	    	border-color: #fcfaf5;
	    	font-size: 13px;
		}
		
		.btn.btn-dafault.write:hover {
		     color: #f8f9fa;
		     background-color: #e0a800;
		     border-color: #040404;
		}
	
</style>



</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">
 	<form>

	<br>
		<div class="page-header text-secondary">

	       
	    </div>
<br>
 	<div class="row">
			<div class="col-sm-10">
				<input type="hidden" id="un" name="userNo" value="${user.userNo}">
				<input type="hidden" id="pn" name="previewNo" value="${preview.previewNo}">
				
				<div class="text-dark">${preview.previewName}</div>
			
				<div class="text-muted">
			
			
				<label>시사회장소</label>
				${preview.previewPlace}
				&nbsp
				
				<label>시사회일시</label>
				${preview.preDate} ${preview.previewTime}
					
				<br>
				<label>당첨발표일자</label>
				${preview.winDate}
				&nbsp
				
				<label>당첨인원수</label>
				${preview.winnerCount}
				
				</div>
			 </div>
		</div>
		<hr>
<!-- 		 row 닫는 애! -->
<br>
	<div class="row">
		
				<div class="col-md-3">		    
					<div>
<%-- 			    	<c:forEach var = "image" items ="${fileArr}"> --%>
			    		<img class="prevImg" src="${preview.previewImage}"/>
			    	<br/>
<%-- 			    	</c:forEach> --%>
					</div>	
				</div>
				
				<div class="col-sm-7">
					<table class="table">
					<tr>
					<td><label>이름</label></td>
					<td>${user.userName}</td>
					</tr>
					
					<tr>
					<td><label>아이디</label></td>
					<td>${user.userId}</td>
					</tr>	
					
					<tr>
					<td><label>이메일</label></td>
					<td>${user.email}</td>
					</tr>	
					
					<tr>
					<td><label>휴대전화번호</label></td>
					<td>${user.phone}</td>
					</tr>	
					
					</table>
				 </div>
		
			
			</div>
	<!-- 		 row 닫는 애! -->
	
			<div class="text-center">
				<button id="applyBtn" class="btn btn-dafault write" type="button" style="margin-top:15px;">응모하기</button>
				<button id="updateBtn" class="btn btn-dafault write" type="button" style="margin-top:15px; background-color:">수정하기</button>
			</div>
			<br>
		
	</form>
 </div>
	<!-- 	container 닫는 애  -->
<jsp:include page="/layout/footer.jsp"></jsp:include>
 </body>
 
 </html>