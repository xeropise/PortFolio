<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
</head>
<body>
총 결제 가격  : ${payment.totalPrice}<br/>
이니시스 결제 가격 : ${payment.cash}<br/>
사용한 포인트 가격 : ${payment.usingPoint}<br/>
유저 넘버 : ${payment.userNo}
</body>
</html>