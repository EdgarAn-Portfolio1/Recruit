<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>회원가입</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    
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

    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                
                                <a class="text-center" href="/recruit/"> <h4>SHAKE IT</h4></a>
        
                                <form id="registerform" class="mt-5 mb-5 login-input" method="POST" action="register">
									<div class="form-group">
										<input type="text" id="memberId" name="memberId" class="form-control" style="float:left; width:80%" placeholder="아이디" required>
										<input type="hidden" id="checkedId" value="">
										<button type="button" class="btn mb-1 btn-outline-primary" id="btn-dup-check" style="width:20%">중복검사</button>
									</div>
									<div class="alert alert-danger" id="id-valid-message">중복 검사를 수행해주세요 : (</div>

									<div class="form-group">
                                        <input type="password" name="passwd" class="form-control" id="pwd1" placeholder="비밀번호" required>
                                    </div>
                                    <div class="alert alert-danger" id="pwd-alert-danger">비밀번호 형식 오류(6~12개의 영문자 또는 숫자)</div>
                                    <div class="form-group">
                                        <input type="password" name="passwdConfirm" class="form-control" id="pwd2" placeholder="비밀번호 확인" required>
                                    </div>
                                    <!-- 비밀번호 확인 -->
                                    <div class="alert alert-success" id="password-validation-message">비밀번호가 일치합니다</div>
                                    <!-- 
                                    <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다</div>
                                    <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                                     -->
                                    <div class="form-group">
                                        <input type="text" name="email" id="email" class="form-control" placeholder="이메일" required>
                                    </div>
                                    
                                    <button class="btn login-form__btn submit w-100" id="do-submit">회원가입</button>
                                </form>
                                    <p class="mt-5 login-form__footer">계정이 있으신가요? <a href="login" class="text-primary"> 여기</a>를 눌러 로그인하세요.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp"/>
    <jsp:include page="/WEB-INF/views/modules/common-js.jsp"/>

    <!--**********************************
        Scripts
    ***********************************-->
    

	<script type="text/javascript">
	
	$(function(){ 
		
		$("#pwd-alert-danger").hide();

		$("#pwd1,#pwd2").keyup(function(){
			
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
			
			var passRule = /^[A-Za-z0-9]{6,12}$/;
			if ( !passRule.test(pwd1) ) {
				$("#pwd-alert-danger").show();
				return;
			}
			else if (pwd1 != "" || pwd2 != "") {
				$("#pwd-alert-danger").hide();
				if (pwd1 == pwd2) {
					// $("#alert-success").show();
					// $("#alert-danger").hide();
					$('#password-validation-message').text('비밀번호가 일치합니다.')
													 .removeClass('alert-danger')
													 .addClass('alert-success');
				} else {
					//$("#alert-success").hide();
					//$("#alert-danger").show();
					$('#password-validation-message').text('비밀번호가 일치하지 않습니다.')
													 .removeClass('alert-success')
													 .addClass('alert-danger');
				}
			}
		});

	});

	
	$(function() {
		
		// id 중복 검사
		$('#btn-dup-check').on('click', function(event){
			event.preventDefault();
			event.stopPropagation();
			
			// 비동기 방식으로 중복 여부 확인 요청
			var memberId = $("#memberId").val();
			if (!memberId) {
				alert('아이디를 입력하세요.');
				return;
			}
			
			$.ajax({
				"url": "memberid-dup-check",
				"data": {"memberId" : memberId },
				"success" : function(result, status, xhr){
					if (result === "valid"){
						var re = /^[A-Za-z0-9]{6,12}$/;
						var memberId = $('#memberId').val();
						if ( !re.test(memberId) ) {
							alert('아이디 형식 오류 (6 ~ 12개의 영문자 또는 숫자)')
							return;
						} else{
						$('#id-valid-message').text("사용하실 수 있는 아이디 입니다.")
											  .removeClass('alert-danger')
											  .addClass('alert-success');
						$('#checkedId').val(memberId);
						}
					} else {
						$('#id-valid-message').text("이미 사용중인 아이디입니다.")
											  .removeClass('alert-success')
											  .addClass('alert-danger');
					}
				}, 
				"error": function(xhr, status, err){
					$('#memberId').val("");
					$('#id-valid-message').text("중복 검사 실패.");
				}
			});
			
			
		});
		
		$('#do-submit').on('click', function(event) {
			
			event.preventDefault(); // 제대로 입력안할 시 페이지 안넘어가게 */
			event.stopPropagation();
			
			var checkId = $('#checkedId').val();
			if (!checkId) { // 중복 검사를 실행하지 않은 경우
				alert('아이디 중복 검사를 실행해 주세요.');
				return;
			}
			
			if ($('#memberId').val() != checkId ){ // 중복검사한 아이디와 입력아이디가 다른 경우
				alert('중복검사를 다시 실행해 주세요.');
				$('#checkedId').val("");
				return;
			}
			
			var pwd1 = $('#pwd1').val();
			if(!pwd1){
				alert('비밀번호란이 비어있습니다. 입력해주시길 바랍니다.');
				return;
			}
			
			var pwd2 = $('#pwd2').val();
			if(!pwd2){
				alert('비밀번호 확인란이 비어있습니다. 입력해주시길 바랍니다.');
				return;
			}
			
			var email = $('#email').val();
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
			if(!emailRule.test(email)){
				alert('이메일의 형식이 올바르지 않습니다. 다시 입력해주세요.');
				return;
			}
			
			
			$('#registerform').submit(); // form을 서버로 전송
		});
	});
	</script>
    
    
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
</body>
</html>





