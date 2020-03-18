<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 카카오 맵 api key -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e195c747986bcc9e0da58dd2ded5409c"></script>

<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	 <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>

<style>

.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}

#contents {
    width: 100%;
    margin: 0;
    padding: 0 0 0 0;
}


div {
    display: block;
}

body {
    overflow: auto;

    letter-spacing: 0;
    line-height: 1.5;
    font-size: 16px;
    color: #444;
    font-weight: 400;
    font-family: 'Noto Sans KR', sans-serif;
}

.my-magabox-info {
    overflow: hidden;
    height: 367px;
    border-radius: 10px;
    background-color: #f3f4f6;
    margin-top: 50px;
}

.my-magabox-info .top {
    position: relative;
    height: 198px;
    padding: 30px 30px 0 0;
}

.my-magabox-info .top .photo {
    float: left;
    width: 200px;
    padding: 20px 0 0 60px;
}

.my-magabox-info .top .photo .wrap {
    position: relative;
    width: 93px;
    margin: 0;
    padding: 0 0 7px 0;
    background: url(https://img.megabox.co.kr/static/pc/images/mypage/bg-photo-back.png) no-repeat center bottom;
}

button, input {
    overflow: visible;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 1em;
    line-height: 1.15;
}

input[type="file" i] {
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    align-items: baseline;
    color: inherit;
    text-align: start !important;
    padding: initial;
    border: initial;
}

input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}

button, input {
    overflow: visible;
}

input[type="hidden" i] {
    display: none;
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    padding: initial;
    border: initial;
}

.my-magabox-info .top .photo .wrap i {
    overflow: hidden;
    display: block;
    position: absolute;
    right: 0;
    top: 10px;
    margin: 0;
    border-radius: 19px;
    box-shadow: -2px 2px 5px 0 rgba(45,45,45,.3);
}
.ico-add-photo {
    width: 19px;
    height: 19px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-add-photo.png);
}
.iconset {
    overflow: hidden;
    display: inline-block;
    margin: -1px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}

.my-magabox-info .top .photo .wrap .img {
    overflow: hidden;
    display: block;
    width: 93px;
    height: 93px;
    border-radius: 93px;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 0;
    line-height: 0;
    background-color: transparent;
    box-shadow: 0 5px 5px 0 rgba(45,45,45,.2);
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}

button, select {
    text-transform: none;
}

.my-magabox-info .top .photo .wrap .img img {
    width: 100%;
    height: 100%;
    border-radius: 93px;
}

.imgs {
    border: 0;
}

.my-magabox-info .top .grade {
    float: left;
    padding-top: 20px;
}

.my-magabox-info .top .grade .name {
    font-size: 1.8666em;
    line-height: 1.3;
    color: #222;
}
.my-megabox-main p {
    margin: 0;
    padding: 0;
}

.my-magabox-info .top .grade .link {
    padding: 15px 0 0 0;
}

.my-magabox-info .top .grade .link a {
    margin-right: 10px;
    color: #666;
}
a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}
a:link {
    color: #444;
    text-decoration: none;	
    
}
a {
    background-color: transparent;
}

.my-magabox-info .top .grade .link a i {
    margin-left: 2px;
}
.my-magabox-info .ico-arr-right-reverse {
    width: 6px;
    height: 9px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-reverse-gray.png);
}

.ico-exclamation-white {
    width: 16px;
    height: 16px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-exclamation-white.png);
}

.my-magabox-info .top .special-membership {
    float: right;
    width: 206px;
    height: 131px;
    text-align: center;
    border: 1px solid #d8d9db;
    border-radius: 10px;
}

.my-magabox-info .top .special-membership .tit {
    height: 50px;
    line-height: 50px;
    text-transform: uppercase;
}
.my-megabox-main p {
    margin: 0;
    padding: 0;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.my-magabox-info .top .special-membership {
    float: right;
    width: 206px;
    height: 131px;
    text-align: center;
    border: 1px solid #d8d9db;
    border-radius: 10px;
}

.my-magabox-info .bottom {
    overflow: hidden;
    height: calc(100% - 198px);
    padding: 26px 30px 29px 30px;
    background-color: #eaebed;
}

.my-magabox-info .bottom .point {
    float: left;
    width: 33%;
    min-height: 116px;
}

.my-magabox-info .bottom .point .tit-area {
    padding-right: 30px;
}
.my-magabox-info .bottom .tit-area {
    overflow: hidden;
}

.my-magabox-info .bottom .tit-area .tit {
    float: left;
    font-size: 1.2em;
    color: #222;
}
.my-megabox-main p {
    margin: 0;
    padding: 0;
}

.my-magabox-info .bottom .tit-area a {
    float: right;
    color: #444;
}

.ico-arr-right-gray {
    overflow: hidden;
    width: 7px;
    height: 12px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-gray.png);
}

.my-magabox-info .bottom .point .cont-area .total {
    overflow: hidden;
}

