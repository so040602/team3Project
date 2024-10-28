<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common/common.jsp" %>      

<style>
	.spanTitle {width:110px;}
</style> 
	
	<div class="container mt-3">
		<h1>Welcome to Team3 JSP Home!</h1>

		<div>
		    <img src="./image/balloon_960.jpg" style="width:560px; height:auto;"/>	
		</div>
		
		<div class="input-group mt-2">
			<span class="input-group-text spanTitle">홈으로</span>&nbsp; 
			<a href="<%=getEnvs%>home">홈으로</a>
		</div>
		<div class="input-group mt-2">
			<span class="input-group-text spanTitle">로그인</span>&nbsp; 
			<a href="<%=getEnvs%>memLogin">로그인</a></a>
		</div>
		<div class="input-group mt-2">
			<span class="input-group-text spanTitle">로그아웃</span>&nbsp; 
			<a href="<%=getEnvs%>memLogout">로그아웃</a>
		</div>
		
		<div class="input-group mt-2"> 
			<span class="input-group-text spanTitle">회원가입</span>&nbsp; 
			<a href="<%=getEnvs%>userAuthStart">회원가입</a>
		</div>
		
		<div class="input-group mt-2">
			<form action="<%=postForm%>" method="post">
				<input type="hidden" name="opsmode" value="memLogin">
				<input type="submit" value="로그인">
			</form>
		</div>
		
		<div class="input-group mt-2 mb-5"> 
			<span class="input-group-text spanTitle">AJAX 테스트</span> 
    		<input type="text" id="testName" name="testName" placeholder="이름 입력" style="border:1px solid #dedede;">
    		<button type="button" class="form-coltro" onclick="sendData()">테스트</button>
    		<divclass="ml-3" id="ajaxResponse" style="padding:5px 0px 0px 10px"></div>
		</div>
    
	</div>
	
	<script>
		// 바닐라 Ajax 코드
        function sendData() {
            const xhr = new XMLHttpRequest();
            const url = "AjaxFaceApi"; // 중요! 요청할 Servlet URL
            const data = "name=" + document.getElementById("testName").value;

            xhr.open("POST", url, true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("ajaxResponse").innerHTML = xhr.responseText;
                }
            };
            xhr.send(data);
        }
    </script>
    
</head>
	
</body>
</html>