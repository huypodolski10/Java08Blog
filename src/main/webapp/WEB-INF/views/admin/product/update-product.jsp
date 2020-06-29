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
    <title>Thêm sản phẩm</title>
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
                        <h4 class="page-title">Cập nhật sản phẩm</h4>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                        	<form:form cssClass="form-horizontal form-material" modelAttribute="motorbike" method="post" action="/admin/update-product" enctype="multipart/form-data">
                        		<input name="id" value="${motorbike.id}" hidden="1">
                        		<div class="form-group">
                                   <label for="name" class="col-md-12">Name</label>
                                    <div class="col-md-12">
                                    	<input id="name" name="name" value="${motorbike.name}" class="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="brand" class="col-md-12">Brand</label>
                                    <div class="col-md-12">
                                    	<input id="brand" name="brand" value="${motorbike.brand}" class="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">Price</label>
                                    <div class="col-md-12">
                                    	<input id="price" name="price" value="${motorbike.price}" class="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="registrationTax" class="col-md-12">Registration Tax</label>
                                    <div class="col-md-12">
                                    	<input id="registrationTax" name="registrationTax" value="${motorbike.registrationTax}" class="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="licenseFee" class="col-md-12">License Fee</label>
                                    <div class="col-md-12">
                                    	<input id="licenseFee" name="licenseFee" value="${motorbike.licenseFee}" class="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="civilInsurance" class="col-md-12">Civil Insurance</label>
                                    <div class="col-md-12">
                                    	<input id="civilInsurance" name="civilInsurance" value="${motorbike.civilInsurance}" class="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="category class="col-sm-12">Choose type</label>
                                    <div class="col-sm-12">
                                    	<form:select id="category" path="category.id" cssClass="form-control form-control-line">
                                    		<form:options items="${categories}" itemValue="id" itemLabel="name" />
                                    	</form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                        			<label for="motorbikeImage" class="col-md-12">Chọn ảnh</label>
                        			<div class="col-md-12">
                        				<input id="motorbikeImage" name="motorbikeImage" type="file"/>
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