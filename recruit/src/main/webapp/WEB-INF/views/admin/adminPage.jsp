<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

	<!-- 	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="adminEdit">회원편집</a></li>
			</ol>
		</div>
	</div> -->
	<div class="content-body">
		<div class="container-fluid">
			<!-- row -->
			<div class="row">
				<!--Tab start-->
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">

							<div class="card-title" style="text-align: left; padding-top: 10px">
								<h4 style="color: RoyalBlue">회원정보관리</h4>
								<br>
								<h6 style="color: LightGrey">아이디를 클릭 시, 편집이 가능합니다.</h6>
							</div>
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이메일</th>
											<th>사용자구분</th>
											<th>등록일자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${account}">
											<tr align="left">
												<td><a
													href="/recruit/admin/adminEdit?memberId=${member.memberId}">${member.memberId}</a>
												</td>
												<td>${ member.email }</td>
												<td>${ member.userType }</td>
												<td>${ member.regDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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