<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>



<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>
	  
	  
	  
<script type="text/javascript">
	
	$(function(){
		
		$('#delBtn').on("click", function(){
			var articleNo = ${article.articleNo};
			console.log(articleNo)
			self.location="/customer/deleteContact?articleNo="+articleNo;
		});
		
		$('#okBtn').on("click", function(){
// 			alert('ok버튼이 클릭됨');
			self.location="/mypage/mypage?condition=10";
			
		});
		
		//답변달기 모달 띄우기
		$('#addAnswer').on("click", function(){
			console.log('addAnswer이 클릭됨');
			$('#modalBox').modal('show');
		});
		
		$('#closeModalBtn').on('click', function(){
			$('#modalBox').modal('hide');
			});
		
		$('#upload').on('click', function(){
			fncAddReply();
			});
		
		$('#modalBox').on('show.bs.modal', function (e) {
			console.log("show.bs.modal");
			
			  $('#summernote').summernote({
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
				  callbacks:{			//data형태로 이미지가 에디터에 그대로 삽입되면 문자열이 길어지므로 이미지 파일을 서버에 저장하고, 이미지를 호출할 수 있는  url을 리턴받아서 입력하자
					  onImageUpload: function(files, editor, welEditable) {
						  for(var i = files.length -1; i>=0; i--){
							  sendFile(files[i], this);
						  }
					  }
				  }
			  });
			
			
			});



		
		$("button[name='ask']").on("click", function(){
			self.location="/customer/getAskList";
		});
		
		$("button[name='notice']").on("click", function(){
			self.location="/customer/getNoticeList";
		});
		
		$("button[name='contact']").on("click", function(){
			self.location="/customer/addContact";
		});
		
	});  
	

	function fncAddReply(){
// 		alert('도착?')
		var articleTitle = $("input[name='articleTitle']").val();
		var content = $("textarea[name='content']").val();
		console.log(content);
		
		if(articleTitle== null || articleTitle.length<1 || articleTitle == '') {
			alert("제목은 반드시 입력하셔야 합니다.")
			return;
		}
		
		if(content== null || content.length<1 || content == '') {
			alert(content)
			alert("내용은 반드시 입력하셔야 합니다.")
			return;
		}
		
		$("form").attr("method","post").attr("action","/customer/addReContact").submit();
	}

	
	function sendFile(file, el) {
		var path = '\\..\\resources\\image\\';
		var form_data = new FormData(); // 페이지전환없이  form을  제출하고 싶을 때  FormData객체를 쓴다
		form_data.append('file', file); // key:file, value:file 로 저장된다
		
		$.ajax({
			data: form_data,
			type: 'POST',
			url: '/customer/json/uploadImage',	//이미지 업로드 경로
			cache :false,
			contentType: false,
			enctype: 'multipart/form-data',	//멀티파트 
			processData: false,
			success: function(img) {	//파일 전송 완료시 이미지 파일 url 
				alert('성공_'+img);
				$(el).summernote('insertImage', path+img);	//editor.insertImage기능은 이미지 삽입해주는 것 
				
			}
		});
	}

</script>

<style>

	
	div.inline{
	
		display: inline;
	}


	 .header{ 
      	width:808px;
      	height:auto;
      	padding: 20px;
        margin: 10px auto;
        border: 1px solid #000000;
       }
        
	 .replyBox{ 
      	width:740px;
      	height:auto;
      	padding: 20px;
        margin: 10px auto;
        border: 1px solid #000000;
        margin-top: 40px;
       }
         
	  .content{
		height:auto;
		
	  }
	  		

	  .writerInfo{
	  	width: 100%;
	  	height: 50px;
	  }
	  
	   div.left{
	  	 width: 50%;
	  	 float: left;
	  	 box-sizing: border-box;
	  }
	    div.right{
	     width: 50%;
	     float: rightt;
	   	 box-sizing: border-box;
	  }
		div.inline.rightt.date {
	    	text-align: right;
		}
		
		body {
	    	font-family: 'Noto Sans KR', sans-serif;
		}
		
		button.btn.write { 
			background-color: #fee50e!important;
	   		color: #212529;
	    	border-color: #fcfaf5;
	    	font-size: 13px;
		}
		
		button.btn.write:hover {
		     color: #f8f9fa;
		     background-color: #e0a800;
		     border-color: #040404;
		}  
	

