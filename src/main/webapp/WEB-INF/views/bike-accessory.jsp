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

	<!-- Accessories -->
	<section class="bg-light">
		<div class="container">

			<!-- Section title -->
			<div class="text-uppercase text-center pt-3">
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