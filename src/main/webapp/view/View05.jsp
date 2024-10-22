<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>	   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.tbView05 th { width:50%; }
	</style>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>주문 정보</h2>
				<p>많이 주문하신 고객 5명만 조회하여 Bar 그래프를 그리면 좋을 듯 해요^^</p>
			</div>
			<div class="col-sm-2"></div>			
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table table-striped tbView05">
					<thead>
						<tr>
							<th>주문자</th>
							<th>주문 건수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td align="center">${bean.memid}</td>
							<td align="center">
								<fmt:formatNumber value="${bean.cnt}" pattern="###,###"/>
							</td>
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