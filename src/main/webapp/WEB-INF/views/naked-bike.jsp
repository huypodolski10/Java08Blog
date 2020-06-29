<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Naked Bike</title>

<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<%@ include file="/WEB-INF/views/layout/include-css.jsp"%>

</head>

<body class="bg-light">

	<!-- Navbar -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<!-- Carousel -->
	<div id="slideShow" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#slideShow" data-slide-to="0" class="active"></li>
			<li data-target="#slideShow" data-slide-to="1"></li>
			<li data-target="#slideShow" data-slide-to="2"></li>
		</ul>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<header>
					<div class="overlay"></div>
					<video playsinline="playsinline" autoplay="autoplay" muted="muted"
						loop="loop">
						<source src="vid/Honda CBR250RR.mp4" type="video/mp4">
					</video>
					<div class="container h-100">
						<div class="d-flex h-100 text-center align-items-center">
							<div class="w-100 text-white">
								<h1 class="display-3">Honda CBR250RR Special Edition</h1>
								<p class="lead mb-0">The Art of Kabuki</p>
							</div>
						</div>
					</div>
				</header>
			</div>
			<div class="carousel-item">
				<header>
					<div class="overlay"></div>
					<video playsinline="playsinline" autoplay="autoplay" muted="muted"
						loop="loop">
						<source src="vid/Honda CBR250RR.mp4" type="video/mp4">
					</video>
					<div class="container h-100">
						<div class="d-flex h-100 text-center align-items-center">
							<div class="w-100 text-white">
								<h1 class="display-3">Honda CBR250RR Special Edition</h1>
								<p class="lead mb-0">The Art of Kabuki</p>
							</div>
						</div>
					</div>
				</header>
			</div>
			<div class="carousel-item">
				<header>
					<div class="overlay"></div>
					<video playsinline="playsinline" autoplay="autoplay" muted="muted"
						loop="loop">
						<source src="vid/Honda CBR250RR.mp4" type="video/mp4">
					</video>
					<div class="container h-100">
						<div class="d-flex h-100 text-center align-items-center">
							<div class="w-100 text-white">
								<h1 class="display-3">Honda CBR250RR Special Edition</h1>
								<p class="lead mb-0">The Art of Kabuki</p>
							</div>
						</div>
					</div>
				</header>
			</div>
		</div>
		<a class="carousel-control-prev" href="#slideShow" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#slideShow" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>

	<!-- Naked-bike -->
	<section class="bg-light text-dark">
		<div class="container">

			<!-- Section title -->
			<div class="text-uppercase text-center pt-3">
				<a href="/naked-bike" class="text-decoration-none text-reset">
					<h1>
						<i class="fas fa-angle-double-right"></i> Naked-bike
					</h1>
				</a>
			</div>

			<!-- List -->
			<div class="row py-3">
				<c:forEach var="nakedBike" items="${nakedBikes}">
					<div class="col-4 img-hover mb-5">
						<a href="/motor-detail/${nakedBike.id}" class="text-decoration-none text-reset">
  						<img alt="${nakedBike.name}" src="/files/${nakedBike.attachments[0].name}" class="img-thumbnail" style="width: 500px; height: 220px;">	
							<h3 class="text-capitalize text-center pt-3"><span>${nakedBike.brand} ${nakedBike.name}</span></h3>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<div class="clearfix text-center mb-5">
		<a class="btn btn-warning text-white" href="/naked-bike?page=${currentPage - 1}">Quay lại</a>
		<a class="btn btn-warning text-white" href="/naked-bike?page=${currentPage + 1}">Xem tiếp</a>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>