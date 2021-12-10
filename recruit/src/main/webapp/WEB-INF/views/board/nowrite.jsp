<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">글쓰기</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">공지사항 글쓰기</h4>
                                <div class="basic-form">
                                    <form id="noboard-write-form" action="nowrite" method="post" enctype="multipart/form-data">
                                    	<br>
                                        <div class="form-group">
                                        	<label>제목</label>
                                            <input type="text" class="form-control input-default" placeholder="제목을 입력하세요." name="notice_title">
                                        </div>
                                        <div class="form-group">
                                        	<label>작성자</label>
                                            <input type="text" class="form-control input-default" name="notice_writer" value="${ loginuser.memberId }">
                                        </div>
                                        <div class="form-group">
                             				<label>첨부파일</label>
                             				<input type="file" class="form-control input-default" name="attachment" multiple>
                             			</div>
                                        <div class="form-group">
                                        	<label>내용</label>
                                            <input type="text" class="form-control input-default" placeholder="내용을 입력하세요." name="notice_content" style="height:200px;">
                                        </div>
                                    	<button id="write-button" class="btn btn-primary btn-sm" >쓰기</button>
                                    	<button id="tolist-button" class="btn btn-primary btn-sm" >목록</button>
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

$(function() { // jQuery의 main 함수 역할 ( 시작점 )
		$('#write-button').on('click', function(event) {
			event.preventDefault();	 // 이벤트를 발생시킨 객체의 기본 동장 ( 다른페이지로 이동 등 )
			event.stopPropagation(); // 상위 객체로 이벤트 전달 차단
			
			// 입력 데이터의 유효성 검사 등 처리
			
			$('#noboard-wirte-form').submit(); // form을 서버로 전송
			
		});
}

$(function() {
		
	  	$('#tolist-button').on('click', function(event) {
	  		event.preventDefault();
	  		event.stopPropagation();
	  			
	  		location.href = "nolist";
	  			
	  	});
	  	
	});

	
</script>
</body>
</html>