.my-magabox-info .bottom .point .cont-area .total .now {
    overflow: hidden;
    display: block;
    float: left;
    width: 140px;
    height: 44px;
    line-height: 48px;
    color: #339eb2;
    font-weight: 400;
    font-size: 1.8em;
    vertical-align: middle;
    letter-spacing: -1px;
}


em {
    font-style: normal;
}


.my-magabox-info .bottom .theater {
    float: left;
    width: 34%;
    height: 100%;
    min-height: 116px;
    padding: 0 30px;
    border-left: 1px solid #d8d9db;
}

.my-magabox-info .bottom .tit-area {
    overflow: hidden;
}

.my-magabox-info .bottom .tit-area .tit {
    float: left;
    font-size: 1.2em;
    color: #222;
}

.my-magabox-info .bottom .tit-area a {
    float: right;
    color: #444;
}

.my-magabox-info .ico-arr-right-reverse {
    width: 6px;
    height: 9px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-reverse-gray.png);
}

.my-magabox-info .bottom .theater .no-list {
    padding-top: 9px;
}

.my-magabox-info .bottom .theater .no-list span {
    display: inline-block;
    border-bottom: 1px solid #444;
}


l {
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.my-magabox-info .bottom .theater .list ol li {
    line-height: 1.1;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}


.my-magabox-info .bottom .theater .list ol li em {
    display: inline-block;
    margin: 0 5px 0 0;
    font-style: italic;
    font-size: 1.2em;
    vertical-align: middle;
}

.my-magabox-info .bottom .coupon {
    float: left;
    width: 33%;
    height: 100%;
    padding: 0 0 0 30px;
    border-left: 1px solid #d8d9db;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

my-magabox-info .bottom .coupon .list ul li span {
    display: block;
    float: left;
}

.my-magabox-info .bottom .coupon .list ul li em {
    display: block;
    float: right;
    text-align: right;
}


ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.my-megabox-main .column {
    overflow: hidden;
}
.mt70 {
    margin-top: 30px!important;
}

.my-megabox-main .column .col.left {
    float: left;
}
.my-megabox-main .column .col {
    width: 400px;
}

.my-megabox-main .tit-util {
    padding-bottom: 15px;
}

.my-megabox-main .tit-util .tit {
    line-height: 32px;
}
h2.tit.small {
    padding: 0 0 16px 0;
    font-size: 1.4666em;
    color: #333;
}
.tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}

.tit-util .right {
    float: right;
}

a.button.gray-line:active, a.button.gray-line:focus, a.button.gray-line:hover, a.button.gray-line:visited {
    color: #444;
}
.button.gray-line.small {
    line-height: 32px;
}
a.button:active, a.button:focus, a.button:hover, a.button:visited {
    color: #fee50e;
}
.tit-util .right a {
    display: inline-block;
}
.button.gray-line {
    color: #444;
    line-height: 36px;
    border: 1px solid #c1c1c1;
    background-color: #fff;
}
.button.small {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
}
a.button {
    text-decoration: none;
}
a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}
a:link {
    color: #444;
    text-decoration: none;
}
.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #fee50e;
    font-weight: 400;
    border-radius: 4px;
    text-decoration: none;
    border: 1px solid #fee50e;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}


.button.gray-line.small {
    line-height: 32px;
}

.my-megabox-main .link-movie-story {
    overflow: hidden;
    height: 100px;
    padding: 20px 10px;
    text-align: center;
}
.box-border {
    padding: 20px;
    border: 1px solid #d8d9db;
    background-color: #fff;
    border-radius: 5px;
}

.my-megabox-main .link-movie-story a {
    display: block;
    float: left;
    width: calc(25% - 10px);
    height: 100%;
    margin: 0 5px;
    padding: 5px 5px 0 5px;
    line-height: 1.1;
    text-decoration: none;
}


.my-megabox-main .link-movie-story a em {
    display: block;
    font-size: 2em;
    font-weight: 400;
    color: #01738b;
}

.my-megabox-main .link-movie-story a span {
    display: block;
    padding: 3px 0 0 0;
    font-size: 14px;
}

.my-megabox-main .column .col.right {
    float: right;
}
.my-megabox-main .column .col {
    width: 400px;
}

.tit-util:after, .tit-util:before {
    content: '';
    display: block;
}
.tit-util:after {
    clear: both;
}
.tit-util:after, .tit-util:before {
    content: '';
    display: block;
}

.my-megabox-main .tit-util {
    padding-bottom: 15px;
}

.my-megabox-main .tit-util .tit {
    line-height: 32px;
}

.tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
h1, h2, h3, h4, h5, h6 {
    margin: 0;
    padding: 0;
    font-weight: 400;
}

.tit-util .right {
    float: right;
}

.my-megabox-main .favor-see {
    overflow: hidden;
    height: 100px;
    padding-top: 30px;
}
.box-border {
    padding: 20px;
    border: 1px solid #d8d9db;
    background-color: #fff;
    border-radius: 5px;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

.dot-list.gray>li:before {
    background-color: #aaa!important;
}
.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #fee50e;
    width: 3px;
    height: 3px;
}

