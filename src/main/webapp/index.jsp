<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>COZA Việt Nam Official Website</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css?v.1.1">
<!--===============================================================================================-->
</head>
<body class="animsition">
	<c:import url="/header" />

	<!-- Slider -->
	<section class="banner-slider p-b-40" style="margin-top: 70px;">
		<div class="swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="new-product" aria-label="Banner Slider"> <img
						src="images/bg-2.png" alt="COZA CHÀO BẠN MỚI">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="new-product" aria-label="Banner Slider">
						<img src="images/bg-1.png" alt="mlbloyalty_reward">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="new-product" aria-label="Banner Slider">
						<img
						src="https://file.hstatic.net/200000642007/file/1920x640_vn_723159492c914c908dabd24c00da338c.jpg"
						alt="Main banner_COZA">
					</a>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</section>

	<!-- HÀNG MỚI VỀ -->
	<section class="sec-product bg0 p-t-20 p-b-30">
		<div class="container">
			<div class="p-b-32"></div>
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<div class="flex-w flex-sb-m">
					<h3 class="ltext-108 cl5">HÀNG MỚI VỀ</h3>
					<ul class="nav nav-tabs" role="tablist">
						<c:forEach items="${listCC}" var="c"
							varStatus="loop">
							<li class="nav-item p-b-10"><a
								class="nav-link ${loop.first ? 'active' : ''}" data-toggle="tab"
								href="#new${c.cid}" role="tab">${c.cname}</a></li>
						</c:forEach>
					</ul>
				</div>

				<!-- Tab panes -->
				<div class="tab-content p-t-25">
					<c:forEach items="${listCC}" var="c"
						varStatus="loop">
						<div class="tab-pane fade ${loop.first ? 'show active' : ''}"
							id="new${c.cid}" role="tabpanel">
							<div class="d-flex flex-wrap">
								<div class="left-banner-2">
									<a href="category?cid=${c.cid}"> <picture>
										<source media="(max-width:991px)"
											srcset="${c.banner}" width="75" height="97">
										<source media="(min-width:992px)"
											srcset="${c.banner}" width="75" height="97">
										<img src="${c.banner}" alt="BỘ SƯU TẬP"
											width="75" height="97"> </picture> <span class="btn-view-all">Xem
											tất cả</span>
									</a>
								</div>
								<!-- Slide2 -->
								<div class="right-collection-2">
									<div class="slick2">
										<c:forEach items="${c.products}" var="p">
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
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	<!-- HÀNG BÁN CHẠY -->
	<section class="sec-product bg0 p-t-23 p-b-30">
		<div class="container">
			<div class="p-b-32"></div>
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<div class="flex-w flex-sb-m ">
					<h3 class="ltext-108 cl5">HÀNG BÁN CHẠY</h3>
					<ul class="nav nav-tabs" role="tablist">
						<c:forEach items="${listCC}" var="c"
							varStatus="loop">
							<li class="nav-item p-b-10"><a
								class="nav-link ${loop.first ? 'active' : ''}" data-toggle="tab"
								href="#bs${c.cid}" role="tab">${c.cname}</a></li>
						</c:forEach>
					</ul>
				</div>

				<!-- Tab panes -->
				<div class="tab-content p-t-25">
				<c:forEach items="${listCC}" var="c"
						varStatus="loop">
					<!-- - -->
					<div class="tab-pane fade ${loop.first ? 'show active' : ''}" id="bs${c.cid}"
						role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach items="${c.bestseller}" var="p" varStatus="loop">
									<div class="item-slick2"
										style="width: calc(25% - 13px); margin: 6.5px;">
										<!-- Block2 -->
										<div class="block2">
										<c:choose>
										    <%-- Trường hợp 1: Có giảm giá VÀ hết hàng --%>
										    <c:when test="${p.discount > 0 && p.stock == 0}">
										        <div class="block2-pic hov-img0 label-loop1" 
										             data-label="-${p.discount}%">
										             <span class="ranking">${loop.index + 1}</span>
										            <div class="label-stock1" data-label="Hết hàng"></div>
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
										        <div class="block2-pic hov-img0 label-loop1" 
										             data-label="-${p.discount}%">
										             <span class="ranking">${loop.index + 1}</span>
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
										        <div class="block2-pic hov-img0 label-stock1" 
										             data-label="Hết hàng">
										             <span class="ranking">${loop.index + 1}</span>
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
										        <span class="ranking">${loop.index + 1}</span>
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
											
											<div class="block2-txt p-l-10 p-r-10 p-t-14 p-b-10">
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
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	<!-- BỘ SƯU TẬP -->
	<section class="sec-product bg0 p-t-23 p-b-50">
		<div class="container">
			<div class="p-b-32"></div>
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<div class="flex-w flex-sb-m ">
					<h3 class="ltext-108 cl5">BỘ SƯU TẬP</h3>
					<ul class="nav nav-tabs" role="tablist">
						<c:forEach items="${listCo}" var="o"
							varStatus="loop">
							<li class="nav-item p-b-10"><a
								class="nav-link ${loop.first ? 'active' : ''}" data-toggle="tab"
								href="#bst${o.collection_id}" role="tab">${o.name}</a></li>
						</c:forEach>
					</ul>
				</div>

				<!-- Tab panes -->
				<div class="tab-content p-t-25">
					<!-- - -->
					<c:forEach items="${listCo}" var="o" varStatus="loop">
					<div class="tab-pane fade ${loop.first ? 'show active' : ''}" id="bst${o.collection_id}"
						role="tabpanel">
						<div class="item-collector">
							<div class="img-collector">
								<picture>
								<source media="(max-width:991px)"
									srcset="${o.banner}"
									data-srcset="${o.banner}">
								<source media="(min-width:992px)"
									srcset="${o.banner}"
									data-srcset="${o.banner}">
								<img width="1" height="1"
									src="${o.banner}"
									data-src="${o.banner}"
									alt="BỘ SƯU TẬP"> </picture>
							</div>
							<div class="wrapper-content-collector">
								<div class="head-collector">
									<h5>${o.style}</h5>
									<h4>${o.hashtag}</h4>
								</div>
								<div class="collection-list">
									<!-- Swiper container -->
									<div class="swiper-container product-swiper">
										<div class="swiper-wrapper">
											<!-- Slide 1 -->
											<c:forEach items="${o.products}" var="p">
											<div class="swiper-slide">
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

										<!-- Add navigation buttons -->
										<div class="swiper-button-next"></div>
										<div class="swiper-button-prev"></div>
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

	<!-- Instagram Begin -->
	<div class="bg0 instagram p-t-50 p-b-15">
		<div class="container">
			<h3 class="ltext-107 cl5 p-b-10">CẬP NHẬT THÊM TỪ @COZA_STORE</h3>
			<div class="row isotope-grid p-t-15">
				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg" data-setbg="images/insta-1.jpg"
						style="background-image: url(images/insta-1.jpg);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>
				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg"
						data-setbg="https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft51.2885-15%2F490376868_18346557916156916_3204758056369060653_n.jpg%3Fstp%3Ddst-jpg_e35_p1080x1080_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjE0NDB4MTgwMC5zZHIuZjc1NzYxLmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D108%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3DWl0u1_UBmeMQ7kNvwG8DMt6%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApABAAAA%26ccb%3D7-5%26ig_cache_key%3DMzYwODM3NDMzODU5ODU3NDU3OQ%253D%253D.3-ccb7-5%26oh%3D00_AfFo-iAdQj4YUvsG0c5iMtzSY7FMDblp6K9JCIYjhgmr6w%26oe%3D680179F6%26_nc_sid%3Db41fef"
						style="background-image: url(https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft51.2885-15%2F490376868_18346557916156916_3204758056369060653_n.jpg%3Fstp%3Ddst-jpg_e35_p1080x1080_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjE0NDB4MTgwMC5zZHIuZjc1NzYxLmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D108%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3DWl0u1_UBmeMQ7kNvwG8DMt6%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApABAAAA%26ccb%3D7-5%26ig_cache_key%3DMzYwODM3NDMzODU5ODU3NDU3OQ%253D%253D.3-ccb7-5%26oh%3D00_AfFo-iAdQj4YUvsG0c5iMtzSY7FMDblp6K9JCIYjhgmr6w%26oe%3D680179F6%26_nc_sid%3Db41fef);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>
				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg"
						data-setbg="https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F488873824_641854278479696_7366626083618539348_n.jpg%3Fse%3D7%26stp%3Dc1.0.1078.1283a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTI4My5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D108%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3D2jL2ajPE_LoQ7kNvwFtgq0a%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzYwNjIzOTAxMTQ3NzQyNTg2NA%253D%253D.3-ccb7-5%26oh%3D00_AfF7LwoXYTGaLuXVQeJqUaHpvV9q6KXeK3R0oZsVs2fOXw%26oe%3D68015875%26_nc_sid%3Db41fef"
						style="background-image: url(https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F488873824_641854278479696_7366626083618539348_n.jpg%3Fse%3D7%26stp%3Dc1.0.1078.1283a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTI4My5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D108%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3D2jL2ajPE_LoQ7kNvwFtgq0a%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzYwNjIzOTAxMTQ3NzQyNTg2NA%253D%253D.3-ccb7-5%26oh%3D00_AfF7LwoXYTGaLuXVQeJqUaHpvV9q6KXeK3R0oZsVs2fOXw%26oe%3D68015875%26_nc_sid%3Db41fef);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>

				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg"
						data-setbg="https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft51.2885-15%2F489699530_18498791944051407_1950910977557506952_n.jpg%3Fstp%3Ddst-jpg_e35_p1080x1080_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjE0NDB4MTgwMC5zZHIuZjc1NzYxLmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D103%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3Dd1h49oY2MT0Q7kNvwFQiVkz%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApABAAAA%26ccb%3D7-5%26ig_cache_key%3DMzYwNTU3NzgxMjIzMzk1Mzk4Mw%253D%253D.3-ccb7-5%26oh%3D00_AfHQSBzgcXM0sRYkozOo5nneexg_X9iy13j7cRiDSryWsA%26oe%3D680161C6%26_nc_sid%3Db41fef"
						style="background-image: url(https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft51.2885-15%2F489699530_18498791944051407_1950910977557506952_n.jpg%3Fstp%3Ddst-jpg_e35_p1080x1080_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjE0NDB4MTgwMC5zZHIuZjc1NzYxLmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D103%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3Dd1h49oY2MT0Q7kNvwFQiVkz%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApABAAAA%26ccb%3D7-5%26ig_cache_key%3DMzYwNTU3NzgxMjIzMzk1Mzk4Mw%253D%253D.3-ccb7-5%26oh%3D00_AfHQSBzgcXM0sRYkozOo5nneexg_X9iy13j7cRiDSryWsA%26oe%3D680161C6%26_nc_sid%3Db41fef);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>

				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg"
						data-setbg="https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F486353859_630772642921193_5925652257929212545_n.jpg%3Fse%3D7%26stp%3Dc0.0.1080.1349a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM1MC5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D105%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3D7x6meoZP0cYQ7kNvwFqv-wv%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5NjA5MjIwODYzOTc1MDA3NA%253D%253D.3-ccb7-5%26oh%3D00_AfE-1S-uq7FxCQgd7HnbNsjlWpNsKVgmL5GzuvFdCeaDVA%26oe%3D68015AC0%26_nc_sid%3Db41fef"
						style="background-image: url(https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F486353859_630772642921193_5925652257929212545_n.jpg%3Fse%3D7%26stp%3Dc0.0.1080.1349a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM1MC5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D105%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3D7x6meoZP0cYQ7kNvwFqv-wv%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5NjA5MjIwODYzOTc1MDA3NA%253D%253D.3-ccb7-5%26oh%3D00_AfE-1S-uq7FxCQgd7HnbNsjlWpNsKVgmL5GzuvFdCeaDVA%26oe%3D68015AC0%26_nc_sid%3Db41fef);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>

				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg"
						data-setbg="https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F485143897_626674986664292_3905360976792543970_n.jpg%3Fse%3D7%26stp%3Dc0.0.1080.1349a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM1MC5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D108%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3Dh88GmON58h8Q7kNvwHxgRVb%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5MzkxNzgzMjMxNzExOTM5NQ%253D%253D.3-ccb7-5%26oh%3D00_AfEJmZYrmuFgulWCrAzqEAzI8PEbc3S-TfDIkoCtN4D_zg%26oe%3D680177CC%26_nc_sid%3Db41fef"
						style="background-image: url(https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F485143897_626674986664292_3905360976792543970_n.jpg%3Fse%3D7%26stp%3Dc0.0.1080.1349a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM1MC5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D108%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3Dh88GmON58h8Q7kNvwHxgRVb%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5MzkxNzgzMjMxNzExOTM5NQ%253D%253D.3-ccb7-5%26oh%3D00_AfEJmZYrmuFgulWCrAzqEAzI8PEbc3S-TfDIkoCtN4D_zg%26oe%3D680177CC%26_nc_sid%3Db41fef);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>

				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg"
						data-setbg="https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F485017119_627161616615629_7040353271850701679_n.jpg%3Fse%3D7%26stp%3Dc0.1.1080.1348a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM1MC5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D105%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3DD5OmY7sCHsUQ7kNvwGOP0GF%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5MjQ2ODI2NTYyMDIwMjQzMw%253D%253D.3-ccb7-5%26oh%3D00_AfG2sO1AV-e_vJOQ1e_beQotkBHmPKLvg841u4MXjO6UIw%26oe%3D68017E8A%26_nc_sid%3Db41fef"
						style="background-image: url(https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F485017119_627161616615629_7040353271850701679_n.jpg%3Fse%3D7%26stp%3Dc0.1.1080.1348a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM1MC5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D105%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3DD5OmY7sCHsUQ7kNvwGOP0GF%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5MjQ2ODI2NTYyMDIwMjQzMw%253D%253D.3-ccb7-5%26oh%3D00_AfG2sO1AV-e_vJOQ1e_beQotkBHmPKLvg841u4MXjO6UIw%26oe%3D68017E8A%26_nc_sid%3Db41fef);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>

				<div class="isotope-item"
					style="width: calc(25% - 13px); margin: 6.5px;">
					<div class="instagram__item set-bg"
						data-setbg="https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F486669211_632210072777450_1418224315355356534_n.jpg%3Fse%3D7%26stp%3Dc0.0.1079.1349a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM0OS5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D102%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3DImfn3eJSChQQ7kNvwGND7MZ%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5NzU0MTcxNDA1MjI4MDA5OA%253D%253D.3-ccb7-5%26oh%3D00_AfHPgb4KHtzyramcT3XeRJ8x-T7yysyB8yYM2FAAgwTSkg%26oe%3D68016AD2%26_nc_sid%3Db41fef"
						style="background-image: url(https://phosphor.utils.elfsightcdn.com/?url=https%3A%2F%2Fscontent-prg1-1.cdninstagram.com%2Fv%2Ft39.30808-6%2F486669211_632210072777450_1418224315355356534_n.jpg%3Fse%3D7%26stp%3Dc0.0.1079.1349a_dst-jpg_e35_tt6%26efg%3DeyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjEwODB4MTM0OS5zZHIuZjMwODA4LmRlZmF1bHRfaW1hZ2UifQ%26_nc_ht%3Dscontent-prg1-1.cdninstagram.com%26_nc_cat%3D102%26_nc_oc%3DQ6cZ2QGmRoNxYxzrHqX9KvZaq1vVrOZFt3-kPlFgsRbWIb-DmRnIvtvGnJsvhc9SOOHK1zY%26_nc_ohc%3DImfn3eJSChQQ7kNvwGND7MZ%26_nc_gid%3DpSrBAtuTMqlPySoKD6pNfw%26edm%3DABmJApAAAAAA%26ccb%3D7-5%26ig_cache_key%3DMzU5NzU0MTcxNDA1MjI4MDA5OA%253D%253D.3-ccb7-5%26oh%3D00_AfHPgb4KHtzyramcT3XeRJ8x-T7yysyB8yYM2FAAgwTSkg%26oe%3D68016AD2%26_nc_sid%3Db41fef);">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ coza_store</a>
						</div>
						<span class="insta-image-icon"> <svg
								viewBox="0 0 45.964 45.964">
							<path
									d="M32.399,40.565H11.113v1.297c0,2.24,1.838,4.051,4.076,4.051h26.733c2.239,0,4.042-1.811,4.042-4.051V15.13c0-2.237-1.803-4.068-4.042-4.068h-1.415v21.395C40.507,36.904,36.845,40.566,32.399,40.565z"></path>
							<path
									d="M0,4.102l0,28.355c0,2.241,1.814,4.067,4.051,4.067h28.365c2.237,0,4.066-1.826,4.066-4.067l0-28.356c0-2.238-1.828-4.051-4.066-4.051H4.051C1.814,0.05,0,1.862,0,4.102z"></path>
						</svg>
						</span>
					</div>
				</div>
			</div>
			<div class="flex-c-m flex-w w-full p-t-20">
				<a href="#footer"
					class="flex-c-m stext-102 cl0 size-219 bg3 bor20 hov-btn1 p-lr-15 trans-04">
					Tải thêm </a>
			</div>
		</div>
	</div>
	<!-- Instagram End -->

	<div class="newsletter-footer" id="footer">
		<div class="container">
			<div class="wrapper-newsletter">
				<h4>ĐĂNG KÝ BẢN TIN CỦA CHÚNG TÔI</h4>
				<p>Hãy cập nhật các tin tức thời trang về sản phẩm, BST sắp ra
					mắt, chương trình khuyến mãi đặc biệt và xu hướng thời trang mới
					nhất hàng tuần của chúng tôi.</p>
				<form id="form-newsletter">
					<input required="" maxlength="100" minlength="1" type="email"
						id="email-newsletter" placeholder="Nhập email đăng ký nhận tin">
					<button type="submit">ĐĂNG KÝ</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>


	
	<!-- Chat Icon -->
    <div class="chat-icon" id="chatIcon">
        <img width="38" height="38" src="https://img.icons8.com/external-tanah-basah-glyph-tanah-basah/38/external-comment-video-and-movie-tanah-basah-glyph-tanah-basah.png" alt="external-comment-video-and-movie-tanah-basah-glyph-tanah-basah"/>
    </div>

    <!-- Chat Container -->
    <div class="chat-container" id="chatContainer">
        <div class="chat-header">
            <h3>Hỗ trợ khách hàng</h3>
            <button class="close-btn" id="closeChat">×</button>
        </div>
        <div class="chat-body" id="chatBody">
        </div>
        <div class="chat-input">
            <input type="text" id="userInput" placeholder="Nhập tin nhắn của bạn...">
            <button id="sendButton">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.5.5 0 0 1-.928.086L7.5 12.5l-4.486 1.318a.5.5 0 0 1-.658-.622L6.23 3.64 15.314.038a.5.5 0 0 1 .54.11z"/>
                </svg>
            </button>
        </div>
    </div>
    

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

										<button type="submit" name="action" value="buynow" class="buynow-update">Mua ngay</button>
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
			document.querySelector('.js-name-detail').textContent = name;

			const priceElement = document.querySelector('.js-price-detail');
			if (price < priceOld) {
				priceElement.innerHTML = formatPrice(price) + ' <del class="stext-117 cl9">' + formatPrice(priceOld) + '</del>';
			} else {
				priceElement.textContent = formatPrice(price);
			}

			const imgTag = document.querySelector('.item-slick3 img');
			const aTag = document.querySelector('.item-slick3 a');
			const thumb = document.querySelector('.item-slick3');

			if (imgTag && aTag && thumb) {
				imgTag.src = img;
				aTag.href = img;
				thumb.setAttribute('data-thumb', img);
			}
		});
	});
