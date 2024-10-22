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
		$('#birth').datepicker();
		
		/* 라디오 버튼의 value 속성 값이 일치하는 항목을 찾아서 체크 on 상태로 변경합니다. */
		$('input[value="${requestScope.bean.gender}"]').attr('checked', true);
		
		/* 취미와 관련된 문자열 : "탁구,축구,"*/
		//var hobbyCheck = "requestScope.bean.hobby"; // held
		
		/* 취미와 관련된 모든 체크 박스들 */
		var checkHobbies = $('input[name="hobby"]');
		
		for(var i=0 ; i < checkHobbies.length ; i++){
			var idx = hobbyCheck.indexOf(checkHobbies[i].value);
			
			if(idx >= 0){
				checkHobbies[i].checked = true ;
			}
		}
	});
</script>
<style type="text/css">
	.container{margin-top: 100px;}
	.input-group{margin-top: 7px;}
	#buttonset{margin-top: 20px;}
	.radio_gender, .checkbox_hobby{font-size: 1.1rem;} /* 주위 글꼴의 1.1배 */
	.input-group-text{
		display: inline-block;
		width: 120px;
		text-align: center; /* 텍스트를 가운데 정렬 */
	}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>회원 정보 수정</h2>
		<p>특정 회원에 대하여 정보를 수정하는 페이지입니다.</p>
		<form action="<%=postForm%>" method="post"> 
			<input type="hidden" name="opsmode" value="memUpdate"> 
			<div class="input-group">
				<span class="input-group-text">아이디</span> 
				
				<!-- 나는 html 주석입니다. -->
				<%--
					수정 페이지 작성시 기본 키(pk)는 가자 데이터를 disabled 속성으로 작성합니다.
					disabled 속성이 붙은 파라미터는 절대로 넘겨 지지 않습니다.
					진짜 데이터는 hidden 파라미터로 넘기면 됩니다.
				--%>
				
				<input disabled="disabled"  type="text" class="form-control" id="fakeid" 
					name="fakeid" value="${requestScope.bean.memid}"> 
				
				<input type="hidden" id="memid" name="memid" value="${requestScope.bean.memid}">					
					
			</div>
			<div class="input-group">
				<span class="input-group-text">이름</span> 
				<input type="text" class="form-control" id="memname" 
					name="memname" value="${requestScope.bean.memname}">
			</div>
			<div class="input-group">
				<span class="input-group-text">비밀번호</span> 
				<input type="password" class="form-control" id="mempwd" name="mempwd">
			</div>
				
			<div class="input-group">
				<span class="input-group-text">성별</span> 
				<div class="form-control">
					<label class="radio-inline radio_gender">
						&nbsp;
      					<input type="radio" name="gender" id="gender1" value="남자">남자
    				</label>
    				&nbsp;
    				<label class="radio-inline radio_gender">
    					&nbsp;
      					<input type="radio" name="gender" id="gender2" value="여자">여자
    				</label>
				</div>
			</div>	
			
			<!--div class="input-group">
				<span class="input-group-text">취미</span> 
				<div class="form-control">
					<label class="checkbox-inline checkbox_hobby">
						&nbsp;
      					<input type="checkbox" name="hobby" id="hobby1" value="탁구">&nbsp;탁구
    				</label>
    				&nbsp;
    				<label class="checkbox-inline checkbox_hobby">
    					&nbsp;
      					<input type="checkbox" name="hobby" id="hobby2" value="농구">&nbsp;농구
    				</label>
					<label class="checkbox-inline checkbox_hobby">
						&nbsp;
      					<input type="checkbox" name="hobby" id="hobby3" value="야구">&nbsp;야구
    				</label>
    				&nbsp;
    				<label class="checkbox-inline checkbox_hobby">
    					&nbsp;
      					<input type="checkbox" name="hobby" id="hobby4" value="축구">&nbsp;축구
    				</label>    				
				</div>
			</div-->
			
			<div class="input-group">
				<span class="input-group-text">생일</span> 
				<input type="datetime" class="form-control" id="birth" name="birth" value="${requestScope.bean.birth}">
			</div>		
			
			<div class="input-group">
				<span class="input-group-text">휴대폰</span>
				<input class="form-control" type="text" id="mobile" name="mobile" value="${requestScope.bean.mobile}">		
			</div>
			
			<div class="input-group">
				<span class="input-group-text">이메일</span>
				<input class="form-control" type="text" id="email" name="email" value="${requestScope.bean.email}">		
			</div>	

			<div class="input-group">
				<span class="input-group-text">주소</span>
				<input class="form-control" type="text" id="addr01" name="addr01" value="${requestScope.bean.addr01}">		
			</div>
			
			<div class="input-group">
				<span class="input-group-text">상세주소</span>
				<input class="form-control" type="text" id="addr02" name="addr02" value="${requestScope.bean.addr02}">				
			</div>	
			
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary">수정</button>	
				&nbsp;&nbsp;&nbsp;								
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>







