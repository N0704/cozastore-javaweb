<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Thông Tin Tài Khoản</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
 <link href="images/icons/favicon.png" rel="icon">
<link href="admin/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="admin/assets/css/style.css?1.2" rel="stylesheet">

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

    <div class="pagetitle">
      <h1>Thông Tin</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
          <li class="breadcrumb-item">Tài khoản</li>
          <li class="breadcrumb-item active">Thông tin</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-12">

          <div class="card">
            <div class="card-body">
              <div class="tab-content">
                <div class="tab-pane fade show active profile-overview" id="profile-overview"> 
                <div class="profile-card pt-4 d-flex flex-column align-items-center">

              <img src="${sessionScope.acc.avatar}" alt="Profile" class="rounded-circle">
              <h2>${detail.fullname}</h2>
              <h3>Quản trị viên</h3>
            </div>
            
                  <h5 class="card-title">Thông Tin Chi Tiết</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Họ và tên</div>
                    <div class="col-lg-9 col-md-8">${detail.fullname}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Số điện thoại</div>
                    <div class="col-lg-9 col-md-8">${detail.phone}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8">${detail.email}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Địa chỉ</div>
                    <div class="col-lg-9 col-md-8">${detail.address}  </div>
                  </div>
                  
               	<div class="action-buttons d-flex gap-2 justify-content-end">
                <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#editProfileBtn">
                     Cập nhật thông tin
                </button>
                <button class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#changePasswordBtn">
                    Đổi mật khẩu
                </button>
            	</div>

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
  
  <div class="modal fade" id="editProfileBtn" tabindex="-1">
			  <div class="modal-dialog modal-dialog-scrollable">
			    <div class="modal-content">
			      <form action="update-account" method="post">
			      <input name="uid" type="hidden" class="form-control border-dark" id="uid" 
			                        value="${sessionScope.acc.uid}">
			        <div class="modal-header bg-dark text-white">
			          <h5 class="modal-title fw-bold">Cập nhật thông tin</h5>
			          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			        </div>
			        <div class="modal-body py-4">
			          <div class="container-fluid">
			                <div class="mb-3">
			                  <label for="fullname" class="form-label text-dark fw-bold">Họ và tên</label>
			                  <input name="fullname" type="text" class="form-control border-dark" id="fullname" 
			                        value="${detail.fullname}" required>
			                </div>
			                <div class="mb-3">
			                  <label for="phone" class="form-label text-dark fw-bold">Số điện thoại</label>
			                  <input name="phone" type="text" class="form-control border-dark" id="phone" 
			                        value="${detail.phone}" required>
			                </div>
			                <div class="mb-3">
			                  <label for="email" class="form-label text-dark fw-bold">Email</label>
			                  <input name="email" type="text" class="form-control border-dark" id="email" 
			                        value="${detail.email}" required>
			                </div>		                
			                <div class="mb-2">
			                  <label for="address" class="form-label text-dark fw-bold">Địa chỉ</label>
			                  <input name="address" type="text" class="form-control border-dark" id="address" 
			                        value="${detail.address}" required>
			                </div>		                 
			          </div>
			        </div>
			
			        <div class="modal-footer border-top-0">
			          <button type="button" class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal" onclick="window.location.href='menu-manager'">Hủy bỏ</button>
			          <button type="submit" class="btn btn-dark rounded-pill px-4" id="submitBtn">Lưu lại</button>
			        </div>
			      </form>
			    </div>
			  </div>
			</div>
			
			<div class="modal fade" id="changePasswordBtn" tabindex="-1">
			  <div class="modal-dialog modal-dialog-scrollable">
			    <div class="modal-content">
			      <form action="changePassword" method="post">
			        <div class="modal-header bg-dark text-white">
			          <h5 class="modal-title fw-bold">Đổi mật khẩu</h5>
			          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			        </div>
			        <div class="modal-body py-4">
			          <div class="container-fluid">
			                <div class="mb-3 toggle-password">
			                  <label for="currentPassword" class="form-label text-dark fw-bold">Mật khẩu hiện tại</label>
			                  <input name="currentPassword" type="password" class="form-control border-dark" id="currentPassword" 
			                        value="" required>
			                        <i class="bi bi-eye-fill" id="toggleCurrentPassword"></i>
			                </div>
			                <div class="mb-3 toggle-password">
			                  <label for="newPassword" class="form-label text-dark fw-bold">Mật khẩu mới</label>
			                  <input name="newPassword" type="password" class="form-control border-dark" id="newPassword" 
			                        value="" required>
			                        <i class="bi bi-eye-fill" id="toggleNewPassword"></i>
			                </div>
			                <div class="mb-2 toggle-password">
			                  <label for="confirmPassword" class="form-label text-dark fw-bold">Xác nhận mật khẩu</label>
			                  <input name="confirmPassword" type="password" class="form-control border-dark" id="confirmPassword" 
			                        value="" required>
			                  <i class="bi bi-eye-fill" id="toggleConfirmPassword"></i>
			                </div>		                	                 
			          </div>
			        </div>
			
			        <div class="modal-footer border-top-0">
			          <button type="button" class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal" onclick="window.location.href='menu-manager'">Hủy bỏ</button>
			          <button type="submit" class="btn btn-dark rounded-pill px-4" id="submitBtn">Lưu lại</button>
			        </div>
			      </form>
			    </div>
			  </div>
			</div>

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="admin/assets/vendor/quill/quill.js"></script>
  <script src="admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="admin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="admin/assets/js/main.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Toggle password visibility
        const toggleNowPassword = document.querySelector('#toggleCurrentPassword');
        const nowPassword = document.querySelector('#currentPassword');
        
        toggleNowPassword.addEventListener('click', function() {
            const type = nowPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            nowPassword.setAttribute('type', type);
            this.classList.toggle('bi-eye-fill');
            this.classList.toggle('bi-eye-slash-fill');
        });

        const togglePassword = document.querySelector('#toggleNewPassword');
        const password = document.querySelector('#newPassword');
        
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('bi-eye-fill');
            this.classList.toggle('bi-eye-slash-fill');
        });
        
        // Toggle confirm password visibility
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const confirmPassword = document.querySelector('#confirmPassword');
        
        toggleConfirmPassword.addEventListener('click', function() {
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            this.classList.toggle('bi-eye-fill');
            this.classList.toggle('bi-eye-slash-fill');
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