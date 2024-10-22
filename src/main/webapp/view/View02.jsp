<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>	   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>회원과 게시물</h2>
			</div>
			<div class="col-sm-2"></div>			
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>이름</th>
							<th>작성 건수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td align="center">${bean.memname}</td>
							<td align="center">${bean.cnt}</td>					
						</tr>
						</c:forEach>				
					</tbody>
				</table>
			</div>
			<div class="col-sm-2"></div>
		</div>	
	</div>
</body>
</html>