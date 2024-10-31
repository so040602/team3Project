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
		<h2>인공 지능 개발 추가</h2>
		<p>Team3 개발자들이 인공 지능을 개발한 결과물을 등록하는 페이지입니다.</p>
		
		<form action="<%=postForm%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="opsmode" value="aibbsInsert">
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span>
				
				<c:set var="userInfo" value="${sessionScope.loginfo.memname}(${sessionScope.loginfo.memid})"/>
				<input id="fakeid" name="fakeid" disabled="disabled" type="text" class="form-control" 
					value="${userInfo}" readonly>
				<input id="memid" name="memid" type="hidden" value="${sessionScope.loginfo.memid}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">카테고리</span> 
				<input id="category" name="category" type="text" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">제목</span> 
				<input id="subtitle" name="subtitle" type="text" class="form-control" autocomplete="off">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">내용</span> 
				<textarea id="contents" name="contents" type="text" class="form-control" autocomplete="off"
					style="height:200px; min-height:200px; max-height:300px;" ></textarea>
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
				<span class="input-group-text col-md-2">첨부파일(3)</span> 
				<input id="attach03" name="attach03" type="file" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">첨부파일(4)</span> 
				<input id="attach04" name="attach04" type="file" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">코드파일</span> 
				<input id="codefile" name="codefile" type="file" class="form-control" 
					accept=".java,.py,.js,.css,.jsp,.html">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">비밀번호</span> 
				<input id="boardpwd" name="boardpwd" type="password" class="form-control" autocomplete="off">
			</div> 			
			<div id="buttonset" class="input-group d-flex justify-content-center">
			    <button type="submit" class="btn btn-primary btn-lg" onclick="return validCheck();">등록</button>
			    <button type="reset" class="btn btn-secondary btn-lg mx-2">초기화</button>
			    <button type="button" class="btn btn-secondary btn-lg" onclick="history.back();">취소</button>
			</div>
		</form>
	</div>
	
<script type="text/javascript">
    function validCheck() {
        // 제목 필드 검사
        const subtitle = document.getElementById('subtitle').value.trim();
        if (subtitle.length === 0) {
            alert('제목을 입력해 주세요.');
            document.getElementById('subtitle').focus();
            return false;
        }

        // 내용 필드 검사
        const contents = document.getElementById('contents').value.trim();
        if (contents.length === 0) {
            alert('내용을 입력해 주세요.');
            document.getElementById('contents').focus();
            return false;
        }
        
        // 첨부파일 검사: 반드시 입력되어야 함
        const attach01 = document.getElementById('attach01').value;
        if (attach01.length === 0) {
            alert('첨부파일(1)은 반드시 입력해 주세요.');
            document.getElementById('attach01').focus();
            return false;
        }

        // 첨부파일 검사 (필요에 따라 추가 가능)
        const attach01 = document.getElementById('attach01').value;
        if (attach01.length > 0) {
            const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.pdf)$/i; // 허용할 파일 확장자
            if (!allowedExtensions.exec(attach01)) {
                alert('jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.');
                document.getElementById('attach01').focus();
                return false;
            }
        }
        
        const attach02 = document.getElementById('attach02').value;
        if (attach02.length > 0) {
            const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.pdf)$/i; // 허용할 파일 확장자
            if (!allowedExtensions.exec(attach02)) {
                alert('jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.');
                document.getElementById('attach02').focus();
                return false;
            }
        }
        
        const attach03 = document.getElementById('attach03').value;
        if (attach03.length > 0) {
            const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.pdf)$/i; // 허용할 파일 확장자
            if (!allowedExtensions.exec(attach03)) {
                alert('jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.');
                document.getElementById('attach03').focus();
                return false;
            }
        }
        
        const attach04 = document.getElementById('attach04').value;
        if (attach04.length > 0) {
            const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif|\.pdf)$/i; // 허용할 파일 확장자
            if (!allowedExtensions.exec(attach04)) {
                alert('jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.');
                document.getElementById('attach04').focus();
                return false;
            }
        }

        // 모든 유효성 검사를 통과한 경우
        return true;
    }
</script>

<script type="text/javascript">
    $(document).ready(function() {
        // 페이지 로딩 후 2초 후에 특정 입력 필드의 값을 삭제
        setTimeout(function() {
            $('#subtitle').val('');
            $('#contents').val('');
            $('#boardpwd').val('');
        }, 1000); 
    });
</script>
	
</body>
</html>