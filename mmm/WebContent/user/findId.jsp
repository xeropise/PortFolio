<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
<title>mmm</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style type="text/css">

.modal-layer {
    overflow-y: scroll;
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 501;
    background-color: rgba(0,0,0,0);
}

.modal-layer .focus {
    display: block;
    position: absolute;
    left: -9999px;
    top: -9999px;
    z-index: 502;
}

.modal-layer .wrap {
    position: absolute;
    left: 50%;
    top: 50%;
    width: 300px;
    min-height: 250px;
    margin: 0;
    padding: 45px 0 0 0;
    box-shadow: 2px 2px 6px 2px rgba(0,0,0,.1);
    background: #fff;
}

.modal-layer .wrap .layer-header {
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 45px;
    background: #fee50e;
}	

.modal-layer .wrap .layer-header h3.tit {
    color: #fff;
    padding: 15px 20px 0 20px!important;
    font-size: 1.2em;
    line-height: 1.1;
}	

.modal-layer .wrap .layer-con {
    overflow-y: auto;
    background-color: #fff;
    padding: 20px 20px 0 20px;
}

.button.purple {
    color: #fff;
    line-height: 36px;
    border: 0;
    background: #fee50e;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}
</style>

<script type="text/javascript">
$(function(){	
	$("#findIdModal").modal("show");
	
	//모달창 엑스
	$("#btn").on("click",function(){
		history.go(-1);
	})
});



</script>

</head>
<body>

<!-- Modal -->
	<form>
		<div class="modal fade" id="findIdModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
						<h5 class="modal-title" id="staticBackdropLabel">아이디 찾기</h5>
						<button type="button" class="close" data-dismiss="modal" id="btn" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="col-wrap">
							<div class="col left">
								<div class="login-input-area">
									<p>보안을 위해 아이디의 3,4 자리를 * 로 표시하였습니다.</p>
									<p>고객님의 ID는 [ ${user.userId} ] 입니다.</p>	
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<a href="/user/login"><button type="button" class="button large purple" style=" border-radius: 4px; color:#333; height: 46px;  border: 0; background-color:#fee50e; color: #333;">로그인 화면으로 이동</button></a>
							<a href="/"><button type="button" class="button large purple" style=" border-radius: 4px; color:#333; height: 46px;  border: 0; background-color:#fee50e; color: #333; ">메인화면으로 이동</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>







<!-- 	<div> -->
<!-- 		<p>보안을 위해 아이디의 3,4 자리를 * 로 표시하였습니다.</p> -->
<%-- 		<p>고객님의 ID는 [ ${user.userId} ] 입니다.</p> --%>
<!-- 		<a href="/user/login"> -->
<!-- 			<button class="btn btn-primary"> -->
<!-- 				로그인 화면으로 이동 -->
<!-- 			</button> -->
<!-- 		</a> -->
		
<!-- 		<a href="/index.jsp"> -->
<!-- 			<button class="btn btn-primary"> -->
<!-- 				메인화면으로 이동 -->
<!-- 			</button> -->
<!-- 		</a> -->
<!-- 	</div> -->
</body>
</html>