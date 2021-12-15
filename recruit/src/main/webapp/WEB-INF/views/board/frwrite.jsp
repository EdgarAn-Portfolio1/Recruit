<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
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
                                <h4 class="card-title">자유게시판 글쓰기</h4>
                                <div class="basic-form">
                                    <form id="frboard-write-form" action="frwrite" method="post" enctype="multipart/form-data">
                                    	<br>
                                        <div class="form-group">
                                        	<label>제목</label>
                                            <input type="text" class="form-control input-default" placeholder="제목을 입력하세요." name="free_title">
                                        </div>
                                        <div class="form-group">
                                        	<label>작성자</label>
                                            <input type="text" class="form-control input-default" id="free_writer" name="free_writer" value="${ loginuser.memberId }">
                                        </div>
                                        <div class="form-group">
                             				<label>첨부파일</label>
                             				<input type="file" class="form-control input-default" name="attachment" multiple>
                             			</div>
                                        <div class="form-group">
                                        	<label>내용</label>
                                            <textarea class="form-control input-default" placeholder="내용을 입력하세요." name="free_content" rows="5"></textarea>
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
		$("#free_writer").attr('readonly', true);

		$(document).on('keydown', function(event) {
			if (event.keyCode == 13) {
				event.preventDefault();
				
				return false;
			}
		});
		
		
		$('#write-button').on('click', function(event) {
			event.preventDefault();	 // 이벤트를 발생시킨 객체의 기본 동장 ( 다른페이지로 이동 등 )
			event.stopPropagation(); // 상위 객체로 이벤트 전달 차단
			
			// 입력 데이터의 유효성 검사 등 처리
			
			$('#frboard-write-form').submit(); // form을 서버로 전송
			
		});
});

$(function() {
		
	  	$('#tolist-button').on('click', function(event) {
	  		event.preventDefault();	 // 이벤트를 발생시킨 객체의 기본 동장 ( 다른페이지로 이동 등 )
	  		event.stopPropagation(); // 상위 객체로 이벤트 전달 차단
	  			
	  		location.href = "frlist";
	  			
	  	});
	  	
	});
	
</script>
</body>
</html>