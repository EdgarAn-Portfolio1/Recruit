<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원정보편집</title>

<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />

				<div class="content-body">
					<div class="container-fluid">
						<!-- row -->
						<div class="row">
							<!--Tab start-->
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">

										<div class="card-title" style="text-align: left; padding-top: 10px">
											<h4 style="color: RoyalBlue">회원정보편집</h4>
										</div>

										<form id="update-form" action="update" method="post">

											<div class="form-group">
												<br> <label>아이디</label><input
													class="form-control" id='memberId' name='memberId'
													value='${ member.memberId }' readonly="readonly">
											</div>

																					
											<div class="form-group">
												<label>비밀번호</label><input
													class="form-control" id='passwd' name='passwd'
													type="password" value='${ member.passwd }'
													readonly="readonly">
											</div>

											<div class="form-group">
												<label>이메일</label><input
													class="form-control" id='email' name='email'
													value='${ member.email }'>
											</div>
											
											<div class="form-group">
												<label>사용자 구분</label>
												<ul class="nav nav-pills mb-3">
													<li class="nav-item">
														<a href="#navpills-1" id="btn-user" class="nav-link${ member.userType eq 'user' ? ' active' : ''  }" data-toggle="tab" aria-expanded="false">
														사용자</a></li>
														<li class="nav-item">
														<a href="#navpills-2" id="btn-admin" class="nav-link${ member.userType eq 'admin' ? ' active' : ''  }" data-toggle="tab" aria-expanded="false">
														관리자</a>
													</li>
												</ul>
												<input type="hidden" id="user-type" name="userType" value=${ member.userType }>
											</div>

											<div class="form-group">
												<label>등록 일자</label>
												<input class="form-control" id='regDate' value='${ member.regDate }' readonly="readonly">
											</div>

											<button id="update-button" type="button"
												class="btn mb-1 btn-primary">수정</button>
											&nbsp;
											<button id="tolist-button" type="button"
												class="btn mb-1 btn-primary">목록</button>
											&nbsp;
											<button id="delete-button" type="button"
												class="btn mb-1 btn-outline-primary">삭제</button>
										</form>
									</div>
								</div>
							</div>


						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

	<script type="text/javascript">
		$(function() {
			$('#update-button').on('click', function(event) {

				// 필요한 경우 입력 데이터 유효성 검사 수행
				// <form id="update-form" ...> ... </form> 요소를 서버로 전송
				
				alert('수정하시겠습니까?');
				$('#update-form').submit();

			});
			
			$('#tolist-button').on('click', function(event) {
				
				alert('목록으로 이동하시겠습니까?');
				location.href = "adminPage";
			});

			$('#delete-button').on('click', function(event) {
				var yes = confirm('${ member.memberId }번 회원을 삭제하겠습니까?');
				if (yes) {
					location.href = "delete?memberId=${ member.memberId }";
				}
			});
			
			// user OR admin
			$('#btn-user').on('click', function(event){
				
				alert("'사용자'로 변경하시겠습니까?");
				$("#user-type").val("user");
				
			});
			
			$('#btn-admin').on('click', function(event){
				
				alert("'관리자'로 변경하시겠습니까?");
				$("#user-type").val("admin");
				
			});
			
		});
	</script>

</body>

</html>