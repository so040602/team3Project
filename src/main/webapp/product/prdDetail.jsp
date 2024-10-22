<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	margin-top: 5px;
} /* 바깥 콘테이너 */

/* 왼쪽 큰 이미지 영역 */ /* overflow: hidden는 자식 요소가 부모를 넘치지 않도록 설정 */
.card {
	width: 30rem;
	height: 30rem;
	overflow: hidden;
}

.large_image {
	width: 100%;
	height: 100%;
} /* 부모의 너비와 높이에 꽉 차게 설정 */

/* 가운데 작은 이미지 영역 */
/* !important가 가장 우선 순위가 높아서 border-radius 속성이 적용되지 않습니다. */
.small_image {
	width: 100px;
	height: 100px;
	margin: 2px;
	display: block;
	margin-bottom: 10px;
}

/* 우측 영역 테두리 없애기 */
.card_borderless{border: 0px;}

/* 총 금액 표시란 */
#totalPrice {
	color: red;
	font-size: 20px;
	font-weight: bolder;
}

.plus, .minus{font-size: 1.1rem;}/* 상품 담기, 빼기 버튼 */
#qty{margin:-10px;border:0px;font-size:0.9rem;}/* 수량 입력란 */

.pagination {display: flex;align-items: center;}
.page-item {height: 40px;display: flex;align-items: center;}
.page-link {display: flex;align-items: center;justify-content: center;height: 100%;padding: 0 10px;}
.page-link input[type="text"] {height: 100%;width: 50px;text-align: center;box-sizing: border-box;}

/* 장바구니 버튼 */
.cart {
	background-color: black;
	border: 1px solid black;
}

/* 바로구매 버튼 */
.rightnow {
	background-color: red;
	border: 1px solid red;
}
</style>
<script type="text/javascript">
	/* const 키워드는 읽기 전용(자바의 final 키워드)  */
	const maxPurchaseSize = 5 ; /* 최대 구매 가능 개수 */
	
	
	/* 실제 단가 정보를 가져와야 하므로, 아래 줄은 주석 처리합니다. */
	/*var price = 10000 ;*/  /* 단가 */	

	$(document).ready(function(){
		var price = '${bean.price}';
		
		/* innerWidth() = self width + padding */
		/* outerWidth() = self width + padding + border */
		console.log('마이너스 버튼 내부 너비 : ' + $('.minus').innerWidth());
		$('#qty').innerWidth(2 * $('.minus').innerWidth());
		$('#totalPrice').text('0'); /* 최초 시작시 총 금액을 0으로 설정하기 */
		
		/* 선택된 작은 이미지의 src 속성을 읽어 와서, 큰 이미지 src 속성에 기록합니다. */
		$('.small_image').click(function(){
			$('.large_image').attr('src', $(this).attr('src'));
		});		
		
		$('.plus').click(function(){
			/* 고객이 + 버튼을 클릭함 */
			var qty = $('#qty').val();
			console.log(typeof(qty)); // string(문자열)
			
			/* Number 객체는 자바의 Integer.parseInt()와 동일한 효과 */
			var newQty = Number(qty) + 1 ;
			
			if(qty == ''){
				$('#qty').val('1');
			}else{
				if(newQty > maxPurchaseSize){
					alert('최대 ' + maxPurchaseSize + '개까지만 주문이 가능합니다.');
					return ; /* 더 이상 진행하지 않겠습니다. */
				}
				$('#qty').val(newQty);
			}
			
			var amount = newQty*price ;
			/* toLocaleString() 메소드는 로케일(한국, 미국 등등) 설정 값을 이용하여 
				숫자를 문자열 형식으로 변경해 줍니다. */
			$('#totalPrice').text(amount.toLocaleString()) ;
		});
				
		$('.minus').click(function(){
			/* 고객이 - 버튼을 클릭함 */
			var qty = $('#qty').val();
			if(qty == '0'){
				alert('최소 1개 이상 구매하셔야 합니다.');
				return ;
			}
			
			var newQty = Number(qty) - 1 ;
			if(qty == ''){
				$('#qty').val('');
				$('#totalPrice').text('0') ;
			}else{
				$('#qty').val(newQty) ;
				$('#totalPrice').text(newQty*price) ;
			}				
		});		
		
		$('.cart').click(function(){
			/* 고객이 '찜' 버튼을 클릭함 */
			var qty = $('#qty').val();
			if(qty < 1 || qty > maxPurchaseSize){
				alert('최소 1개 이상 찜을 할 수 있습니다.');
				return ; 
			}
		});
		
		$('.rightnow').click(function(){
			/* 고객이 '바로 구매' 버튼을 클릭함 */
			const qty = $('#qty').val();
			if(qty < 1 || qty > maxPurchaseSize){
				alert('바로 구매는 최소 1개 이상 담을 수 있습니다.');
				return ; 
			}

			/* rightnow=true이면 `바로(즉시) 결제` 모드입니다. */
			const pnum = $('#pnum').val();
			const stock = $('#stock').val();
			
			let parameters = '&rightnow=true'; /* `바로(즉시) 결제` 모드 */
			parameters += '&pnum=' + pnum ;
			parameters += '&qty=' + qty ;
			parameters += '&stock=' + stock ;
			
			location.assign('<%=getEnvs%>maCalculate' + parameters) ;
		});	
		
		/* 수량 입력란이 포커스를 잃을 때 발생 */
		$('#qty').blur(function(){
			var qty = $('#qty').val();
			
			if(qty == '' || isNaN(qty) == true){
				alert('0이상 ' + maxPurchaseSize + '이하의 숫자만 입력이 가능합니다.');
				$('#qty').val('0');
				$('#qty').focus();
				return ;
				
			} else {
				var newQty = Number(qty) ;
				
				if(newQty < 0 || newQty > maxPurchaseSize){
					alert('0이상 ' + maxPurchaseSize + '이하의 숫자만 입력이 가능합니다.');
					$('#qty').val('0');
					$('#qty').focus();
					return ; 
				}
				$('#qty').val(newQty);
			}
			
		});
		
	});
