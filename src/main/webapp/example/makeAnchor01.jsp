<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>그림</th>
			<th>주소</th>
		</tr>
		<tr>
			<td>이름</td>			
			<td>
				<!-- 앵커 태그 : 하이퍼 링크를 위한 태그, href 속성 사용 -->
				<a href="htmlTest01.jsp"><!-- 현재 파일과 동일 위치에 존재함 -->
					<!-- relative path : 상대 경로 지정 방식 -->
					<!-- src : 이미지 출처, alt : 이미지 엑박시 보여줄 글자 -->
					<img alt="아반떼 그림" src="./../image/avante.png" width="150" height="90">
				</a>
			</td>
			<td>
				<!-- absolute path : 절대 경로 지정 방식 -->
				<a href="https://www.naver.com/">네이버</a>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<!-- 그랜저 이미지 클릭시 hello.jsp 파일로 이동하기 -->			
			<td>
				<a href="./../hello.jsp">
					<img alt="그랜저" src="./../image/grandeur.png"  width="150" height="90">
				</a>
			</td>
			<td>
				<a href="https://www.daum.net/">다음</a>
			</td>
		</tr>		
	</table>
</body>
</html>






