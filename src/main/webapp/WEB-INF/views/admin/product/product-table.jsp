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
    <title>Product Page</title>

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
                        <h4 class="page-title">Basic Table</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Motorbike Table</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">Motorbike Table</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Brand</th>
                                            <th>Price</th>
                                            <th>Registration Tax</th>
                                            <th>License Fee</th>
                                            <th>Civil Insuarance</th>
                                            <th>Type</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="motorbike" items="${motorbikes}">
                                    	 <tr>
                                            <td>${motorbike.id}</td>
                                            <td>${motorbike.name}</td>
                                            <td>${motorbike.brand}</td>
                                            <td><fmt:formatNumber value="${motorbike.price}" type="currency"/></td>
                                            <td><fmt:formatNumber value="${motorbike.registrationTax}" type="currency"/></td>
                                            <td><fmt:formatNumber value="${motorbike.licenseFee}" type="currency"/></td>
                                            <td><fmt:formatNumber value="${motorbike.civilInsurance}" type="currency"/></td>
                                            <td>${motorbike.category.name}</td>
                                            <td><a href="/admin/update-product/${motorbike.id}"><i class="fa fa-pencil fa-fw" aria-hidden="true"></a></td>
                                            <td>
	                                            	<form id="deleteForm${motorbike.id}" action="/admin/delete-product/${motorbike.id}" hidden="1" method="post">
	                                            	</form> 
	                                            	<a id="deleteLink" title="Click to delete this product" href="#" onclick="$('#deleteForm${motorbike.id}').submit();return false;"><i class="fa fa-trash-o fa-fw" aria-hidden="true"></i></a>
	                                            </td>         
                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                           <div class="text-center">
                                <a href="/admin/add-product" class="btn btn-danger">Add Product</a>
                           </div>
                           <div class="clearfix">
								<a class="btn btn-primary float-left" href="/admin/product-table?page=${currentPage - 1 }">Quay lại</a>
								<a style="float : right" class="btn btn-primary float-right" href="/admin/product-table?page=${currentPage + 1 }">Xem tiếp</a>
						</div>
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
