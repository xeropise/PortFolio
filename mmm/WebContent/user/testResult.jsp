<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
<title>mmm</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		var resultId = "${resultId}";
		$(function(){
			console.log(resultId);
				
			$("div").on("click", function(){
				console.log("클릭");
				$.ajax(
						{
							url : "/user/json/sendSMSResult/" + resultId ,
							method : "get" ,
							datatype : "json" ,
							headers : {
								"Accept" : "application/json" ,
								"Content-Type" : "application/json"
							} ,
							success : function( JSONData , status ) {
								console.log("동작");
								
								console.log(JSONData.status);
								$("div").text(JSONData.status);
								
							}
						}
					)
			})
		})
	
	</script>
	

</head>
<body>
	<div>클릭 시 SMS 전송 여부 확인(대기시간 필요)</div>
</body>
</html>