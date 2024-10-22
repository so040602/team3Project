<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="./../common/common.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team3 Main</title>
</head>
<body>
	<!-- Carousel -->
	<div id="demo" class="container mt-3 carousel slide" data-bs-ride="carousel">
		<h3>Team3 Main</h3>
		
		<p>The following example shows how to create a basic carousel with
			indicators and controls.</p>
			
		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%=appName%>/image/la.jpg" alt="Los Angeles" class="d-block"
					style="width: 100%">
			</div>
			<div class="carousel-item">
				<img src="<%=appName%>/image/chicago.jpg" alt="Chicago" class="d-block"
					style="width: 100%">
			</div>
			<div class="carousel-item">
				<img src="<%=appName%>/image/ny.jpg" alt="New York" class="d-block" style="width: 100%">
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
</body>
</html>