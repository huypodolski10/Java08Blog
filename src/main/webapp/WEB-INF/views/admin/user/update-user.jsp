<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ include file="/WEB-INF/views/admin/layout/tag-lib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="/plugins/images/favicon.png">
    <title>Cập nhật người dùng</title>
    <!-- Bootstrap Core CSS -->
    <link href="/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="/css/colors/default.css" id="theme" rel="stylesheet">
</head>

<body class="fix-header">
    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <%@include file="/WEB-INF/views/admin/layout/header.jsp" %>
        <!-- ============================================================== -->
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <%@include file="/WEB-INF/views/admin/layout/left-side-bar.jsp" %>
        <!-- ============================================================== -->
        <!-- End Left Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Cập nhật người dùng</h4> 
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <div class="white-box">
                            <div class="user-bg"> <img width="100%" alt="user" src="/plugins/images/large/img1.jpg">
                                <div class="overlay-box">
                                    <div class="user-content">
                                        <a href="javascript:void(0)"><img src="/files/${user.attachment.name}" class="thumb-lg img-circle" alt="img"></a>
                                        <h4 class="text-white">${user.username}</h4>
                                        <h5 class="text-white">${user.email}</h5> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                            <form:form action="/admin/update-user" modelAttribute="user" class="form-horizontal form-material" enctype="multipart/form-data" method="post">
                                <input hidden="1" name="id" value="${user.id}">
                                <div class="form-group">
                                    <label for="username" class="col-md-12">Tên tài khoản</label>
                                    <div class="col-md-12">
                                        <input id="username" type="text" name="username" value="${user.username}" placeholder="JohnathanDoe" class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-12">Mật khẩu</label>
                                    <div class="col-md-12">
                                        <input id="password" type="password" name="password" class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input id="email" type="email" name="email" value="${user.email}" placeholder="johnathan@admin.com" class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumber" class="col-md-12">Số điện thoại</label>
                                    <div class="col-md-12">
                                        <input id="phoneNumber" type="text" name="phoneNumber" value="${user.phoneNumber}" placeholder="1234567890" class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="col-md-12">Địa chỉ</label>
                                    <div class="col-md-12">
                                        <input id="address" type="text" name="address" value="${user.address}" placeholder="Hà Nội" class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="roleChoice" class="col-sm-12">Chọn vai trò</label>
                                    <div class="col-sm-12">
                                    	<form:select id="roleChoice" path="roles" multiple="true" cssClass="form-control form-control-line">
                        					<form:options items="${roles}" itemValue="id" itemLabel="name"/>
                        				</form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                               		<label for="userImage" class="col-md-12">Ảnh đại diện</label>
                        			<div class="col-md-12">
                        				<input id="userImage" name="userImage" type="file"/>
                        			</div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Cập nhật</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <!-- ============================================================== -->
        	<!-- Footer  -->
       	 	<!-- ============================================================== -->
        	<%@include file="/WEB-INF/views/admin/layout/footer.jsp" %>
        	<!-- ============================================================== -->
        	<!-- End Footer -->
        	<!-- ============================================================== -->
        </div>
    </div>
    <!-- jQuery -->
    <script src="/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="/js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/js/custom.min.js"></script>
</body>

</html>
