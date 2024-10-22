<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#birth').datepicker({dateFormat:"yy-mm-dd"});
	});
	
	function validCheck(){ /* form validation check */
		
		var memid = $('#memid').val();
		if(memid.length < 4 || memid.length > 12){
			alert('아이디는 4글자 이상 12글자 이하로 입력해 주세요.');
			$('#memid').focus(); 
			return false ; /* 이벤트 전파 방지 */
		}
				
		var memname = $('#memname').val();  			
		if(memname.length < 3 || memname.length > 15){
			alert('이름은 3자리 이상 15자리 이하로 입력해 주세요.');
			$('#memname').focus();			
			return false ;
		}	
		
		var mempwd = $('#mempwd').val();  			
		if(mempwd.length < 5 || mempwd.length > 12){
			alert('비밀 번호는 5자리 이상 12자리 이하로 입력해 주세요.');
			$('#mempwd').focus();			
			return false ;
		}	
		
		var regex = /^[a-z]\S{4,11}$/;
		var result = regex.test(password);
		
		if(result == false){
			alert('비밀 번호의 첫 글자는 반드시 소문자이어야 합니다.');
			$('#mempwd').focus();			
			return false ;
		}
		
		if(mempwd.indexOf('@') <= 0 && mempwd.indexOf('#') <= 0 && 
				mempwd.indexOf('$') <= 0 ){
			alert('특수 문자 #@$ 중에서 최소 1개가 포함이 되어야 합니다.');
			$('#mempwd').focus();			
			return false ;
		}
		
		var radioList = $('input[type="radio"]:checked');
		
		if(radioList.length == 0){
			alert('성별은 반드시 선택이 되어야 합니다.');
			$('#gender').focus();			
			return false ;
		}
		
		// 체크 박스에 대한 코드를 지웠습니다.	
		
		var birth = $('#birth').val() ;
		
		// 슬래시를 인식 시키기 위하여 역슬래시를 앞에 붙여 주세요.
		regex = /^\d{4}[\/-][01]\d[\/-][0123]\d$/;
		
		if(result == false){
			alert('생일은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd 형식으로 입력해 주셔야 합니다.');
			$('#birth').focus();			
			return false ;
		}
				
		/* jQuery UI Plugin Date Picker 설정 */
		
		/* alert('유효성 검사 성공'); */ 
		return true ; 
	}
</script>
<style type="text/css">
.container {
	margin-top: 100px;
}

.input-group {
	margin-top: 7px;
}

#buttonset {
	margin-top: 20px;
}

.radio_gender, .checkbox_hobby {
	font-size: 1.1rem;
} /* 주위 글꼴의 1.1배 */
.input-group-text {
	display: inline-block;
	width: 120px;
	text-align: center; /* 텍스트를 가운데 정렬 */
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>회원 가입</h2>
		<p>신규 회원이 가입하는 페이지입니다.</p>
		<form action="<%=postForm%>" method="post"> 
			<input type="hidden" name="opsmode" value="memInsert">		
			<div class="input-group">
				<span class="input-group-text">아이디</span> <input type="text"
					class="form-control" id="memid" name="memid">
			</div>
			<div class="input-group">
				<span class="input-group-text">이름</span> <input type="text"
					class="form-control" id="memname" name="memname">
			</div>
			<div class="input-group">
				<span class="input-group-text">비밀번호</span> <input type="password"
					class="form-control" id="mempwd" name="mempwd">
			</div>

			<div class="input-group">
				<span class="input-group-text">성별</span>
				<div class="form-control">
					<label class="radio-inline radio_gender"> &nbsp; <input
						type="radio" name="gender" id="gender1" value="남자">남자
					</label> &nbsp; 
					<label class="radio-inline radio_gender"> &nbsp; <input
						type="radio" name="gender" id="gender2" value="여자">여자
					</label>
				</div>
			</div>
			
			<!-- 취미는 삭제했습니다. -->

			<div class="input-group">
				<span class="input-group-text">생일</span> 
				<input type="datetime" class="form-control" id="birth" name="birth">
			</div>
			<div class="input-group">
				<span class="input-group-text">휴대폰</span> <input class="form-control"
					type="text" id="mobile" name="mobile">
			</div>
			<div class="input-group">
				<span class="input-group-text">이메일</span> <input class="form-control"
					type="text" id="email" name="email">
			</div>
			<div class="input-group">
				<span class="input-group-text">주소</span> <input class="form-control"
					type="text" id="addr01" name="addr01">
			</div>
			<div class="input-group">
				<span class="input-group-text">상세주소</span> <input class="form-control"
					type="text" id="addr02" name="addr02">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary"
					onclick="return validCheck();">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>