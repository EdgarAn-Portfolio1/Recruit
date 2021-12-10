<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>스펙공유</title>
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
						href="javascript:void(0)">스펙공유</a></li>
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
								<a href="spwrite" class="btn btn-primary btn-sm" style="float:right">글 쓰기</a>
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
										<c:forEach var="board_specshare" items="${ boards }">
										<tr>
											<th>${ board_specshare.board_specshare_no }</th>
											<td>
													<c:choose>
		                                            	<c:when test="${ not board_specshare.specshare_deleted }" >
		                                            	<a href="detail?board_specshare_No=${ board_specshare.board_specshare_no }">${ board_specshare.specshare_title }</a>
		                                            	</c:when>
		                                            	<c:otherwise>
		                                            	<span style="color:lightgray">${ board_specshare.specshare_title } [삭제된 글]</span>
		                                            	</c:otherwise>
		                                            </c:choose>
		                                            
											</td>
											<td><span class="badge badge-primary px-2">${ board_specshare.specshare_writer }</span></td>
											<td>${ board_specshare.specshare_date }</td>
											<td class="color-primary">${ board_specshare.specshare_readcount }</td>
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