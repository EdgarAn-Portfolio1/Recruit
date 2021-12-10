<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>스마트 매치</title>
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
						href="javascript:void(0)">즐겨찾기</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">

			<!-- End Row -->
			<div class="row">
				<div class="col-12">
					<h4 class="d-inline">즐겨찾기 목록</h4>
					<p></p>
					<div class="row">

						<div class="col-md-6 col-lg-3">
							<div class="card">
								<div class="card-header">기업이름</div>
								<div class="card-body">
									<h5 class="card-title">공고제목</h5>
									<p class="card-text">공고내용</p>
									<a href="#" class="btn btn-primary">링크</a>
								</div>
							</div>
						</div>
						<!-- End Col -->
					</div>
					<!-- End Col -->
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>
<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
</body>
</html>