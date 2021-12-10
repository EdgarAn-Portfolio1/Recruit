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

<div class="card-body">
                                <h4 class="card-title">Textarea</h4>
                                <div class="basic-form">
                                    <form>
                                        <div class="form-group">
                                            <label>Comment:</label>
                                            <textarea class="form-control h-150px" rows="6" id="comment"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>


<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
</body>
</html>