<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	 <!--**********************************-->
        
        <div class="nav-header">
            <div class="brand-logo" style = "padding-left: 35px">
                <a href="/recruit/home.action">
                    <b class="logo-abbr"><img src="resources/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="resources/images/logo-compact.png" alt=""></span>
                    <span class="brand-title"><font size="5em" color='white'>
                       SHAKE IT
                    </font></span>
                </a>
            </div>
        </div>
        <!--**********************************-->

        <div class="header">
        	<c:choose>
        		<c:when test="${ empty loginuser }">
        			<div style="float: right; padding-right: 30px; padding-top: 25px">
        				<span><font size="3em">
        					<a href="/recruit/account/login">Login</a> / 
        					<a href="/recruit/account/register">Signin</a>
        				</font></span>
        			</div>
        		</c:when>
        		<c:otherwise>
        			<div style="float: right; padding-right: 30px; padding-top: 25px">
        				<span><font size="3em">
        					<c:if test="${loginuser.userType eq 'admin'}">
        						<font color="RoyalBlue">관리자계정</font>
        					</c:if>
        					<c:if test="${loginuser.userType eq 'user'}">
        					${ loginuser.memberId }님
        					</c:if> / 
        					<a href="/recruit/account/logout">Logout</a>
        				</font></span>
        			</div>
        		</c:otherwise>
        	</c:choose>  
        </div>