<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function(){
			// Initialize tooltips
			// data-bs-toggle="tooltip"라고 명시되어 있는 항목들을 찾아서 배열로 만드시오.
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			
			// 배열들을 순환하여 각각 Tooltip 함수들을 적용하십시요. 
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
				return new bootstrap.Tooltip(tooltipTriggerEl)
			})
		});
		
		function validCheck(){ /* form validation check */
			var memid = $('#memid').val();
			if(id.length < 5 || id.length > 12){
				alert('아이디는 5글자 이상 12글자 이하로 입력해 주세요.');
				$('#memid').focus(); 
				return false ; /* 이벤트 전파 방지 */
			}
			
			var mempwd = $('#mempwd').val();  			
			if(mempwd.length < 5 || mempwd.length > 12){
				alert('비밀번호는 5자리 이상 12자리 이하로 입력해 주세요.');
				$('#mempwd').focus();			
				return false ;
			}	
			
			return true;
		}
		
	</script>
	<style type="text/css">
		/* 하단의 버튼과 입력 양식 간의 간격 띄우기 */
		.bottomBtnGroup{margin-top: 30px;}
		.bottomBtnGroup button { width: 100px; }
		.inputTitle { width: 100px; text-align:center; display:block;}
	</style>
</head>
<body>
	<div class="container mt-3">
		<h2>로그인 페이지</h2>
		<p>로그인을 위한 페이지입니다.</p>
		<form action="<%=postForm%>" method="post">
			<input type="hidden" name="opsmode" value="memLogin">
			
			<div class="input-group">
				<span class="input-group-text inputTitle">아이디</span> 
				<input type="text" class="form-control" id="memid" 
					placeholder="아이디를 입력해 주세요." name="memid"
					data-bs-toggle="tooltip" data-bs-placement="bottom"
					title="아이디는 5글자 이상 12글자 이하로 입력해 주세요." >
			</div>
			
			<div class="input-group mt-2">
				<span class="input-group-text inputTitle">비밀번호</span> 
				<input type="password" class="form-control" id="mempwd" 
					placeholder="비밀번호를 입력해 주세요" name="mempwd"
					data-bs-toggle="tooltip" data-bs-placement="bottom"
					title="비밀번호는 5글자 이상 12글자 이하로 입력해 주세요." >
			</div>
			
			<div class="bottomBtnGroup"> 
				<button type="submit" class="btn btn-primary"
				  onclick="return validCheck();">로그인</button>
				<button type="button" class="btn btn-info"
				onclick="location.assign('member/memInsertForm.jsp');">회원가입</button>
				
			</div>			
		</form>
	</div>
</body>
</html>