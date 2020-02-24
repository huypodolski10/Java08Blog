<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
				<img src="${pageContext.request.contextPath}/img/slide1.jpg"
					alt="Banner">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/slide2.jpg"
					alt="Banner">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/slide3.jpg"
					alt="Banner">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/slide4.jpg"
					alt="Banner">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#slideShow" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slideShow" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<!-- End Carousel -->

	<!-- Sport-bike -->
	<section class="bg-light">
		<div class="container">
			<!-- Section title -->
			<div class="text-uppercase text-center">
				<a href="#" class="text-decoration-none text-reset">
					<h1>
						<i class="fas fa-angle-double-right"></i> Sport-bike
					</h1>
				</a>
			</div>

			<!-- Motor list -->
			<!--  <div class="grid-item-bike">
				<ul class="row list-bike list-unstyled">
					<li class="col-lg-4 img-hover mb-5"><a href="/motor-detail">
							<img src="/img/H2.jpg" alt="Kawasaki Ninja H2"
							class="img-thumbnail img-fluid">
							<div class="info">
								<h3>Kawasaki Ninja H2</h3>
							</div>
					</a></li>
				</ul>
			</div> -->
			<div class="row py-3">
				<div class="col-4 img-hover">
					<a href="/motor-detail" class="text-decoration-none text-reset">
						<img alt="Kawasaki Ninja H2" src="/img/H2.jpg"
						class="img-thumbnail">
						<h2 class="text-uppercase text-center pt-3">Kawasaki Ninja H2</h2>
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Naked-bike -->
	<section class="bg-white">
		<div class="container">
			<!-- Title -->
			<div class="title-content">
				<h1>Naked-bike</h1>
			</div>

			<!-- Motor list -->
			<div class="grid-item-bike">
				<ul class="row list-bike list-unstyled">
					<li class="col-lg-4 img-hover mb-5"><a href="/motor-detail">
							<img src="/img/H2.jpg" alt="Kawasaki Ninja H2"
							class="img-thumbnail img-fluid">
							<div class="info">
								<h3>Kawasaki Ninja H2</h3>
							</div>
							<div class="price">
								990.000.000 <u>đ</u>
							</div>
					</a></li>
				</ul>
			</div>
		</div>
	</section>

	<!-- Components -->
	<section class="bg-light">
		<div class="container">
			<!-- Title -->
			<div class="title-content">
				<h1>Phụ tùng</h1>
			</div>

			<!-- Motor list -->
			<div class="grid-item-bike">
				<ul class="row list-bike list-unstyled">
					<li class="col-lg-4 img-hover mb-5"><a href="/motor-detail">
							<img src="/img/H2.jpg" alt="Kawasaki Ninja H2"
							class="img-thumbnail img-fluid">
							<div class="info">
								<h3>Kawasaki Ninja H2</h3>
							</div>

					</a></li>
				</ul>
			</div>
		</div>
	</section>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>