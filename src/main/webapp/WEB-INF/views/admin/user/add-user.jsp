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
    <title>Thêm người dùng</title>
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond./js/1.4.2/respond.min.js"></script>
<![endif]-->
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
                        <h4 class="page-title">Thêm người dùng</h4>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                        	<form:form action="/admin/add-user" modelAttribute="user" method="post" cssClass="form-horizontal form-material" enctype="multipart/form-data">
                        		<div class="form-group">
                        			<label for="username" class="col-md-12">Tên tài khoản</label>
                        			<div class="col-md-12">
                        				<form:input id="username" path="username" placeholder="Thomas Shelby" cssClass="form-control form-control-line"/>
                        			</div>
                        		</div>
                        		<div class="form-group">
                        			<label for="password" class="col-md-12">Mật khẩu</label>
                        			<div class="col-md-12">
                        				<form:password id="password" path="password" cssClass="form-control form-control-line"/>
                        			</div>
                        		</div>
                        		<div class="form-group">
                        			<label for="email" class="col-md-12">Email</label>
                        			<div class="col-md-12">
                        				<form:input id="email" type="email" path="email" placeholder="quochuy.2.10.98@email.com" cssClass="form-control form-control-line"/>
                        			</div>
                        		</div>
                        		<div class="form-group">
                        			<label for="address" class="col-md-12">Địa chỉ</label>
                        			<div class="col-md-12">
                        				<form:input id="address" path="address" placeholder="Hà Nội" cssClass="form-control form-control-line"/>
                        			</div>
                        		</div>
                        		<div class="form-group">
                        			<label for="phoneNumber" class="col-md-12">Số điện thoại</label>
                        			<div class="col-md-12">
                        				<form:input id="phoneNumber" path="phoneNumber" placeholder="0962866198" cssClass="form-control form-control-line"/>
                        			</div>
                        		</div>
                        		<div class="form-group">
                        			<label for="roleChoice" class="col-md-12">Vai trò</label>
                        			<div class="col-md-12">
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
                                        <button type="submit" class="btn btn-success">Lưu</button>
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
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
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
