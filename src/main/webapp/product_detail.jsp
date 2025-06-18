<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<!DOCTYPE html>
<html lang="en">
<head>
	<title>COZA - ${listPP.pname} COZA Việt Nam</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css?v1.1">
	<link rel="stylesheet" type="text/css" href="css/main.css?v1.1">
<!--===============================================================================================-->
</head>
<body class="animsition">
	
	<c:import url="/header" />
	
	<!-- breadcrumb -->
	<div class="container p-t-80">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="home" class="stext-106 cl8 hov-cl1 trans-04">
				Trang chủ
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="category?cid=${cid}" class="stext-106 cl8 hov-cl1 trans-04">
				${cname}
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-106 cl4">
				${listPP.pname}
			</span>
		</div>
	</div>
	
	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-55 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="${listPP.img}">
									<div class="wrap-pic-w pos-relative">
										<img src="${listPP.img}" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${listPP.img}">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
					
				<div class="detail-info col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="detail-tittle cl2 js-name-detail">
							${listPP.pname}
						</h4>

						<span>
							<fmt:formatNumber value="${listPP.price * (1 - (listPP.discount / 100.0))}" pattern="#,##0" />₫
						</span>
						<c:if test="${listPP.discount > 0}">
							<del><fmt:formatNumber value="${listPP.price}" pattern="#,##0" />₫</del>
						</c:if>
						<!--  -->
						<form action="add-to-cart" method="post">
						<div class="p-t-28">
							<div class="p-b-10">
								<div class="flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>
										<input type="hidden" name="pid" value="${listPP.pid}">
										<input class="mtext-104 cl3 txt-center num-product" type="number" name="quantity" value="1" min="1">

										<div class="btn-num-product-up cl8 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
									<c:if test="${listPP.stock > 0}">
										<div class="action-wishlist p-t-20" style="min-width:400px;">
										<button type="submit" name="action" value="add" class="btn-add-to-cart hov-cl1">Thêm vào giỏ</button>
										<span><svg xmlns="http://www.w3.org/2000/svg" width="2" height="14" viewBox="0 0 2 14" fill="none"> <rect x="0.5" width="1" height="14" rx="0.5" fill="white" fill-opacity="0.32"></rect> </svg></span>
			
										<button type="submit" name="action" value="buynow" class="buynow-update">Mua ngay</button>
	
									</div>
									</c:if>
									<c:if test="${listPP.stock == 0}">
										<div class="dis-flex flex-c-m p-t-20" style="min-width:400px;">
										<div class="fs-22 cl2">Hết Hàng</div>
									</div>
									</c:if>
								</div>
								
							</div>	
						</div>
						</form>
						<!--  -->
						<div class="flex-w flex-m p-l-138 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Thêm vào mục yêu thích">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">THÔNG TIN SẢN PHẨM</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">HƯỚNG DẪN BẢO QUẢN</a>
						</li>
						
						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#tab3" role="tab">CHÍNH SÁCH ĐỔI TRẢ</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="detail-text" style="white-space: pre-line;">
									${listPP.pdesc}
								</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="detail-text" style="white-space: pre-line;">
									${listPP.pci}
								</p>
							</div>
						</div>
						
						<!-- - -->
						<div class="tab-pane fade" id="tab3" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<div class="detail-text cl3 p-t-30">
									<p><strong>Áp dụng cho toàn bộ sản phẩm quần áo nguyên giá.</strong></p>

									<p><strong>Đối tượng khách hàng:</strong> Tất cả khách hàng sử dụng dịch vụ tại <a href="home" class="cl3 fst-italic"><strong>vn.coza-store.com</strong></a></p>
									
									<p><strong>Thời gian đổi/ trả hàng:</strong></p>
									<ul>
									  <li><strong>Đổi hàng:</strong> Trong vòng 30 ngày kể từ ngày khách hàng nhận được sản phẩm.</li>
									  <li><strong>Trả hàng:</strong> Trong vòng 03 ngày kể từ ngày khách hàng nhận được sản phẩm.</li>
									</ul>
									
									<p><strong>Lưu ý:</strong> Không áp dụng cho các sản phẩm giảm giá từ 30% trở lên và các sản phẩm mua trực tiếp tại hệ thống cửa hàng của Coza.</p>
									
									<p><strong>Ghi chú:</strong> Thời hạn đổi/trả hàng được tính từ ngày khách hàng nhận hàng cho đến ngày khách hàng gửi hàng đổi/trả cho đơn vị vận chuyển.</p>
									
									<p>Tham khảo thêm thông tin tại <a href="home" class="cl3 fst-italic"><strong>Chính sách đổi trả hàng</strong></a>.</p>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-108 cl5">
					SẢN PHẨM LIÊN QUAN
				</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
					<c:forEach items="${list}" var="p">
											<div class="item-slick2"
												style="width: calc(50% - 13px); margin: 6.5px;">
												<!-- Block2 -->
												<div class="block2">
													<c:choose>
										    <%-- Trường hợp 1: Có giảm giá VÀ hết hàng --%>
										    <c:when test="${p.discount > 0 && p.stock == 0}">
										        <div class="block2-pic hov-img0 label-loop label-loop1" 
										             data-label="-${p.discount}%">
										            <div class="label-stock" data-label="Hết hàng"></div>
										            <img src="${p.img}" alt="IMG-PRODUCT">
										            <a href="#"
															   data-pid="${p.pid}"
															   data-name="${p.pname}"
															   data-price="${p.price * (1 - p.discount / 100)}"
															   data-price-old="${p.price}"
															   data-img="${p.img}"
															   class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"
															   style="pointer-events: none; opacity: 0.5;">
										               			Mua ngay
															</a>
										        </div>
										    </c:when>
										    
										    <%-- Trường hợp 2: Có giảm giá KHÔNG hết hàng --%>
										    <c:when test="${p.discount > 0 && p.stock > 0}">
										        <div class="block2-pic hov-img0 label-loop" 
										             data-label="-${p.discount}%">
										            <img src="${p.img}" alt="IMG-PRODUCT">
										            <a href="#"
															   data-pid="${p.pid}"
															   data-name="${p.pname}"
															   data-price="${p.price * (1 - p.discount / 100)}"
															   data-price-old="${p.price}"
															   data-img="${p.img}"
															   class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
										               			Mua ngay
															</a>
										        </div>
										    </c:when>
										    
										    <%-- Trường hợp 3: Hết hàng KHÔNG có giảm giá --%>
										    <c:when test="${p.discount == 0 && p.stock == 0}">
										        <div class="block2-pic hov-img0 label-stock" 
										             data-label="Hết hàng">
										            <img src="${p.img}" alt="IMG-PRODUCT">
										            <a href="#"
															   data-pid="${p.pid}"
															   data-name="${p.pname}"
															   data-price="${p.price * (1 - p.discount / 100)}"
															   data-price-old="${p.price}"
															   data-img="${p.img}"
															   class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"
															   style="pointer-events: none; opacity: 0.5;">
										               			Mua ngay
															</a>
										        </div>
										    </c:when>
										    
										    <%-- Trường hợp 4: Không giảm giá KHÔNG hết hàng --%>
										    <c:otherwise>
										        <div class="block2-pic hov-img0">
										            <img src="${p.img}" alt="IMG-PRODUCT">
										            <a href="#"
															   data-pid="${p.pid}"
															   data-name="${p.pname}"
															   data-price="${p.price * (1 - p.discount / 100)}"
															   data-price-old="${p.price}"
															   data-img="${p.img}"
															   class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
										               			Mua ngay
															</a>
										        </div>
										    </c:otherwise>
										</c:choose>
													<div class="block2-txt p-l-10 p-r-10 p-t-14 p-b-10"
														style="background-color: #fff;">
														<div class="new-item-text">
															<a href="detail?pid=${p.pid}" title="${p.pname}"
																class="item-text cl5 hov-cl1 trans-04 js-name-b2 p-b-6">
																${p.pname} </a>
															<div class="flex-sb">
															<div class="dis-flex p-t-5">
																<span class="stext-106 cl13">
																	<fmt:formatNumber value="${p.price * (1 - (p.discount / 100.0))}" pattern="#,##0" />₫
																</span>
																
																<!-- Hiển thị <del> nếu label > 0 -->
																<c:if test="${p.discount > 0}">
																	<del class="stext-118 m-l-5 cl9"><fmt:formatNumber value="${p.price}" pattern="#,##0" />₫</del>
																</c:if>
															</div>
																<div class="block2-txt-child2 flex-r p-t-2">
																	<a href="#"
																		class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
																		<img class="icon-heart1 dis-block trans-04"
																		src="images/icons/icons8-heart-1.png" alt="ICON">
																		<img class="icon-heart2 dis-block trans-04 ab-t-l"
																		src="images/icons/icons8-heart-2.png" alt="ICON">
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
						</div>
					
				</div>
			</div>
	</section>
		

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	<c:if test="${not empty sessionScope.cartMessage}">	
	<div id="jGrowl" class="top-right jGrowl">
		<div class="jGrowl-notification" style="display: none;">
			<button class="jGrowl-close">×</button>
			<div class="jGrowl-header"></div>
			<div class="jGrowl-message">
				<div class="row">
					<div class="col-md-12 col-12">
						<p class="jGrowl-text">${sessionScope.cartMessage}</p>
					</div>
					<div class="col-md-4 col-4">
						<a href="#"><img width="70px" src="${listPP.img}" alt="${listPP.pname}"></a>
					</div>
					<div class="col-md-8 col-8">
						<div class="jGrowl-note">
							<a class="jGrowl-title" href="#">${listPP.pname}</a>
							<ins><fmt:formatNumber value="${listPP.price}" pattern="#,##0" />₫</ins>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<!-- JavaScript thông báo -->
	<script>
	document.addEventListener("DOMContentLoaded", function () {
		const notification = document.querySelector(".jGrowl-notification");
		const closeBtn = document.querySelector(".jGrowl-close");
		let hideTimeout;

		notification.style.display = "block";

		function startAutoHide() {
			hideTimeout = setTimeout(() => {
				hideNotification();
			}, 3000);
		}

		function clearAutoHide() {
			clearTimeout(hideTimeout);
		}

		function hideNotification() {
			notification.style.opacity = "0";
			notification.style.transition = "opacity 0.5s ease";
			setTimeout(() => {
				notification.style.display = "none";
			}, 500);
		}

		startAutoHide();
		notification.addEventListener("mouseenter", clearAutoHide);
		notification.addEventListener("mouseleave", startAutoHide);
		closeBtn.addEventListener("click", function () {
			clearAutoHide();
			hideNotification();
		});
	});
	</script>
	
	

	<!-- XÓA THÔNG BÁO SAU KHI HIỂN THỊ -->
	<c:remove var="cartMessage" scope="session"/>
