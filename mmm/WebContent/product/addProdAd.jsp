<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

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
  
  
    <script src="<c:url value="/resources/javascript/jquery.barrating.min.js" />"></script> 
    <script src="<c:url value="/resources/javascript/rater.min.js" />"></script> 

    
    
	
	<!-- 	SweetAlert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>

	
	<!--     Common Css -->
    <link rel="stylesheet" href="/resources/css/product.css">
	
	
	
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//============= "등록"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "#addProdBtn" ).on("click" , function() {
			
			
					fncAddProduct();	
			
		});
	});	
	
	//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/product/getSnackProductList"
				
				//$("form")[0].reset();
				//self.location = "/index.jsp"
			});
		});	
	
	
	
	function fncAddProduct(){
	//Form 유효성 검증
 	var name = $("input[name=prodName]").val();
	var prodPrice = $("input[name=prodPrice]").val();
	
	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(prodPrice == null || prodPrice.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	Swal.fire({
		  icon: 'success',
		  title: '상품등록이 완료 되었습니다.',
		  timer: 3000
		}).then( result => {
			$("form").attr("method" , "POST").attr("action" , "/product/addProduct").attr("enctype","multipart/form-data").submit();		
			
		});
	
	
	
	
	}
	
	
	


		</script>
	<title>mmm</title>		
	</head>

<body id="body">
	
		<jsp:include page="/product/prodToolBar.jsp" />
	
	
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	<div class="container" id="addProdDiv">
 	<br/><br/><br/>
 		<h1 class=" text-center" >상 품 등 록</h1>
 		
 		
 		
 		 <!-- form Start-->
		 <form class="form-horizontal" enctype="multipart/form-data" >
		 
			<div class="group" id="addProdDivGroup">
				<div class="row mx-0 mb-2">
					<label class=" col-4 control-label">
						<img src="/resources/image/no_image.jpg" id="addProdImage"  style= "width: 450px; height: 360px;"/> 
							<input type="file" class="form-control"   name="prodImage" style="padding-right: 0px;  padding-left: 20px;  
							margin-top: 0px;   margin-right: 40px;border-right-width: 1px;  width: 421px; border: ridge;">
					</label>
				</div>
											
											<br/>
											
				<label for="prodName" class=" col-4 control-label">상품명</label>
				<div class="col-6">
					<input type="text" class="form-control"  name="prodName" placeholder="상품명을 입력해주세요." id="addProdInput">
				</div>
											
											<br/>
											
											
				
					<label for="prodPrice" class="col-4 control-label">상품가격</label>
				<div class="col-6">	
						<input type="text" class="form-control"  name="prodPrice" placeholder="상품 가격을 입력해주세요." id="addProdInput">
				</div>
										
											<br/>
											
											
											
				<label for="prodDetail" class="col-4 control-label">상품구성</label>
					<div class="col-6">
						<input type="text" class="form-control"  name="prodDetail" placeholder="상품 설명을 입력해주세요." id="addProdInput">
					</div>
											
											<br/>
											
											
										
				<label for="franType" class="col-4 control-label">프랜차이즈    </label>
					<div class="col-6">
						<select class="form-control" name="franType" id="addProdInput">
									<option selected>프랜차이즈</option>
									<option value="0">CGV</option>
									<option value="1">롯데시네마</option>
									<option value="2">메가박스</option>
						</select>
					</div>
												
												<br/>
												
										 
				<label for="prodType" class="col-4 control-label">상품종류</label>
					<div class="col-6">
						<select class="form-control" name="prodType" id="addProdInput">
									<option selected>상품종류</option>
									<option value="0">영화관람권</option>
									<option value="1">스토어이용권</option>
									<option value="2">스낵</option>
						</select>
												
												<br><br>
												
					</div>
					
					<div class="form-group">
					    <div class="col-8 text-center">
					      <button  type="button"  id="addBtn" class="btn btn-outline-warning" >등&nbsp;록</button>
							  <a class="btn btn-outline-warning"  href="#"  id="addBtn" role="button">취&nbsp;소</a>
								<br><br>		   
					   </div>
				    </div>
					
			</div>
		</form><!-- form end ///////////////////////////////////// -->
		
		<br/>
 			 
	 </div>
	 <jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>