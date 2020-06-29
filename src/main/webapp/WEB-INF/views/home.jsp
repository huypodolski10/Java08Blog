<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Trang chủ</title>

<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<%@ include file="/WEB-INF/views/layout/include-css.jsp"%>

</head>

<body>

	<!-- Navbar -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<!-- Carousel -->
	<div id="slideShow" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#slideShow" data-slide-to="0" class="active"></li>
			<li data-target="#slideShow" data-slide-to="1"></li>
			<li data-target="#slideShow" data-slide-to="2"></li>
			<li data-target="#slideShow" data-slide-to="3"></li>
		</ul>

		<!-- Images-->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/img/slide1.jpg" alt="Banner">
			</div>
			<div class="carousel-item">
				<img src="/img/slide2.jpg" alt="Banner">
			</div>
			<div class="carousel-item">
				<img src="/img/slide3.jpg" alt="Banner">
			</div>
			<div class="carousel-item">
				<img src="/img/slide4.jpg" alt="Banner">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#slideShow" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slideShow" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

	<!-- Sport-bike -->
	<section class="bg-secondary text-white border">
		<div class="container">

			<!-- Section title -->
			<div class="text-uppercase text-center pt-2">
				<a href="/sport-bike" class="text-decoration-none text-reset">
					<h2>Sport-bike</h2>
				</a>
			</div>

			<!-- List -->
			<div class="row py-3">
				<c:forEach var="bike" items="${sportBikes}" begin="0" end="8">
					<div class="col-4 img-hover mb-3">
						<a href="/motor-detail/${bike.id}" class="text-decoration-none text-reset">
							<img alt="${bike.name}" src="/files/${bike.attachments[0].name}"
							class="img-thumbnail" style="width: 500px; height: 220px;">
							<h3 class="text-capitalize text-center pt-3"><span>${bike.brand} ${bike.name}</span></h3>
						</a>
					</div>
				</c:forEach>
			</div>

			<!-- More info -->
			<div class="text-uppercase text-center py-2">
				<a href="/sport-bike" class="text-decoration-none text-reset">
					<h2>
						<i class="fas fa-angle-double-right"></i> Xem chi tiết
					</h2>
				</a>
			</div>
		</div>
	</section>

	<hr class="my-0">

	<!-- Naked-bike -->
	<section class="bg-light text-dark mt-3 border">
		<div class="container">

			<!-- Section title -->
			<div class="text-uppercase text-center pt-2">
				<a href="/naked-bike" class="text-decoration-none text-reset">
					<h2>Naked-bike</h2>
				</a>
			</div>

			<!-- List -->
			<div class="row py-3">
				<c:forEach var="bike" items="${nakedBikes}" begin="0" end="8">
					<div class="col-4 img-hover mb-3">
						<a href="/motor-detail/${bike.id}" class="text-decoration-none text-reset">
							<img alt="${bike.name}" src="/files/${bike.attachments[0].name}"
							class="img-thumbnail" style="width: 500px; height: 220px;">
							<h3 class="text-capitalize text-center pt-3"><span>${bike.brand} ${bike.name}</span></h3>
						</a>
					</div>
				</c:forEach>
			</div>

			<!-- More info -->
			<div class="text-uppercase text-center py-2">
				<a href="/naked-bike" class="text-decoration-none text-reset">
					<h2>
						<i class="fas fa-angle-double-right"></i> Xem chi tiết
					</h2>
				</a>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>