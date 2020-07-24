<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
<title>Đăng nhập</title>
<%@include file="/WEB-INF/views/layout/meta.jsp"%>
<%@include file="/WEB-INF/views/layout/include-css.jsp"%>
<link rel="stylesheet" href="/css/login.css">
</head>

<body>

	<div class="container">
		<div class="text-center">
			<a href="/home"> <img src="/img/Webike_logo.png" alt="Webike.vn">
			</a>
		</div>
		<div class="d-flex justify-content-center h-100 mt-5">
			<div class="card">
				<div class="card-header">
					<h3>Đăng nhập</h3>
					<div class="d-flex justify-content-end social_icon">
						<span class="unauthenticated"><a href="/login"
							title="Login with Facebook"><i class="fab fa-facebook-square"></i></a></span>
						<span><i class="fab fa-google-plus-square"></i></span> <span><i
							class="fab fa-twitter-square"></i></span>
					</div>
				</div>
				<div class="card-body">
					<form action="/perform_login" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<c:if test="${not empty param.login_error}">
							<div class="alert alert-danger" role="alert">Login attempt
								was not successful, try again.</div>
						</c:if>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input name="username" type="text" class="form-control"
								placeholder="Tên đăng nhập">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input name="password" type="password" class="form-control"
								placeholder="Mật khẩu">
						</div>
						<div class="row align-items-center remember">
							<input type="checkbox">Nhớ mật khẩu
						</div>
						<div class="form-group">
							<input type="submit" value="Đăng nhập"
								class="btn btn-warning text-light float-right">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						Không có tài khoản?<a href="/register">Đăng ký</a>
					</div>
					<div class="d-flex justify-content-center">
						<a href="#">Quên mật khẩu?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$.get("/user", function(data) {
		$("#user").html(data.userAuthentication.details.name);
		$(".unauthenticated").hide()
		$(".authenticated").show()
	});
</script>

</html>