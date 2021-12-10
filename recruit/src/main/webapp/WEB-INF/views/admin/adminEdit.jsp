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
												<br> <label>&nbsp;&nbsp;&nbsp;아이디</label> &nbsp;&nbsp;<input
													class="form-control" id='memberId' name='memberId'
													value='${ member.memberId }' readonly="readonly">
											</div>

											<div class="form-group">
												<label>&nbsp;&nbsp;&nbsp;비밀번호</label> &nbsp;&nbsp;<input
													class="form-control" id='passwd' name='passwd'
													type="password" value='${ member.passwd }'
													readonly="readonly">
											</div>

											<div class="form-group">
												<label>&nbsp;&nbsp;&nbsp;이메일</label> &nbsp;&nbsp;<input
													class="form-control" id='email' name='email'
													value='${ member.email }'>
											</div>

											<div class="form-group">
												<label>&nbsp;&nbsp;&nbsp;사용자 구분</label> &nbsp;&nbsp;<input
													class="form-control" id='userType' name='userType'
													value='${ member.userType }'>
											</div>

											<div class="form-group">
												<label>&nbsp;&nbsp;&nbsp;등록 일자</label> &nbsp;&nbsp;<input
													class="form-control" id='regDate' name='regDate'
													value='${ member.regDate }' readonly="readonly">
											</div>

											<div class="form-group">
												<label>&nbsp;&nbsp;&nbsp;구직중</label> &nbsp;&nbsp;<input
													class="form-control" id='active' name='active'
													value='${ member.active }'>
											</div>

											<div class="form-group">
												
												&nbsp;&nbsp;<input type="checkbox" id='active' name='active'
													${ member.active ? "checked" : "" }>활성 사용자 여부
											</div>

											&nbsp;&nbsp;&nbsp;
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
	</div>
	<!-- Begin Page Content -->

	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

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
				$('#update-form').submit();

			});
			$('#tolist-button').on('click', function(event) {
				location.href = "adminpage";
			});

			$('#delete-button').on('click', function(event) {
				var yes = confirm('${ member.memberId }번 회원을 삭제하겠습니까?');
				if (yes) {
					location.href = "delete?memberId=${ member.memberId }";
				}
			});
		});
	</script>

</body>

</html>