<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<nav class="navbar navbar-light bg-light">
	<a href="/home" class="navbar-brand"> <img
		src="${pageContext.request.contextPath}/img/Webike_logo.jpg"
		alt="Webike.vn">
	</a>
	<button class="navbar-toggler" data-toggle="collapse"
		data-target="#navbarMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarMenu">
		<ul class="navbar-nav">
			<li class="nav-item align-self-center"><a href="#"
				class="nav-link">
					<h3>
						<i class='fas fa-biking'></i> Sport-bike
					</h3>
			</a></li>
			<li class="nav-item align-self-center"><a href="#"
				class="nav-link">
					<h3>
						<i class="fas fa-motorcycle"></i> Naked-bike
					</h3>
			</a></li>
			<li class="nav-item align-self-center"><a href="#"
				class="nav-link">
					<h3>
						<i class="fas fa-cogs"></i> Phụ tùng
					</h3>
			</a></li>
			<li class="nav-item align-self-center">
				<form class="form-inline" action="#">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Ninja H2, Yamaha R1,...">
					<button class="btn btn-success" type="submit">Tìm kiếm</button>
				</form>
			</li>
		</ul>
	</div>
</nav>