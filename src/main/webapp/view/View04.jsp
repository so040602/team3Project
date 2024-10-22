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
				<h2>주문 정보</h2>
				<p>chart.js를 이용하여 Pie 그래프를 그리면 좋을 듯해요^^</p>
			</div>
			<div class="col-sm-2"></div>			
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>주문자</th>
							<th>매출 총액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td align="center">${bean.memid}</td>
							<td align="center">
								<fmt:formatNumber value="${bean.sumtotal}" pattern="###,###"/> 원
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