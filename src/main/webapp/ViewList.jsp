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
				<h2>데이터 목록 보기</h2>
				<p>여러 가지 테이블들을 조인하여 결과들을 보고자 하는 페이지</p>
			</div>
			<div class="col-sm-2"></div>			
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>뷰 제목</th>
							<th>링크</th>
							<th>상세 설명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td valign="middle" align="center">회원과 게시물</td>
							<td valign="middle"><a href="<%=getEnvs%>vwExam01">View01</a></td>
							<td>
								회원 테이블과 게시물 테이블을 조인하여 조회합니다.<br/>
								게시물을 작성한 회원의 이름, 글제목, 글내용, 작성 일자 등을 조회합니다.
							</td>
						</tr>
						<tr>
							<td valign="middle" align="center">회원별 게시물 건수</td>
							<td valign="middle"><a href="<%=getEnvs%>vwExam02">View02</a></td>
							<td>
								회원들이 게시물을 얼마나 많이 작성했는지를 확인합니다.<br/>
								회원별로 그룹핑하여 작성 건수를 보여 줍니다.
							</td>					
						</tr>
						<tr>
							<td valign="middle" align="center">주문 정보</td>
							<td valign="middle"><a href="<%=getEnvs%>vwExam03">View03</a></td>
							<td>
								회원별 주문 정보를 조회합니다.<br/>
								주문한 고객의 이름, 상품명, 주문 일자, 구매 수량, 금액을 구해 봅니다.	
							</td>
						</tr>
						<tr>
							<td valign="middle" align="center">고객별 매출 총액</td>
							<td valign="middle"><a href="<%=getEnvs%>vwExam04">View04</a></td>
							<td>
								회원들이 얼마나 많은 매출을 발생시켰는지 집계해 봅니다.<br/>
								각 고객들에 대한 매출 총액을 구해 봅니다.
							</td>
						</tr>
						<tr>
							<td valign="middle" align="center">회원별 주문 건수</td>
							<td valign="middle"><a href="<%=getEnvs%>vwExam05">View05</a></td>
							<td>
								회원별 주문 건수를 집계해 봅니다.<br/>
								회원별 주문 건수를 조회하되, 주문이 없는 고객도 같이 확인하도록 합니다.
							</td>
						</tr>			
					</tbody>
				</table>			
			</div>
			<div class="col-sm-2"></div>
		</div>	
	</div>
</body>
</html>