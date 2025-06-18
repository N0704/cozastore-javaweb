<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Quản lý bộ sưu tập - COZA Việt Nam</title>
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
<link href="admin/assets/vendor/simple-datatables/style.css?v1.3"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="admin/assets/css/style.css?v1.4" rel="stylesheet">

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
							<h4 class="card-title2">Quản lý người dùng</h4>
								<div class="d-flex align-items-center p-3">
								<button type="button" class="add-btn"
										data-bs-toggle="modal" data-bs-target="#modalAdd">
										 Thêm mới
									</button>
								<div class="search-manager d-flex align-items-center ms-auto">
								    <input type="text" id="customSearchInput" placeholder="Tìm kiếm..." title="Enter search keyword">
								    <button type="submit" title="Search"><i class="bi bi-search"></i></button>
								 </div>
								</div>
							</div>
							<!-- Table with stripped rows -->
							<table class="table table-borderless datatable">						
								<thead>
									<tr>
										<th class="col-2 text-center">#</th>
										<th class="col-8 text-center">Tên Menu</th>
										<th class="col-2 text-center">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="o">
										<tr>
											<td class="text-center">${o.menuID}</td>
											<td class="text-center">${o.menuName}</td>
											<td class="text-center">
											<a
												href="loadMenu?menuID=${o.menuID}"
												class="btn btn-outline-dark btn-sm" title="Cập nhật"> <i
													class="bi bi-pencil-square"></i>
											</a> 
											<a href="#" class="btn btn-outline-danger btn-sm delete-btn"
												data-mid="${o.menuID}" title="Xóa tài khoản"> <i
													class="bi bi-trash"></i>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- Modal xác nhận xóa -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content border-0 shadow-lg">
				<div class="modal-header bg-danger text-white">
					<div class="d-flex align-items-center">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							fill="currentColor" class="bi bi-exclamation-triangle-fill me-2"
							viewBox="0 0 16 16">
                        <path
								d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                    </svg>
						<h5 class="modal-title mb-0" id="deleteModalLabel">Xác nhận
							xóa</h5>
					</div>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body py-4">
					<div class="d-flex">
						<div class="flex-shrink-0 text-danger me-3">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="currentColor" class="bi bi-trash3-fill"
								viewBox="0 0 16 16">
                            <path
									d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
                        </svg>
						</div>
						<div class="flex-grow-1">
							<h6 class="fw-bold mb-2">Bạn chắc chắn muốn xóa mục này?</h6>
							<p class="text-muted mb-0">Hành động này sẽ xóa vĩnh viễn dữ
								liệu và không thể hoàn tác. Vui lòng xác nhận lại.</p>
						</div>
					</div>
				</div>
				<div class="modal-footer border-0">
					<button type="button"
						class="btn btn-outline-secondary rounded-pill px-4"
						data-bs-dismiss="modal">Hủy bỏ</button>
					<a id="confirmDeleteBtn"
						class="btn btn-danger rounded-pill px-4 d-flex align-items-center">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-trash3 me-2" viewBox="0 0 16 16">
                        <path
								d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
                    </svg> Xóa vĩnh viễn
					</a>
				</div>
			</div>
		</div>
	</div>

			<!-- Modal Add -->
			<div class="modal fade" id="modalAdd" tabindex="-1">
			  <div class="modal-dialog modal-dialog-scrollable">
			    <div class="modal-content">
			      <form action="add-menu" method="post">
			        <div class="modal-header bg-dark text-white">
			          <h5 class="modal-title fw-bold">Thêm Người Dùng Mới</h5>
			          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			        </div>
			        <div class="modal-body py-4">
			          <div class="container-fluid">
			                <div class="mb-4">
			                  <label for="menuName" class="form-label text-dark fw-bold">Tên Menu</label>
			                  <input name="menuName" type="text" class="form-control border-dark" id="menuName" 
			                        value="" required>
			                </div>
			                		                
			                 <div class="form-group mb-4">
										<label for="cid" class="form-label text-dark fw-bold">Thuộc
											danh mục:</label> <select class="form-select border-dark" name="cid"
											id="cid">
											<c:forEach items="${listC}" var="c">
												<option value="${c.cid}">${c.cname}</option>
											</c:forEach>
										</select>
									</div>
							<div class="form-group mb-3 mt-2">
										<label for="editIsActive" class="form-check-label">Hiển
											thị: </label> <input class="form-check-input" type="checkbox"
											name="IsActive" value="true" id="editIsActive" ${isChecked}>
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
			
			<!-- Modal Edit -->
			<div class="modal fade" id="modalEdit" tabindex="-1">
			  <div class="modal-dialog modal-dialog-scrollable">
			    <div class="modal-content">
			      <form action="edit-menu" method="post">
			      <input type="hidden" name="uid" value="${detail.menuID}">
			        <div class="modal-header bg-dark text-white">
			          <h5 class="modal-title fw-bold">Phân Quyền Người Dùng</h5>
			          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="window.location.href='menu-manager'"></button>
			        </div>
			        <div class="modal-body py-4">
			          <div class="container-fluid">
			                <div class="mb-4">
			                  <label for="menuName" class="form-label text-dark fw-bold">Tên Menu</label>
			                  <input name="menuName" type="text" class="form-control border-dark" id="menuName" 
			                        value="${detail.menuName}" required>
			                </div>
			                		                
			                 <div class="form-group mb-4">
										<label for="cid" class="form-label text-dark fw-bold">Thuộc
											danh mục:</label> <select class="form-select border-dark" name="cid"
											id="cid">
											<c:forEach items="${listC}" var="c">
												<option value="${c.cid}"
													<c:if test="${detail.cid == c.cid}">selected</c:if>>
													${c.cname}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group mb-3 mt-2">
										<label for="editIsActive" class="form-check-label">Hiển
											thị: </label> <input class="form-check-input" type="checkbox"
											name="IsActive" value="true" id="editIsActive" ${isChecked}>
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
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        const adminRole = document.getElementById('adminRole');
        const customerRole = document.getElementById('customerRole');
        const adminPermissions = document.getElementById('adminPermissions');
        const customerPermissions = document.getElementById('customerPermissions');
        
        // Hàm xử lý hiển thị quyền theo vai trò được chọn
        function handleRoleChange() {
            adminPermissions.classList.remove('active');
            customerPermissions.classList.remove('active');
            
            if (adminRole.checked) {
                adminPermissions.classList.add('active');
            } else if (customerRole.checked) {
                customerPermissions.classList.add('active');
            }
        }

        // Gắn sự kiện thay đổi
        adminRole.addEventListener('change', handleRoleChange);
        customerRole.addEventListener('change', handleRoleChange);

        // Gọi khi mới load để hiển thị sẵn quyền tương ứng vai trò đã chọn
        handleRoleChange();
    });
</script>



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

	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    // Khởi tạo DataTable
	    const dataTable = new simpleDatatables.DataTable(".datatable");

	    // Xử lý nút delete
	    const deleteButtons = document.querySelectorAll(".delete-btn");
	    const confirmDeleteBtn = document.getElementById("confirmDeleteBtn");
	    deleteButtons.forEach(button => {
	        button.addEventListener("click", function(event) {
	            event.preventDefault();
	            const mid = this.getAttribute("data-mid");
	            confirmDeleteBtn.href = "delete-menu?menuID=" + mid;
	            const deleteModal = new bootstrap.Modal(document.getElementById("deleteModal"));
	            deleteModal.show();
	        });
	    });
	});
</script>

<c:if test="${openEdit == true}">
		<script>
	  const editModal = new bootstrap.Modal(document.getElementById('modalEdit'));
	  editModal.show();
	</script>
	</c:if>

</body>

</html>