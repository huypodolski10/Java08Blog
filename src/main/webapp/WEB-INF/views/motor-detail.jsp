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

	<!-- NavBar -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<!-- Price Info -->
	<section class="motor-price">
		<div class="container">
			<!-- Motor Name -->
			<div class="product-name text-gray">
				<h2 class="text-capitalize">${bike.brand} ${bike.name}</h2>
			</div>
			<!-- End Motor Name -->

			<!-- Motor detail -->
			<div class="row">
				<!-- Slide Image -->
				<div class="col-xl-6">
					<div id="motorImage" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#motorImage" data-slide-to="0" class="active"></li>
							<li data-target="#motorImage" data-slide-to="1"></li>
						</ul>

						<!-- Image -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="/files/${bike.attachments[0].name}" alt="${bike.attachments[0].name}"
									class="img-thumbnail">
							</div>
							<div class="carousel-item">
								<img src="/files/${bike.attachments[0].name}" alt="${bike.attachments[0].name}"
									class="img-thumbnail">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#motorImage"
							data-slide="prev"> <span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#motorImage"
							data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>

					<!-- Motor detail -->
					<div class="text-center mt-3">
						<button type="button" class="btn btn-warning text-light"
							data-toggle="modal" data-target="#motorDetailModal">Xem
							thông số kỹ thuật</button>
					</div>

					<div class="modal fade" id="motorDetailModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Thông số kỹ
										thuật</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- Motor specifications -->
									<div class="table-responsive">
										<table class="table table-striped table-sm">
											<tbody>
												<tr>
													<th class="text-nowrap" scope="row">Dài x Rộng x Cao</th>
													<td>${bike.specifications.length} x ${bike.specifications.width} x ${bike.specifications.height} mm</td>
												</tr>
												<tr>
													<th class="text-nowrap" scope="row">Dung tích bình
														xăng</th>
													<td>${bike.specifications.fuelTankCapacity} lít</td>
												</tr>
												<tr>
													<th class="text-nowrap" scope="row">Khối lượng ướt</th>
													<td>${bike.specifications.wetWeight}kg</td>
												</tr>
												<tr>
													<th class="text-nowrap" scope="row">Dung tích</th>
													<td>${bike.specifications.displacement} cc</td>
												</tr>
												<tr>
													<th class="text-nowrap" scope="row">Công suất tối đa</th>
													<td>${bike.specifications.horsePower}</td>
												</tr>
												<tr>
													<th class="text-nowrap" scope="row">Mô men xoắn cực
														đại</th>
													<td>${bike.specifications.torque}</td>
												</tr>
												<tr>
													<th class="text-nowrap" scope="row">Số xi lanh</th>
													<td>${bike.specifications.cylinders} xi-lanh</td>
												</tr>
												<tr>
													<th class="text-nowrap" scope="row">Hộp số</th>
													<td>${bike.specifications.gears} cấp</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Đóng</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Price Detail-->
				<div class="col-xl-6 price-block text-dark">
					<div class="price-bike">
						<div class="price-bike-title text-center bg-danger">
							<span>Giá xe máy tạm tính</span>
						</div>

						<!-- Khu vực -->
						<div class="row row-price-bike">
							<div class="col">
								<i class="material-icons">location_on</i> Khu vực:
							</div>
							<div class="col">
								<select class="form-control" id="choose_province">
									<option value="1" selected>Hà Nội</option>
									<option value="2">TP. HCM</option>
									<option value="3">Tỉnh thành khác</option>
								</select>
							</div>
						</div>

						<!-- Giá xe -->
						<div class="row row-price-bike">
							<div class="col">
								<i class='fas fa-dollar-sign'></i> Giá xe:
							</div>
							<div class="col row-price">
								<span><fmt:formatNumber value="${bike.price}" type="currency"/></span>
							</div>
						</div>

						<!-- Thuế trước bạ -->
						<div class="row row-price-bike">
							<div class="col">
								<i class='fas fa-dollar-sign'></i> Thuế trước bạ:
							</div>
							<div class="col row-price">
								<span><fmt:formatNumber value="${bike.registrationTax}" type="currency"/></span>
							</div>
						</div>

						<!-- Phí biển số -->
						<div class="row row-price-bike">
							<div class="col">
								<i class='fas fa-dollar-sign'></i> Phí biển số
							</div>
							<div class="col row-price">
								<span><fmt:formatNumber value="${bike.licenseFee}" type="currency"/></span>
							</div>
						</div>

						<!-- Bảo hiểm dân sự -->
						<div class="row row-price-bike">
							<div class="col">
								<i class='fas fa-dollar-sign'></i> Bảo hiểm dân sự:
							</div>
							<div class="col row-price">
								<span><fmt:formatNumber value="${bike.civilInsurance}" type="currency"/></span>
							</div>
						</div>

						<!-- Tổng cộng -->
						<div class="row row-price-bike bg-light"
							style="color: red; font-weight: bold;">
							<div class="col">
								<i class="fa fa-tags"></i> Tổng cộng:
							</div>
							<div class="col row-price">
								<c:set var="total" value="${bike.price + bike.registrationTax + bike.licenseFee + bike.civilInsurance}"/>
								<span><fmt:formatNumber value="${total}" type="currency"/></span>
							</div>
						</div>

						<!-- Buy button -->
						<button type="button" class="btn btn-warning btn-block text-white" onclick="Cart.add(${bike.id})">
							<i class='fas fa-shopping-cart icon'></i> Mua xe
						</button>

