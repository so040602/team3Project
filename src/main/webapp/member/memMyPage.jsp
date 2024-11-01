<%@page import="com.team3.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ page isErrorPage="false" %>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
:root {
	--primary-color: #0066c0;
	--primary-hover: #004d8c;
	--background-color: #f8f9fa;
}

.container {
	max-width: 1400px;
	margin: 40px auto;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: var(--shadow-sm);
	position: relative;
	border-radius: 15px;
}

span {
	font-size: 1.2rem;
}

.dddmain_header {
	background-color: LightGray;
	border-top-left-radius: 2em 0.5em;
	border-top-right-radius: 1em 3em;
	border-bottom-right-radius: 4em 0.5em;
	border-bottom-left-radius: 1em 3em;
}

.borrow-button {
	background-color: var(--primary-color);
	color: white;
}

.borrow-button:hover {
	background-color: var(--primary-hover);
}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>
					${sessionScope.loginfo.memname}(${sessionScope.loginfo.memid}) 님의
					마이페이지</h2>
				<p>${sessionScope.loginfo.memname}님의 회원 정보입니다.</p>
				<br />
				<h3 class="main_header">회원 정보</h3>
				
				<span>이름 : ${mbean.memname}</span>
				<span></span>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th>회원정보</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>이름</th>
							<td valign="middle">${mbean.memname}</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td valign="middle">${mbean.memid}</td>
						</tr>
						<tr>
							<th>생일</th>
							<td valign="middle">${mbean.birth}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td valign="middle">${mbean.mobile}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td valign="middle">${mbean.email}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td valign="middle">${mbean.addr01}</td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td valign="middle">${mbean.addr02}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>