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
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  	</style>
</head>
<body>
	<div class="container">
		<h2>게시물 수정</h2>
		<p>내가 작성한 게시물을 수정하는 페이지입니다.</p>
		
		<form action="<%=postForm%>" method="post" enctype="multipart/form-data"> 
			<input type="hidden" name="opsmode" value="brdUpdate">
			
			<div class="input-group"> 
				<span class="input-group-text col-md-2">게시물 번호</span> 
				<input id="brdidx" name="brdidx" type="number" class="form-control" readonly value="${requestScope.bean.brdidx}"> 
			</div> 
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span> 
				<input id="memid" name="memid" type="text" class="form-control" readonly value="${requestScope.bean.memid}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">비밀번호</span> 
				<input id="boardpwd" name="boardpwd" type="password" class="form-control" placeholder="글작성 시 입력한 비밀번호를 입력하세요.">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="subtitle" name="subtitle" type="text" class="form-control" value="${requestScope.bean.subtitle}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<input id="contents" name="contents" type="text" class="form-control" value="${requestScope.bean.contents}">
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
				<span class="input-group-text col-md-2">조회수</span> 
				<input id="readcnt" name="readcnt" type="number" class="form-control" readonly value="${requestScope.bean.readcnt}"> 
			</div> 
			<div class="input-group">
				<span class="input-group-text col-md-2">등록일자</span> 
				<input id="regdate" name="regdate" type="text" class="form-control" value="${requestScope.bean.regdate}">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>