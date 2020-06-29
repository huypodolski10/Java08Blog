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
    <title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
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
                        <h4 class="page-title">Add Product page</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="https://wrappixel.com/templates/ampleadmin/" target="_blank" class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Upgrade to Pro</a>
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Add Product Page</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                        	<form:form cssClass="form-horizontal form-material" modelAttribute="motorbike" method="post" action="/admin/add-product" enctype="multipart/form-data">
                        		<div class="form-group">
                                   <label for="name" class="col-md-12">Name</label>
                                    <div class="col-md-12">
                                    	<form:input id="name" path="name" placeholder="Ninja H2" cssClass="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="brand" class="col-md-12">Brand</label>
                                    <div class="col-md-12">
                                    	<form:input id="brand" path="brand" placeholder="Kawasaki" cssClass="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">Price</label>
                                    <div class="col-md-12">
                                    	<form:input id="price" path="price" placeholder="990000000" cssClass="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">Registration Tax</label>
                                    <div class="col-md-12">
                                    	<form:input id="registrationTax" path="registrationTax" placeholder="49500000" cssClass="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">License Fee</label>
                                    <div class="col-md-12">
                                    	<form:input id="licenseFee" path="licenseFee" placeholder="4000000" cssClass="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-md-12">Civil Insurance</label>
                                    <div class="col-md-12">
                                    	<form:input id="civilInsurance" path="civilInsurance" placeholder="66000" cssClass="form-control form-control-line"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12">Choose type</label>
                                    <div class="col-sm-12">
                                    	<form:select id="categoryID" path="category.id" cssClass="form-control form-control-line">
                                    		<form:options items="${categories}" itemValue="id" itemLabel="name" />
                                    	</form:select>
                                    </div>
                                </div>                              
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button id="sendMessageButton" type="button" class="btn btn-success" onclick="Motorbike.saveMotorbike()">Save</button>
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
        
        <script type="text/javascript">
        	var Motorbike = {
        		saveMotorbike: function() {
        			var name = $('#name').val();
        			var brand = $('#brand').val();
        			var price = $('#price').val();
        			var registrationTax = $('#registrationTax').val();
        			var licenseFee = $('#licenseFee').val();
        			var civilInsurance = $('#civilInsurance').val();
        			var categoryID = document.getElementById("categoryID").value;
        			
        			var dataSendToBackEnd = {};
        			dataSendToBackEnd["name"] = name;
        			dataSendToBackEnd["brand"] = brand;
        			dataSendToBackEnd["price"] = price;
        			dataSendToBackEnd["registrationTax"] = registrationTax;
        			dataSendToBackEnd["licenseFee"] = licenseFee;
        			dataSendToBackEnd["civilInsurance"] = civilInsurance;
        			dataSendToBackEnd["categoryID"] = categoryID;
        			
        			var jsonString = JSON.stringify(dataSendToBackEnd);
        			
        			// Call Ajax
        			$.ajax({
        				url: "/api/motorbike/save",
        				type: "post",
        				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
        				data: JSON.stringify(dataSendToBackEnd), // object json -> string json
        				
        				dataType: "json", // dữ liệu từ web-service trả về là json.
        				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
        					if(jsonResult.statusCode == 200) {
        						alert("Lưu thành công!");
        					} else {
        						alert("Lỗi!");
        					}
        				}
        			});
        		}
        	}
        </script>
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
