<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>	   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function(){
		  $("tbody tr").each(function(){		    	
		    	var amount = $(this).attr('data');
		    	if(amount >= 50000){
		    		$(this).addClass('table-primary');
		    	}else if(amount >= 30000){
		    		$(this).addClass('table-info');
		    	}
		  });
		});
	</script>
</head>
<body>
	<div class="container mt-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>주문 정보</h2>
				<p>jQuery를 사용하여 금액에 따른 색상을 다르게 설정해 줍니다.</p>
			</div>
			<div class="col-sm-2"></div>			
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table">
					<thead>
						<tr>
							<th>주문자</th>
							<th>상품명</th>
							<th>주문 일자</th>
							<th>구매 수량</th>
							<th>가격</th>
							<th>소계</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${requestScope.lists}">
						<tr data="${bean.amount}">
							<td align="center">${bean.mname}</td>
							<td align="center">${bean.pname}</td>					
							<td align="center">${bean.orderdate}</td>
							<td align="center">
								<fmt:formatNumber value="${bean.qty}" pattern="###,###"/> 개
							</td>
							<td align="center">
								<fmt:formatNumber value="${bean.price}" pattern="###,###"/> 원
							</td>
							<td align="center">
								<fmt:formatNumber value="${bean.amount}" pattern="###,###"/> 원
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