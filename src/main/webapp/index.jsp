<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common/common.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Team3 JSP Home!</title>
<style>
	.spanTitle { width: 100px; dispaly:inline-block; text-align:center; margin-right: 10px;}
</style>
</head>
<body>
	
	<div class="container mt-3">
		<h1>Welcome to Team3 JSP Home!</h1>

		<div>
		    <img src="./image/balloon_960.jpg" style="width:560px; height:auto;"/>	
		</div>
		
		<div class="input-group mt-2">
			<span class="input-group-text spanTitle">홈으로</span> 
			<a href="<%=getEnvs%>home">홈으로</a>
		</div>
		<div class="input-group mt-2">
			<span class="input-group-text spanTitle">로그인</span> 
			<a href="<%=getEnvs%>memLogin">로그인</a></a>
		</div>
		<div class="input-group mt-2">
			<span class="input-group-text spanTitle">로그아웃</span> 
			<a href="<%=getEnvs%>memLogout">로그아웃</a>
		</div>
		
		<div class="input-group mt-2"> 
			<span class="input-group-text spanTitle">회원가입</span> 
			<a href="<%=getEnvs%>userAuthStart">회원가입</a>
		</div>
		
		<div class="input-group mt-2">
			<form action="<%=postForm%>" method="post">
				<input type="hidden" name="opsmode" value="memLogin">
				<input type="submit" value="로그인">
			</form>
		</div>
	</div>
	
</body>
</html>