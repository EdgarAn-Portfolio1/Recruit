<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질의응답 글 수정하기</title>
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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">질의응답</a></li>
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
                                <h4 class="card-title">질의응답 글 수정하기</h4>
                                <div class="basic-form">
                                    <form id="qaboard-update-form" role="form" action="qaupdate" method="post">
                                    	<input type="hidden" name="board_qa_no" value="${ qaboard.board_qa_no }">
                                    	<br>
                                        <div class="form-group">
                                        	<label>제목</label>
                                            <input class="form-control input-default" id="qa_title" name="qa_title" value="${ qaboard.qa_title }">
                                        </div>
                                        <div class="form-group">
                                        	<label>작성자</label>
                                            <input class="form-control input-default" id="qa_writer" name="qa_writer" value="${ qaboard.qa_writer }">
                                        </div>
                                        <div class="form-group">
                                        	<label>내용</label>
                                            <input class="form-control input-default" id="qa_content" name="qa_content" style="height:180px;" value="${ qaboard.qa_content }">
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
	$('#update-button').on('click', function(event) {
		var yes = confirm('수정하시겠습니까?');
		if (yes) {
		// <form id="update-form" ...> ... </form> 요소를 서버로 전송
		$('#qaboard-update-form').submit();
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
	    location.href = "qadetail?board_qa_no=${ qaboard.board_qa_no }";
	});
	$('#tolist-button').on('click', function(event) {
		location.href = "qalist";
	});
});
</script>
</body>
</html>