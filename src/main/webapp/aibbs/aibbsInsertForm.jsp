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
			width: 120px;
			text-align: center; /* 텍스트를 가운데 정렬 */
  		}
  		#buttonset{margin-top: 15px;}
  		
  		#boardNo{display: none;visibility: hidden;}
  	</style>
  	<script type="text/javascript">
  		//$(document).ready(function(){
  	  	//	/* $('#regdate').datepicker(); */   	
  	  	//	$('#regdate').datepicker({dateFormat: "yy/mm/dd"});  	  	
  		//});
  		
  		function validCheck(){
  			var subtitle = $('#subtitle').val();
  			if(subject.length < 3 || subject.length > 50){
  				alert('글 제목은 3 글자 이상 50 글자 이하이어야 합니다.');
  				$('#subject').focus();
  				return false ;
  			}
  			
  			var contents = $('#contents').val();
  			if(contents.length < 5 || contents.length > 1000){
  				alert('글 내용은 5글자 이상 1000 글자 이하이어야 합니다.');
  				$('#contents').focus() ;
  				return false ;
  			}
  			
  			//var regdate = $('#regdate').val();
  			
  			//var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
  			//var result = regex.test(regdate) ;
  			
  			//if(result == false){
  			//	alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
  			//	$('#regdate').focus() ;
  			//	return false ;
  			//}  			
  			
  			return true;
  		}
  	</script>
</head>
<body>
	<div class="container">
		<h2>게시물 등록</h2>
		<p>사용자들이 게시물을 등록하는 페이지입니다.</p>
		
		<form action="<%=postForm%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="opsmode" value="aibbsInsert">
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span>
				
				<c:set var="userInfo" value="${sessionScope.loginfo.memname}(${sessionScope.loginfo.memid})"/>
				 
				<input id="fakeid" name="fakeid" disabled="disabled" type="text" class="form-control" value="${userInfo}">
				<input id="memid" name="memid" type="hidden" value="${sessionScope.loginfo.memid}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="subtitle" name="subtitle" type="text" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<textarea id="contents" name="contents" type="text" 
					class="form-control" style="height:100px; max-height:200px;"></textarea>
			</div>  
			<div class="input-group">
				<span class="input-group-text col-md-2">첨부파일(1)</span> 
				<input id="attach01" name="attach01" type="file" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">첨부파일(2)</span> 
				<input id="attach02" name="attach02" type="file" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">비밀번호</span> 
				<input id="boardpwd" name="boardpwd" type="password" class="form-control">
			</div> 			
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg" onclick="return validCheck();">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button> 
			</div>
		</form>
	</div>
</body>
</html>