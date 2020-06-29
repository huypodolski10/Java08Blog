<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Trang thanh toán</title>

<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<%@ include file="/WEB-INF/views/layout/include-css.jsp"%>

<link href="/less/icons/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

</head>

<body>

	<div class="bg-light text-dark">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/layout/header.jsp"%>

		<div class="container" style="margin-top: 50px">
			<div class="border mb-3 bg-white p-3">
				<h5 class="text-danger pt-3">
					<i class="material-icons">location_on</i>Địa chỉ nhận hàng
				</h5>
				<span><span class="font-weight-bold">Lê Quốc Huy (+84)
						962866198 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;626B - Ngách 18 -
					Ngõ 199 - Hồ Tùng Mậu, Phường Cầu Diễn, Quận Nam Từ Liêm, Hà Nội</span>
			</div>
			<div class="mt-4 p-3 bg-white border">
				<div class="col-12 mx-auto">
					<c:set var="total" value="0" />
					<table class="table table-borderless">
						<thead>
							<tr>
								<th scope="col">Sản phẩm</th>
								<th scope="col">Đơn giá</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Thành tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart" items="${gio_hang_cua_ban}">
								<c:set var="total" value="${total + cart.price * cart.quantity}" />
								<tr>
									<td>${cart.name}</td>
									<td><fmt:formatNumber value="${cart.price}"
											type="currency" /></td>
									<td>${cart.quantity}</td>
									<td><fmt:formatNumber
											value="${cart.price * cart.quantity}" type="currency" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr class="my-4">
					<div class="text-left">
						Phương thức thanh toán <span class="float-right"> <select>
								<option value="1" selected>Thanh toán khi nhận hàng</option>
								<option value="2">Thẻ tín dụng/Ghi nợ</option>
								<option value="3">Ví AirPay</option>
						</select></span>
					</div>
					<hr class="my-4">
					<div class="text-right">
						<span class="text-secondary">Tổng thanh toán:</span> <span
							class="font-weight-bold"><fmt:formatNumber
								value="${total}" type="currency" /></span>
					</div>
					<hr class="my-4">
					<div class="text-right">
						<button type="button" class="btn btn-warning text-white" data-toggle="modal" data-target="#orderModal">
							<i class='fas fa-shopping-cart icon'></i>Đặt hàng
						</button>
					</div>
					<div class="modal fade text-dark" id="orderModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Đặt hàng thành công</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="text-success text-center"><i class="fa fa-check border border-success rounded-circle p-3" aria-hidden="true" style="font-size: 75px;"></i></div>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success"
										data-dismiss="modal">Đồng ý</button>
								</div>
							</div>
						</div>
					</div>

					<script type="text/javascript">
						var Cart = {
							remove : function(motorbikeID) {
								var dataSendToBackEnd = {};
								dataSendToBackEnd["motorbikeID"] = motorbikeID;

								var jsonString = JSON
										.stringify(dataSendToBackEnd);

								// call ajax
								$
										.ajax({
											url : "/api/cart/remove",
											type : "post",
											contentType : "application/json", // dữ liệu gửi lên web-service có dạng là json.
											data : JSON
													.stringify(dataSendToBackEnd), // object json -> string json

											dataType : "json", // dữ liệu từ web-service trả về là json.
											success : function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
												if (jsonResult.statusCode == 200) {
													alert("Đã xóa khỏi giỏ hàng!");
													location.replace("/cart");
												} else {
													alert("Lỗi xảy ra! Vui lòng thử lại.");
												}
											}
										});

							}
						}
					</script>
</div>

</div>
				</div>
									<!-- Footer -->
					<div style="margin-top: 100px">
						<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
					</div>
</body>

</html>