.mr10 {
    margin-right: 10px!important;
}
.font-gblue {
    color: #01738b!important;
}


.dot-list>li+li {
    margin-top: 2px;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}


.my-megabox-main .tit-util .more {
    line-height: 32px;
}
.tit-util .more {
    float: right;
}

.my-megabox-main .tit-util .tit {
    line-height: 32px;
}

.tit-util .tit {
    float: left;
    padding: 0!important;
    line-heig
}

.my-megabox-main .my-reserve-history {
    border-top: 1px solid #555;
}

.my-megabox-main .my-reserve-history ul li.no-result {
    min-height: 0;
    padding: 20px 0;
}
.my-megabox-main .my-reserve-history ul li {
    position: relative;
    min-height: 140px;
    margin: 0;
    padding: 20px 100px 20px 100px;
    border-bottom: 1px solid #eaeaea;
}

.my-megabox-main .my-reserve-history ul li.no-result .no-history-reservation {
    border: none;
}

.no-history-reservation {
    display: block;
    height: 160px;
    padding: 0;
    text-align: center;
    line-height: 160px;
    border: 1px solid #ddd;
    border-width: 1px 0;
}


.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}

.board-list {
    line-height: 1.3;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}

table caption {
    overflow: hidden;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    opacity: 0;
}

caption {
    display: table-caption;
    text-align: -webkit-center;
}

colgroup {
    display: table-column-group;
}
.board-list {
    line-height: 1.3;
}


col {
    display: table-column;
}

.board-list {
    line-height: 1.3;
}


tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.board-list.line>tbody>tr>td:last-child, .board-list.line>tbody>tr>th:last-child {
    border-width: 0 0 1px 0;
}
.board-list.line>tbody>tr>td, .board-list.line>tbody>tr>th {
    border-width: 0 1px 1px 0;
}
.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}
.a-c {
    text-align: center!important;
}
table td, table th {
    padding: 0;
}

td {
    display: table-cell;
    vertical-align: inherit;
}

.my-megabox-main .column .col.left {
    float: left;
}
.my-megabox-main .column .col {
    width: 400px;
}

.my-megabox-main .brd-list {
    overflow: hidden;
    border-top: 1px solid #555;
    border-bottom: 1px solid #eaeaea;
}

.my-megabox-main .brd-list ul li.no-result {
    padding: 20px 0 0 0;
    text-align: center;
}
.my-megabox-main .brd-list ul li {
    position: relative;
    height: 63px;
    padding: 0 90px 0 0;
}

.my-megabox-main .column .col.right {
    float: right;
}
.my-megabox-main .column .col {
    width: 400px;
}


.board-list.line>tbody>tr>td:last-child, .board-list.line>tbody>tr>th:last-child {
    border-width: 0 0 1px 0;
}
.board-list.line>tbody>tr>td, .board-list.line>tbody>tr>th {
    border-width: 0 1px 1px 0;
}
.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}
.a-c {
    text-align: center!important;
}
table td, table th {
    padding: 0;
}  
    

.board-list {
    line-height: 1.3;
}

colgroup {
    display: table-column-group;
}

.btn-primary {
	color : #1d2124;
	background-color : #fee50e;
	border-color : #fee50e;
}
.btn-primary:hover {
	color : #1d2124;
	background-color : #fee50e;
	border-color : #fee50e;
}
.btn-primary:click {
	color : #1d2124;
	background-color : #fee50e;
	border-color : #fee50e;
}

.button.purple {
    color: #333;
    line-height: 36px;
    border: 0;
    background: #fee50e;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}
/* 취소 버튼 */
#theaterChoice > div > div > div.modal-footer > button:nth-child(1) {
	color: #fff;
   	background-color: #6c757d;
   	border-color: #6c757d;	
}

#theaterChoice > div > div > div.modal-header {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #333;	
}


#genreChoice > div > div > div.modal-footer > button:nth-child(1) {
	color: #fff;
   	background-color: #6c757d;
   	border-color: #6c757d;	
}

#genreChoice > div > div > div.modal-header {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #333;	
}

#myModal > div > div > div.modal-footer > button:nth-child(1) {
	color: #fff;
   	background-color: #6c757d;
   	border-color: #6c757d;		
}

#myModalBodyButton {
    background-color: #fee50e;
    color: #545454;
    border: 1px solid #dedede;	
}