</script>




<script>
document.addEventListener('DOMContentLoaded', function() {
    const chatIcon = document.getElementById('chatIcon');
    const chatContainer = document.getElementById('chatContainer');
    const closeChat = document.getElementById('closeChat');
    const chatBody = document.getElementById('chatBody');
    const userInput = document.getElementById('userInput');
    const sendButton = document.getElementById('sendButton');

    // Mở/đóng chat box
    chatIcon.addEventListener('click', function() {
        chatContainer.style.display = chatContainer.style.display === 'block' ? 'none' : 'block';
    });

    closeChat.addEventListener('click', function() {
        chatContainer.style.display = 'none';
    });
    

	    // Mảng các câu hỏi mẫu và phản hồi
	    function processMessage(message) {
	    	fetch('chatbotProxy', {
	    	    method: 'POST',
	    	    headers: {
	    	        'Content-Type': 'application/x-www-form-urlencoded'
	    	    },
	    	    body: 'message=' + encodeURIComponent(message)
	    	})
	    .then(response => response.text())
	    .then(reply => {
	        addMessage(reply, 'bot');
	    })
	    .catch(error => {
	        console.error('Lỗi khi gửi tin nhắn:', error);
	        addMessage("Xin lỗi, hệ thống đang gặp sự cố.", 'bot');
	    });
	}


    // Gửi tin nhắn
    function sendMessage() {
        const message = userInput.value.trim();
        if (message !== '') {
            addMessage(message, 'user');
            userInput.value = '';
            processMessage(message);
        }
    }

    // Thêm tin nhắn vào khung chat
    function addMessage(content, sender) {
        const now = new Date();
        const timeString = now.getHours() + ':' + (now.getMinutes() < 10 ? '0' : '') + now.getMinutes();
        
        const messageDiv = document.createElement('div');
        messageDiv.className = 'chat-message ' + sender + '-message';
        
        const contentDiv = document.createElement('div');
        contentDiv.className = 'message-content';
        contentDiv.textContent = content;
        
        const timeDiv = document.createElement('div');
        timeDiv.className = 'message-time';
        timeDiv.textContent = timeString;
        
        messageDiv.appendChild(contentDiv);
        messageDiv.appendChild(timeDiv);
        
        chatBody.appendChild(messageDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
    }
    
    document.querySelectorAll('.suggestion-btn').forEach(button => {
        button.addEventListener('click', () => {
            const suggestedMessage = button.textContent;
            addMessage(suggestedMessage, 'user');
            processMessage(suggestedMessage);
        });
    });

    // Gửi tin nhắn khi nhấn nút hoặc Enter
    sendButton.addEventListener('click', sendMessage);
    userInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            sendMessage();
        }
    });

    // Mở chat box lần đầu với lời chào
    setTimeout(() => {
        addMessage("Xin chào! Mình có thể giúp gì cho bạn? 😉", 'bot');
    }, 2000);
});
</script>

</body>
</html>