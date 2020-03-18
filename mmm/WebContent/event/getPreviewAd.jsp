<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
  <!-- 카카오 맵 api key -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e195c747986bcc9e0da58dd2ded5409c"></script>

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>


<!-- 부트스트랩4 를 위한 것 -->

<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script type="text/javascript">
function getCommentList(currentPage) {
	
	var parent = ${preview.previewNo};
	
	var datas = JSON.stringify({
		currentPage : new String(currentPage),
		commentType : "0",
		parent : new String(parent)
	});
	
	$.ajax({
		type: "POST",
		url: "/event/json/listExpectLine",				
		data: datas,
		dataType : "json",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json",
		},
		success : function(result) {
			
			//alert(result.list.length)
			
				console.log(result)
				$(".reply_box").empty()
				var html = "<p class='num'>"+ result.resultPage.totalCount+" Comments</p>";
				html+= "<input type='hidden' id='currentPage' value=''/>" 
				html+= "<input type='hidden' name='articleNo' value='${preview.previewNo}'>"
				html+= "<input type='hidden' name='commentType' value='0'>"
				html+= "<input type='hidden' name='userId' value='${user.userId}'>"
				html+= "<div class='textarea_box'>"
				html+="<textarea name='commentContent' rows='5' cols='50' class='textarea' onfocus=''></textarea>"
				html+="<a id='commentWrite' class='btn_write'>쓰기</a></div>"
			
				
			if(result.list.length!=0){
				for (var i = 0; i < result.list.length; i++) {
					
					if(result.list[i].blindStatus==1){
						html += "<li class='blindCmt'>관리자에 의해 블라인드 처리되었습니다. </li>"
					}else{
					html += "<li><div class='id' name='userId'>"+ result.list[i].userId+ "</div>";
					html += "<input type='hidden' name='commentNo' value='"+result.list[i].commentNo+"'>";
					
					html += "<div class='comment' name='content'>"+result.list[i].commentContent+ "<div class='date' name='date'>"+result.list[i].commentDate+"</div>"+"</div>";
					
					if('${user.role}'=='admin'){
						html += "<a type='button' class='btn_spam' name='btn_spam'>처리</a>";
					}
					html += "</li>";
					}
				}
			}
				html += "</p>"
					$(".reply_box").append(html);
				
		
			
			//페이지네이션 추가
			$("div.cmtPagination").empty();
			
			Element = "<div class='col-4'></div>"
	  		Element +="<div>"
			Element +="<ul class='pagination justify-content-center'>"
   			if(result.resultPage.currentPage <= result.resultPage.pageUnit){
   				Element +="<li class='page-item disabled'>"
   				Element +="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'>«</a>";
   				Element +="</li>"
   			}else if(result.resultPage.currentPage > result.resultPage.pageUnit){
   				Element +="<li class='page-item'>";
   				Element +="<a class='page-link' href='javascript:getCommentList("+(parseInt(result.resultPage.beginUnitPage)-1)+")' tabindex='-1' aria-disabled='true'>«</a>";
   				Element +="</li>";
   			}
			
  			for(var i=result.resultPage.beginUnitPage; i<=result.resultPage.endUnitPage; i++){
  				if(result.resultPage.currentPage==i){
  					Element+="<li class='page-item active' aria-current='page'>";
  					Element+="<a class='page-link' href='javascript:getCommentList("+i+")'>"+i+"<span class='sr-only'>(current)</span></a>";
  					Element+="</li>";
  				}else{
  					Element+="<li class='page-item'>";
  					Element+="<a class='page-link' href='javascript:getCommentList("+i+")'>"+i+"</a>";
  					Element+="</li>";
  				}
  				
  			}//end of for
			
  			if(result.resultPage.endUnitPage >= result.resultPage.maxPage){
  				Element+="<li class='page-item disabled'>";
  				Element+="<a class='page-link' href='#'>»</a>";
  				Element+="</li>";
  			}else if(result.resultPage.endUnitPage < result.resultPage.maxPage){
  				Element+="<li class='page-item'>";
  				Element+="<a class='page-link' href='javascript:getCommentList("+(parseInt(result.resultPage.endUnitPage)+1)+") '>»</a>";
  				Element+="</li>";
  			}
				
	  			Element+= "</ul>";
				Element+= "</div>";
				Element+= "<div class='col-4'></div>";
				Element+= "<form>";
				Element+= "<input type='hidden' id='currentPage' name='currentPage' value=''/>";
				Element+= "</form>";
				
				$("div.cmtPagination").append(Element);
				
				comment(currentPage)
			
		}//end of success
	
	})//end of ajax
}//end of getCommentList
function comment(currentPage){
	

	
	$('#commentWrite').off("click")
	
	$('#commentWrite').on("click", function(){
		
		if( $("textarea[name='commentContent']").val().length>0){
					$.ajax({
						
					url: "/event/json/addExpectLine",
					method:"POST",
					data: JSON.stringify({
						articleNo : $("input[name='articleNo']").val(),
						commentType : $("input[name='commentType']").val(),
						userId : $("input[name='userId']").val(),
						commentContent : $("textarea[name='commentContent']").val(),
						currentPage :currentPage,
					}),
					headers:{
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success: function(){
						getCommentList(currentPage);
					},
					error: function(status,error) {
						alert("에러발생");
					}//success 끝
				}); //ajax끝
			}else{
				alert("내용을 입력해주세요")
			}
		}); //click 이벤트 끝
}//end of comment()
	$(function(){
		
		$('#player').attr("src","http://www.youtube.com/embed/"+ "${preview.trailer}");
	
		getCommentList(1);
		
		//처리 버튼을 누름
		$(document).on("click", "a[name='btn_spam']" ,function() { 
			
			
			var today = new Date();   
			var commentDate = 	today.toLocaleDateString()+" "+today.toLocaleTimeString();	
			var articleNo =${preview.previewNo};
			var userId = $(this).parent().find("div[name='userId']").text();
			var commentContent = $(this).parent().find("div[name='content']").text();
			var commentNo = $(this).parent().find("input[name='commentNo']").val();
			
			$("#userId").html(userId);
			$("#content").html(commentContent);
			$("#cmtDate").html(commentDate);
			$("input[name='commentNo']").val(commentNo);
			
			$('#modalBox').modal('show');
		
		});
		
		
		$('#modalBox').on('show.bs.modal', function (e) {
			console.log("show.bs.modal");
		});
		
		
		$('#closeModalBtn').on('click', function(){
			$('#modalBox').modal('hide');
		});
		
		
		
		
		
		//블라인드 처리 모달창 확인버튼 
		$('#addBlindBtn').on("click", function(){
			
			var blindReason = $("select[name='blind_reason']").val();
			var commentNo = $("input[name='commentNo']").val();
			
			
			
			console.log(blindReason);
			console.log(commentNo);
			
			$.ajax({
				
				url: "/event/json/addExpectLineBlind",
				method:"POST",
				data: JSON.stringify({
					blindReason : new String(blindReason),
					commentNo : new String(commentNo)
				}),
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(){
// 					alert('성공했어....')
				},
				error: function(status,error) {
// 					alert("에러발생");
				}//success 끝
			}); //ajax끝
			
			
			
			
			self.location = "";
		});
		
		$('#okBtn').on("click", function(){
			self.location="/event/getPreviewListAd";
		});
		
		
		$('#updateBtn').on('click', function(){
			
			var previewNo = ${preview.previewNo};
			self.location = "/event/updatePreviewAd?previewNo="+previewNo;
	
		})
		
		
		
		$('#doApply').on("click", function(){
			var status =${preview.previewFlag};
			console.log(status);
			
			if(status==2){
// 				 alert("마감된 이벤트 입니다");
			}
			
			var previewNo = ${preview.previewNo};
			self.location="/event/addPartPrev?previewNo="+previewNo;
		});
		
//추첨하는 버튼...		
// 		$('#ranBtn').on("click", function(){
// 			alert('doApply버튼이 클릭됨');
// 			var previewNo = ${preview.previewNo};
// 			alert("previewNo:"+previewNo)
// 			self.location="/event/getWinner?previewNo="+previewNo;
// 		});
		
		
		$('#viewWinner').on('click',function(){
			var previewNo = ${preview.previewNo};
			$("div#winnerModal").modal("show");
			getWinnerList(previewNo);
		});
		
		
		$('#viewDetail').on('click',function(){
			var movieNo = ${preview.movieNo};
			self.location = "/movie/getMovie/"+movieNo;
		});
		
		
		$("#apply").on("click", function(){
			
			var previewNo = ${preview.previewNo};
			console.log("previewNo"+previewNo);
			
				$.ajax({
				url: "/event/json/getApplyList/"+previewNo,
				method:"GET",
				dataType:"json",
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(JSONData, status){
				
					console.log(JSONData.list.length);
					for (var i = 0; i < JSONData.list.length; i++) {
						console.log(JSONData.list[i]);
						$('#ax').append("<h4><h5>[회원관리번호]"+JSONData.list[i].userNo+
								"[참여일시]"+JSONData.list[i].partStrDate+"</h4><br>");
					}
				}
			}); //ajax끝
		}); //click 이벤트 끝
	}) //$ 끝
	
</script>
<style>

#comment_holder > div > div > div > ul > li.page-item.active > a{
    z-index: 3;
    color: #212529;
    background-color: #fee50e;
    border-color: #fee50e;
}

	.fa-map:before {
	    color: chocolate;
	    content: "\f279";
	    margin-left: 6px;
	    cursor: pointer;
	}
	
 	#infoWindow{
 		  white-space: nowrap; 
		  width: 50px; 
		  overflow: hidden;
		  text-overflow: ellipsis; 	
 	}
 	
 	#doApply{
 	
 		background-color: #fee50e;
 		font-weight: 900;
 		color: #495057;
 	}
 	
 	div.cdtl_prd_info > div.prevInfo > p > i {
 		color: #fee50e;
 	}
 	
 	
 	.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
	.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
	.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	.number {font-weight:bold;color:#ee6152;}
	.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
	.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
	.distanceInfo .label {display:inline-block;width:50px;}
	.distanceInfo:after {content:none;}
	.issue{
	height: 500px;
	border: 1px solid black;
	
	
	}	
		
		
	.byeFloat {
	/* 	content: '';  */
		dispaly: table;
		clear: both;
		height: 30px;
	}
	
	.event-detail .event-detail-date {
	    overflow: hidden;
	    width: 1114px;
	    margin: 0 auto 30px auto;
	    font-weight: bold;
	    padding: 15px 0 25px 0;
	    line-height: 1.1;
	    border-bottom: 1px solid #555;
		}
	
	* {
	    box-sizing: border-box;
		}
		
	.page-item.active .page-link {
	    z-index: 3;
	    color:  #4e4c4c;
	    background-color: #fee00e;
	    border-color: #d6cece;
	}

	p {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	
	body {
		
	    overflow: auto;
	    letter-spacing: 0;
	    line-height: 1.5;
	    font-size: 15px;
	    color: #444;
	    font-weight: 400;
		font-family: 'Noto Sans KR', sans-serif;
		
		}
		
	#contents {
   		 width: 100%;
    	 margin: 0;
  		 padding: 40px 0 0 0;
	}
	.event-detail h2.tit {
	    width: 1100px;
	    margin: 0 auto;
	    padding: 0;
	}
	
	
	h2.tit {
	    padding: 0 0 26px 0;
	    font-size: 1.8666em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	    }
	    
	
		div.cdtl_col_lft{
		font-size: 12px;
		line-height: 1.5em;
		float: left;
		width: 550px;
		}
	
		div.cdtl_col_rgt {
	    float: right;
	    width: 550px;
	    line-height: 1.5em;
		}
	
		div.prevInfo {
		padding: 0px;
		font-size: 1.1em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	    border-bottom: 0.5px solid #444444;
	    margin-bottom: 15px;
		}
	
		p{
		text-indent : 0;
		}
	
	.jb-bolder {
        font-weight: bolder;
      }
	.trailer{
		width: 550px;
		height: 300px;
		border: 1px solid #444444;
	}
	
	.expectLine{
		border-top: 1px solid black;
		px;
	}
	
	
	.comment_area{
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 14px;
		color: #545454;
		position: relative;
	}
	
	.comment_area.num{
		padding: 0;
		border: 0;
		color: #545454;
		font-weight: bold;
		font-size: 12px;
		margin: 10px 0 25px;
	}
	
	p {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	
	.comment_area .textarea_box {
	    position: relative;
	    margin: 10px 0; 
	    padding-right: 75px;
	}
	
	.comment_area .textarea_box textarea {
	    border: 1px solid #ebebeb;
	    background: #f3f3f3;
	    font-size: 14px;
	    display: block;
	    height: 70px;
	    width: 100%;
	}
	.comment_area .textarea_box a.btn_write {
	    position: absolute;
	    right: 0;
	    top: 0;
	    height: 70px;
	    color: #fff;
	    font-weight: bold;
	    width: 65px;
	    background: #828282;
	    text-align: center;
	    padding-top: 25px;
	}
	
	textarea {
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
	    -webkit-appearance: textarea;
	    background-color: -internal-light-dark-color(white, black);
	    -webkit-rtl-ordering: logical;
	    flex-direction: column;
	    resize: auto;
	    cursor: text;
	    white-space: pre-wrap;
	    overflow-wrap: break-word;
	    margin: 0em;
	    font: 400 13.3333px Arial;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(169, 169, 169);
	    border-image: initial;
	    padding: 2px;
	}
	 .reply_box {
    margin-bottom: 25px;
    padding: 0 
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
	
	.reply_box li {
	    position: relative;
	    border-bottom: 1px solid #e0e0e0;
	    padding: 12px 5px;
	}
	
	
	li {
	    list-style: none;
	}
	
	.reply_box li .id {
	    margin-bottom: 10px;
	    display: inline-block;
	    font-weight: bold;
	    color: #828282;
	    font-size: 14px;
	}
	li {
	    text-align: -webkit-match-parent;
	}
	
	 li .date {
	    font-size: 12px;
	    color: #bebebe;
	    position: 0;
	    top: 12px;
	    right: 50px;
	}
	
	li .comment {
	    font-size: 16px;
	    line-height: 180%;
	}
	
	li .btn_spam {
	    position: absolute;
	    right:10px;
	    top: 12px;
	    font-size: 12px;
	    text-decoration: underline;
	    color: #000;
	}
	#comment_holder > div > ul > li> a {
		color: #dc3545;
	}
	
	
	
	.cmtPagination {
	    text-align: center;
	}
	
	.cmtPagination a {
	    display: inline-block;
	}
	
	li.blindCmt{
		height: 82.76px;
		color: #dc3545;
		padding-top:30px;
	}
	a:visited {
	    color: #545454;
	    text-decoration: none;
	}
	li.active {
	  background-color: yellow;
	}
	
	p.modal-title {
		color: #545454;
		font-size: 15px;
	}
	
	
	i.fas.fa-pastafarianism{
		color:#545454;
	}
	
	button.btn.getPreviewAd {
		background-color:#fee50e ;
		color:#545454;
		border: 1px solid #dedede;
	}
	

	button.btn.moreInfo {
		background-color:#e33030 ;
		color:#ffffff;
		border: 1px solid #dedede;
	}
	
	button.btn.update{
		background-color: pink;
		color:gray;
		background-color: #fee50e;
		border-color : #fee50e;
		color : #222;
	}
	
	#content{
		width:90%;
		margin-left: 21px;
		height: 100px;
		border: 1px solid #dedede;
	}
	
	#cmtDate{
	    font-size: 15px;
	    color: #dedede;
	    position: absolute;
	    top: 12px;
	    right: 40px;
	}
	
	#userId{
		font-size: 15px;
	   
	    position: absolute;
	    top: 12px;
	    left: 40px;
	}
	
	span.getPreview{
		color: #444444;
	}
	
	div.blindInfo{
		width:90%;
	}
	
	.btn{
	border: 1px solid #dedede;
	}
	
	 .page-link {
	 	color: #333 !important;
	 }
	 
	 #myModal2 > div > div > div.modal-header {
		background-color: #fee50e;
		border-color : #fee50e;
		color : #333;		 	
	 }
	 
	 #winnerModal > div > div > div.modal-header {
		background-color: #fee50e;
		border-color : #fee50e;
		color : #333;		 
	 }	
