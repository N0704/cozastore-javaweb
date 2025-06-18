<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Tài khoản COZA Việt Nam</title>
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
                <c:if test="${sessionScope.acc.role == 'User'}">
                <ul>
                    <li><a href="account"><i class="fa fa-user-o" aria-hidden="true"></i>Thông tin của tôi</a></li>
                    <li><a href="delete-acc"><i class="fa fa-trash-o" aria-hidden="true"></i>Xoá tài khoản</a></li>
                    <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Đăng xuất</a></li>
                </ul>
                </c:if>
                <c:if test="${sessionScope.acc.role == 'Admin'}">
                <ul>
                    <li><a href="account"><i class="fa fa-user-o" aria-hidden="true"></i>Thông tin của tôi</a></li>
                    <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Đăng xuất</a></li>
                </ul>
                </c:if>
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
				Thông tin
			</span>
			</div>
				</div>

        </nav>			<div class="main-account-info">
                        <div class="heading-account-info">
                            TÀI KHOẢN ĐĂNG NHẬP
                        </div>
                        <div class="content-account-info">
                            <div class="item-account-info">
                                <label>Tên đăng nhập</label>
                                <span>${sessionScope.acc.username}</span>
                            </div>
                            <div class="item-account-info item-account-info-btn">
                                <label></label>
                                <span>
                                    <button class="btn-account-info change-password js-show-modal1">Đổi mật khẩu</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-account-info">
                        <div class="heading-account-info">
                            TÀI KHOẢN
                        </div>
                        <div class="content-account-info">
                            <div class="item-account-info">
                                <label>Họ và tên</label>
                                <span>
                                     ${detail.fullname}
                                </span>
                            </div>
                            <div class="item-account-info">
                                <label>Số điện thoại</label>
                                <span>
                                    ${detail.phone}
                                </span>
                            </div>
                            <div class="item-account-info">
                                <label>Địa chỉ</label>
                                <span>
                                    ${detail.address}        
                                </span>
                            </div>
                            <div class="item-account-info item-account-info-btn">
                                <label></label>
                                <span>
                                    <button class="btn-account-info update-info js-show-modal2">Cập nhật thông tin</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="email-account-info">
                        <div class="item-input-form">
                            <label class="required">Email</label>
                            <input required="" class="form-input" type="text" name="email" value="${sessionScope.acc.email} " readonly="">
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
		<div class="overlay-modal1 js-hide-modal2"></div>

		<div class="reset-password">
			<div class="bg0 how-pos3-parent reset-password-content">
				<button class="close-btn cl5 hov3 trans-04 js-hide-modal1">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1"
                        viewBox="0 0 24 24">
                        <path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg>
                </button>

                <div class="reset-password-inner">
                    <h2>Đổi mật khẩu</h2>
                    <div class="inner-form-update">
                <form action="reset-password" method="post">
                        <div class="input-form-item">
                            <label class="new-label">Mật khẩu hiện tại</label>
                            <input name="currentPassword" type="password" id="currentPassword" placeholder="Nhập mật khẩu" required>
                            <i class="zmdi zmdi-eye toggle-password" id="toggleNowPassword"></i>
                        </div>
                        <div class="input-form-item">
                            <label class="new-label">Mật khẩu mới</label>
                            <input type="password" name="newPassword" id="newPassword" placeholder="Nhập mật khẩu mới" required>
                            <i class="zmdi zmdi-eye toggle-password" id="togglePassword"></i>
                        </div>
                        <div class="input-form-item">
                            <label class="new-label">Xác nhận mật khẩu</label>
                            <input name="confirmPassword" type="password" id="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                            <i class="zmdi zmdi-eye toggle-password" id="toggleConfirmPassword"></i>
                        </div>
                        <div class="input-form-item">
                            <button type="submit" class="confirm-reset-pass">Xác nhận</button>
                        </div>
                    </form>		
                </div>
                </div>

			</div>
		</div>
	</div>

    <!-- Modal2 -->
	<div class="wrap-modal2 js-modal2 p-t-60 p-b-20">
		<div class="overlay-modal2 js-hide-modal1"></div>

		<div class="update-user-info">
			<div class="bg0 how-pos3-parent update-info-content">
				<button class="close-btn cl5 hov3 trans-04 js-hide-modal2">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1"
                        viewBox="0 0 24 24">
                        <path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg>
                </button>
				<div class="update-info-inner">
					<h2>Cập nhật thông tin</h2>
					<div class="inner-form-update">
			<form action="update-customer" id="update_customer" method="post">
			<input id="uid" value="${sessionScope.acc.uid}" type="hidden" name="uid">
						<div id="form-update-account">
							<div class="input-form-item">
								<label><span>Họ và tên</span></label>
								<input id="fullname" value="${detail.fullname}" type="text" name="fullname" placeholder="Nhập họ và tên" required>
							</div>
							<div class="input-form-item">
								<label><span>Số điện thoại</span></label>
								<input id="phone" value="${detail.phone}" type="text" name="phone" placeholder="Nhập số điện thoại" required>
							</div>
							<input id="email" value="${sessionScope.acc.email}" type="hidden" name="email">
							<div class="input-form-item">
								<label><span>Địa chỉ</span></label>
								<input id="address" value="${detail.address}" type="text" name="address" placeholder="Nhập địa chỉ" required>
							</div>
							<div class="input-form-item input-form-item-btn">
								<button type="submit" class="btn-update-profile">
									Cập nhật
								</button>
							</div>
						</div>
			</form>		</div>
				</div>
			</div>
		</div>
	</div>
	


	<jsp:include page="script.jsp"></jsp:include>

<script>
$('.js-show-modal1').on('click', function() {
    var productData = $(this).data(); // Lấy tất cả data attributes
    
    // Điền dữ liệu vào modal
    $('.js-name-detail').text(productData.name);
    $('.mtext-106').text(parseInt(productData.price).toLocaleString('vi-VN') + 'đ');
    $('.item-slick3 img').attr('src', productData.img);
    
    // QUAN TRỌNG: Đặt giá trị quantity và pid
    $('#hiddenProductId').val(productData.pid);
    $('input[name="quantity"]').val(productData.quantity).attr('value', productData.quantity);
    
    // Hiển thị modal
    $('.js-modal1').addClass('show-modal1');
});
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Toggle password visibility
        const toggleNowPassword = document.querySelector('#toggleNowPassword');
        const nowPassword = document.querySelector('#currentPassword');
        
        toggleNowPassword.addEventListener('click', function() {
            const type = nowPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            nowPassword.setAttribute('type', type);
            this.classList.toggle('zmdi-eye');
            this.classList.toggle('zmdi-eye-off');
        });

        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#newPassword');
        
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('zmdi-eye');
            this.classList.toggle('zmdi-eye-off');
        });
        
        // Toggle confirm password visibility
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const confirmPassword = document.querySelector('#confirmPassword');
        
        toggleConfirmPassword.addEventListener('click', function() {
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            this.classList.toggle('zmdi-eye');
            this.classList.toggle('zmdi-eye-off');
        });
        
        // Simple password match validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            if (password.value !== confirmPassword.value) {
                e.preventDefault();
                alert('Mật khẩu không khớp! Vui lòng kiểm tra lại.');
                confirmPassword.focus();
            }
        });
    });
</script>
</body>
</html>