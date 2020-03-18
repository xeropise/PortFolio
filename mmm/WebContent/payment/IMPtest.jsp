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
	imp_uid�� �Է��ϼ��� console�� ���Ϳ� <br/>
	imp_uid�� ���� db���� �����;������� ���� �������ϴ�. IMP����Ʈ�� �ֿܼ� �����ɷ� �����ͼ� �Է��ϼ���<br/>
	<input type="text" name="impUid">
	<button name="info">��������</button><button name="cancel">�������</button>
	
</form>
</body>
</html>