#myModal > div > div > div.modal-header {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #333;		
}
</style>
<script type="text/javascript">
$(function(){

	//회원기본정보
	$("#userInfo").on('click',function(){
		$("#plusPage").load("/user/passwordCheck");
	});
	
	//내가본영화
	$("#sawMovie").on('click',function(){
		var ticketerPhone = $("#ticketerPhone").val();
		$("#plusPage").load("/mypage/mySeenMovie");
	});
	
	//위시리스트
	$("#wishList").on('click',function(){
		$("#plusPage").load("/mypage/wishList");
	});
	
	//한줄평
	$("#oneLine").on('click',function(){
		$("#plusPage").load("/movie/getOnelineListByUserId");
	});
	
	//포인트내역
	$("#pointList").on("click",function(){
		$("#plusPage").load("/payment/getPointList");
	});
	
	$("#addGenreBtn").on('click',function(){
		var likeGenre1 =$("#likeGenre1").val();
		var likeGenre2 =$("#likeGenre2").val();
		var likeGenre3 =$("#likeGenre3").val();
		
		$("#likeGenreForm").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
	});
	
	$("#addTheaterBtn").on('click',function(){
		var likeTheater1 =$("#likeTheater1").val();
		var likeTheater2 =$("#likeTheater2").val();
		var likeTheater3 =$("#likeTheater3").val();
		$("#likeTheater1_input").val(likeTheater1);
		$("#likeTheater2_input").val(likeTheater2);
		$("#likeTheater3_input").val(likeTheater3);
		$("#likeTheaterForm").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
	});
	
		
	
});

</script>

</head>
<body>


