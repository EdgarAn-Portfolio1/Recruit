<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>로그인</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="css/style.css" rel="stylesheet">
    
    <script type="text/javascript">
    
    	if (${ not empty param.loginfail }) {
    		alert('아이디 비밀번호를 확인해주세요');
    	}
 
    </script>
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

								<form class="mt-5 mb-5 login-input" method='POST' action='login'>
								<div class="form-group">
											<input type="text" name="memberId" class="form-control"
												placeholder="아이디">
										</div>
										<div class="form-group">
											<input type="password" name="passwd" class="form-control"
												placeholder="비밀번호">
										</div>
										<button class="btn login-form__btn submit w-100">로그인</button>
										<p class="mt-5 login-form__footer">
										계정이 없으신가요? <a href="register" class="text-primary"> 여기</a>를 눌러 회원가입하세요.</p>
								</form>
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

<!-- 	<script type="text/javascript">
    $(function() {
    	if (${ not empty param.loginfail }) {
    		alert('로그인 실패');
    	}
    });
    </script> -->
	<script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
</body>
</html>





