<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label">ACCOUNT</li>
                    
                    <c:choose>
	            		<c:when test="${ empty loginuser }">
		            		<li>
	                        	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                           	<span class="nav-text">회원등록</span>
	                        	</a>
	                        	<ul aria-expanded="false">
						    		<li><a href="/recruit/account/register">회원가입</a></li>
		                       		<li><a href="/recruit/account/login">로그인</a></li>
	                        	</ul>
	                    	</li>
                    </c:when>
                    </c:choose>
                    
                    <c:choose>
                    	<c:when test="${ not empty loginuser }">
                    	<li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">마이페이지</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="/recruit/mypage/myInfo">내 정보 관리</a></li>
                            <!-- <li><a href="/recruit/mypage/myInfo">내 정보 관리</a></li> -->
                            <li><a href="/recruit/mypage/bookmark">즐겨찾기</a></li>
                            <!-- <li><a href="/recruit/mypage/smartMatch">스마트매치</a></li> -->
                        </ul>
                    </li>
                    	</c:when>
                    </c:choose>
                    
                    <li class="nav-label">ENTERPRISES</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i> <span class="nav-text">채용 정보</span>
                        </a>
                        <ul aria-expanded="false">
                        	<li><a href="/recruit/enterprises/integrated_search?category=0">통합 검색</a></li>
                            <li><a href="/recruit/enterprises/integrated_search?category=4">지역</a></li>
                            <li><a href="/recruit/enterprises/integrated_search?category=1">직무</a></li>
                            <li><a href="/recruit/enterprises/integrated_search?category=2">신입/경력</a></li>
                            <li><a href="/recruit/enterprises/integrated_search?category=3">학력별</a></li>
                            <li><a href="/recruit/enterprises/recruitChart">기업채용 분석 차트</a></li>
                        </ul>
                    </li>
                    
                    <li class="nav-label">BOARD</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">게시판</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="/recruit/board/nolist">공지사항</a></li>
                           <li><a href="/recruit/board/qalist">Q&A</a></li>
                            <li><a href="/recruit/board/frlist">자유게시판</a></li>
                            <li><a href="/recruit/board/splist">스펙공유</a></li>
                            <li><a href="/recruit/board/eplist">취업자 후기</a></li>
                            
                        <!-- </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false"> -->
                       
                        </ul>
                    </li>
                  
                    <li class="nav-label">NEWS</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i><span class="nav-text">뉴스</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="/recruit/news/ITnews">IT소식</a></li>
                           
                        </ul>
                    </li>
                    
                    <c:if test="${ not empty loginuser and loginuser.userType eq 'admin' }">
	                	<li class="nav-label">ADMIN</li>
	                	<li>
	                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                        	<i class="icon-envelope menu-icon"></i><span class="nav-text">관리자페이지</span>
	                        </a>
	                    	<ul aria-expanded="false">
	                        	<li><a href="/recruit/admin/adminPage">회원정보관리</a></li>
	                    	</ul>
	                	</li>                    	
                   </c:if>
                   
                    <c:choose>
                    	<c:when test="${ not empty loginuser }">
                    		<li><a href="/recruit/account/logout">로그아웃</a></li>
                    	</c:when>
                    </c:choose>
                   
                   
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->