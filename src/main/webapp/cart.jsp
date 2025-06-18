<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Giỏ hàng của bạn | COZA Việt Nam</title>
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
<link rel="stylesheet" type="text/css" href="css/main.css?v=1.5">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<c:import url="/header" />

	<!-- breadcrumb -->
	<div class="p-l-28 p-t-80">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="home" class="stext-106 cl8 hov-cl1 trans-04"> Trang chủ
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-106 cl4"> Giỏ hàng </span>
		</div>
	</div>

	<div class="p-t-40 p-b-50">
	<div class="wrapper-cart">
		<div class="container-wrapper-cart">
			<div class="main-cart">
				<div class="heading-cart">
					<input type="checkbox" checked="" class="select-all"> <span>Chọn
						tất cả</span>
				</div>
				<c:if test="${empty cart}">
				<div class="empty-cart">
				<div class="icon-empty-cart">
					<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64" fill="none"> <path d="M21.27 31.67C21.76 31.67 22.19 31.48 22.57 31.1C22.95 30.72 23.14 30.29 23.14 29.8C23.14 29.31 22.95 28.88 22.57 28.5C22.19 28.12 21.76 27.93 21.27 27.93C20.74 27.93 20.29 28.12 19.94 28.5C19.58 28.88 19.41 29.31 19.41 29.8C19.41 30.29 19.59 30.72 19.94 31.1C20.3 31.48 20.74 31.67 21.27 31.67ZM32.27 31.67C32.76 31.67 33.19 31.48 33.57 31.1C33.95 30.72 34.14 30.29 34.14 29.8C34.14 29.31 33.95 28.88 33.57 28.5C33.19 28.12 32.76 27.93 32.27 27.93C31.78 27.93 31.35 28.12 30.97 28.5C30.59 28.88 30.4 29.31 30.4 29.8C30.4 30.29 30.59 30.72 30.97 31.1C31.35 31.48 31.78 31.67 32.27 31.67ZM43.14 31.67C43.63 31.67 44.06 31.48 44.44 31.1C44.82 30.72 45.01 30.29 45.01 29.8C45.01 29.31 44.82 28.88 44.44 28.5C44.06 28.12 43.63 27.93 43.14 27.93C42.65 27.93 42.22 28.12 41.84 28.5C41.46 28.88 41.27 29.31 41.27 29.8C41.27 30.29 41.46 30.72 41.84 31.1C42.22 31.48 42.65 31.67 43.14 31.67ZM9 55.2V15.6C9 14.58 9.34 13.72 10.03 13.03C10.72 12.34 11.58 12 12.6 12H51.8C52.82 12 53.68 12.34 54.37 13.03C55.06 13.72 55.4 14.57 55.4 15.6V44.13C55.4 45.15 55.06 46.01 54.37 46.7C53.68 47.39 52.83 47.73 51.8 47.73H16.47L9 55.2ZM10.47 51.6L15.8 46.27H51.8C52.42 46.27 52.93 46.07 53.33 45.67C53.73 45.27 53.93 44.76 53.93 44.14V15.6C53.93 14.98 53.73 14.47 53.33 14.07C52.93 13.67 52.42 13.47 51.8 13.47H12.6C11.98 13.47 11.47 13.67 11.07 14.07C10.67 14.47 10.47 14.98 10.47 15.6V51.6Z" fill="#D0D0D0"></path> <path opacity="0.05" d="M51.8 42.2696H15.8L10.47 47.5996V51.5996L15.8 46.2696H51.8C52.42 46.2696 52.93 46.0696 53.33 45.6696C53.73 45.2696 53.93 44.7596 53.93 44.1396V40.1396C53.93 40.7596 53.73 41.2696 53.33 41.6696C52.93 42.0696 52.42 42.2696 51.8 42.2696Z" fill="black"></path> </svg>
				</div>
				<span class="text-empty-cart">Không có sản phẩm nào trong giỏ hàng</span>
			</div>
				</c:if>
				<c:if test="${not empty cart}">
				<div class="body-cart">
					<c:forEach items="${cart}" var="o">
					<div class="item-cart">
						<div class="box-media-item-cart">
							<div class="box-media">
								<div class="input-line">
									<input class="input-item-line item-checkbox" type="checkbox" data-price="${o.price.multiply(o.quantity).subtract(o.price.multiply(o.quantity).multiply(o.discount).divide(100))}" checked>
								</div>
								<div class="img-media">
									<a
										href="detail?pid=${o.pid}">
										<img
										src="${o.img}"
										alt="${o.pname}">
									</a>
								</div>
							</div>
							<div class="box-info">
								<div class="box-info-inner">
									<div class="title-item">
										<a class="item-text-cart cl5 hov-cl1 trans-04 js-name-b2 p-b-6" 
											href="detail?pid=${o.pid}">${o.pname}</a>
									</div>
									<div class="quantity-item">Số lượng: ${o.quantity}</div>
									<div class="price-item ">
										<fmt:formatNumber 
								        value="${o.price.multiply(o.quantity).subtract(o.price.multiply(o.quantity).multiply(o.discount).divide(100))}" 
								        pattern="#,##0" />₫
								        <c:if test="${o.discount > 0}">
													<del class="fs-14 cl9">
														<fmt:formatNumber value="${o.price.multiply(o.quantity)}" pattern="#,##0" />₫
													</del>
												</c:if>
									</div>
									
								</div>
							</div>
							<div class="box-delete-mobile">
								<a  href=""> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 20 20" fill="none"> <path
											d="M13.9998 6L5.99988 14" stroke="black"
											stroke-linecap="square" stroke-linejoin="round"></path> <path
											d="M6 6L13.9999 14" stroke="black" stroke-linecap="square"
											stroke-linejoin="round"></path> </svg>
								</a>
							</div>
						</div>
						<div class="box-action-item-cart">
							<div class="line-box-action">
								<button class="change-option cl5 hov-cl1 js-show-modal1"
									data-pid="${o.pid}"
									data-name="${o.pname}"
									   data-price="${o.price.multiply(o.quantity).subtract(o.price.multiply(o.quantity).multiply(o.discount).divide(100))}"
									   data-price-old="${o.price}"
									   data-img="${o.img}" data-quantity="${o.quantity}">Thay đổi tùy
									chọn</button>
									
									<form action="delete-from-cart" method="post">
		                                <input type="hidden" id="pid" name="pid" value="${o.pid}">
		                                <button type="submit" class="delete-option cl5 hov-cl1">Xóa</button>
		                            </form>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				</c:if>
				<div class="back-shopping">
					<a class="cl5 hov-cl1" href="new-product">Tiếp tục mua hàng</a>
				</div>
			</div>
			
			<div class="sidebar-cart">
				<div class="sidebar-cart-inner cl5">
					<h4>Thông tin đơn hàng</h4>
					<ul>
						<li><label>Tạm tính</label> <span class="subtotal-price"><fmt:formatNumber value="${total}" pattern="#,##0" />₫</span>
						</li>
						<li><label>Phí vận chuyển</label> <span>-</span></li>
					</ul>
					<div class="total-price-cart">
						<label>Tổng đơn hàng</label> <span class="total-price"><fmt:formatNumber value="${total}" pattern="#,##0" />₫</span>
					</div>
				</div>
				<c:if test="${sessionScope.acc.role != 'Admin'}">
				<div class="sidebar-cart-action">
					<button id="process-checkout">Thanh toán</button>
				</div>
				</c:if>
				<c:if test="${sessionScope.acc.role == 'Admin'}">
				<div class="sidebar-cart-action">
					<button class="js-show-modal2">Thanh toán</button>
				</div>
				</c:if>



				<div class="note-sidebar cl5">
					<label>Ghi chú</label>
					<textarea maxlength="2000" id="note-cart"
						placeholder="Nhập ghi chú đơn hàng" rows="2"></textarea>
					<span>0/2000</span>
				</div>
			</div>
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
								<div class="item-slick3" data-thumb="">
									<div class="wrap-pic-w pos-relative">
										<img src="" alt="IMG-PRODUCT">

										<a class="flex-c-m how-pos1 bor0 fs-14 cl10 trans-04" href="">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

							</div>
					</div>

					
				<div class="buy-right">
				<button class="close-btn cl5 hov3 trans-04 js-hide-modal1">
					<svg xmlns="http://www.w3.org/2000/svg" version="1" viewBox="0 0 24 24"><path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg>
				</button>
					<div class="p-t-10">
						<h4 class="cl5 js-name-detail">
							
						</h4>

						<span class="mtext-106 cl2">
							<fmt:formatNumber value="" pattern="#,##0" />đ
						</span>
			
						<!--  -->
							<form action="update-cart" method="post">
							<div class="p-t-28">
							<div class="p-b-10">					
								<div class="size-204 respon6-next">
								<input type="hidden" id="hiddenProductId" name="pid" value="">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="quantity" value="1" min="1">

										<div class="btn-num-product-up cl8 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</div>
							</div>
						<div class="action-wishlist p-t-10">
							<div class="close-modal cl5 hov-cl1 js-hide-modal1">Hủy</div>
							<span><svg xmlns="http://www.w3.org/2000/svg" width="2" height="14" viewBox="0 0 2 14" fill="none"> <rect x="0.5" width="1" height="14" rx="0.5" fill="white" fill-opacity="0.32"></rect> </svg></span>
							<button type="submit" class="buynow-update">Cập nhật</button>
						</div>
						</div>
                            </form>
						
						<!--  -->
						<div class="flex-w flex-m p-l-168 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
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
			</div>
			</div>
			</div>
			
			<!-- Modal2 -->
	<div class="wrap-modal2 js-modal2 p-t-60 p-b-20">
		<div class="overlay-modal2 js-hide-modal1"></div>

		<div class="notification">
			<div class="bg0 how-pos3-parent notification-content">
				<button class="close-btn cl5 hov3 trans-04 js-hide-modal2">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1"
                        viewBox="0 0 24 24">
                        <path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg>
                </button>
				<div class="notification-inner">
					<h2>Thông báo</h2>
					<p>Chức năng thanh toán không khả dụng đối với tài khoản quản trị viên.<p>
				</div>
			</div>
		</div>
	</div>
			
			<form id="checkoutForm" action="checkout" method="post">
    <!-- Các input hidden sẽ được thêm bằng JavaScript -->