<div id="contents">

	<!-- my page-main -->
	<div class="my-megabox-main">

		<div class="my-magabox-info ">
			<!-- top -->
			<div class="top">
				<div class="photo" id="myPhoto">
					<div class="wrap">
						<button type="button" class="img">
						<c:if test="${empty user.profile.trim()}">	
							<img class="imgs" src="https://www.megabox.co.kr//static/pc/images/mypage/bg-profile.png" alt="프로필 사진 샘플" />
						</c:if>
						<c:if test="${! empty user.profile.trim()}">
							<img class="imgs" alt="" src="/resources/image/${user.profile}"/>
						</c:if>
						</button>
					</div>
				</div>

				<div class="grade">
					<p class="name">
					
					${user.userName}님은 
					<c:if test="${user.accPoint < 10000}">	
						일반회원 
					</c:if>
					<c:if test="${user.accPoint >= 10000 && user.accPoint < 20000}">
						VIP	
					</c:if>
					<c:if test="${user.accPoint  >= 20000}">
						VVIP	
					</c:if>
					 입니다.<br>
					
					</p>	 	
					<div class="link">
						<a href="#" id="userInfo" title="개인정보수정 페이지로 이동">개인정보수정 <i class="iconset ico-arr-right-reverse"></i></a>
					</div>
				</div>

			</div>
			<!--// top -->

			<!-- bottom -->
			<div class="bottom row">
				<div class="point col-sm-6 " id="myPoint">
					<div class="tit-area" style="padding-left: 50px;">
						<p class="tit"  >총 보유 포인트</p>
						<a href="#" id="pointList" class="more" title="포인트 이용내역 페이지로 이동"><i class="iconset ico-arr-right-gray">더보기</i></a>
					</div>

					<div class="cont-area" style="padding-left: 50px;">
						<div class="total">
							<p class="now"><fmt:formatNumber value="${user.totalPoint}" pattern="#,###" />P</p><br><br>
							<p>누적포인트 : <fmt:formatNumber value="${user.accPoint}" pattern="#,###" />P</p>
						</div>
					</div>
				</div>
				<!-- theater -->
				<div class="theater col-sm-6" id="myFaverBrch" >
					<div class="tit-area " >
						<p class="tit">자주가는 극장</p>
						<a href="#" class="right" title="자주가는 극장 변경" style="padding-right: 30px;" data-toggle="modal" data-target="#theaterChoice">변경  <i class="iconset ico-arr-right-reverse"></i></a>
					</div>

					<div class="list">
						<div class="no-list" style="display: none;">
							<span>자주가는 극장</span>을  설정하세요.
						</div>
						<ol style="margin-top: 5px;">
							<li>
								<em style="padding-bottom : 5px;">1</em>
								<span >${user.likeTheater1}</span>
							</li>
							<li>
								<em style="padding-bottom : 5px;">2</em>
								<span>${user.likeTheater2}</span>
							</li>
							<li>
								<em style="padding-bottom : 5px;">3</em>
								<span>${user.likeTheater3}</span>
							</li>
						</ol>
					</div>
				</div><!--// theater -->
			</div><!--// bottom -->
		</div><!--// my page-info -->
		
		
		<!-- 선호극장 Modal -->
	<form id="likeTheaterForm">
		<div class="modal fade" id="theaterChoice" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">자주 가는 극장</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
	        			</button>
	     	 		</div>
					<div class="modal-body">
						<div class="form-group row" style="text-align: center;">
		 					<div class="col-sm-4">
								<select class="form-control" id="likeTheater1">
										<option selected>극장선택</option>
									<c:forEach var="i" items="${getTheaterList}">
						   				<option value="${i.theaterName}">${i.theaterName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-4">
								<select class="form-control" id="likeTheater2">
										<option selected>극장선택</option>
									<c:forEach var="i" items="${getTheaterList}">
						   				<option value="${i.theaterName}">${i.theaterName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-4">
								<select class="form-control" id="likeTheater3">
										<option selected>극장선택</option>
									<c:forEach var="i" items="${getTheaterList}">
						   				<option value="${i.theaterName}">${i.theaterName}</option>
									</c:forEach>
								</select>
							</div>
								</div>
								<div style="text-align:center;">
								<input type="hidden" id="likeTheater1_input" name="likeTheater1">
								<input type="hidden" id="likeTheater2_input" name="likeTheater2">
								<input type="hidden" id="likeTheater3_input" name="likeTheater3">
								<button type="button" id="mapModal" class="button large purple" data-toggle="modal" data-target=".bd-example-modal-xl">지도로 선택</button>
						</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="button large"  style="margin-right: 10px;" data-dismiss="modal">취소</button>
				        <button type="button" class="button large purple" style="color: #333; " id="addTheaterBtn">등록</button>
				      </div>
				    </div>
				  </div>
				</div>
			</form>

		
		<!-- column -->
		<div class="column mt70">
			<!-- left -->
			<div class="col left" id="myStory">
				<div class="tit-util">
					<h2 class="tit small">나의 무비스토리</h2>
				</div>

				<div class="box-border link-movie-story">
					<a href="#" id=sawMovie title="본 영화 탭으로 이동" style="margin-left : 35px;">
					<input type="hidden" id="ticketerPhone" value="${user.phone}" >
						<em>${mySeeMovieCnt}</em>
						<span>본 영화</span>
					</a>

					<a href="#" id="wishList" title="위시리스트 탭으로 이동" style="margin-left : 20px; margin-right: 20px;" >
						<em>${wishMovieCnt}</em>
						<span>위시리스트</span>
					</a>

					<a href="#" id="oneLine" title="한줄평 탭으로 이동">
						<em>${commentCnt }</em>
						<span>한줄평</span>
					</a>
				</div>
			</div>
			<!--// left -->

			<!-- right -->
			<div class="col right" id="myFaverInfo">
				<div class="tit-util">
					<h2 class="tit small">선호관람정보</h2>

					<div class="right">
						<a href="#" class="button gray-line small" title="설정" data-toggle="modal" data-target="#genreChoice">설정</a>
					</div>
				</div>

				<div class="box-border favor-see" >
					<ul class="dot-list gray">
						<li><a id="reLoadGenre"><span class="font-gblue mr10">내 선호장르</span></a>
							<c:if test="${user.likeGenre1 != null ||user.likeGenre2 != null ||user.likeGenre3 != null }">	
								<span id="chgLikeGenre1">${user.likeGenre1},</span>
								<span id="chgLikeGenre2">${user.likeGenre2},</span>
								<span id="chgLikeGenre3">${user.likeGenre3}</span>
							</c:if>
						</li>
					</ul>
				</div>
				<!-- Modal -->
				 <form id="likeGenreForm">
				 <input type= "hidden" name= "userNo" value="${user.userNo }" >
					<div class="modal fade" id="genreChoice" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">선호 장르 선택</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      	<div class="row">
					      		<div class="col-sm-4">
				    				<select class="form-control" id="likeGenre1" name="likeGenre1" style="width:120px;height:50px;">
				    				<option selected>선호장르</option>
				      					<option>드라마</option>
										<option>코미디</option>
										<option>액션</option>
										<option>멜로/로맨스</option>
										<option>스릴러</option>
										<option>미스터리</option>
										<option>공포(호러)</option>
										<option>어드벤쳐</option>
										<option>범죄</option>
										<option>가족</option>
										<option>판타지</option>
										<option>SF</option>
										<option>서부극(웨스턴)</option>
										<option>사극</option>
										<option>애니메이션</option>
										<option>다큐멘터리</option>
										<option>전쟁</option>
										<option>뮤지컬</option>
										<option>성인물(에로)</option>
										<option>공연</option>
										<option>기타</option>
				    				</select>
			    				</div>
			    				<div class="col-sm-4">
									<select class="form-control" id="likeGenre2" name="likeGenre2" style="width:120px;height:50px;">
									<option selected>선호장르</option>
										<option>드라마</option>
										<option>코미디</option>
										<option>액션</option>
										<option>멜로/로맨스</option>
										<option>스릴러</option>
										<option>미스터리</option>
										<option>공포(호러)</option>
										<option>어드벤쳐</option>
										<option>범죄</option>
										<option>가족</option>
										<option>판타지</option>
										<option>SF</option>
										<option>서부극(웨스턴)</option>
										<option>사극</option>
										<option>애니메이션</option>
										<option>다큐멘터리</option>
										<option>전쟁</option>
										<option>뮤지컬</option>
										<option>성인물(에로)</option>
										<option>공연</option>
										<option>기타</option>
									</select>
								</div>
								<div class="col-sm-4">
									<select class="form-control" id="likeGenre3" name="likeGenre3" style="width:120px;height:50px;">
									<option selected>선호장르</option>
										<option>드라마</option>
										<option>코미디</option>
										<option>액션</option>
										<option>멜로/로맨스</option>
										<option>스릴러</option>
										<option>미스터리</option>
										<option>공포(호러)</option>
										<option>어드벤쳐</option>
										<option>범죄</option>
										<option>가족</option>
										<option>판타지</option>
										<option>SF</option>
										<option>서부극(웨스턴)</option>
										<option>사극</option>
										<option>애니메이션</option>
										<option>다큐멘터리</option>
										<option>전쟁</option>
										<option>뮤지컬</option>
										<option>성인물(에로)</option>
										<option>공연</option>
										<option>기타</option>
									</select>
								</div>
							</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="button large" style="margin-right: 10px;" data-dismiss="modal">취소</button>
					        <button type="button" class="button large purple" style=" " id="addGenreBtn">등록</button>
					      </div>
					    </div>
					  </div>
					</div>
				</form>
				
			</div>
			<!--// right -->
		</div>
		<!--// column -->
	</div>
	<!--// mypage-main -->
</div>


	<div class="modal fade bd-example-modal-xl" id="outerMotdal" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
     		<div id="map" style="width:1138px;height:762px;"></div>
	<script>
	
	$("#outerMotdal").on('shown.bs.modal', function (e) {
		activeMap();
	})
	
	

	  
	function activeMap(){

		
			//비트 캠프 위치
		    var coords = {
		        latitude: 37.499526740945925,
		        longitude: 127.02925836185794
		    };
		    success(coords)
	
		  
		// 현재 위치 불러오는게 성공했다면	
		function success(coords) {
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(coords.latitude, coords.longitude),
				level: 3,
				keyboardShortcuts : true
			};
	
			var map = new kakao.maps.Map(container, options); // 화면에 맵 추가
			
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 일반-스카이뷰 선택 추가
			
			var control = new kakao.maps.ZoomControl(); // 맵 축소 확대 추가
			map.addControl(control, kakao.maps.ControlPosition.RIGHT);
			
			// 현재 위치 마커 이미지
			var myPosition ="../resources/image/kakaoMapIcon/myPosition.png";
			
			var icon = new kakao.maps.MarkerImage(myPosition, new kakao.maps.Size(100, 100));
			
			// 현재 위치 마커
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter(),
			    image: icon
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
	
			
			var cgvLogo ="../resources/image/kakaoMapIcon/CGV.png";
			var lotteLogo ="../resources/image/kakaoMapIcon/lotte.png";
			var megaLogo ="../resources/image/kakaoMapIcon/MegaBox.png";
			
			//theater List ajax로 불러오고 Marker로 표시
			var theaterMarkerArray = new Array();
			var jqxhr = $.getJSON( "/ticketing/json/getTheaterList", function() {
				  console.log( "success" );
				})
				  .done(function(theaters) {
				     theaters.forEach(
				    	theater => {
				    		//로고 달기
				    		if(theater.franchise=='CGV'){
				    			var icon = new kakao.maps.MarkerImage(cgvLogo, new kakao.maps.Size(50, 50));
				    		}else if(theater.franchise=='롯데시네마'){
				    			var icon = new kakao.maps.MarkerImage(lotteLogo, new kakao.maps.Size(80, 80));
				    		}else if(theater.franchise=='메가박스'){
				    			var icon = new kakao.maps.MarkerImage(megaLogo, new kakao.maps.Size(50, 50));
				    		}
				    		//극장 마커 생성
				    		var theaterMarker = new kakao.maps.Marker({
				    		    map: map,
				    		    position: new kakao.maps.LatLng(theater.positionY, theater.positionX),
				    		 	image: icon
				    		});
				    		
				    		theaterMarkerArray.push(theaterMarker);
				    		//극장 마커 표시
				    		theaterMarker.setMap(map);
							
				    	    var infowindow = new kakao.maps.InfoWindow({
				    	        content: "<span id='infoWindow'>"+theater.theaterName+"</span>" // 인포윈도우에 표시할 내용
				    	    });
				    		
				    		//극장 마커에 인포윈도우 달기
				    		kakao.maps.event.addListener(theaterMarker, 'mouseover', function(){
				    			
				    			 infowindow.open(map, theaterMarker);
				    		});
				    		
				    		kakao.maps.event.addListener(theaterMarker, 'mouseout', function(){
				    			
				    			 infowindow.close();
				    		});			    		
				    		//극장 마커에 Click 이벤트 달기
				    		kakao.maps.event.addListener(theaterMarker, 'click', function() {
				    			$("#myModalTitle").html("<strong>"+theater.theaterName+"</strong>");
				    			
				    			var bodyHtml = "<p>주소  : "+theater.address+"</p>"
				    				bodyHtml+= "<p>도로명 주소 : "+theater.roadAddress+"</p>"
				    				bodyHtml+= "<p>전화번호 : "+theater.theaterPhone+"</p>"
				    				bodyHtml+= "<button type='button' id='myModalBodyButton' class='btn btn-link p-0'>상세정보</button>"
				    			$("#myModalBody").html(bodyHtml);
				    			$("#myModalBodyButton").on("click",function(){
				    				showPopup(theater.placeUrl);
				    			});	
				    			$('#myModal').modal('show')
				    			
				    			
				    		});//end of theaterMarker event click
				    	}//end of forEach inner Function		 
				     )//end of for Each
				  })// end of done
			
			
		  var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		  var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		  var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		  var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		  var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
			
				
			//현재 위치를 제외한 마커
			var markerArray = new Array();
			
			// 맵에 클릭 이벤트 추가
			// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				//map.relayout();
				markerArray.forEach(
					marker => {marker.setMap(null);}		
				)//end of forEach
				// 클릭한 위도, 경도 정보를 가져옵니다  
				var latlng = mouseEvent.latLng; 
	            
				//새 마커를 표시합니다
				var newMarker = new kakao.maps.Marker({ 
				    
				    position: latlng
				}); 
			    
				newMarker.setMap(map);
				
				markerArray.push(newMarker);
				// 마우스로 클릭한 위치입니다 
			    var clickPosition = mouseEvent.latLng;
			 	
			    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
			    if (!drawingFlag) {
	
			        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
			        drawingFlag = true;
			        
			        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
			        deleteClickLine();
			        
			        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
			        deleteDistnce();
	
			        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
			        deleteCircleDot();
			    
			        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
			        clickLine = new kakao.maps.Polyline({
			            map: map, // 선을 표시할 지도입니다 
			            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			            strokeWeight: 3, // 선의 두께입니다 
			            strokeColor: '#db4040', // 선의 색깔입니다
			            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid' // 선의 스타일입니다
			        });
			        
			        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
			        moveLine = new kakao.maps.Polyline({
			            strokeWeight: 3, // 선의 두께입니다 
			            strokeColor: '#db4040', // 선의 색깔입니다
			            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid' // 선의 스타일입니다    
			        });
			    
			        // 클릭한 지점에 대한 정보를 지도에 표시합니다
			        displayCircleDot(clickPosition, 0);
	
			            
			    } else { // 선이 그려지고 있는 상태이면
	
			        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
	
			        // 좌표 배열에 클릭한 위치를 추가합니다
			        path.push(clickPosition);
			        
			        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
			        clickLine.setPath(path);
	
			        var distance = Math.round(clickLine.getLength());
			        displayCircleDot(clickPosition, distance);
			    }
			});
			    
			// 지도에 마우스무브 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
			kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	
			    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
			    if (drawingFlag){
			        
			        // 마우스 커서의 현재 위치를 얻어옵니다 
			        var mousePosition = mouseEvent.latLng; 
	
			        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
			        
			        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
			        var movepath = [path[path.length-1], mousePosition];
			        moveLine.setPath(movepath);    
			        moveLine.setMap(map);
			        
			        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
			            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
			        
			        // 거리정보를 지도에 표시합니다
			        showDistance(content, mousePosition);   
			    }             
			});                 
	
			// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
			kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
			    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
			    if (drawingFlag) {
			        
			        // 마우스무브로 그려진 선은 지도에서 제거합니다
			        moveLine.setMap(null);
			        moveLine = null;  
			        
			        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
			    
			        // 선을 구성하는 좌표의 개수가 2개 이상이면
			        if (path.length > 1) {
	
			            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
			            if (dots[dots.length-1].distance) {
			                dots[dots.length-1].distance.setMap(null);
			                dots[dots.length-1].distance = null;    
			            }
	
			            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
			                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
			                
			            // 그려진 선의 거리정보를 지도에 표시합니다
			            showDistance(content, path[path.length-1]);  
			             
			        } else {
						markerArray.forEach(
								marker => {marker.setMap(null);}		
							)//end of forEach
			            // 선을 구성하는 좌표의 개수가 1개 이하이면 
			            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
			            deleteClickLine();
			            deleteCircleDot(); 
			            deleteDistnce();
	
			        }
			        
			        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
			        drawingFlag = false;          
			    }  
			});    
	
			// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
			function deleteClickLine() {
			    if (clickLine) {
			        clickLine.setMap(null);    
			        clickLine = null;        
			    }
			}
	
			// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
			// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
			function showDistance(content, position) {
			    
			    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
			        
			        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
			        distanceOverlay.setPosition(position);
			        distanceOverlay.setContent(content);
			        
			    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
			        
			        // 커스텀 오버레이를 생성하고 지도에 표시합니다
			        distanceOverlay = new kakao.maps.CustomOverlay({
			            map: map, // 커스텀오버레이를 표시할 지도입니다
			            content: content,  // 커스텀오버레이에 표시할 내용입니다
			            position: position, // 커스텀오버레이를 표시할 위치입니다.
			            xAnchor: 0,
			            yAnchor: 0,
			            zIndex: 3  
			        });      
			    }
			}
	
			// 그려지고 있는 선의 총거리 정보와 
			// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
			function deleteDistnce () {
			    if (distanceOverlay) {
			        distanceOverlay.setMap(null);
			        distanceOverlay = null;
			    }
			}
	
			// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
			function displayCircleDot(position, distance) {
	
			    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
			    var circleOverlay = new kakao.maps.CustomOverlay({
			        content: '<span class="dot"></span>',
			        position: position,
			        zIndex: 1
			    });
	
			    // 지도에 표시합니다
			    circleOverlay.setMap(map);
	
			    if (distance > 0) {
			        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			        var distanceOverlay = new kakao.maps.CustomOverlay({
			            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
			            position: position,
			            yAnchor: 1,
			            zIndex: 2
			        });
	
			        // 지도에 표시합니다
			        distanceOverlay.setMap(map);
			    }
	
			    // 배열에 추가합니다
			    dots.push({circle:circleOverlay, distance: distanceOverlay});
			}
	
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
			function deleteCircleDot() {
			    var i;
	
			    for ( i = 0; i < dots.length; i++ ){
			        if (dots[i].circle) { 
			            dots[i].circle.setMap(null);
			        }
	
			        if (dots[i].distance) {
			            dots[i].distance.setMap(null);
			        }
			    }
	
			    dots = [];
			}
	
			// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
			// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
			// HTML Content를 만들어 리턴하는 함수입니다
			function getTimeHTML(distance) {
	
			    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			    var walkkTime = distance / 67 | 0;
			    var walkHour = '', walkMin = '';
	
			    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			    if (walkkTime > 60) {
			        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
			    }
			    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
	
			    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			    var content = '<ul class="dotOverlay distanceInfo">';
			    content += '    <li>';
			    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
			    content += '    </li>';
			    content += '    <li>';
			    content += '        <span class="label">도보</span>' + walkHour + walkMin;
			    content += '    </li>';
			    content += '</ul>'
	
			    return content;
			}
			
				$("#addTheater").off("click");
				
				$("#addTheater").on("click",function(){
					var theaterName = $("#myModalTitle").text();
					if( $("#likeTheater1 option:selected").val() == "극장선택"){
						alert("첫번째 선호극장이 선택되었습니다.")
						$("#likeTheater1 option:selected").removeAttr("selected");
						$("#likeTheater1 option").each(
							(index,item) => {
								console.log(index)
								if( $("#likeTheater1 option")[index].innerText==theaterName ){
									$($("#likeTheater1 option")[index]).attr("selected",true);
									
								}
							}//end of option		
						)//end of each
					}else if( $("#likeTheater2 option:selected").val() == "극장선택"){
							alert("두번째 선호극장이 선택되었습니다.")
							$("#likeTheater2 option:selected").removeAttr("selected");
							$("#likeTheater2 option").each(
									(index,item) => {
									if( $("#likeTheater2 option")[index].innerText==theaterName ){
										$($("#likeTheater2 option")[index]).attr("selected",true);
										
									}
								}//end of option		
							)//end of each		
					}else if( $("#likeTheater3 option:selected").val() == "극장선택"){
							alert("세번째 선호극장이 선택되었습니다.")
							$("#likeTheater3 option:selected").removeAttr("selected");
							$("#likeTheater3 option").each(
									(index,item) => {
									if( $("#likeTheater3 option")[index].innerText==theaterName ){
										$($("#likeTheater3 option")[index]).attr("selected",true);
										
									}
								}//end of option		
							)//end of each		
					}else{
						alert("선호 극장이 모두 선택되었습니다.");
						$("#myModal > div > div > div.modal-footer > button.btn.btn-secondary").trigger("click");
						$("#outerMotdal").modal('toggle')
						$("#theaterChoice").on('hidden.bs.modal',function(){
							$('body').removeClass('modal-open');
							$('.modal-backdrop').remove();		
						})
						
						
					
					}
				});//end of #addtheater click
				
		};//end of success
		

	}//end of activeMap()
	
	function showPopup(url){
		
		window.open(url, "a", "width=400, height=300, left=100, top=50");
	}

	// 현재 위치 불러오는게 실패했다면
	function error(err) {
  		console.warn('ERROR(' + err.code + '): ' + err.message);
	};	  
	
	function otherModal(){
		$("button[data-dismiss=modal2]").click(function () {
		    $('#myModal').modal('hide');
		});
		
		$('#myModal').trigger("click");
	}
	
	/* 마커 클릭하면 정보 보이고, 버튼 누를시에 선호 극장으로 데이터 전송하기 */
	</script>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalTitle"></h5>
	        <button type="button" class="close" data-dismiss="modal2" aria-label="Close" onClick='otherModal()'>
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="myModalBody">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="button large" style="margin-right: 10px;" data-dismiss="modal2" onClick='otherModal()'>닫기</button>
	        <button type="button" class="button large purple" style="color: #333; " id="addTheater">선호극장 추가하기</button>
	      </div>
	    </div>
	  </div>
	</div>
    </div>
  </div>
</div>

<script>



</script>


</body>
</html>