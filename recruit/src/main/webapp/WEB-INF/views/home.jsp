<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>SHAKE IT</title>
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

	<style type="text/css">
		.card{
			margin-bottom: 15px;
		}
	</style>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Header start
        ***********************************-->
        <jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->
<!--**********************************
            side-bar
        ***********************************-->
        <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
 
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>IT도서 베스트셀러</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>순위</th>
                                                <th>제목</th>
                                                <th>평점</th>
                                                <th>저자</th>
                                                <th>가격</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="bookslist" items="${ booksList }">
                                            <tr>
                                                <th>${ bookslist.book_no }</th>
                                                <td><a href="${ bookslist.link }" target="_blank"> ${ bookslist.book_name }</a></td>
                                                <td>
                                               <c:choose>
                                               <c:when test="${ bookslist.grade >= '8' && bookslist.grade < '9' }">
                                               <span class="badge badge-primary px-2">${ bookslist.grade }</span>
                                               </c:when>
                                               <c:when test="${ bookslist.grade >= '9' && bookslist.grade < '10' }">
                                               <span class="badge badge-success px-2">${ bookslist.grade }</span>
                                               </c:when>
                                               <c:when test="${ bookslist.grade == '10' }">
                                               <span class="badge badge-danger px-2">${ bookslist.grade }</span>
                                               </c:when>
                                               <c:otherwise>
                                               <span class="badge badge-light px-2">${ bookslist.grade }</span>
                                               </c:otherwise>
                                               </c:choose>
                                                </td>
                                                <td>${ bookslist.writer }</td>
                                                <td class="color-primary">${ bookslist.price }</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
					<div class="col-md-6 col-sm-3">
					<div class="card">
					<div class="text-center">
           	         		<div class="card-title"><h5>내가 즐겨찾기 누른 채용공고</h5></div>
           	         		</div>
           	         		</div>
					<div class="row">
					<div class="col-md-6 col-sm-3">
           	         		<div class="card">
             	        	   <div class="card-body">
    	                    	   <h5 class="card-title">안재완의 행복한 IT세상</h5>
       		                    		<p class="card-text">비전공자 전공자 상관없이 누구나 하고싶은 일을 하며 월급을 받아가실 수 있습니다.</p><a href="#" class="btn btn-primary">LINK</a>
        	                    </div>
           		          </div>
           		         </div>
           		         
           		      <div class="col-md-6 col-sm-3">
       	               <div class="card">
   	        	               <div class="card-body">
                	              <h5 class="card-title">윤경석의 data LAB</h5>
                    	             <p class="card-text">세상의 모든 데이터를 분석해드립니다.</p><a href="#" class="btn btn-primary">LINK</a>
                        	     </div>
       	          	       </div>
       	          	       </div>
       	          	       
       	          	       <div class="col-md-6 col-sm-3">
       	               <div class="card">
   	        	               <div class="card-body">
                	              <h5 class="card-title">김우석의 신나는 웹개발</h5>
                    	             <p class="card-text">웹개발은 신나게해도 어렵습니다.</p><a href="#" class="btn btn-primary">LINK</a>
                        	     </div>
       	          	       </div>
       	          	       </div>
       	          	       <div class="col-md-6 col-sm-3">
       	               <div class="card">
   	        	               <div class="card-body">
                	              <h5 class="card-title">김려원의 보안 전문가</h5>
                    	             <p class="card-text">세계 최고 레벨의 보안을 자랑</p><a href="#" class="btn btn-primary">LINK</a>
                        	     </div>
       	          	       </div>
       	          	       </div>
       	          	       <div class="col-md-6 col-sm-3">
       	               <div class="card">
   	        	               <div class="card-body">
                	              <h5 class="card-title">한병운의 프론트엔드 스쿨</h5>
                    	             <p class="card-text">너무 어려워요</p><a href="#" class="btn btn-primary">LINK</a>
                        	     </div>
       	          	       </div>
       	          	       </div>
       	          	       <div class="col-md-6 col-sm-3">
       	               <div class="card">
   	        	               <div class="card-body">
                	              <h5 class="card-title">안재완의 행복한 IT세상</h5>
                    	             <p class="card-text">비전공자 전공자 상관없이 누구나 하고싶은 일을 하며 월급을 받아가실 수 있습니다.</p><a href="#" class="btn btn-primary">LINK</a>
                        	     </div>
       	          	       </div>
       	          	       </div>
       	          	       </div>
                        </div>
                        
                        </div>
                    </div>
                    
                    <!--end of row  -->
                  </div>                  
                 </div> 
                <!--end of tab-->
    		
        <!-- #/ container -->
        
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Shake IT &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">TEAM 2</a> 2021</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

    <!--**********************************
        Main wrapper end
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

    
    <script src="./plugins/jqueryui/js/jquery-ui.min.js"></script>
    <script src="./plugins/moment/moment.min.js"></script>
    <script src="./plugins/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="./js/plugins-init/fullcalendar-init.js"></script>
   <jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
</body>

</html>