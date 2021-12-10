<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판 글 상세보기</title>
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
                                            <input class="form-control input-default" id="board_qa_no" name="board_qa_no" value="${ qaboard.board_qa_no }">
                                        </div>
                                        <div class="form-group">
                                        	<label>제목</label>
                                            <input class="form-control input-default" id="qa_title" name="qa_title" value="${ qaboard.qa_title }">
                                        </div>
                                        <div class="form-group">
                                        	<label>내용</label>
                                            <input class="form-control input-default" id="qa_content" name="qa_content" style="height:180px;" value="${ qaboard.qa_content }">
                                        </div>
                                        <div class="form-group">
                                        	<label>작성자</label>
                                            <input class="form-control input-default" id="qa_writer" name="qa_writer" value="${ qaboard.qa_writer }">
                                        </div>
                                        <div class="form-group">
											<label>작성일자</label> 
											<fmt:formatDate var="formattedqa_Date" value="${ qaboard.qa_Date }" pattern="yyyy-MM-dd HH:mm:ss" />
											<input class="form-control" id='qa_Date' value="${ formattedqa_Date }">
										</div>
                                        <div class="form-group">
                                        	<label>조회수</label>
                                            <input class="form-control input-default" id="qa_readsCount" name="qa_readCount" value="${ qaboard.qa_readCount }">
                                        </div>
                                        
                                        <c:choose>
											<c:when test="${ loginuser.memberId == qaboard.qa_writer }">
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
			location.href = "qaedit?board_qa_no=${ qaboard.board_qa_no }";
		});
		
		$('#delete-button').on('click', function(event){
			var yes = confirm('${ qaboard.board_qa_no }번 게시글을 삭제하겠습니까?');
			if (yes) {
			location.href = "qadelete?board_qa_no=${ qaboard.board_qa_no }";
			}
		});
		
		$('#tolist-button').on('click', function(event){
			location.href = "qalist";
		});
		
		
	});
</script>
</body>
</html>