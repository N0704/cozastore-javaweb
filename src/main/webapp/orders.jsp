<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Theo dõi đơn hàng COZA Việt Nam</title>
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

	<div class="container">
        <div class="layout-main-account">
            <div class="wrapper-account">
                <div class="sidebar-account">
        <div class="sidebar-inner">
            <h2>
                Tài khoản
            </h2>
            <div class="box-sidebar">
                <h4>
                    Thông tin mua hàng
                    <span><svg xmlns="http://www.w3.org/2000/svg" width="6" height="10" viewBox="0 0 6 10" fill="none"> <path d="M0.919922 1L4.91992 5L0.91992 9" stroke="black" stroke-linecap="square"></path> </svg></span>
                </h4>
                <ul>
                    <li><a href="orders"><i class="fa fa-file-text-o" aria-hidden="true"></i>Đơn hàng</a></li>
                </ul>
            </div>
            <div class="box-sidebar">
                <h4>
                    Cài đặt tài khoản
                    <span><svg xmlns="http://www.w3.org/2000/svg" width="6" height="10" viewBox="0 0 6 10" fill="none"> <path d="M0.919922 1L4.91992 5L0.91992 9" stroke="black" stroke-linecap="square"></path> </svg></span>
                </h4>
                <ul>
                    <li><a href="account"><i class="fa fa-user-o" aria-hidden="true"></i>Thông tin của tôi</a></li>
                    <li><a href="delete-acc"><i class="fa fa-trash-o" aria-hidden="true"></i>Xoá tài khoản</a></li>
                    <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Đăng xuất</a></li>
                </ul>
            </div>
        </div>		</div>
                <div class="main-account">
        <nav aria-label="breadcrumb" id="breadcrumb">
            <div class="flex-w flex-sb-m p-b-14">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10" style="font-weight: 600;">
					<a href="home" class="stext-106 cl5 hov-cl1 trans-04">
				Trang chủ
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="account" class="stext-106 cl5 hov-cl1 trans-04">
				Tài khoản
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-106 cl4">
				Đơn hàng
			</span>
			</div>
				</div>

        </nav>			
        <div class="main-account-info">
         <input type="text" id="orderSearch" placeholder="Tìm kiếm theo mã đơn hàng..." class="order-search-input">
                         	     
        <!-- Đơn hàng -->
        <c:forEach items="${orders}" var="o">
        <div class="order-card">
            <div class="order-header">
                <div class="order-code">#DH-${o.orderid}</div>
                <div class="order-date"><fmt:formatDate value="${o.orderdate}" pattern="yyyy-MM-dd HH:mm" /></div>
            </div>
            <div class="order-body">
                <div class="order-info">
                    <div class="order-product-count">${o.productCount} sản phẩm</div>
                    <div class="order-total"><fmt:formatNumber value="${o.total}" pattern="#,##0"/>₫</div>
                </div>
                <div class="order-status ${o.status eq 'Đã xác nhận' ? 'status-confirmed' : 
											     o.status eq 'Đã hủy' ? 'status-cancelled' : 
											     'status-pending'}">
											    ${o.status}</div>
            </div>
            <div class="order-footer">
                <a href="chi-tiet-don-hang?orderid=${o.orderid}" class="view-btn">Xem chi tiết</a>
            </div>
        </div>
         </c:forEach>
           
           <!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-30">
				<button id="loadmore"
					class="flex-c-m stext-102 cl0 size-219 bg3 bor20 hov-btn1 p-lr-15 trans-04">
					Tải thêm</button>
			</div>
                    
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

		<div class="order-detail">
			<div class="bg0 how-pos3-parent order-detail-content">
				<button class="close-btn cl5 hov3 trans-04 js-hide-modal1" onclick="window.location.href='orders'">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1"
                        viewBox="0 0 24 24">
                        <path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg>
                </button>


            <div class="order-detail-header">
                <div class="order-title">Đơn hàng #DH-${order.orderid}</div>
                <div class="order-subtitle">Đặt ngày <fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd" /> lúc <fmt:formatDate value="${order.orderdate}" pattern="HH:mm" /></div>
                <div class="order-detail-status">${order.status}</div>
            </div>
            
           <div class="order-detail-body">
            <div class="info-section">
                <div class="section-title">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                    Thông tin khách hàng
                </div>
                <div class="info-grid">
                    <div class="info-label">Họ tên:</div>
                    <div class="info-value">${order.fullName}</div>
                    <div class="info-label">Số điện thoại:</div>
                    <div class="info-value">${order.phone}</div>
                    <div class="info-label">Email:</div>
                    <div class="info-value">${sessionScope.acc.email} </div>
                    <div class="info-label">Địa chỉ:</div>
                    <div class="info-value">${order.address}</div>
                </div>
            </div>
            
            <div class="info-section">
                <div class="section-title">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polyline points="12 6 12 12 16 14"></polyline>
                    </svg>
                    Tiến trình đơn hàng
                </div>
                <div class="timeline">
                    <div class="timeline-step completed">
                        <div class="dot"></div>
                        <div class="timeline-title">Đơn hàng đã được đặt</div>
                        <div class="timeline-date"><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd HH:mm" /></div>
                    </div>
                    <div class="timeline-step completed">
                        <div class="dot"></div>
                        <div class="timeline-title">Đơn hàng đã xác nhận</div>
                        <div class="timeline-date"></div>
                    </div>
                    <div class="timeline-step active">
                        <div class="dot"></div>
                        <div class="timeline-title">Đã đóng gói</div>
                        <div class="timeline-date"></div>
                    </div>
                    <div class="timeline-step">
                        <div class="dot"></div>
                        <div class="timeline-title">Đã bàn giao vận chuyển</div>
                        <div class="timeline-date"></div>
                    </div>
                    <div class="timeline-step">
                        <div class="dot"></div>
                        <div class="timeline-title">Đang giao hàng</div>
                        <div class="timeline-date"></div>
                    </div>
                    <div class="timeline-step">
                        <div class="dot"></div>
                        <div class="timeline-title">Giao hàng thành công</div>
                        <div class="timeline-date"></div>
                    </div>
                </div>
            </div>
            
            <div class="info-section">
                <div class="section-title">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                        <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                        <line x1="12" y1="22.08" x2="12" y2="12"></line>
                    </svg>
                    Sản phẩm
                </div>
                <c:forEach items="${details}" var="item">
                <div class="product-item">
                    <img src="${item.img}" alt="${item.pname}" class="product-image">
                    <div class="product-name">${item.pname}</div>
                    <div class="product-qty">${item.quantity}</div>
                    <div class="product-price"><fmt:formatNumber value="${item.price.multiply(item.quantity).subtract(item.price.multiply(item.quantity).multiply(item.discount).divide(100))}" pattern="#,##0"/>₫</div>
                </div>
                </c:forEach>
            </div>
            
            <div class="order-summary">
                <div class="summary-row">
                    <div class="summary-label">Tạm tính:</div>
                    <div class="summary-value"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>₫</div>
                </div>
                <div class="summary-row">
                    <div class="summary-label">Phí vận chuyển:</div>
                    <div class="summary-value">-</div>
                </div>
                <div class="summary-row">
                    <div class="summary-label">Giảm giá:</div>
                    <div class="summary-value">-</div>
                </div>
                <div class="summary-row total-row">
                    <div class="summary-label">Tổng cộng:</div>
                    <div class="summary-value"><fmt:formatNumber value="${order.total}" pattern="#,##0"/>₫</div>
                </div>
            </div>
           </div>
			<div class="modal-footer border-top-0">
						<button type="button"
							class="btn btn-outline-secondary px-4 js-hide-modal1"
							onclick="window.location.href='orders'">Đóng</button>
					</div>

			</div>
		</div>
	</div>

	<jsp:include page="script.jsp"></jsp:include>
	<script>
    const orders = Array.from(document.querySelectorAll(".order-card"));
    const loadMoreBtn = document.getElementById("loadmore");
    const searchInput = document.getElementById("orderSearch");
    let filtered = orders; // mặc định là toàn bộ danh sách
    let currentIndex = 0;
    const batchSize = 3;

    function resetDisplay() {
        orders.forEach(o => o.style.display = "none");
    }

    function showNextBatch() {
        let count = 0;
        for (let i = currentIndex; i < filtered.length && count < batchSize; i++) {
            filtered[i].style.display = "block";
            count++;
        }
        currentIndex += count;

        loadMoreBtn.style.display = currentIndex >= filtered.length ? "none" : "block";
    }

    function applySearch() {
        const keyword = searchInput.value.trim().toLowerCase();
        currentIndex = 0;

        filtered = orders.filter(order => {
            const codeText = order.querySelector(".order-code")?.innerText.toLowerCase() || "";

            return codeText.includes(keyword);
        });

        resetDisplay();
        showNextBatch();
    }

    // Sự kiện
    loadMoreBtn.addEventListener("click", showNextBatch);
    searchInput.addEventListener("input", applySearch);

    // Khởi tạo lần đầu
    applySearch();
</script>


	<c:if test="${openOrder == true}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            $('.js-modal1').addClass('show-modal1');
        });
    </script>
</c:if>

</body>
</html>