<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Kết quả tìm kiếm "${txtS}" | COZA Việt Nam Official Website</title>
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
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css?v=1.1">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<c:import url="/header" />

	<div class="p-t-140">
		<div class="container">
			<!-- Search product -->
			<form action="search" method="get" class="search_product">
				<div class="dis-flex">
					<input class="search_box" type="text" name="txt"
						placeholder="Tìm kiếm sản phẩm" value="${txtS}">

					<button type="submit" class="hov-cl1">
						<i class="zmdi zmdi-search"></i>
					</button>
				</div>
			</form>
		</div>
	</div>


	<!-- Product -->
        <div class="bg0 m-t-23 p-t-60 p-b-75">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-15">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<span class="stext-302 cl5"> Kết quả tìm kiếm (${count})</span>
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn1 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Lọc
					</div>
				</div>

				
				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div
						class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<!-- Sắp xếp -->
        <div class="filter-col1 p-r-15 p-b-27">
            <div class="cl2 p-b-15">Sắp xếp theo</div>
            <ul>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&sort=price_asc" 
                       class="filter-link trans-04 ${currentSort == 'price_asc' ? 'filter-link-active' : ''}">
                       Giá: Tăng dần
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&sort=price_desc" 
                       class="filter-link trans-04 ${currentSort == 'price_desc' ? 'filter-link-active' : ''}">
                       Giá: Giảm dần
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&sort=name_asc" 
                       class="filter-link trans-04 ${currentSort == 'name_asc' ? 'filter-link-active' : ''}">
                       Tên: A-Z
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&sort=name_desc" 
                       class="filter-link trans-04 ${currentSort == 'name_desc' ? 'filter-link-active' : ''}">
                       Tên: Z-A
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}" 
                       class="filter-link trans-04 ${empty currentSort ? 'filter-link-active' : ''}">
                       Mới nhất
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&sort=oldest" 
                       class="filter-link trans-04 ${currentSort == 'oldest' ? 'filter-link-active' : ''}">
                       Cũ nhất
                    </a>
                </li>
            </ul>
        </div>

        <!-- Lọc giá -->
        <div class="filter-col2 p-r-15 p-b-27">
            <div class=" cl2 p-b-15">Giá</div>
            <ul>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}" 
                       class="filter-link trans-04 ${empty currentPrice ? 'filter-link-active' : ''}">
                       Tất cả
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&price=under200" 
                       class="filter-link trans-04 ${currentPrice == 'under200' ? 'filter-link-active' : ''}">
                       Dưới 200,000₫
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&price=200to500" 
                       class="filter-link trans-04 ${currentPrice == '200to500' ? 'filter-link-active' : ''}">
                       200,000₫ - 500,000₫
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&price=500to1000" 
                       class="filter-link trans-04 ${currentPrice == '500to1000' ? 'filter-link-active' : ''}">
                       500,000₫ - 1,000,000₫
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&price=over1000" 
                       class="filter-link trans-04 ${currentPrice == 'over1000' ? 'filter-link-active' : ''}">
                       Trên 1,000,000₫
                    </a>
                </li>
            </ul>
        </div>
        <!-- Lọc giá -->
        <div class="filter-col3 p-r-15 p-b-27">
            <div class=" cl2 p-b-15">Giảm giá</div>
            <ul>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&discount=discount10" 
                       class="filter-link trans-04 ${currentDiscount == 'discount10' ? 'filter-link-active' : ''}">
                       Từ 10% trở lên
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&discount=discount20" 
                       class="filter-link trans-04 ${currentDiscount == 'discount20' ? 'filter-link-active' : ''}">
                       Từ 20% trở lên
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&discount=discount30" 
                       class="filter-link trans-04 ${currentDiscount == 'discount30' ? 'filter-link-active' : ''}">
                       Từ 30% trở lên
                    </a>
                </li>
                <li class="p-b-6">
                    <a href="search?txt=${txtS}&discount=discount50" 
                       class="filter-link trans-04 ${currentDiscount == 'discount50' ? 'filter-link-active' : ''}">
                       Từ 50% trở lên
                    </a>
                </li>
            </ul>
        </div>


						<div class="filter-col4 p-b-27">
							<div class="cl2 p-b-15">Tags</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#"
									class="flex-c-m cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion </a> <a href="#"
									class="flex-c-m cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle </a> <a href="#"
									class="flex-c-m cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim </a> <a href="#"
									class="flex-c-m cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			 <c:if test="${empty txtS or empty listP}">
	        <div class="empty-product">
				<img src="https://file.hstatic.net/200000642007/file/nodata_f5cef3c4919e47f8a881eaaacb1f6a1c.png" alt="Tìm kiếm">
				<span>
					Không tìm thấy kết quả cho tìm kiếm của bạn<br>
					Thử một từ khóa khác
				</span>
			</div>
    		</c:if>
			<c:if test="${not empty txtS and not empty listP}">
			<div class="row isotope-grid">
				<c:forEach items="${listP}" var="o">
					<div class="isotope-item p-b-20"
						style="width: calc(25% - 13px); margin: 6.5px;">
						<!-- Block2 -->
						<div class="block2">
						<c:choose>
									<%-- Trường hợp 1: Có giảm giá VÀ hết hàng --%>
									<c:when test="${o.discount > 0 && o.stock == 0}">
										<div class="block2-pic hov-img0 label-loop label-loop1"
											data-label="-${o.discount}%">
											<div class="label-stock" data-label="Hết hàng"></div>
											<img src="${o.img}" alt="IMG-PRODUCT"> <a href="#"
												data-pid="${o.pid}" data-name="${o.pname}"
												data-price="${o.price * (1 - o.discount / 100)}"
												data-price-old="${p.price}" data-img="${o.img}"
												class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"
												style="pointer-events: none; opacity: 0.5;"> Mua ngay </a>
										</div>
									</c:when>

									<%-- Trường hợp 2: Có giảm giá KHÔNG hết hàng --%>
									<c:when test="${o.discount > 0 && o.stock > 0}">
										<div class="block2-pic hov-img0 label-loop"
											data-label="-${o.discount}%">
											<img src="${o.img}" alt="IMG-PRODUCT"> <a href="#"
												data-pid="${o.pid}" data-name="${o.pname}"
												data-price="${o.price * (1 - o.discount / 100)}"
												data-price-old="${o.price}" data-img="${o.img}"
												class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
												Mua ngay </a>
										</div>
									</c:when>

									<%-- Trường hợp 3: Hết hàng KHÔNG có giảm giá --%>
									<c:when test="${o.discount == 0 && o.stock == 0}">
										<div class="block2-pic hov-img0 label-stock"
											data-label="Hết hàng">
											<img src="${o.img}" alt="IMG-PRODUCT"> <a href="#"
												data-pid="${o.pid}" data-name="${o.pname}"
												data-price="${o.price * (1 - o.discount / 100)}"
												data-price-old="${o.price}" data-img="${o.img}"
												class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1"
												style="pointer-events: none; opacity: 0.5;"> Mua ngay </a>
										</div>
									</c:when>

									<%-- Trường hợp 4: Không giảm giá KHÔNG hết hàng --%>
									<c:otherwise>
										<div class="block2-pic hov-img0">
											<img src="${o.img}" alt="IMG-PRODUCT"> <a href="#"
												data-pid="${o.pid}" data-name="${o.pname}"
												data-price="${o.price * (1 - o.discount / 100)}"
												data-price-old="${o.price}" data-img="${o.img}"
												class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
												Mua ngay </a>
										</div>
									</c:otherwise>
								</c:choose>

							<div class="block2-txt p-l-10 p-r-10 p-t-14 p-b-10"
								style="background-color: #fff;">
								<div class="new-item-text">
									<a href="detail?pid=${o.pid}" title="${o.pname}"
										class="item-text cl5 hov-cl1 trans-04 js-name-b2 p-b-6">
										${o.pname} </a>

									<div class="flex-sb">
										<div class="dis-flex p-t-5">
											<span class="stext-106 cl13">
												<fmt:formatNumber value="${o.price * (1 - (o.discount / 100.0))}" pattern="#,##0" />₫
											</span>
											
											<!-- Hiển thị <del> nếu label > 0 -->
											<c:if test="${o.discount > 0}">
												<del class="stext-118 m-l-5 cl9"><fmt:formatNumber value="${o.price}" pattern="#,##0" />₫</del>
											</c:if>
										</div>

										<div class="block2-txt-child2 flex-r p-t-2">
											<a href="#"
												class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
												<img class="icon-heart1 dis-block trans-04"
												src="images/icons/icons8-heart-1.png" alt="ICON"> <img
												class="icon-heart2 dis-block trans-04 ab-t-l"
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
			</c:if>
			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-30">
				<button id="loadmore"
					class="flex-c-m stext-102 cl0 size-219 bg3 bor20 hov-btn1 p-lr-15 trans-04">
					Tải thêm</button>
			</div>
		</div>
	</div>

	

	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
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
	let $grid = $('.isotope-grid').isotope({
  itemSelector: '.isotope-item',
  transitionDuration: 0
});

document.addEventListener("DOMContentLoaded", function () {
        const loadMoreBtn = document.getElementById("loadmore");
        const items = document.querySelectorAll(".isotope-item");

        let itemsPerLoad = 12;
        let currentItem = 0;

        // Ẩn hết và thiết lập opacity = 0 để chuẩn bị cho fade-in
        items.forEach(item => {
            item.style.display = 'none';
            item.style.opacity = '0';
            item.style.transition = 'opacity 0.5s ease';
        });

        function showMoreItems() {
            for (let i = currentItem; i < currentItem + itemsPerLoad && i < items.length; i++) {
                // Hiển thị item và sau đó fade-in
                items[i].style.display = '';
                setTimeout(() => {
                    items[i].style.opacity = '1';
                }, 10); // Thêm delay nhỏ để đảm bảo trình duyệt nhận display change
            }
            currentItem += itemsPerLoad;

            // Re-layout isotope sau khi hiển thị thêm
            $('.isotope-grid').isotope('layout');

            if (currentItem >= items.length) {
                loadMoreBtn.style.display = "none";
            }
        }

        // Khởi tạo
        showMoreItems();

        loadMoreBtn.addEventListener("click", function (e) {
            e.preventDefault();
            showMoreItems();
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
</body>
</html>