<!--					<div class="modal fade text-dark" id="buyerInfoModal"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thông tin
											đăng ký</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										
										<form action="#">
											
											<div class="form-group">
												<label>Họ tên:</label> <input type="text"
													class="form-control">
											</div>
											
											<div class="form-group">
												<label>Email:</label> <input type="email"
													class="form-control">
											</div>
											
											<div class="form-group">
												<label>Số CMND:</label> <input type="text"
													class="form-control">
											</div>
											
											<div class="form-group">
												<label>Số điện thoại:</label> <input type="text"
													class="form-control">
											</div>
											
											<div class="form-group">
												<label>Lưu ý cho người bán:</label>
												<textarea class="form-control" rows="3"></textarea>
											</div>
											<button type="submit" class="btn btn-primary" hidden=0>Submit</button>
										</form>
									</div> 
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Đăng ký</button>
									</div> -->
					</div>
				</div>
				<!-- End Price Detail -->
			</div>
		</div>
	</section>
	<!-- End Price Info -->

	<!-- Comment section -->
	<section>
		<div class="container">
			<div class="comment-wrapper">
				<div class="panel panel-info">
					<div class="panel-heading text-light">Mục bình luận</div>
					<div class="panel-body">
						<form:form modelAttribute="comment" action="/add-comment" method="post" cssClass="row">
							<div class="col-11">
								<form:textarea id="summernote" path="content" cssClass="form-control" rows="3"/>
							</div>
							<div class="col-1 mt-3">
								<button type="submit" class="btn btn-warning float-right text-light">
								Bình luận
								</button>
							</div>
						</form:form>
						<hr class="my-4">
						<ul class="media-list">
							<li class="media"><a href="#" class="float-left mr-2"> <img
									src="https://bootdey.com/img/Content/user_1.jpg" alt=""
									class="rounded-circle">
							</a>
								<div class="media-body">
									<span class="text-muted float-right"> <small
										class="text-muted">30 min ago</small>
									</span> <strong class="text-success">MartinoMont</strong>
									<p>
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem
										ipsum dolor sit amet, <a href="#">#consecteturadipiscing </a>.
									</p>
								</div></li>
							<li class="media"><a href="#" class="float-left mr-2"> <img
									src="https://bootdey.com/img/Content/user_2.jpg" alt=""
									class="rounded-circle">
							</a>
								<div class="media-body">
									<span class="text-muted float-right"> <small
										class="text-muted">30 min ago</small>
									</span> <strong class="text-success">LaurenceCorreil</strong>
									<p>
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem
										ipsum dolor <a href="#">#ipsumdolor </a>adipiscing elit.
									</p>
								</div></li>
							<li class="media"><a href="#" class="float-left mr-2"> <img
									src="https://bootdey.com/img/Content/user_3.jpg" alt=""
									class="rounded-circle">
							</a>
								<div class="media-body">
									<span class="text-muted float-right"> <small
										class="text-muted">30 min ago</small>
									</span> <strong class="text-success">JohnNida</strong>
									<p>
										Lorem ipsum dolor <a href="#">#sitamet</a> sit amet,
										consectetur adipiscing elit.
									</p>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End comment section -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<!-- End Footer -->
	
	<!-- Summernote js -->
	<script type="text/javascript">
	 	$('#summernote').summernote({
	       placeholder: 'Nhập bình luận...',
	       tabsize: 2,
	       height: 100
	     });
	 	
	 	var Cart = {
				add: function(motorbikeID) {
					var dataSendToBackEnd = {};
					dataSendToBackEnd["motorbikeID"] = motorbikeID;
					
					var jsonString = JSON.stringify(dataSendToBackEnd);
					
					// call ajax
					$.ajax({
						url: "/api/cart/add",
						type: "post",
						contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
						data: JSON.stringify(dataSendToBackEnd), // object json -> string json
						
						dataType: "json", // dữ liệu từ web-service trả về là json.
						success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
							if(jsonResult.statusCode == 200) {
								alert("Thêm thành công!");
							} else {
								alert("Lỗi!");
							}
						}
					});
									
				}				
			}
	</script>
</body>

</html>