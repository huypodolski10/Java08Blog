<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
<title>Đăng ký</title>
<%@include file="/WEB-INF/views/layout/meta.jsp"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
</head>

<body style="background-image: url('../img/register.jpg');">
	<div class="container">
		<div class="text-center">
			<a href="/home"> <img src="/img/Webike_logo.png" alt="Webike.vn"></a>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<header class="card-header text-center">
						<h4 class="card-title mt-2">Đăng ký</h4>
					</header>
					<article class="card-body">
						<form:form action="/register" modelAttribute="user" method="post" enctype="multipart/form-data">
							<div class="form-row">
								<div class="col form-group">
								<label for="username">Tên tài khoản</label> 
								<form:input id="username" path="username" cssClass="form-control"/>
							</div>
							<!-- form-group end.// -->
							<div class="col form-group">
								<label for="password">Mật khẩu</label> 
								<form:password id="password" path="password" cssClass="form-control"/>
							</div>
							<!-- form-row end.// -->
							<div class="form-group">
								<label for="email">Email</label>
								<form:input id="email" path="email" cssClass="form-control"/>
							</div>
							<!-- form-group end.// -->
							<div class="form-group">
                        		<label for="address" class="col-md-12">Địa chỉ</label>
                        		<div class="col-md-12">
                        			<form:input id="address" path="address" placeholder="Hà Nội" cssClass="form-control"/>
                        		</div>
                        	</div>
                        	<!-- form-group end.// -->
                        	<div class="form-group">
                        		<label for="phoneNumber" class="col-md-12">Số điện thoại</label>
                        		<div class="col-md-12">
                        			<form:input id="phoneNumber" path="phoneNumber" placeholder="0962866198" cssClass="form-control"/>
                        		</div>
                        	</div>
                        	<!-- form-group end.// -->
	                        <select name="roleID" hidden="1">
	                        	<option selected="selected">2</option>
	                        </select>
                        	<!-- form-group end.// -->
                        	<div class="form-group">
                        		<label for="userImage" class="col-md-12">Ảnh đại diện</label>
                        		<div class="col-md-12">
                        			<input id="userImage" name="userImage" type="file"/>
                        		</div>
                        	</div>
                        	<!-- form-group end.// -->
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-warning btn-block text-white">Đăng ký</button>
							</div>
							<!-- form-group end.// -->
						</form:form>
					</article>
					<!-- card-body end .// -->
					<div class="border-top card-body text-center">
						Đã có tài khoản? <a href="/login">Đăng nhập</a>
					</div>
				</div>
				<!-- card.// -->
			</div>
			<!-- col.//-->
		</div>
		<!-- row.//-->


	</div>
	<!--container end.//-->
</body>

</html>