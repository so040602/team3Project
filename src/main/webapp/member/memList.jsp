<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.container{margin-top: 10px;}
		tr{opacity: 0.7;}
	</style>	
</head>
<body>
	<div class="container">
		<h2>회원 목록</h2>
		<p>회원 목록을 보여 주는 페이지입니다.</p>		
		<table class="table table-hover">
			<thead class="table-dark">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>생일</th>
					<th>휴대폰</th>
					<th>이메일</th>
					<th>주소</th>
					<th>상세주소</th>		
					<th>로그인수</th>		
					<th>탈퇴여부</th>
					<th>등록일</th>				
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${datalist}">
				<c:choose>
					<c:when test="${bean.gender eq '남자'}">
						<tr class="table-primary">
					</c:when>
					<c:when test="${bean.gender eq '여자'}">
						<tr class="table-success">
					</c:when>
					<c:when test="${bean.dropout == 1}">
						<tr class="table-danger">
					</c:when>
					<c:otherwise>
						<tr class="table-warning">
					</c:otherwise>
				</c:choose> 
				
					<td align="left">${bean.memid}</td>
					<td>${bean.memname}</td>
					<td>${bean.gender}</td>
					<td>${bean.birth}</td>
					<td>${bean.mobile}</td>
					<td>${bean.email}</td>
					<td>${bean.addr01}</td>
					<td>${bean.addr02}</td>	
					<td>${bean.logcnt}</td>
					<td>${bean.dropout}</td>			
					<td>${bean.regdate}</td>					
				</tr>
				</c:forEach>
			</tbody>
		</table>		 
	</div>	 
</body>
</html>