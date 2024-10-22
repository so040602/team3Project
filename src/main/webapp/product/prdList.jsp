<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card-img-top {
	width: 300px;
	height: 300px;
}

.removeUnderLine {
	text-decoration: none;
}

#buttonList {
	margin-top: 10px;
}

#updateAnchor, #deleteAnchor {
	opacity: 0.8;
}
</style>
</head>
<body>

	<div class="container mt-3">
		<h2>상품 목록</h2>
		<p>고객들이 구매하고자 하는 상품 목록을 보여 주는 페이지입니다.</p>
		<table class="table table-borderless">
			<thead>
			</thead>
			<tbody>
				<!-- colsu는 보여 주고자 하는 열의 개수 -->
				<!-- settings.properties에 정의 되어 있습니다. -->
				<c:set var="colsu"
					value="${applicationScope.settings.product_list_column_size}" />

				<c:forEach varStatus="status" var="bean"
					items="${requestScope.datalist}">

					<c:if test="${status.index mod colsu == 0}">
						<tr>
					</c:if>

					<td>
						<div class="card" style="width: 400px">
							<a class="removeUnderLine"
								href="<%=getEnvs%>prdDetail&pnum=${bean.pnum}"> <img
								class="card-img-top" src="image/${bean.image01}"
								alt="${bean.prdname}" style="width: 100%">
								<div class="card-body">
									<h4 class="card-title">${bean.prdname}</h4>

									<p class="card-text">
										<span data-bs-toggle="popover" title="${bean.prdname}"
											data-bs-content="${bean.contents}" data-bs-trigger="hover">

											<c:if test="${fn:length(bean.contents) >= 50}">
												${fn:substring(bean.contents, 0, 50)}...
											</c:if>
										</span>

										<c:if test="${fn:length(bean.contents) < 50}">
											${bean.contents}
										</c:if>
									</p>

									<c:if test="${whologin == 2}">
										<div id="buttonList">
											<a id="updateAnchor" class="btn btn-info"
												href="<%=getEnvs%>prdUpdate&pnum=${bean.pnum}">수정</a>

											&nbsp;&nbsp; <a id="deleteAnchor" class="btn btn-info"
												href="<%=getEnvs%>prdDelete&pnum=${bean.pnum}">삭제</a>
										</div>
									</c:if>

								</div>
							</a>
						</div>
					</td>

					<c:if test="${status.index mod colsu == (colsu-1)}">
						</tr>
					</c:if>

				</c:forEach>
			</tbody>
		</table>
	</div>


	<script>
		var popoverTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		})
	</script>

</body>
</html>