</style>



</head> 

<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">

	<div class="page-header mt-3">
	       <span style="font-weight: bold; font-size:35px; color:black;">고객센터</span>
	       <hr>
	    </div>
	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
		<button type="button" name="ask" class="btn"><span style="font-size:20px;"><i class="fas fa-question-circle">자주찾는질문</i></span></button>
	    <button type="button" name="contact" class="btn"><span style="font-size:20px;"><i class="fas fa-comment">일대일문의</i></span></button>
	    <button type="button" name="notice" class="btn"><span style="font-size:20px;"><i class="fas fa-info-circle">공지사항</i></span></button>
	  </div>
	</div>
	<br>
<br>

</div>

<div class="container">
	<div class="row mx-0" style="margin: 10px auto;">
		<span class="col-2"></span>
		<span class="col-2" style="position:relative; right:40px;"><strong>글 번호 :</strong> <kbd>${article.articleNo }</kbd></span>
		<span class="col-6"></span>
		<span class="col-2"></span>
	</div>
	<div class="header p-0"> 
	
	<div class="border-bottom text-black mb-2 p-3 h-100" style="background-color:#333;">   <!-- 문의 제목, 일시 -->
		<div class="inline left">
		<span class="align-center  ml-4" style="font-size:18px; font-weight:800px; color:white;">
		Q. ${article.articleTitle}</span></div>
		<div class="rightt date text-right"> 
		<span class="mb-1" style="font-size:15px; color:white;">${article.articleDate}</span></div>
 	</div>	
 	
 	
 	
 	<div class="writerInfo border-bottom ml-4 mb-2 p-2 h-100 font-weight-bold" >  <!-- 질문자 정보 -->
		<div  class="inline left ">${writer.userName}</div>
		<div  class="inline right ">${writer.userId}</div>
		<br>
		<div  class="inline left ">${writer.email}</div>
		<div  class="inline right">${writer.phone}</div>
	</div>
	
	
	<div class="body p-4">
	<div class="content askbox mb-2">
	
		<div class="mb-2">${article.content}</div>
	
	</div>
	

	
	<c:if test="${reArticle ne null}">
	   <div class="replyBox p-1">
	   
	  			<div class="inline left"> 
	  				<span style="font-size: 20px; "><i class="fab fa-replyd fa-lg" style="color:#f23d4f;" ></i></span>
	  				<c:if test="${reArticle.articleTitle ne null}">
	                  <span style="font-weight:bold;"> ${reArticle.articleTitle} </span>
	                </c:if> 
	                </div>
	                
	                <div class="inline rightt date">
	               	   	<c:if test="${reArticle.articleDate ne null}">
	           		   <span style="font-weight:bold;">	${reArticle.articleDate}</span>
	                    </c:if> 
	                </div>
                			<div class="m-3">
	                        <c:if test="${reArticle.content ne null}">
	                     ${reArticle.content}
	                        </c:if>
	                        
					</div>
	
			</div>
			</c:if>
        </div>	
        
	<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
		
			<div class="modal-body">
			<form>
			<table class="table">
				 	<tbody>
					 <tr>
					 <td  colspan="4"> <input type="text" class="form-control" name="articleTitle"> </td>
					 </tr>
					 
					 <tr>
					 <td  colspan="4"><textarea class="form-control noresize" rows="10" cols="10"  id="summernote" name="content">
				  	 	</textarea> </td>
					 </tr>
					 </tbody>
					 </table>
					 <input type="hidden" name="supArticleNo" value="${article.articleNo}">
					 </form>
			</div>
		
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="upload">확인</button>
				<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
			</div>
		</div>
	</div>

	</div>


	
		<div class="text-center m-2">
			<button id="delBtn" class="btn btn-secondary write" type="button">삭 &nbsp;제</button>
			<button id="okBtn" type="button" class="btn btn-secondary write">목 &nbsp;록</button>
			
			<c:if test="${reArticle eq null}">
				<c:if test="${user.role eq 'admin'}">
				<button id="addAnswer" type="button" class="btn btn-secondary write">답변추가</button>
				</c:if>
		</c:if>	
		</div>
</div>
	
</div>

<jsp:include page="/layout/footer.jsp"></jsp:include>
 </body>
 
 </html>