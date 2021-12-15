<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 수정하기</title>
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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">자유게시판</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">글 상세</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">글 수정</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">자유게시판 글 수정하기</h4>
                                <div class="basic-form">
                                    <form id="frboard-update-form" role="form" action="frupdate" method="post">
                                    	<input type="hidden" name="board_free_no" value="${ frboard.board_free_no }">
                                    	<br>
                                        <div class="form-group">
                                        	<label>제목</label>
                                            <input class="form-control input-default" id="free_title" name="free_title" value="${ frboard.free_title }">
                                        </div>
                                        <div class="form-group">
                                        	<label>작성자</label>
                                            <input class="form-control input-default" id="free_writer" name="free_writer" value="${ frboard.free_writer }">
                                        </div>
                                        
                                         <div class="form-group">
                             				<label>첨부파일</label>
                             				<br >
                             				<c:forEach var="attachment" items="${ frboard.attachments }"> 
											
											<a id='attachment' href="download?attach_free_no=${ attachment.attach_free_no }">${ attachment.userFileName }</a>
											&nbsp;&nbsp; <a href="delete-attach?attach_free_no=${ attachment.attach_free_no }">삭제</a>
											<br>
											</c:forEach>
                             				<input type="file" class="form-control input-default" name="attachment" multiple>
                             			</div>
                                        
                                        <%-- <div class="form-group">
											<label>첨부파일</label>
											<c:forEach var="attachment" items="${ frboard.attachments }"> 
											<br>
											<a id='attachment' href="download?attach_free_no=${ attachment.attach_free_no }">${ attachment.userFileName }</a>
											</c:forEach>
										</div> --%>
                                        
                                        <div class="form-group">
                                        	<label>내용</label>
                                            <input class="form-control input-default" id="free_content" name="free_content" style="height:180px;" value="${ frboard.free_content }">
                                        </div>
                                    	<button id="update-button" type="button" class="btn btn-success">수정</button>
										<button id="reset-button" type="reset" class="btn btn-success">다시쓰기</button>
										<button id="cancel-button" type="button" class="btn btn-success">취소</button>
										<button id="tolist-button" type="button" class="btn btn-success">목록</button>
                                    </form>
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
	
	$("#free_writer").attr("readonly", true);
	
	$('#update-button').on('click', function(event) {
		var yes = confirm('수정하시겠습니까?');
		if (yes) {
		// <form id="update-form" ...> ... </form> 요소를 서버로 전송
		$('#frboard-update-form').submit();
		}
		
	});
	$("#reset-button").click(function (event) {
		/* event.preventDefault();
		event.stopPropagation();
		
		$("#title").val("");
		$("#content").val(""); */
		$('#update-formvent').reset();
	});
	
	$('#cancel-button').on('click', function(event) {
	    location.href = "frdetail?board_free_no=${ frboard.board_free_no }";
	});
	$('#tolist-button').on('click', function(event) {
		location.href = "frlist?pageNo=${pageNo}";
	});
});
</script>
</body>
</html>