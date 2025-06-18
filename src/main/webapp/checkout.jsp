<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COZA Việt Nam - Thanh toán đơn hàng</title>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/checkout.css?v1.1">
</head>
<body>
	<div class="container-fluid">
		<div id="checkout-header">
			<a href="home"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
			<ul class="breadcrumb-cont">
				<li class="breadcrumb-items">1 - <a href="cart">Giỏ hàng</a> <svg
						width="20" height="20" viewBox="0 0 20 20" fill="none"
						xmlns="http://www.w3.org/2000/svg"> <path
							d="M7.5 3.75L13.75 10L7.5 16.25" stroke="#2E2E2E"
							stroke-linecap="round" stroke-linejoin="round"></path> </svg></li>

				<li class="breadcrumb-items breadcrumb-items-current">Thông tin
					giao hàng</li>

			</ul>
		</div>
	</div>

	<div class="main dis-flex">
		<div class="main-content">
			<div class="content">
				<div class="section">
					<h2 class="section-title">Thông tin giao hàng</h2>
					<div class="user-info">
						<div class="user-img p-r-16">
							<img src="${sessionScope.acc.avatar}" alt="">
						</div>
						<div class="user-cont">
							<p>${sessionScope.acc.fullname}</p>
							<p>${sessionScope.acc.email}</p>
						</div>
					</div>
				</div>
				<div class="section-form p-b-35">
					<form id="checkoutForm" action="complete-checkout" method="post">
						<div class="section-form-row">
							<div class="section-form-item">
								<label for="fullname" class="form-item-label">Họ và tên</label>
								<input placeholder="Họ và tên" type="text" name="fullname"
									id="fullname" class="form-item-control" value="${sessionScope.acc.fullname}" required>
							</div>
							<div class="section-form-item">
								<label for="phone" class="form-item-label">Số điện thoại</label>
								<input placeholder="Số điện thoại" type="tel" name="phone"
									id="phone" class="form-item-control" value="${sessionScope.acc.phone}" required>
							</div>
						</div>

						<div class="section-form-address m-t-10">
							<label for="address" class="form-item-label">Địa chỉ</label> <input
								placeholder="Địa chỉ" type="text" name="address" id="address"
								class="form-item-control" value="${sessionScope.acc.address}" required>
						</div>

						<input type="hidden" name="paymentMethod" value="COD">
					</form>
				</div>
				<div class="section-shipping p-b-35">
					<h2 class="section-title m-t-18">Phương thức vận chuyển</h2>
					<div class="no-shipping">
						<svg xmlns="http://www.w3.org/2000/svg" width="108" height="85"
							viewBox="0 0 108 85">
							<g stroke="#B2B2B2" stroke-width="2" stroke-miterlimit="10"
								fill="none">
							<path d="M1 18h106M11 70.3h26m-26-6h26m-26-6h17" /></g>
							<path stroke="#B2B2B2" stroke-width="2" stroke-miterlimit="10"
								d="M1 18l10.7-17h84.7l10.6 17v61.5c0 2.5-2 4.5-4.5 4.5h-97c-2.5 0-4.5-2-4.5-4.5v-61.5zM54 1v16.6"
								fill="none" /></svg>
						<p>Hiện tại chưa có phương thức vận chuyển.</p>
					</div>
				</div>
				<div class="section-pay p-b-100">
					<h2 class="section-title m-t-18">Phương thức thanh toán</h2>
					<label class="radio-label m-t-18"
						for="payment_method_id_1003458829">
						<div class="radio-input payment-method-checkbox">
							<input type-id="1" id="payment_method_id_1003458829"
								class="input-radio" name="payment_method_id" type="radio"
								value="Thanh toán khi giao hàng (COD)" checked="">
						</div>
						<div class="radio-content-input">
							<span class="logo-checkout-payment logo-cod"> <img
								src="https://file.hstatic.net/1000284478/file/cod_icon-47_a8768752c1a445da90d600ca0a94675c.svg"
								alt="logo">
							</span>
							<div>
								<span class="radio-label-primary">Thanh toán khi giao
									hàng (COD)</span> <span class="quick-tagline hidden"></span>
							</div>
						</div>
					</label>
					<label class="radio-label" for="payment_method_id_vnpay">
						<div class="radio-input payment-method-checkbox">
							<input type="radio" id="payment_method_id_vnpay"
								class="input-radio" name="payment_method_id"
								value="Thanh toán VNPay">
						</div>
						<div class="radio-content-input">
							<span class="logo-checkout-payment logo-vnpay">
								<img src="https://file.hstatic.net/1000284478/file/vnpay-40_5dbcecd2b4eb4245a4527d357a0459fc.svg" alt="logo">
							</span>
										<div>
						<span class="radio-label-primary">Thanh toán qua VNPay</span>
					</div>
				</div>
			</label>
					
				</div>
			</div>
		</div>

		<div class="sidebar">
			<button class="expanded desk-toggle-items">
				<div>
					<span>TÓM TẮT ĐƠN HÀNG</span>
					<svg width="20" height="20" viewBox="0 0 20 20" fill="none"
						xmlns="http://www.w3.org/2000/svg"> <path
							d="M16.25 7.5L10 13.75L3.75 7.5" stroke="#2E2E2E"
							stroke-linecap="round" stroke-linejoin="round"></path> </svg>
				</div>
				<span class="js-cart-price"><fmt:formatNumber value="${orderTotal}" pattern="#,##0"/>₫</span>
			</button>
			<div class="sidebar-content">
				<div class="order-summary">
					<div class="order-summary-sections">
						<div class="order-summary-section-product-list">
						    <c:forEach items="${selectedItems}" var="item">
						        <div class="product-item m-b-8">
						            <div class="product-img">
						                <img alt="${item.pname}" src="${item.img}">
						            </div>
						            <div class="product-description p-t-10 p-l-14">
						                <div class="product-title">${item.pname}</div>
						                <span class="cus-price-style m-t-10">
						                    <span>
						                    <fmt:formatNumber value="${item.price.multiply(item.quantity).subtract(item.price.multiply(item.quantity).multiply(item.discount).divide(100))}" pattern="#,##0"/>₫
						                    <c:if test="${item.discount > 0}">
											<del class="fs-12 cl9">
												<fmt:formatNumber value="${item.price.multiply(item.quantity)}" pattern="#,##0" />₫
											</del>
											</c:if>
						                    </span>
						                    <span>Số lượng: ${item.quantity}</span>
						                </span>
						                
						            </div>
						        </div>
						    </c:forEach>
						</div>
						<div class="order-summary-section-discount">
							<label class="form-item-label" for="discount.code">Mã
								giảm giá</label>
							<div class="discount-input">
								<input placeholder="Nhập Mã Giảm Giá" class="field-input"
									size="30" type="text" id="discount.code" name="discount.code"
									value="">
								<button type="submit" class="field-input-btn">
									<span class="btn-content">Sử dụng</span>
								</button>
							</div>
						</div>
						<div class="total-line p-t-26 p-b-10">
							<ul>
								<li><label class="fw-700">Tạm tính</label> <span
									class="subtotal-price fw-700"><fmt:formatNumber value="${orderTotal}" pattern="#,##0"/>₫</span></li>
								<li><label class="fw-700">Giảm giá</label> <span>-</span></li>
								<li><label>Phí vận chuyển</label> <span>-</span></li>
							</ul>
						</div>
						<div class="total dis-flex flex-sb p-t-16">
							<span class="fw-700">Thành tiền</span> <span
								class="subtotal-price fw-700"><fmt:formatNumber value="${orderTotal}" pattern="#,##0"/>₫</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="checkout-step">
		<div class="step-footer" id="step-footer-checkout">
    <button class="success-checkout" id="completeBtn" onclick="submitCheckoutForm()" disabled>HOÀN TẤT ĐƠN HÀNG</button>									  
    <a class="step-footer-previous-link" href="cart">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> 
            <path d="M11.4375 18.75L4.6875 12L11.4375 5.25M5.625 12H19.3125" stroke="#2E2E2E" stroke-linecap="round" stroke-linejoin="round"></path> 
        </svg>quay lại giỏ hàng
    </a>
