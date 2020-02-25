<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>${pageTitle.name }</title>

<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<%@ include file="/WEB-INF/views/layout/include-css.jsp"%>
</head>

<body>

	<!-- NavBar -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<!-- End NavBar -->

	<!-- Price Info -->
	<section class="motor-price">
		<div class="container">
			<!-- Motor Name -->
			<div class="product-name">
				<h2>Kawasaki H2</h2>
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
								<img src="img/H2-detail.jpg" alt="Kawasaki-H2-1">
							</div>
							<div class="carousel-item">
								<img src="img/H2-detail-2.jpg" alt="Kawasaki-H2-2">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#motorImage"
							data-slide="prev"> <span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#motorImage"
							data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
				<!-- End Slide Image -->

				<!-- Price Detail-->
				<div class="col-xl-6 price-block">
					<div class="group-price">
						<p>Phiên bản tiêu chuẩn</p>
						<p>
							Giá: <strong>990.000.000 VNĐ</strong>
						</p>
						<p>Giá bán lẻ đề xuất (Đã có thuế GTGT)</p>
					</div>

					<div class="price-bike">
						<div class="price-bike-title text-center">
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
							<div class="col row-price" style="color: red;">
								<span>990.000.00VNĐ</span>
							</div>
						</div>

						<!-- Thuế trước bạ -->
						<div class="row row-price-bike">
							<div class="col">
								<i class='fas fa-dollar-sign'></i> Thuế trước bạ:
							</div>
							<div class="col row-price">
								<span>49.500.000VNĐ</span>
							</div>
						</div>

						<!-- Phí biển số -->
						<div class="row row-price-bike">
							<div class="col">
								<i class='fas fa-dollar-sign'></i> Phí biển số
							</div>
							<div class="col row-price">
								<span>4.000.000VNĐ</span>
							</div>
						</div>

						<!-- Bảo hiểm dân sự -->
						<div class="row row-price-bike">
							<div class="col">
								<i class='fas fa-dollar-sign'></i> Bảo hiểm dân sự:
							</div>
							<div class="col row-price">
								<span>66.000VNĐ</span>
							</div>
						</div>

						<!-- Tổng cộng -->
						<div class="row row-price-bike"
							style="color: red; font-weight: bold;">
							<div class="col">
								<i class="fa fa-tags"></i> Tổng cộng:
							</div>
							<div class="col row-price">
								<span>1.043.566.000VNĐ</span>
							</div>
						</div>

						<!-- Buy button -->
						<!-- <div class="row input-icons">
                            <i class='fas fa-shopping-cart icon' style="color: white;"></i>
                            <input type="submit" class="btn btn-info btn-block buy-field" value=" Mua xe">
                        </div> -->
						<button type="button" class="btn btn-primary buy-field"
							data-toggle="modal" data-target="#buyerInfoModal">
							<i class='fas fa-shopping-cart icon' style="color: white;"></i>
							Đăng ký mua xe
						</button>

						<div class="modal fade" id="buyerInfoModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
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
										<!-- Customer registry infor-->
										<form action="#">
											<!-- Name -->
											<div class="form-group">
												<label>Họ tên:</label> <input type="text"
													class="form-control">
											</div>
											<!-- Email -->
											<div class="form-group">
												<label>Email:</label> <input type="email"
													class="form-control">
											</div>
											<!-- Personal ID-->
											<div class="form-group">
												<label>Số CMND:</label> <input type="text"
													class="form-control">
											</div>
											<!-- Phone number -->
											<div class="form-group">
												<label>Số điện thoại:</label> <input type="text"
													class="form-control">
											</div>
											<!-- Sex -->
											<div class="form-group">
												<label>Giới tính:</label>
												<!-- Male -->
												<input type="checkbox" class="custom-control-input"
													id="customCheckbox"> <label
													class="custom-control-label ml-5" for="customCheckbox">Nam</label>
												<!-- Female -->
												<input type="checkbox" class="custom-control-input"
													id="customCheckbox"> <label
													class="custom-control-label ml-5" for="customCheckbox">Nữ</label>
											</div>
											<!-- Note -->
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
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Price Detail -->
			</div>
		</div>
	</section>
	<!-- End Price Info -->


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	<!-- End Footer -->
</body>

</html>