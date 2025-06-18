<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Quản lý sản phẩm - COZA Việt Nam</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="images/icons/favicon.png" rel="icon">
<link href="admin/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="admin/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="admin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="admin/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="admin/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="admin/assets/vendor/simple-datatables/style.css?v1.2"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/assets/css/style.css?v1.6" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<c:import url="/admin-header" />
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<jsp:include page="sidebar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main">
		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<div class="card-header">
								
								<div class="d-flex align-items-center p-3">
								<h4 class="card-title2">Quản lý đơn hàng</h4>
									<div class="search-manager d-flex align-items-center ms-auto">
										<input type="text" id="customSearchInput"
											placeholder="Tìm kiếm..." title="Enter search keyword">
										<button type="submit" title="Search">
											<i class="bi bi-search"></i>
										</button>
									</div>
								</div>
							</div>
						<table class="table table-borderless datatable">
					    <thead>
					        <tr>
					            <th class="col-1 text-center">#DH</th>
					            <th class="col-2 text-center">Ngày đặt</th>
					            <th class="col-3 text-center">Tên khách hàng</th>
					            <th class="col-2 text-center">Tổng tiền</th>
					            <th class="col-2 text-center">Trạng thái</th>
					            <th class="col-2 text-center">Hành động</th>
					        </tr>
					    </thead>
					    <tbody>
					        <c:forEach items="${listO}" var="o">
					            <tr>
					                <td class="text-center">DH-${o.orderid}</td>
					                <td class="text-center">
					                    <fmt:formatDate value="${o.orderdate}" pattern="yyyy-MM-dd" />
					                </td>
					                <td class="text-center">${o.fullName}</td>
					                <td class="text-center">
					                    <fmt:formatNumber value="${o.total}" pattern="#,##0" />₫
					                </td>
					                <!--Biểu thức điều kiện trong EL-->
					                <td class="text-center"><span class="status 
											    ${o.status eq 'Đã xác nhận' ? 'badge-light-success' : 
											     o.status eq 'Đã hủy' ? 'badge-light-error' : 
											     'badge-light-warning'}">
											    ${o.status}
											</span></td>
					                <td class="d-flex justify-content-center align-items-center gap-1">
					                    <a href="orderdetail?orderid=${o.orderid}" class="btn btn-outline-dark btn-sm" title="Chi tiết đơn hàng">
					                        <i class="bi bi-eye-fill"></i>
					                    </a>
					                 <c:choose>
					                 <c:when test="${o.status == 'Đang xử lý'}">
					                 	<form action="update-status" method="post">
			                                <input type="hidden" id="orderid" name="orderid" value="${o.orderid}">
			                                <input type="hidden" id="status" name="status" value="Đã xác nhận">
			                                <button type="submit" class="btn btn-outline-success btn-sm"  title="Xác nhận">
			                                	<i class="bi bi-check-lg"></i>
											</button>
		                            	</form>
					                 </c:when>
					                 <c:when test="${o.status == 'Đã xác nhận'}">
					                 <form action="update-status" method="post">
			                                <input type="hidden" id="orderid" name="orderid" value="${o.orderid}">
			                                <input type="hidden" id="status" name="status" value="Đã hủy">
			                                <button type="submit" class="btn btn-outline-danger btn-sm"  title="Hủy">
			                                	<i class="bi bi-x-lg"></i>
											</button>
		                            	</form>
					                 </c:when>
					                 <c:otherwise>
			                                <button type="button" class="btn btn-outline-secondary btn-sm">
			                                	<i class="bi bi-x-lg"></i>
											</button>
					                 </c:otherwise>
					                 </c:choose>
					                    
					                </td>
					            </tr>
					        </c:forEach>
					    </tbody>
					</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->


	<!-- Modal Add -->
	<div class="modal fade" id="modalOrder" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">
					<div class="modal-header bg-dark text-white">
						<h5 class="modal-title fw-bold">Đơn Hàng #DH-${order.orderid}</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="modal" aria-label="Close" onclick="window.location.href='order-manager'"></button>
					</div>
					<div class="modal-body py-4">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-7 mb-4">
								<div class="order-info">
									<h2>Thông Tin Đơn Hàng</h2>
									<div class="info-item">
									<ul>
										<li><label class="fw-700">Người đặt:</label> <span>${order.fullName}</span></li>
										<li><label class="fw-700">Điện thoại:</label> <span>${order.phone}</span></li>
										<li><label class="fw-700">Địa chỉ:</label> <span>${order.address}</span></li>
										<li><label class="fw-700">Phương thức thanh toán:</label> <span>${order.paymentMethod}</span></li>
										<li><label class="fw-700">Trạng thái thanh toán:</label> <span>${order.payment_status}</span></li>
										<li><label class="fw-700">Ngày đặt:</label> <span><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd HH:mm" /></span></li>
										<li><label class="fw-700">Trạng thái:</label> <span>${order.status}</span></li>
									</ul>
								</div>
								</div>
								</div>
								
								<div class="col-md-5 mb-4">
									<div class="detail-product">
			<button class="expanded desk-toggle-items">
				<div>
					<span>CHI TIẾT SẢN PHẨM</span>
					<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
						xmlns="http://www.w3.org/2000/svg"> <path
							d="M16.25 7.5L10 13.75L3.75 7.5" stroke="#2E2E2E"
							stroke-linecap="round" stroke-linejoin="round"></path> </svg>
			</div>
				<span class="js-cart-price"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>₫</span>
			</button>
			<div class="detail-content">
				<div class="order-summary">
					<div class="order-summary-sections">
						<div class="order-summary-section-product-list">
						    <c:forEach items="${details}" var="item">
						        <div class="product-item">
						            <div class="product-img">
						                <img alt="${item.pname}" src="${item.img}">
						            </div>
						            <div class="product-description">
						                <div class="product-title">${item.pname}</div>
						                <span class="cus-price-style">
						                    <fmt:formatNumber value="${item.price.multiply(item.quantity).subtract(item.price.multiply(item.quantity).multiply(item.discount).divide(100))}" pattern="#,##0"/>₫
						                    <span>Số lượng: ${item.quantity}</span>
						                </span>
						            </div>
						        </div>
						    </c:forEach>
						</div>
						<div class="total-line">
							<ul>
								<li><label class="fw-700">Tạm tính</label> <span
									class="subtotal-price fw-700"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>₫</span></li>
								<li><label class="fw-700">Giảm giá</label> <span>-</span></li>
								<li><label>Phí vận chuyển</label> <span>-</span></li>
							</ul>
						</div>
						<div class="total">
							<span class="fw-700">Thành tiền</span> <span
								class="subtotal-price fw-700"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>₫</span>
						</div>
					</div>
				</div>
			</div>
		</div>
									
									
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer border-top-0">
						<button type="button"
							class="btn btn-outline-secondary rounded-pill px-4"
							data-bs-dismiss="modal"
							onclick="window.location.href='order-manager'">Đóng</button>
					</div>
			</div>
		</div>
	</div>


	<!-- ======= Footer ======= -->


	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="admin/assets/vendor/chart.js/chart.umd.min.js"></script>
	<script src="admin/assets/vendor/echarts/echarts.min.js"></script>
	<script src="admin/assets/vendor/quill/quill.min.js"></script>
	<script
		src="admin/assets/vendor/simple-datatables/simple-datatables.min.js"></script>
	<script src="admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="admin/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="admin/assets/js/main.js"></script>
	<script>
  document.getElementById("customSearchInput").addEventListener("input", function () {
    const keyword = this.value.toLowerCase();
    const rows = document.querySelectorAll(".datatable tbody tr");

    rows.forEach(row => {
      const rowText = row.innerText.toLowerCase();
      if (rowText.includes(keyword)) {
        row.style.display = "";
      } else {
        row.style.display = "none";
      }
    });
  });
</script>


	<c:if test="${openOrder == true}">
		<script>
	  const orderModal = new bootstrap.Modal(document.getElementById('modalOrder'));
	  orderModal.show();
	</script>
	</c:if>

</body>

</html>