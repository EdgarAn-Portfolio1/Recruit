<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>자기소개서</title>
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

	<div class="content-body" style="min-height: 1100px;">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">자기소개서</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">
			<!-- End Row -->
			<div class="row">
				<div class="col-12 m-b-30">
					<h4 class="d-inline">자기소개서</h4>
                    <a href="writeCV" class="btn btn-primary btn-sm" style="float:right">자기소개서 작성</a>
					<hr>
					<div class="row">
						<div class="col-md-12 col-lg-10">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title"></h5>
									<p class="card-text">자기소개서의 제목, 작성일, 간략한 내용이 표시됩니다.</p>
									<p class="card-text">
										<small class="text-muted">마지막 수정으로부터 경과시간을 나타냅니다.</small>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
</body>
</html>