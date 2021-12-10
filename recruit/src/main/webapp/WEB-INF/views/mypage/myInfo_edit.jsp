<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>내 정보 관리</title>
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
<style>
.ul {
	list-style:none;
}
.li {
	float: left;
}
</style>
</head>
<body>
<!-- start of topbar -->
<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
<!-- end of topbar -->

<!-- start of sidebar -->
<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
<!-- end of topbar -->


<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->
<!-- 내 정보 수정 페이지 시작 -->
	<div class="content-body" style="min-height: 1100px;">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">내 정보 관리</a></li>
					<li class="breadcrumb-item"><a href="javascript:void(0)">수정</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">
		
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="form-validation">
								<form id="myInfo-update-form" action="updateMyInfo" method="post" >
									<input type="hidden" name="memberId" value="${ myInfo.memberId }">
									
									<!-- 이름 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="name">이름
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input class="form-control" id="name" name="name" value="${ myInfo.name }">
										</div>
									</div>
									
									<!-- 나이 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="year">나이
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="year" name="year" value="${ myInfo.year }">
										</div>
									</div>
									
									<!-- 성별 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="gender">성별
											 <span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" id="gender" name="gender" value="${ myInfo.gender }">
												<option value="">선택해 주세요.</option>
												<option value="Male" ${ myInfo.gender == 'Male' ? "selected" : "" }>남성</option>
												<option value="Female" ${ myInfo.gender == 'Female' ? "selected" : ""  }>여성</option>
											</select>
										</div>
									</div>
									
									 <!-- 학력 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="career">학력
											 <span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" id="degree" name="degree" value="${ myInfo.gender }">
												<option value="">선택해 주세요.</option>
												<option value="Highschool" ${ myInfo.degree == 'Highschool' ? "selected" : ""}>고등학교 졸업</option>
												<option value="College" ${ myInfo.degree == 'College' ? "selected" : ""}>대학졸업(2,3년)</option>
												<option value="University" ${ myInfo.degree == 'University' ? "selected" : ""}>대학교졸업(4년)</option>
												<option value="Master" ${ myInfo.degree == 'Master' ? "selected" : ""}>대학원 석사졸업</option>
												<option value="Doctor" ${ myInfo.degree == 'Doctor' ? "selected" : ""}>대학원 박사졸업</option>
												<option value="etc" ${ myInfo.degree == 'etc' ? "selected" : ""}>그 외</option>
											</select>
										</div>
									</div>
									
									<!-- 경력/신입 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="career">경력
											 <span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" id="career" name="career" value="${ myInfo.career }">
												<option value="">선택해 주세요.</option>
												<option value="New" ${ myInfo.career == 'New' ? "selected" : "" }>신입</option>
												<option value="Career" ${ myInfo.career == 'Career' ? "selected" : "" }>경력</option>
												<option value="NoMatter" ${ myInfo.career == 'NoMatter' ? "selected" : "" }>무관</option>
											</select>
										</div>
									</div>
									
									<!-- 희망근무 지역 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="wish_site">희망 근무지역
											 <span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" id="wish_site" name="wish_site" value="${ myInfo.wish_site }">
												<option value="">선택해 주세요.</option>
												<option value="Seoul" ${ myInfo.wish_site == 'Seoul' ? "selected" : "" }>서울</option>
												<option value="Incheon" ${ myInfo.wish_site == 'Incheon' ? "selected" : "" }>인천</option>
												<option value="Sejong" ${ myInfo.wish_site == 'Sejong' ? "selected" : "" }>세종</option>
												<option value="CB" ${ myInfo.wish_site == 'CB' ? "selected" : "" }>충북</option>
												<option value="JN" ${ myInfo.wish_site == 'JN' ? "selected" : "" }>전남</option>
												<option value="Daegu" ${ myInfo.wish_site == 'Daegu' ? "selected" : "" }>대구</option>
												<option value="Busan" ${ myInfo.wish_site == 'Busan' ? "selected" : "" }>부산</option>
												<option value="Jeju" ${ myInfo.wish_site == 'Jeju' ? "selected" : "" }>제주</option>
												<option value="KK" ${ myInfo.wish_site == 'KK' ? "selected" : "" }>경기</option>
												<option value="CN" ${ myInfo.wish_site == 'CN' ? "selected" : "" }>충남</option>
												<option value="Gwangju" ${ myInfo.wish_site == 'Gwangju' ? "selected" : "" }>광주</option>
												<option value="JB" ${ myInfo.wish_site == 'JB' ? "selected" : "" }>전북</option>
												<option value="KB" ${ myInfo.wish_site == 'KB' ? "selected" : "" }>경북</option>
												<option value="Ulsan" ${ myInfo.wish_site == 'Ulsan' ? "selected" : "" }>울산</option>
												<option value="KW" ${ myInfo.wish_site == 'KW' ? "selected" : "" }>강원</option>
												<option value="JK" ${ myInfo.wish_site == 'JK' ? "selected" : "" }>전국</option>
											</select>
										</div>
									</div>
									
									<br>
									
									<div class="form-group row">
										<
										<div class="col-lg-8 ml-auto">
											<button id="edit-button" type="button" class="btn btn-primary">수정</button>
										</div>
										
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>
	<!-- 내 정보 수정 페이지 끝 -->
	<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->
	
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	
<script type="text/javascript">

$(function() {
	$("#edit-button").on("click", function(event) {
		var yes = confirm("수정하시겠습니까?");
		if (yes) {
			$("#myInfo-update-form").submit();
		}
	});
});
</script>
	
</body>
</html>