</form>

<script>
document.getElementById("process-checkout").addEventListener("click", function() {
    const checkboxes = document.querySelectorAll('.item-checkbox:checked');
    
    if (checkboxes.length === 0) {
        alert("Vui lòng chọn ít nhất một sản phẩm");
        return;
    }
    
    const form = document.getElementById("checkoutForm");
    form.innerHTML = ''; // Xóa các input cũ
    
    checkboxes.forEach(checkbox => {
        const productId = checkbox.closest('.item-cart').querySelector('.change-option').dataset.pid;
        const input = document.createElement('input');
        input.type = "hidden";
        input.name = "selectedProducts";
        input.value = productId;
        form.appendChild(input);
    });
    
    form.submit();
});
</script>

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
$('.js-show-modal1').on('click', function() {
    var productData = $(this).data(); // Lấy tất cả data attributes
    
    // Điền dữ liệu vào modal
    $('.js-name-detail').text(productData.name);
    $('.item-slick3 img').attr('src', productData.img);
    
    // Xử lý hiển thị giá
    var priceElement = $('.mtext-106');
    var price = parseInt(productData.price);
    var priceOld = parseInt(productData.priceOld || price); // Nếu không có priceOld thì dùng price
    
    if (price < priceOld) {
        priceElement.html(price.toLocaleString('vi-VN') + 'đ <del class="stext-117 cl9">' + priceOld.toLocaleString('vi-VN') + 'đ</del>');
    } else {
        priceElement.text(price.toLocaleString('vi-VN') + 'đ');
    }
    
    // QUAN TRỌNG: Đặt giá trị quantity và pid
    $('#hiddenProductId').val(productData.pid);
    $('input[name="quantity"]').val(productData.quantity).attr('value', productData.quantity);
    
    // Hiển thị modal
    $('.js-modal1').addClass('show-modal1');
});
</script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const checkboxes = document.querySelectorAll('.item-checkbox');
    const subtotalSpan = document.querySelector('.subtotal-price');
    const totalSpan = document.querySelector('.total-price');
    const selectAllCheckbox = document.querySelector('.select-all');

    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN').format(amount) + "₫";
    }

    function updateTotal() {
        let total = 0;
        checkboxes.forEach(cb => {
            if (cb.checked) {
                total += parseFloat(cb.getAttribute('data-price'));
            }
        });
        subtotalSpan.textContent = formatCurrency(total);
        totalSpan.textContent = formatCurrency(total);
    }

    // Lắng nghe sự kiện click vào từng checkbox sản phẩm
    checkboxes.forEach(cb => {
        cb.addEventListener('change', function() {
            updateTotal();
            
            // Kiểm tra nếu có checkbox sản phẩm nào không được chọn
            const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
            
            // Cập nhật trạng thái của checkbox "Chọn tất cả"
            if (selectAllCheckbox) {
                selectAllCheckbox.checked = allChecked;
            }
        });
    });

    // Lắng nghe sự kiện chọn tất cả
    if (selectAllCheckbox) {
        selectAllCheckbox.addEventListener('change', function() {
            const checked = this.checked;
            checkboxes.forEach(cb => cb.checked = checked);
            updateTotal();
        });
    }

    // Gọi ban đầu
    updateTotal();
});
</script>

</body>
</html>