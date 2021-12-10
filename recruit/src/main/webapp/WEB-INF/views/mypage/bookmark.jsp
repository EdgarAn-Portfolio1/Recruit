<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>즐겨찾기</title>
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
			<div>
				<div class="col-12">
					<h4 class="d-inline">즐겨찾기 목록</h4>
					<p></p>
					<div class="row" >
						<c:forEach var="bookmark" items = "${ bookmarks }">
						<div class="col-sm-6 col-lg-3">
	                                <div class="card text-center">
	                                	<h5 class="card-header" style="text:border;">${ bookmark.enterprises.company_name }</h5>
	                                    <div class="card-body">
											<p class="card-title">${ bookmark.enterprises.duty }</p>
											<p class="card-text">${ bookmark.enterprises.career }</p>
											<p class="card-text">${ bookmark.enterprises.work_type }</p>
											<p class="card-text">${ bookmark.enterprises.degree }</p>
											<p class="card-text">${ bookmark.enterprises.work_place }</p>
											<button class="btn btn-primary todetail-button" data-recruit-num="${ bookmark.recruit_num }">상세보기</button>
										</div>
	                                </div>
	                    </div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<script type="text/javascript">
$(function() {
	$('.todetail-button').on('click', function(event) {
		event.preventDefault();
		event.stopPropagation();
		var recruit_num = $(this).attr('data-recruit-num');
		location.href = "/recruit/enterprises/enterprisesInformation?recruit_num=" + recruit_num;
	});
});
</script>
</body>
</html>