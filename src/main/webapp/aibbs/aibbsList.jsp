<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>

	<div class="container">
		<div>
	        <h2>인공지능 목록</h2>
	        <p>Team3 팀원들이 작업한 목록을 보여 주는 페이지</p>
        <div>
        
        <table style="width:100%">
        	<tr>
	        	<td style="width:20%;">
	        		<select class="custom-select ml-1">
	        			<option value=""> 전체 카테고리 </option>
	        			<option value="인공지능"> 인공지능 </option>
	        			<option value="빅데이터"> 빅데이터 </option>
	        		</select>
	        	</td>
	            <td id="buttonset" style="width:80%; text-align:right;">
			    	<button type="submit" class="btn btn-primary" onclick="aibbsInsert();">
			        	<i class="fas fa-sign-in-alt me-2"></i>인공 지능 개발 추가
			        </button>
			        &nbsp;
			        <button type="submit" class="btn btn-primary" onclick="aibbsBigData();">
			        	<i class="fas fa-sign-in-alt me-2"></i>빅데이터 처리 목록
			        </button>
			    </td>
		    </tr>
		</table>    
	    
		<table class="table table-striped mt-2">
			<thead>
				<tr>
					<th>번호</th>
					<th>개발자</th>
					<th>글제목</th>
					<th>조회수</th>
					<th>작성일</th>					
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.datalist}"> 
				<tr>
					<td>${bean.brdidx}</td>
					<td>${bean.memid}</td>
					<td>
						<a href="<%=getEnvs%>aibbsDetail&brdidx=${bean.brdidx}">
							<c:forEach var="i" begin="1" end="${bean.depthcnt}" step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach>
							${bean.subtitle}
						</a>
					</td>
					<td>
						<c:if test="${bean.readcnt >= 30}">
							<span class="badge rounded-pill bg-primary">
								${bean.readcnt}
							</span>
						</c:if>
						<c:if test="${bean.readcnt < 30}">
							<span class="badge rounded-pill bg-danger">
								${bean.readcnt}
							</span>
						</c:if>						
					</td>
					<td>${bean.regdate}</td>							
					<td>
						<c:if test="${sessionScope.loginfo.memid == bean.memid}">
							<a href="<%=getEnvs%>aibbsUpdate&brdidx=${bean.brdidx}">수정</a>
						</c:if>
					</td>
				</tr>
				</c:forEach>
					
				<c:if test="${empty requestScope.datalist}">
				    <tr>
				        <td colspan="6">
				            <div style="padding:20px; text-align:center">데이터가 없습니다.</div>
				        </td>
				    </tr>
				</c:if>
	 
			</tbody>
		</table>
		
	</div>	 
	
	<script>
	<% 
	    boolean isLoggedIn = session.getAttribute("loginfo") != null; // 로그인 정보 확인
	%> 
	    function aibbsInsert() {
	        // JSP의 boolean 값을 숫자로 변환
	        const isLoggedIn = <%= isLoggedIn ? 1 : 0 %>;
	        const aibbsInsertUrl = "<%= getEnvs %>aibbsInsert";
	        
	        if (!isLoggedIn) {
	            alert("로그인 이후 사용할 수 있습니다.");
	        } else {
	            location.assign(aibbsInsertUrl);
	        }    
	    }
	    
	    function aibbsBigData() {
	        const aibbsBigListUrl = "<%= getEnvs %>aibbsBigList";
	        location.assign(aibbsBigListUrl);
	    }
	</script>
	
</body>
</html>