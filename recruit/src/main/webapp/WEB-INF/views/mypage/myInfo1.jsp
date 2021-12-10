<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
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
								<form id="editMyInfo-form class="form-valide" action="editMyInfo" method="post"
									novalidate="novalidate">
									<input type="hidden" name="memberId" value="${ myinfo.memberId }">
									
									<!-- 이름 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="name">이름
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="name"
												name="member_name" value="${ myInfo.name }" placeholder="이름을 입력하세요...">
										</div>
									</div>
									
									<!-- 나이 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="age">나이
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="age"
												name="age" value="${ myInfo.age }" placeholder="나이을 입력하세요...">
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
												<option value="Male">남성</option>
												<option value="Female">여성</option>
											</select>
										</div>
									</div>
									
									<!-- 이메일 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="email">이메일
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="email"
												name="email" value="${ myInfo.email }" placeholder="이메일을 입력하세요...">
										</div>
									</div>
									
									 <!-- 학력 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="career">학력
											 <span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" id="degree" name="degree" value="${ myInfo.degree }">
												<option value="">선택해 주세요.</option>
												<option value="Highschool">고등학교 졸업</option>
												<option value="College">대학졸업(2,3년)</option>
												<option value="University">대학교졸업(4년)</option>
												<option value="Master">대학원 석사졸업</option>
												<option value="Doctor">대학원 박사졸업</option>
												<option value="etc">그 외</option>
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
												<option value="New">신입</option>
												<option value="Career">경력</option>
												<option value="NoMatter">무관</option>
											</select>
										</div>
									</div>
									
									<!-- 희망근무 지역 -->
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="wish_site">희망 근무지역
											 <span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" id="wish_site" name="wish-site" value="${ myInfo.wish_site }">
												<option value="">선택해 주세요.</option>
												<option value="Seoul">서울</option>
												<option value="Incheon">인천</option>
												<option value="Sejong">세종</option>
												<option value="CB">충북</option>
												<option value="JN">전남</option>
												<option value="Daegu">대구</option>
												<option value="Busan">부산</option>
												<option value="Jeju">제주</option>
												<option value="KK">경기</option>
												<option value="CN">충남</option>
												<option value="Gwangju">광주</option>
												<option value="JB">전북</option>
												<option value="KB">경북</option>
												<option value="Ulsan">울산</option>
												<option value="KW">강원</option>
												<option value="JK">전국</option>
											</select>
										</div>
									</div>
									
									<br>
									<div class="form-group row">
										<div class="col-lg-8 ml-auto">
											<button id="edit-button" type="button" class="btn btn-primary" >수정하기</button>
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
		/* 내정보 읽기만 가능하도록 구현 */
		$(".form-control").attr("readonly", true);
		
		$("#edit-button").on("click", function(event){
			var yes = confirm("내 정보를 수정하시겠습니까?");
			if (yes) {
				location.href = "myInfo_edit";
			}
		})
	});
</script>
</body>
</html>