</style>



</head> 

<body>
<jsp:include page="/layout/header.jsp"></jsp:include>	
<div class="container">

 	<div id="contents">
 	
	<div class="event-detail" style="margin-right: 10px;">	
	<h2 class="tit">
	<span class="getPreview" style="font-weight:bold;">${preview.previewName}</span></h2>
	<p class="event-detail-date ">
				<span class="getPreview">기간 : </span>
				<em>${preview.preStDate} ~ ${preview.preEdDate}</em>
	</p>
	
	</div><!-- div.event-detail끝 -->
	
	<div class="cdtl_cm_detail">
	
		<div class="cdtl_col_lft">
				<div class="cdtl_item_image">
					<span class="cdtl_imgbox imgzoom getPreview">
								<img src= "${preview.previewImage}" width="450" height="600" onerror="this.onerror=null;this.src='http://img.ssgcdn.com/trans.ssg?src=/ui/ssg/img/common/img_ready_500x500.jpg&amp;w=1200&amp;h=1200&amp;t=a00628030fd12db31022d09ae5b97d4b29576a99'" id="mainImg"></span>
				</div>
	
			</div><!-- div.cdtl_col_lft끝 -->
	
		<div class="cdtl_col_rgt">
		
				<div class="cdtl_bn_wrap">
                        <div>
