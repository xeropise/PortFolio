<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

	<meta charset="utf-8">
	
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	<!-- 	SweetAlert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<head>
<style>

	button.swal2-confirm.swal2-styled {
		background-color: #fee50e;
		border-color : #fee50e;
		color : #222;
	}
</style>
<title>SNS 가입후에 네비게이션하는 jsp.</title>
</head>
<body>

	<script type="text/javascript">
		// 이동 시 부모 창 새로고침(main.jsp로 이동)과 팝업창 종료를 위한 구간 
		$(function(){
			
		    Swal.fire({
				  icon: 'success', //"info,success,warning,error" 중 택1
				 // title: 'Oops...',
				  text: '로그인을 해주세요.'
				}).then((result) => {  
			opener.parent.location="/";
			window.open("about:blank","_self").close();
				});
		})
	</script>
	
</body>
</html>