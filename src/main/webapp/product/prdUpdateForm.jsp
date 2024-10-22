<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
			display: inline-block;
			width: 125px;
			text-align: center; /* 텍스트를 가운데 정렬 */
  		}
  		#buttonset{margin-top: 15px;}
  		.radio_gender, .checkbox_hobby{font-size: 1.1rem;} /* 주위 글꼴의 1.1배 */
  	</style>
  	<script type="text/javascript">
  		$(document).ready(function(){
  	  		$('#inputdate').datepicker({dateFormat:"yy/mm/dd"}); 
  	  		
  	  		/* 이전에 선택했던 카테고리 정보가 자동으로 선택이 되어 있어야 합니다. */
  	  		$('option[value="${requestScope.bean.category}"]').attr('selected', true);
  		});
  	</script>  	
</head>
<body>
	<div class="container">
		<h2>상품 수정</h2>
		<p>관리자가 구매할 상품을 수정하는 페이지입니다.</p>
		<form action="<%=postForm%>" method="post" enctype="multipart/form-data"> 
			<input type="hidden" name="opsmode" value="prdUpdate"> 
			
			<div class="input-group">
				<span class="input-group-text">상품 번호</span>
				<input disabled="disabled" class="form-control" type="text" 
					id="fakepnum" name="fakepnum" value="${requestScope.bean.pnum}">				
				<input type="text" id="pnum" name="pnum" value="${requestScope.bean.pnum}">	
			</div>
			<div class="input-group">
				<span class="input-group-text">상품 이름</span>
				<input class="form-control" type="text" id="name" name="name" value="${requestScope.bean.name}">				
			</div>
			<div class="input-group">
				<span class="input-group-text">제조 회사</span>
				<input class="form-control" type="text" id="company" name="company" value="${requestScope.bean.company}">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지01</span>
				<input class="form-control" type="file" id="image01" name="image01">				
				<input type="hidden" name="deleteImage01" value="${requestScope.bean.image01}">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지02</span>
				<input class="form-control" type="file" id="image02" name="image02">				
				<input type="hidden" name="deleteImage02" value="${requestScope.bean.image02}">
			</div>			
			<div class="input-group">
				<span class="input-group-text">이미지03</span>
				<input class="form-control" type="file" id="image03" name="image03">				
				<input type="hidden" name="deleteImage03" value="${requestScope.bean.image03}">
			</div>			
			
			<div class="input-group">
				<span class="input-group-text">재고 수량</span>
				<input class="form-control" type="number" id="stock" name="stock" value="${requestScope.bean.stock}">				
			</div>
			<div class="input-group">
				<span class="input-group-text">단가</span>
				<input class="form-control" type="number" id="price" name="price" value="${requestScope.bean.price}">				
			</div>
			<div class="input-group">
				<span class="input-group-text">카테고리</span>
				<select id="category" name="category" class="form-select">
					<c:forEach var="category" items="${requestScope.categories}">
						<option value="${category.engname}">${category.korname}
					</c:forEach>
				</select>				
			</div>
			<div class="input-group">
				<span class="input-group-text">상품 상세 설명</span>
				<input class="form-control" type="text" id="contents" name="contents" value="${requestScope.bean.contents}">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">적립 포인트</span>
				<input class="form-control" type="number" id="point" name="point" value="${requestScope.bean.point}">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">입고 일자</span>
				<input class="form-control" type="datetime" id="inputdate" name="inputdate" value="${requestScope.bean.inputdate}">				
			</div>
			<div class="input-group">
				<button type="submit" class="btn btn-primary">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>				
			</div>
		</form>
	</div>
</body>
</html>