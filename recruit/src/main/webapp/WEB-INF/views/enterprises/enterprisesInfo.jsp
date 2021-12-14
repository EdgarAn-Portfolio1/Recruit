<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>취업상세공고</title>
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />

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
			<!-- row -->
			<div class="container-fluid">
				<div class="row">



					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">${ enterprisesLink.company_name } &nbsp; 기업정보</h4>
								
								<!-- <button id="scrap-button" type="button" class="btn btn-primary fa fa-star gradient-1-text" style="float: right;"></button> -->
								<div class="media-reply__link" style="float:right;">
								<input type="hidden" id='already-like-vote-count' value="${ voteLikeCount > 0 ? 'voted' : '' }">
								<button id="like-button"  class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-up">&nbsp;&nbsp;<span class="like_rec_count">${ LikeAllCount }</span></i></button>
								<input type="hidden" id='already-bookmark-vote-count' value="${ voteBookmarkCount > 0 ? 'voted' : '' }">
								<button id="bookmark-button" class="btn btn-transparent p-0 mr-3"><i class="fa fa-star">&nbsp;&nbsp;<span class="bookmark_rec_count">${ BookmarkAllCount }</span></i></button>
								<button id="go-to-mypage" class="btn btn-transparent p-0 ml-3 font-weight-bold"  onclick="location.href ='/recruit/mypage/bookmark';">MyPage</button>
								</div>
								
								<div class="table-responsive">
									<table class="table header-border">

										<tbody>
											<tr>
												<th>산업</th>
												<td></td>
												<th>사원수</th>
												<td></td>
											</tr>

											<tr>
												<th>기업구분</th>
												<td></td>
												<th>설립일</th>
												<td></td>
											</tr>
											<tr>
												<th>자본금</th>
												<td></td>
												<th>매출액</th>
												<td></td>
											</tr>
											<tr>
												<th>대표자</th>
												<td></td>
												<th>주요사업</th>
												<td></td>
											</tr>
											<tr>
												<th>4대보험</th>
												<td></td>
												<th>주소</th>
												<td></td>
											</tr>

										</tbody>

									</table>
									<div style="text-align: center">

										<a href="${ enterprisesLink.recruit_link }"class="btn btn-primary recruit_link_a">채용정보</a>
										<a href="${ enterprisesLink.enterprises_link }"class="btn btn-primary enterprises_link_a">기업정보</a>
									</div>
								</div>

							</div><!-- card body -->
						</div>
					</div>





					<c:forEach var="news" items="${ news }">
	                   <div class="col-lg-3">
	                                <div class="card text-center">
	                                    <div class="card-body">
	                                        <h5 class="card-title">${ enterprisesLink.company_name } 관련 소식</h5>
	                                        
	                                        <p class="card-text">${ news.title }</p>
	                                        
	                                        
	                                        <div class="card-footer">
	                                        	<p class="card-text d-inline"><small class="text-muted">${ news.date }</small></p>
		                                        <a href="${ news.link }" class="card-link float-right"><small>바로가기</small></a>
		                                    </div>
	                                        
	                                    </div>
	                                </div>
	                   </div>
	                   </c:forEach>
	                   
	                  
	                   	
	              	
                         
                    
           
            
            	</div><!-- /# row -->
            </div><!-- #/ container -->
        </div>
        
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

   <jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
   <script type="text/javascript">

   // common-js.jsp에 jquery에 대한 include가 없어서 추가
   // ajax 요청 구문은 다시 검토해 보는 것이 좋겠습니다.
   
   // 좋아요버튼 클릭시(좋아요 추가 또는 좋아요 제거)
    $(function(){
	   
	 
	   
	   
   $("#like-button").click(function(event){
	   console.log("좋아요 클릭")
	   
	   var voted = $('#already-like-vote-count').val();
	   var memberId = '${ sessionScope.loginuser.memberId }';
	   if( memberId === "" ){
		   alert('로그인 후에 가능합니다.')
		   console.log("좋아요 추가 클릭")
		   var check = confirm('로그인하러 갈까요?')
		   if( check == true){
			   location.href="/recruit/account/login"
		   }
		   return;
	   }
	   
	   $.ajax({
		   url:"saveLike",
		   type:"POST",
		   data:{
			   "memberId" : memberId,
			   "recruit_num" : '${ enterprisesLink.recruit_num }'
		   },				   
		   success: function(data, status, xhr){
			   var result = data.split(";")
			    if ( result[0] === 'register') {
			       
				   $('#already-like-vote-count').val("voted");
				   alert("좋아요 등록 성공");
				   //$('.like_rec_count').text('${ likeCount }');
				   
			   } else {
				   
				   $('#already-like-vote-count').val("");
				   alert('좋아요 삭제 성공');
				   //$('.like_rec_count').text('${ likeCount }');
			   }
			   $('.like_rec_count').text(result[1]);
		   },
		   error: function(xhr, status, err) {
			   alert(err);
		   }
		   
	   });
  }); 
		   
  $("#bookmark-button").click(function(event){
   console.log("즐겨찾기 클릭")
   
   var voted = $('#already-bookmark-vote-count').val();
   var memberId = '${ sessionScope.loginuser.memberId }';
   if( memberId === "" ){
	   alert('로그인 후에 가능합니다.')
	   console.log("즐겨찾기 추가 클릭")
	   var check = confirm('로그인하러 갈까요?')
	   if( check == true){
		   location.href="/recruit/account/login"
	   }
	   return;
	   }
	   $.ajax({
		   url:"saveBookmark",
		   type:"POST",
		   data:{
			   "memberId" : memberId,
			   "recruit_num" : '${ enterprisesLink.recruit_num }'
		   },				   
		   success: function(data, status, xhr){
			   var result = data.split(";")
			    if ( result[0] === "register") {
			       
				   $('#already-bookmark-vote-count').val("voted");
				   alert("즐겨찾기 등록 성공");
				  				   
			   } else {
				   
				   $('#already-bookmark-vote-count').val("");
				   alert('즐겨찾기 삭제 성공');
				   
			   }
			   $('.bookmark_rec_count').text(result[1]);
		   },
		   error: function(xhr, status, err) {
			   alert(err);
		   }
		   
	   });
   });	 
	    
	

   	
    });
   </script>
</body>

</html>