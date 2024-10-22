<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.container{margin-top: 10px;} /* box model */
		.rounded-pill{opacity: 0.7;}
		#backButton{margin: auto;}
		.tbMemView tbody th {width: 120px;}
	</style>
</head>
<body>
	<div class="container">
		<h2>${requestScope.bean.memidx}번 게시물 정보</h2>
        	<table class="table tbMemView">
            	<thead>
                	<tr>
                    	<th>항목</th>
                        <th>내용</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                    	<th>아이디</th>
                        <td>${requestScope.bean.memid}</td>
                    </tr>
                    <tr>
                    	<th>이름</th>
                        <td>${requestScope.bean.memname}</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>${requestScope.bean.gender}</td>
                    </tr>
                    <tr>
                       	<th>생일</th>
                        <td>${requestScope.bean.birth}</td>
                    </tr>
                    <tr>
                        <th>휴대폰</th>
                        <td>${bean.mobile}</td>
                    </tr>        
                    <tr>
                        <th>이메일</th>
                        <td>${bean.email}</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${bean.addr01}</td>
                    </tr>        
                    <tr>
                        <th>상세주소</th>
                        <td>${bean.addr02}</td>
                    </tr>        
                </tbody>
        	</table>
		<div id="backButton" style="text-align:center;">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아가기
			</button>		
		</div>
		<div>&nbsp;</div>
	</div>	 
</body>
</html>
