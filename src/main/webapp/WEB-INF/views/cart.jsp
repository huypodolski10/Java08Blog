<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/layout/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Giỏ hàng</title>

<%@ include file="/WEB-INF/views/layout/meta.jsp"%>
<%@ include file="/WEB-INF/views/layout/include-css.jsp"%>

<link href="/less/icons/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

</head>

<body>

	<!-- Navbar -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<c:set var="total" value="0" />
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Tên sản phẩm</th>
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
								<td><fmt:formatNumber value="${cart.price}" type="currency" /></td>
								<td>${cart.quantity}</td>
								<td><fmt:formatNumber value="${cart.price * cart.quantity}"
										type="currency" /></td>
								<td><a onclick="Cart.remove(${cart.motorbikeID})"><i
										class="fa fa-trash-o fa-fw" aria-hidden="true"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr class="my-4">
				<div class="text-center font-weight-bold">
					<p>
						Thành tiền:
						<fmt:formatNumber value="${total}" type="currency" />
					</p>
				</div>
				<hr class="my-4">
				<div class="text-center">
					<button type="button" class="btn btn-warning text-white"
						onclick="toCheckout()">
						<i class='fas fa-shopping-cart icon'></i>Thanh toán
					</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var Cart = {
			remove : function(motorbikeID) {
				var dataSendToBackEnd = {};
				dataSendToBackEnd["motorbikeID"] = motorbikeID;

				var jsonString = JSON.stringify(dataSendToBackEnd);

				// call ajax
				$.ajax({
					url : "/cart/remove",
					type : "post",
					contentType : "application/json", // dữ liệu gửi lên web-service có dạng là json.
					data : JSON.stringify(dataSendToBackEnd), // object json -> string json

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
		
		function toCheckout(){
			location.href = "/cart/checkout";
		}
	</script>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	</div>
</body>

</html>