<!--                                    <img src="/resources/image/ddd.PNG" alt=""> -->
										</div>
                        </div>

		 <c:if test="${user.role eq 'admin'}">
            <button class="btn float-right update" id="updateBtn">수정</button>
         </c:if>
         
            <button class="btn float-right moreInfo" id="viewDetail">영화상세</button>
            <c:if test="${preview.previewFlag==1}">
               <button class="btn float-right getPreviewAd" id="doApply">응모하기</button>
            </c:if>
            <c:if test="${preview.previewFlag==2}">
               <button class="btn float-right getPreviewAd" id="viewWinner">당첨자보기</button>
            </c:if>
            
            
            <div class="cdtl_prd_info"> <!-- 시사회 정보 -->
                <div class="prevInfo" style="margin-top:25px;">
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder getPreview"> 시사회 이름 : </span><span class="getPreview">${preview.previewName}</span></p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder getPreview"> 장소 : </span><span class="getPreview" id="previewPlace"><span >${preview.previewPlace}</span></span> <i id="mapIcon" class="far fa-map"></i></p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder getPreview"> 시사 일자 : </span><span class="getPreview">${preview.preDate}</span></p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder getPreview"> 상영 시간 : </span><span class="getPreview">${preview.previewTime}</span></p>
                	<p><i class="fas fa-caret-right"></i><span class="jb-bolder getPreview"> 인원수 : </span><span class="getPreview">${preview.winnerCount} 명</span></p>
				</div>
                
                <div class="trailer" style="margin-top:55px;">
                <iframe id="player" class="embed-responsive-item" width="550" height="300"
			        		src=""></iframe>
                </div>
	 		</div> <!-- cdtl_prd_infot끝 -->
	   
		</div><!-- div.cdtl_col_rgt끝 -->
	
	</div>			
	
	<div class="byeFloat" style="clear:both;">
	</div>
	