</div>
	</div>
	
		<!-- Loader HTML -->
	<div id="loader">
	  <div class="dots">
	    <div class="dot"></div>
	    <div class="dot"></div>
	    <div class="dot"></div>
	  </div>
	  <div class="message">Đang xử lý đơn hàng. Vui lòng đợi trong giây lát...</div>
	</div>
	
	<script>
function submitCheckoutForm() {
    const form = document.getElementById("checkoutForm");
    const selectedPayment = document.querySelector("input[name='payment_method_id']:checked");

    if (!selectedPayment) {
        alert("Vui lòng chọn phương thức thanh toán");
        return;
    }

    const paymentValue = selectedPayment.value;

    // Gán vào input ẩn
    form.querySelector("input[name='paymentMethod']").value = paymentValue;

    // Hiện loader
    const loader = document.getElementById("loader");
    if (loader) {
        loader.style.display = "flex";
    }

    // Xử lý theo phương thức
    if (paymentValue.includes("VNPay")) {
        setTimeout(function () {
            // Redirect sang servlet xử lý VNPay
            form.action = "vnpay-payment";
            form.submit();
        }, 3000);
    } else {
        setTimeout(function () {
            form.action = "complete-checkout"; // Mặc định COD
            form.submit();
        }, 3000);
    }
}
</script>


	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const toggleButton = document.querySelector(".desk-toggle-items");
			const productList = document
					.querySelector(".order-summary-section-product-list");
			const svgIcon = toggleButton.querySelector("svg");

			toggleButton.addEventListener("click", function() {
				// Toggle hiển thị danh sách sản phẩm
				productList.classList.toggle("hidden");

				// Xoay icon SVG bằng cách toggle class
				svgIcon.classList.toggle("flip-vertical");
			});
		});
	</script>
   
		<script>
  // Loader hiển thị tối thiểu 4 giây, sau đó mới ẩn
  window.addEventListener("load", function () {
    setTimeout(function () {
      const loader = document.getElementById("loader");
      if (loader) {
        loader.style.display = "none";
      }
    }, 3000); // 4000 ms = 4 giây
  });
</script>
	
	<script>
  window.addEventListener("load", function () {
    const fullname = document.getElementById("fullname");
    const phone = document.getElementById("phone");
    const address = document.getElementById("address");
    const completeBtn = document.getElementById("completeBtn");

    function validateFormFields() {
      const isValid =
        fullname.value.trim() !== "" &&
        phone.value.trim() !== "" &&
        address.value.trim() !== "";

      completeBtn.disabled = !isValid;
    }

    fullname.addEventListener("input", validateFormFields);
    phone.addEventListener("input", validateFormFields);
    address.addEventListener("input", validateFormFields);

    validateFormFields(); // Kiểm tra lại sau khi trang load hoàn tất
  });
</script>
	
</body>
</html>