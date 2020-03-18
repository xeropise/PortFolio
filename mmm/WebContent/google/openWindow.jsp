<!doctype html>

<html lang="ko">

<head>
	<meta charset="utf-8">
	
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){
	// 해당 jsp가 window.open 되자마자 바로 새로운 페이지로 이동시키기 위해 바로 $.ajax 사용 
	$.ajax({
		url : "/user/json/googleLoginUrlMake" ,  // 단순 URL을 만들기 위한 UserController 
		method : "get" , // 넘겨 줄 Data가 없으므로 get
		dataType : "json" , // 받아 올 data의 Type을 json으로 설정 
		headers : { // dataType이 json이므로 받을 때(Accept)와 보낼 때(Content-Type)을 모두 application/json으로 설정  
			"Accept" : "application/json" , 
			"Content-Type" : "application/json"
		} , 
		success : function( JSONData ) { // success 시, 
										 // HTTP 200 OK일 시 
										 // UserController에서 return한 값을 JSONData로 받음 
					
		self.location = JSONData.url; 	// json/googleLoginUrlMake에서 return을 Map<String, String>으로 했으며
										// map.put("url",googleLoginUrl); 으로 map에 넣었으므로 
										// JSONData.url로 googleLoginUrl 접근이 가능하다 
										// self.location으로 return한 URL로 이동 

		}
	})	
});

	</script>
</head>
<body>
$.ajax로 인해 바로 페이지가 변환되어 출력되지 않는 구간입니다.
</body>
</html>