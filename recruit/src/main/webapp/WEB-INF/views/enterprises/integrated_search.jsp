<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 취업공고</title>
 <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
</head>

<body>
<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
  <div class="content-body">
	<!-- row -->
		<div class="container-fluid">
			<div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">통합 취업공고</h4>
                                <div id="integrated-job-board" class="button-dropdown">
                                	
                                    <div id='duty-select-area' class="btn-group mb-1">
                                        <button id="duty_btn" type="button" class="btn btn-primary">직무</button>
                                        <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false"></button>
                                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(85px, 36px, 0px);">
                                            
                                            
                                            <!--  직무 옵션   -->
											
											<div class="dropdown-divider"></div>
                                         </div>
                                    </div>
                                    <div id='career-select-area' class="btn-group mb-1">
                                        <button id="career_btn" type="button" class="btn btn-secondary">신입/경력</button>
                                        <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false"></button>
                                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(102px, 36px, 0px);">
                                           
                                             <c:forEach var="career" items="${ careerOption }">
                                            	<a class="dropdown-item career_a" href="#" >${ career }</a>
												<div class="dropdown-divider"></div>
											 </c:forEach>
											
											 
                                        </div>
                                    </div>
                                    <div id='degree-select-area' class="btn-group mb-1">
                                        <button id="degree_btn" type="button" class="btn btn-success">학력</button>
                                        <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false"></button>
                                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(89px, 36px, 0px);">
                                        	
                                        	 <c:forEach var="degree" items="${ degreeOption }">
                                            	<a class="dropdown-item degree_a" href="#">${ degree }</a>
												<div class="dropdown-divider"></div>
											 </c:forEach>
                                        	
                                        	
                                            
                                        </div>
                                    </div>
                                    <div id='work-place-select-area' class="btn-group mb-1">
                                        <button id="work_place_btn" type="button" class="btn btn-info">지역</button>
                                        <button type="button" class="btn btn-info dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false"></button>
                                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(61px, 36px, 0px);">
                                            
                                             <c:forEach var="work_place" items="${ work_placeOption }">
                                            	<a class="dropdown-item work_place_a" href="#">${ work_place }</a>
												<div class="dropdown-divider"></div>
											 </c:forEach>
                                            
                                            
                                        </div>
                                    </div>
                                    
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button id="search-button" type="button" class="btn mb-1 btn-secondary" >조회 <span class="btn-icon-right"><i class="fa fa-check"></i></span></button>
                                    <button id="initialize-button" type="button" class="btn mb-1 btn-secondary" >초기화 <span class="btn-icon-right"><i class="fa fa-close"></i></span></button>
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                
				
				
				<!--     information            -->
				
				<div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>통합 채용공고</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>기업명</th>
                                                <th>제목</th>
                                                <th>관련 분류</th>
                                                <th>신입/경력</th>
                                                <th>근무형태</th>
                                                <th>학력</th>
                                                <th>지역</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="enterprisesList" items="${ enterprisesList }">
                                        <tbody>
                                        	<c:set var="i" value="${ i+1 }"/>
                                            <tr id="info-${enterprisesList.recruit_num }" data-company-name="${ enterprisesList.company_name }" data-category="${ enterprisesList.category }">
                                            	<th>${ i }</th>
                                                <td class="info_tr" data-recruit_num="${enterprisesList.recruit_num }"  style="cursor:pointer">${ enterprisesList.company_name }</td>
                                                <td class="info_tr" data-recruit_num="${enterprisesList.recruit_num }"  style="cursor:pointer">${ enterprisesList.duty }</td>
                                                <td>
                                                <div class="bootstrap-modal">
				                                    <!-- Button trigger modal -->
				                                    <button data-recruit-num="${enterprisesList.recruit_num }" type="button" class="btn btn-primary category-modal-button">상세보기</button>
				                                    <!-- Modal -->
				                                  
				                                </div>
				                                </td>
                                                <td>${ enterprisesList.career }</td>
                                                <td>${ enterprisesList.work_type }</td>
                                                <td class="color-primary">${ enterprisesList.degree }</td>
                                                <td>${ enterprisesList.work_place }</td>
                                            </tr>
                                            
                                            
                                        </tbody>
                                        </c:forEach> 
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!--  pagination -->
                    <%-- <c:forEach var ="enterprisesPager" items="${enterprisesPager }">
                       <div class="bootstrap-pagination">
                           <nav>
                               <ul class="pagination justify-content-center">
                               	   <li class="page-item"><a class="page-link" href="#">처음</a>
                                   </li>
                                   <li class="page-item"><a class="page-link" href="#">이전</a>
                                   </li>
                                   <li class="page-item"><a class="page-link" href="#">1</a>
                                   </li>
                                   <li class="page-item"><a class="page-link" href="#">2</a>
                                   </li>
                                   <li class="page-item"><a class="page-link" href="#">3</a>
                                   </li>
                                   <li class="page-item"><a class="page-link" href="#">다음</a>
                                   </li>
                                   <li class="page-item"><a class="page-link" href="#">마지막</a>
                                   </li>
                               </ul>
                           </nav>
                       </div>
                       </c:forEach> --%>
                       
                       ${ enterprisesPager }
					
							
                        <!-- /# card -->
                    </div>
                    
                 </div> <!-- /# row -->
			</div><!-- #/ container -->
		
           
           
            
       </div>
   
 
