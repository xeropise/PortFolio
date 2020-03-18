<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
<title>MMM</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <!-- google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <!-- summer notes -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>
	
	
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>		
<script type="text/javascript">
	
$(document).ready(function() {
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
	

	function fncAddNotice(){
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
		
		$("form").attr("method","post").attr("action","/customer/addContact").submit();
	}


		
	$(function(){
		
		
		$('#regBtn').on("click", function(){
			fncAddNotice();
		});
		
		$('#cancelBtn').on("click", function(){
			history.go(-1);
		});

	
	});
	
	
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

	
	$(function(){
		
		
		$("button[name='ask']").on("click", function(){
			self.location="/customer/getAskList";
		});
		
		$("button[name='notice']").on("click", function(){
			self.location="/customer/getNoticeList";
		});
		
		$("button[name='contact']").on("click", function(){
			self.location="/customer/addContact";
		});

		$("button[name='updtUser']").on("click", function(){
			console.log(userNo);
			self.location="/user/updateUser";
		});
		
	});  

</script>

<style>
	
	body {
		font-family: 'Noto Sans KR', sans-serif;
		}
		
		@media (min-width: 768px) {
	 	 .container {
	     width: 750px;
	  }
	}
	
		@media (min-width: 992px) {
		 .container {
	     width: 940px;
	  }
	}

	 #header{ 
	      	width:940px;
	      	height:auto;
	      	padding: 20px;
	        margin: 10px auto;
	        border: 1px solid #bcbcbc;
	        }
	        
	
	  
	  .content{
	  	height:auto;
	  }
	  
	  
	  th{
	  	width:0px;
	  
	  }

	  button.write{
	background-color:#fee50e ;
	color:#545454;
	border: 1px solid #dedede;
	}
	
	#cancelBtn {
		color: #fff;
	   	background-color: #6c757d;
	   	border-color: #6c757d;			
	}
</style>



</head> 

<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">

<br>
		<div class="page-header mt-3">
	       <span style="font-weight: bold; font-size:35px; color:black;">고객센터</span>
	    <hr>
	    </div>
	    
	 	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
		 <button type="button" name="ask" class="btn"><span style="font-size:20px;"><i class="fas fa-question-circle" style="font-style: normal;">자주찾는질문</i></span></button>
	    <button type="button" name="contact" class="btn"><span style="font-size:20px;"><i class="fas fa-comment"style="font-style: normal;">일대일문의</i></span></button>
	    <button type="button" name="notice" class="btn"><span style="font-size:20px;"><i class="fas fa-info-circle" style="font-style: normal;">공지사항</i></span></button>	
	  </div>
	</div>
   </div>
	  
<form autocomplete="off">
	<input type="hidden" name="userNo" value="${user.userNo}"/>
	
	<div class="container">
	
	<div id="header"> 
	<div>
<!-- 	<button name="updtUser" class="btn btn-outline-secondary btn-sm">수정</button> -->
					<table class="table table-borderless">
				     <tbody>
					<tr>
					<th>이름</th>
					<td>${user.userName}</td>
					
					
				
					<th>아이디</th>
					<td>${user.userId}</td>
					</tr>	
					
					<tr>
					<th>이메일</th>
					<td>${user.email}</td>
					
					
					
					<th>휴대전화번호</th>
					<td>${user.phone}</td>
					</tr>	
					
				
				</tbody>
				</table>
				
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
						   
	</div>
		
	 
	<div class="text-center">
		<button id="regBtn" class="btn write ">등&nbsp;록</button>
		<button id="cancelBtn" type="button" class="btn write" >취 &nbsp;소</button>
	</div>
	<br>
	
	</div> <!--#header 닫는애 -->
	</div> <!-- container 닫는애 -->
</form>
<jsp:include page="/layout/footer.jsp"></jsp:include>
 </body>
 
 </html>