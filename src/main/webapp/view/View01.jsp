<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<h2>회원과 게시물</h2>
		</div>

		<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width:100px;">이름</th>
							<th>글제목</th>
							<th>글내용</th>
							<th style="width:120px;">작성일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td>${bean.memname}</td>
							<td>${bean.subtitle}</td>
							<td>${bean.contents}</td>
							<td>${bean.regdate}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>