<!-- 	<div class="issue"> -->
		
<!-- 	</div> -->
	
	<div class="expectLine" >
	
	<div class="comment_area" id="comment_holder">
<!-- 댓글 -->
					<div class="comment_area">
						<ul class="reply_box">
							</ul>

						<div class="cmtPagination">
						
						
						</div>
						
					</div>
					<!-- //댓글 -->


</div>
	
	
	
	
	</div>
	
	</div>		
	
		
	   
			
											
</div>

	<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<p class="modal-title" id="myModalLabel"><i class="fas fa-pastafarianism yellowTheme"></i> 블라인드 처리</p>
			<button type="button" class="close  getPreviewAd" data-dismiss="modal" aria-label="Close"><span  class="getPreview" aria-hidden="true">×</span></button>
			</div>
		
			<div class="modal-body">
					<form>
					
					 <div class="mt-3 mb-0">
					 <label class="m-4">처리사유</label>
						<select class="m-3" name="blind_reason">
						<option value="0">욕설 등 불건전한 내용</option>
						<option value="1">정치적 성향이 강한 내용</option>
						<option value="2">비방, 명예훼손의 내용</option>
						<option value="3">도배성 게시글</option>
						<option value="4">상업성을 띄는 광고글</option>
						</select>
					 </div>
					 
					 <input type="hidden" name="commentNo" value="">
					 <div class="blindInfo mb-2">
					 <span  class="getPreview" id="userId"> </span>
					 <span  class="getPreview" id="cmtDate"></span>
					 </div>
					<div id="content">
					</div>			
								
					 </form>
			</div>
		
			<div class="modal-footer">
				<button type="button" class="btn getPreviewAd" id="addBlindBtn">확인</button>
				<button type="button" class="btn getPreviewAd" id="closeModalBtn">취소</button>
			</div>
		</div>
	</div>

	</div><!-- end of modal-box -->