</c:if>
	

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="buynow">
			<div class="bg0 how-pos3-parent buy-content">
				<div class="buy-item">
					<div class="buy-left">
						<div class="gallery-lb">
							<div class="item-slick3" data-thumb="${listPP.img}">
								<div class="wrap-pic-w pos-relative">
									<img src="${listPP.img}" alt="IMG-PRODUCT"> <a
										class="flex-c-m how-pos1 bor0 fs-14 cl10 trans-04"
										href="${listPP.img}"> <i class="fa fa-expand"></i>
									</a>
								</div>
							</div>

						</div>
					</div>


					<div class="buy-right">
						<button class="close-btn cl5 hov3 trans-04 js-hide-modal1">
							<svg xmlns="http://www.w3.org/2000/svg" version="1"
								viewBox="0 0 24 24">
								<path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg>
						</button>
						<div class="p-t-10">
							<h4 class="cl5 js-name-detail"></h4>

							<span class="mtext-106 cl2 js-price-detail"></span>

							<!--  -->
							<form action="add-to-cart" method="post">
								<div class="p-t-28">
									<div class="p-b-10">
										<div class="size-204 respon6-next">
											<div class="wrap-num-product flex-w m-r-20 m-tb-10">
												<div class="btn-num-product-down cl8 trans-04 flex-c-m">
													<i class="fs-16 zmdi zmdi-minus"></i>
												</div>
												<input type="hidden" id="hiddenProductId" name="pid"
													value=""> <input
													class="mtext-104 cl3 txt-center num-product" type="number"
													name="quantity" value="1" min="1">

												<div class="btn-num-product-up cl8 trans-04 flex-c-m">
													<i class="fs-16 zmdi zmdi-plus"></i>
												</div>
											</div>
										</div>
									</div>
									<div class="action-wishlist p-t-10">
										<div class="close-modal cl5 hov-cl1 js-hide-modal1">Hủy</div>
										<span><svg xmlns="http://www.w3.org/2000/svg" width="2"
												height="14" viewBox="0 0 2 14" fill="none"> <rect
													x="0.5" width="1" height="14" rx="0.5" fill="white"
													fill-opacity="0.32"></rect> </svg></span>

										<button type="submit" name="action" value="buynow"
											class="buynow-update">Mua ngay</button>
									</div>
								</div>
							</form>

							<!--  -->
							<div class="flex-w flex-m p-l-168 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#"
										class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
										data-tooltip="Add to Wishlist"> <i
										class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	
