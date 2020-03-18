<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var impUid = $("input[name='impUid']").val();

	$(function() {
		$("button[name='info']").on("click", function() {
			var impUid = $("input[name='impUid']").val();
			alert(impUid);
			$.ajax({
				url : "/IMPinfo/json/info",
				type : "post",
				dataType : "json",
				data : {
					imp_uid : impUid
				},
				success : function() {
					self.location = "/main.jsp";
				}
			});
		})
		
		$("button[name='cancel']").on("click", function() {
			var impUid = $("input[name='impUid']").val();
			alert(impUid);
			$.ajax({
				url : "/IMPinfo/json/cancelByImpUid",
				type : "post",
				dataType : "json",
				data : {
					imp_uid : impUid
				},
				success : function() {
					self.location = "/main.jsp";
				}
			});
		})
	});
	
</script>
<title>Insert title here</title>
</head>
<body>

<form action="#">
	imp_uid를 입력하세용 console에 나와용 <br/>
	imp_uid는 원래 db에서 가져와야하지만 구현 안했읍니다. IMP사이트나 콘솔에 찍힌걸로 가져와서 입력하세용<br/>
	<input type="text" name="impUid">
	<button name="info">정보보기</button><button name="cancel">결제취소</button>
	
</form>
</body>
</html>