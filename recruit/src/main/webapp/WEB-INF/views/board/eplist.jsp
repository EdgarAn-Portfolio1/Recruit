<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>취업자 후기</title>
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
						href="javascript:void(0)">취업자 후기</a></li>
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
								<h4>취업자후기</h4>
								<a href="epwrite" class="btn btn-primary btn-sm" style="float:right">글 쓰기</a>
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
										<c:forEach var="board_epilogue" items="${ boards }">
										<tr>
											<th>${ board_epilogue.board_epilogue_no }</th>
											<td>
													<c:choose>
		                                            	<c:when test="${ not board_epilogue.epilogue_deleted }" >
		                                            	<a href="detail?board_review_No=${ board_epilogue.board_review_no }">${ board_epilogue.review_title }</a>
		                                            	</c:when>
		                                            	<c:otherwise>
		                                            	<span style="color:lightgray">${ board_epilogue.review_title } [삭제된 글]</span>
		                                            	</c:otherwise>
		                                            </c:choose>
		                                            
											</td>
											<td><span class="badge badge-primary px-2">${ board_epilogue.review_writer }</span></td>
											<td>${ board_epilogue.review_date }</td>
											<td class="color-primary">${ board_epilogue.review_readcount }</td>
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
		<!-- #/ container -->
	</div>

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
</body>
</html>