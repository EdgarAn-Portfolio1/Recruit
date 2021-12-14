<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
				
				<div class="col-lg-6 col-xl-6">
				
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white">오늘의 업종 지수</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">${ empty score ? "0" : score }</h2>
                                    <p class="text-white mb-0"><fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" /></p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-cloud"></i></span>
                            </div>
                        </div>
                      
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
                    </div>
                    
                    <!--오른쪽 영역  -->
                    <div class="col-lg-6 col-xl-6">
						<div class="card">
							<div class="text-center">
           	         			<div class="card-title"><h5>내가 즐겨찾기 누른 채용공고</h5></div>
           	         		</div>
           	         	</div>
           	         	
           	       <!--즐겨찾기-->  		
       				<div class="row row-col-1 row-cols-md-2 g-8">
       	
           		        <div class="col">
           	         		<div class="card">
             	        	   <div class="card-body">
    	                    	   <h5 class="card-title">기업 이름</h5>
       		                    		<p class="card-text">기업 정보</p><a href="#" class="btn btn-primary">공고 보기</a>
        	                   </div>
           		          	</div>
           		        </div>
           		         
           		    </div>
           		    <!--즐겨찾기 끝-->
           		          
       	          </div>
       	          <!--오른쪽 영역 끝-->
       	          	     
 
                    </div>
                    <!--container-fluid end-->
                        
              </div>
              <!--content body end  -->			
                 
         </div>
         </div>
         <!--main wrapper end  -->
                    
       
               
    		
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