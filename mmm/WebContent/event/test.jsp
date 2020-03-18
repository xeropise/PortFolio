<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> <meta charset="utf-8"> <!-- 문자셋 --> 
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>	
	
</head> 
<body>

<h3>getPreviewAd테스트</h3>
<form action="/event/getPreviewAd" method="GET">
	<input type="text" name="previewNo">
	<input type="submit" name="submit">
</form>


<h3>getQuizAd테스트</h3>
<form action="/event/getQuizAd" method="GET">
	<input type="text" name="quizNo">
	<input type="submit" name="submit">
</form>	

<h3>getWinnerList테스트</h3>
<form action="/event/getWinnerList" method="GET">
	<input type="text" name="previewNo">
	<input type="submit" name="submit">
</form>	

<h3>updatePreviewAd테스트</h3>
<form action="/event/updatePreviewAd" method="GET">
	<input type="text" name="previewNo">
	<input type="submit" name="submit">
</form>	

<h3>updateQuizAd테스트</h3>
<form action="/event/updateQuizAd" method="GET">
	<input type="text" name="quizNo">
	<input type="submit" name="submit">
</form>	

<h3>addPartQuiz테스트</h3>
<form action="/event/addPartQuiz" method="GET">
	<input type="text" name="quizNo">
	<input type="text" name="userNo">
	<input type="submit" name="submit">
</form>

 </body>
 
 </html>