</script>
</head>
<body>
	<div class="container">
		<h2>도서 상세</h2>
		<p>해당 도서에 대한 상세 내역을 보여 주는 페이지입니다.</p>
		<table class="table table-borderless">
			<tbody>
				<tr>
					<td class="col-lg-5">
						<div class="card">
							<img alt="${bean.name}" src="image/${bean.image}"
								class="rounded large_image">
						</div>
					</td>
					<td class="col-lg-1">
						<img alt="${bean.name}"
							src="image/${bean.image}" class="small_image rounded">		
				
					</td>
					<td class="col-lg-6">
						<div class="card card_borderless" style="width: 18rem;">
							<h5 class="card-title">${bean.prdname}</h5>
							<p class="card-text">${bean.contents}</p>
							<p class="card-text">
								합계 : <span id="totalPrice">10,000</span>원
							</p>
							<form action="<%=postForm%>" method="post">
								<input type="hidden" name="opsmode" value="maInsert">
								<input type="hidden" name="pnum" id="pnum" value="${bean.pnum}">
								<input type="hidden" name="stock" id="stock" value="${bean.stock}">
							<ul class="pagination">
								<li class="page-item"><a class="page-link minus" href="#"> - </a></li>
								<li class="page-item">
									<a class="page-link" href="#">
										<input type="number" name="qty" id="qty" value="0" min="0" readonly
											style="text-align:center; padding:0px;"> 
									</a>
								</li>
								<li class="page-item"><a class="page-link plus" href="#"> + </a></li>
							</ul>
							<div class="btn-group">
								<button type="submit" class="btn btn-primary cart">찜하기</button>
								<button type="button" class="btn btn-primary rightnow">	대출하기</button>
							</div>
							</form>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>