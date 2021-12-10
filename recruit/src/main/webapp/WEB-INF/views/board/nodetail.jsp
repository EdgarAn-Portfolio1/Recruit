<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 상세보기</title>
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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">공지사항</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">글 상세보기</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">공지사항/글 상세 보기</h4>
                                <div class="basic-form">
                                    	<br>
                                    	<div class="form-group">
                                        	<label>글번호</label>
                                            <input class="form-control input-default" id="board_notice_no" name="board_notice_no" value="${ noboard.board_notice_no }">
                                        </div>
                                        <div class="form-group">
                                        	<label>제목</label>
                                            <input class="form-control input-default" id="notice_title" name="notice_title" value="${ noboard.notice_title }">
                                        </div>
                                        <div class="form-group">
                                        	<label>내용</label>
                                            <input class="form-control input-default" id="notice_content" name="notice_content" style="height:180px;" value="${ noboard.notice_content }">
                                        </div>
                                        <div class="form-group">
                                        	<label>작성자</label>
                                            <input class="form-control input-default" id="notice_writer" name="notice_writer" value="${ noboard.notice_writer }">
                                        </div>
                                        <div class="form-group">
											<label>작성일자</label> 
											<fmt:formatDate var="formattednotice_Date" value="${ noboard.notice_Date }" pattern="yyyy-MM-dd HH:mm:ss" />
											<input class="form-control" id='notice_Date' value="${ formattednotice_Date }">
										</div>
                                        <div class="form-group">
                                        	<label>조회수</label>
                                            <input class="form-control input-default" id="notice_readsCount" name="notice_readCount" value="${ noboard.notice_readCount }">
                                        </div>
                                        
                                        <c:choose>
											<c:when test="${ loginuser.memberId == noboard.notice_writer }">
												<a id="edit-button" type="button" class="btn btn-success" style="color:white">수정</a>
												<a id="delete-button" type="button" class="btn btn-success" style="color:white">삭제</a>
												<button id="tolist-button" type="button" class="btn btn-success">목록</button>
											</c:when>
											<c:otherwise>
                         						<button id="tolist-button" type="button" class="btn btn-success">목록</button>
											</c:otherwise>
										</c:choose>	
                                        
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- #/ container -->
        </div>


<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

<script type="text/javascript">
	$(function() {
		$(".form-group input").attr('readonly', true);
		
		$('#edit-button').on('click', function(event){
			location.href = "noedit?board_notice_no=${ noboard.board_notice_no }";
		});
		
		$('#delete-button').on('click', function(event){
			var yes = confirm('${ noboard.board_notice_no }번 게시글을 삭제하겠습니까?');
			if (yes) {
			location.href = "nodelete?board_notice_no=${ noboard.board_notice_no }";
			}
		});
		
		$('#tolist-button').on('click', function(event){
			location.href = "nolist";
		});
		
		
	});
</script>
</body>
</html>