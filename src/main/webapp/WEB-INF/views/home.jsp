<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>${pageTitle.name}</title>

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
	<section class="bg-light">
		<div class="container">

			<!-- Section title -->
			<div class="text-uppercase text-center pt-2">
				<a href="/sport-bike" class="text-decoration-none text-reset">
					<h1>
						<i class="fas fa-angle-double-right"></i> Sport-bike
					</h1>
				</a>
			</div>

			<!-- List -->
			<div class="row py-3">
				<c:forEach var="sportBike" items="${sportBikes }">
					<div class="col-4 img-hover">
						<a href="/motor-detail" class="text-decoration-none text-reset">
							<img alt="${sportBike.productName }"
							src="${sportBike.productImgUrl }" class="img-thumbnail">
							<h2 class="text-uppercase text-center pt-3">${sportBike.productName }</h2>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<hr class="my-0">

	<!-- Naked-bike -->
	<section class="bg-secondary text-white">
		<div class="container">

			<!-- Section title -->
			<div class="text-uppercase text-center pt-2">
				<a href="/naked-bike" class="text-decoration-none text-reset">
					<h1>
						<i class="fas fa-angle-double-right"></i> Naked-bike
					</h1>
				</a>
			</div>

			<!-- List -->
			<div class="row py-3">
				<c:forEach var="nakedBike" items="${nakedBikes }">
					<div class="col-4 img-hover">
						<a href="/motor-detail" class="text-decoration-none text-reset">
							<img alt="${nakedBike.productName }"
							src="${nakedBike.productImgUrl }" class="img-thumbnail">
							<h2 class="text-uppercase text-center pt-3">${nakedBike.productName }</h2>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<hr class="my-0">

	<!-- Accessories -->
	<section class="bg-light">
		<div class="container">

			<!-- Section title -->
			<div class="text-uppercase text-center pt-2">
				<a href="/bike-accessory" class="text-decoration-none text-reset">
					<h1>
						<i class="fas fa-angle-double-right"></i> Phụ tùng
					</h1>
				</a>
			</div>

			<!-- List -->
			<div class="row py-3">
				<c:forEach var="accessory" items="${accessories }">
					<div class="col-4 img-hover">
						<a href="/motor-detail" class="text-decoration-none text-reset">
							<img alt="${accessory.productName }"
							src="${accessory.productImgUrl }" class="img-thumbnail">
							<h4 class="text-uppercase text-center pt-3">${accessory.productName }</h4>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>