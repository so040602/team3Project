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
			<div class="col-sm-2"></div>
			<div class="col-sm-8">				
				<h2>
					${sessionScope.loginfo.name}
					(${sessionScope.loginfo.id}) 
					님의 과거 주문 내역
				</h2>				
				<p>과거 나의 주문 내역을 최근 날짜부터 보여 줍니다.</p>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th>주문 번호</th>
							<th>주문 일자</th>
							<th>상세 보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${requestScope.orderList}">
							<tr>
								<td>${bean.oid}</td>
								<td>${bean.orderdate}</td>
								<td>
									<a href="<%=getEnvs%>maDetail&oid=${bean.oid}">
										상세 보기 
									</a>
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