<!-- Modal -->
<div class="modal fade" id="recruit-info-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="company-name-in-modal"></h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                </button>
            </div>
            <div class="modal-body" id="category-in-modal"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                
            </div>
        </div>
    </div>
</div>
 
<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<script type="text/javascript">


	$(function(){
		
		$('.category-modal-button').on('click', function(event) {
			var recruit_num = $(this).attr('data-recruit-num');
			var company_name = $('#info-'+recruit_num).attr('data-company-name');
			var category = $('#info-'+recruit_num).attr('data-category');
			$('#company-name-in-modal').text(company_name)
			$('#category-in-modal').text(category);
			
			$('#recruit-info-modal').modal("show");
		});
		
		
	//이전 버튼 이벤트
/* 	
	$('.category-modal-button').on('click', function(event) {
	function fn_prev(page, range, rangeSize) {

			var page = ((range - 2) * rangeSize) + 1;

			var range = range - 1;

			

			var url = "${pageContext.request.contextPath}/board/getBoardList";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			

			location.href = url;

		}



	  //페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, searchType, keyword) {

			var url = "${pageContext.request.contextPath}/board/getBoardList";

			url = url + "?page=" + page;

			url = url + "&range=" + range;



			location.href = url;	

		}



		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize) {

			var page = parseInt((range * rangeSize)) + 1;

			var range = parseInt(range) + 1;

			

			var url = "${pageContext.request.contextPath}/board/getBoardList";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			

			location.href = url;

		} */

		// degree_a, work_place_a 에 대해서도 같은 구현 필요
		$('.career_a').on('click', function(event) {
			var carrer = $(this).text();
			//alert(carrer);
			$('#career_btn').text(carrer);
		});
		$('.degree_a').on('click', function(event) {
			var degree = $(this).text();
			//alert(carrer);
			$('#degree_btn').text(degree);
		});
		$('.work_place_a').on('click', function(event) {
			var work_place = $(this).text();
			//alert(carrer);
			$('#work_place_btn').text(work_place);
		});
		
		
		
		//검색버튼 
		$('#search-button').on('click', function(event) {
			var career = $('#career_btn').text();
			if (career == "신입/경력") {
				career = "";
			}
			var degree = $('#degree_btn').text();
			if (degree == "학력") {
				degree = "";
			}
			var work_place = $('#work_place_btn').text();
			if (work_place == "지역") {
				work_place = "";
			}
			location.href = "searchEnterprisesList?"+  "career="  + career + "&degree="+ degree + "&work_place="+ work_place;
		});
		

		// 초기화 버튼
		$('#initialize-button').on('click', function(event){
			location.href = "integrated_search?"+ $(this).val();
		});
		
		$('.info_tr').on('click', function(event) {
			var recruit_num = $(this).attr('data-recruit_num')
			location.href = '/recruit/enterprises/enterprisesInformation?recruit_num=' + recruit_num;
		});
		
		//////////////////////
		
		var parent = $('#integrated-job-board')
		
		// duty, career, degree, workplace,
		
		switch (${ search_category }) {
		case 1: $('#duty-select-area').prependTo(parent); break;
		case 2: $('#career-select-area').prependTo(parent); break;
		case 3: $('#degree-select-area').prependTo(parent); break;
		case 4: $('#work-place-select-area').prependTo(parent); break;
		}
		
		
		
	})

</script>

</body>
</html>