<div id="modal3" class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
      <div id="map" style="width:1152px;height:500px;"></div>
    </div>
  </div>
</div>



<script>
	
</script>
<script>
var place = "";
function getWinnerList(previewNo){
		$.ajax({
		url: "/event/json/getWinnerList/"+previewNo,
		method:"GET",
		dataType:"json",
		headers:{
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success: function(JSONData, status){
			
			console.log(JSONData.list.length);
			$('#winnerArea').empty();
			for (var i = 0; i < JSONData.list.length; i++) {
				console.log(JSONData.list[i]);
// 			var phonePart = JSONData.uList[i].phone;
// 			console.log(phonePart);
// 			phonePart.substr(0,4);
// 			console.log(phonePart);
				$('#winnerArea').append("<center><h5>"+JSONData.uList[i].userName+
						" "+JSONData.uList[i].phone+"</h5></center><br>");
			}
		}
	}); //ajax끝
	}
	
	$("i#mapIcon").on("click",function(){
		
		$("div#modal3").modal("show");
	
		place = $.trim($("span#previewPlace").text())
		console.log(place)
	});
	
	$("div#modal3").on('shown.bs.modal', function (e) {
		searchTheater(place);
	})
	
	
	function searchTheater(keyword){	  
		
		    var coords = {
		        latitude: 37.499526740945925,
		        longitude: 127.02925836185794
		    };
		    success(coords,keyword)
		};
	        
		
		// 현재 위치 불러오는게 성공했다면	
		function success(coords,keyword) {
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(coords.latitude, coords.longitude),
				level: 1,
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
			var jqxhr = $.getJSON( "/ticketing/json/getTheaterByName/"+encodeURI(keyword), function() {
				  //console.log( "success" );
				})
				  .done( 
				    	theater => {
				    		console.log(theater)
				    		//로고 달기
				    		if(theater.franchise=='CGV'){
				    			var icon = new kakao.maps.MarkerImage(cgvLogo, new kakao.maps.Size(100, 100));
				    		}else if(theater.franchise=='롯데시네마'){
				    			var icon = new kakao.maps.MarkerImage(lotteLogo, new kakao.maps.Size(100, 100));
				    		}else if(theater.franchise=='메가박스'){
				    			var icon = new kakao.maps.MarkerImage(megaLogo, new kakao.maps.Size(100, 100));
				    		}
				    		//극장 마커 생성
				    		var theaterMarker = new kakao.maps.Marker({
				    		    map: map,
				    		    position: new kakao.maps.LatLng(theater.positionY, theater.positionX),
				    		 	image: icon
				    		});
				    		
				    		theaterMarkerArray.push(theaterMarker);
				    		//극장 마커 표시
				    		//theaterMarker.setMap(new kakao.maps.LatLng(theater.positionY, theater.positionX));
							
				    		
				    		map.panTo(new kakao.maps.LatLng(theater.positionY, theater.positionX));
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
				    				bodyHtml+= "<button type='button' id='myModalBodyButton' class='btn btn-link p-0 getPreviewAd'>상세정보</button>"
				    			$("#myModalBody").html(bodyHtml);
				    			$("#myModalBodyButton").on("click",function(){
				    				showPopup(theater.placeUrl);
				    			});	
				    			$('#myModal2').modal('show')
				    			
				    			
				    		});//end of theaterMarker event click
				    		
				    		kakao.maps.event.addListener(map,'click',function(mouseevent){
				    			console.log("맵 클릭")
				    			map.relayout();
				    			map.setCenter(new kakao.maps.LatLng(theater.positionY, theater.positionX));
				    		});
				    	})//end of forEach inner Function		 
				     
		};//end of success
		
		function showPopup(url){
			
			window.open(url, "a", "width=400, height=300, left=100, top=50");
		}
	
		// 현재 위치 불러오는게 실패했다면
		function error(err) {
	  		console.warn('ERROR(' + err.code + '): ' + err.message);
		};	  
	
	/* 마커 클릭하면 정보 보이고, 버튼 누를시에 선호 극장으로 데이터 전송하기 */
	</script>

	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalTitle"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span  class="getPreview" aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="myModalBody">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>		

	<!-- Modal -->
	<div class="modal fade" id="winnerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalTitle" style="font-weight:bold;">당첨자 목록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span  class="getPreview" aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="winnerArea">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
 </body>
 
 </html>
 