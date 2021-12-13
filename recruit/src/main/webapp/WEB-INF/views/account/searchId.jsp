<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>로그인</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../../assets/images/favicon.png">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
<link href="css/style.css" rel="stylesheet">
</head>

<body class="h-100">

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->

	<div class="login-form-bg h-100">
		<div class="container h-100">
			<div class="row justify-content-center h-100">
				<div class="col-xl-6">
					<div class="form-input-content">
						<div class="card login-form mb-0">
							<div class="card-body pt-5">
								<a class="text-center">
									<h4 style="color: RoyalBlue">아이디 찾기</h4>
								</a>

								<form class="mt-5 mb-5 login-input" method='POST' action='login'>
									<div class="form-group">
										<input type="text" id="email" name="email" class="form-control" placeholder="이메일">
									</div>

									<div>
										<button id="cancel-button" type="button"
											class="btn mb-1 btn-outline-primary" style="width: 49%">취소</button>
										<button id="submit-button" type="button"
											class="btn mb-1  btn-primary" style="width: 49%">확인</button>
										
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

	<!--**********************************
        Scripts
    ***********************************-->
	<script type="text/javascript">
		$(function() {
			// 취소
			$('#cancel-button').on('click', function(event) {
				location.href = "login";
			});
			
			// 확인
			$('#submit-button').on('click', function(event){
				event.preventDefault();
				event.stopPropagation();
				
				// 사용자가 입력한 이메일을 사용해서 아이디 조회
				var email = $('#email').val();
				if (email == "") {
					alert('이메일을 입력하세요.');
					return;
				}
				
				$.ajax({
					"url": "findId",
					"data": {"email": email},
					"success": function(id, status, xhr){
						if (id == null || id.length == 0) {
							alert('존재하지 않는 이메일입니다.');
						} else {
							alert("회원님의 아이디는 " + id +"입니다.");
							if(confirm("비밀번호 찾기 페이지로 이동하시겠습니까?") == true) {
								location.href = "searchPasswd";
							} else{
								location.href = "login";
							}
						}
					},
					"error": function(xhr, status, err){
						alert('아이디 검색 실패.');
					}
					
				});
			});
			
		});
	</script>

	<script src="plugins/common/common.min.js"></script>
	<script src="js/custom.min.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/gleek.js"></script>
	<script src="js/styleSwitcher.js"></script>
</body>
</html>





