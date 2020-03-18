<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hello World
	<br>
	${ticketing }

	
	<form action="/ticketing/cancelTest" method="POST">
			<!-- 특정 번호로 지정해줘야함 -->
		<input type="hidden" name="ticketingNo" value="10001">
		<input type="submit">
	</form>
</body>
</html>