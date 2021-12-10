<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
	<div class="content-body" style="min-height: 1100px;">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">게시판</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">공지사항</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="card-title">
								<h4>공지사항</h4>
								<a href="nowrite" class="btn btn-primary btn-sm" style="float:right">글 쓰기</a>
							</div>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="board_notice" items="${ noboards }">
										<tr>
											<th>${ board_notice.board_notice_no }</th>
											<td>
													<c:choose>
		                                            	<c:when test="${ not board_notice.notice_deleted }" >
		                                            	<a href="nodetail?board_notice_no=${ board_notice.board_notice_no }">${ board_notice.notice_title }</a>
		                                            	</c:when>
		                                            	<c:otherwise>
		                                            	<span style="color:lightgray">${ board_notice.notice_title } [삭제된 글]</span>
		                                            	</c:otherwise>
		                                            </c:choose>
		                                            
											</td>
											<td><span class="badge badge-primary px-2">${ board_notice.notice_writer }</span></td>
											<td>${ board_notice.notice_Date }</td>
											<td class="color-primary">${ board_notice.notice_readCount }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<br>
							<div style="text-align:center">
							${ pager }
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
</body>
</html>