<jsp:include page="script.jsp"></jsp:include>


<script>
	document.querySelectorAll('.js-show-modal1').forEach(function(button) {
	    button.addEventListener('click', function() {
	        var pid = this.getAttribute('data-pid');
	        var name = this.getAttribute('data-name');
	        var price = this.getAttribute('data-price');
	        var img = this.getAttribute('data-img');

	        // Gán PID vào input hidden
	        document.querySelector('#hiddenProductId').value = pid;
	        
	        // Set data vào modal
	        document.querySelector('.wrap-modal1 .js-name-detail').textContent = name;
	        document.querySelector('.mtext-106').textContent = parseInt(price).toLocaleString() + 'đ';
	        
	        // Thay ảnh lớn
	        document.querySelector('.wrap-modal1 .item-slick3 img').setAttribute('src', img);
	        document.querySelector('.wrap-modal1 .item-slick3 a').setAttribute('href', img);

	        // Nếu có ảnh nhỏ (thumbnail)
	        var thumbImg = document.querySelector('.wrap-modal1 .wrap-slick3-dots img');
	        if (thumbImg) {
	            thumbImg.setAttribute('src', img);
	            thumbImg.setAttribute('data-thumb', img);
	        }
	        
	    });
	});
</script>
<script>
	document.querySelectorAll('.js-show-modal1').forEach(function(button) {
		button.addEventListener('click', function () {
			const pid = this.getAttribute('data-pid');
			const name = this.getAttribute('data-name');
			const price = parseFloat(this.getAttribute('data-price'));
			const priceOld = parseFloat(this.getAttribute('data-price-old'));
			const img = this.getAttribute('data-img');

			// Format giá
			const formatPrice = (n) => n.toLocaleString('vi-VN') + '₫';

			// Gán vào modal
			document.getElementById('hiddenProductId').value = pid;
			document.querySelector('.wrap-modal1 .js-name-detail').textContent = name;

			const priceElement = document.querySelector('.wrap-modal1 .js-price-detail');
			if (price < priceOld) {
				priceElement.innerHTML = formatPrice(price) + ' <del class="stext-117 cl9">' + formatPrice(priceOld) + '</del>';
			} else {
				priceElement.textContent = formatPrice(price);
			}

			const imgTag = document.querySelector('.wrap-modal1 .item-slick3 img');
			const aTag = document.querySelector('.wrap-modal1 .item-slick3 a');
			const thumb = document.querySelector('.wrap-modal1 .item-slick3');

			if (imgTag && aTag && thumb) {
				imgTag.src = img;
				aTag.href = img;
				thumb.setAttribute('data-thumb', img);
			}
		});
	});
</script>
</body>
</html>