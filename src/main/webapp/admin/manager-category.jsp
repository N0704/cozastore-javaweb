<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Quản lý danh mục - COZA Việt Nam</title>
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
<link href="admin/assets/css/style.css?v1.2" rel="stylesheet">

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
							<h4 class="card-title2">Quản lý danh mục</h4>
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
										<th class="col-2 text-center">Ảnh danh mục</th>
										<th class="col-6 text-center">Tên danh mục</th>
										<th class="col-2 text-center">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listC}" var="c">
										<tr>
											<th class="text-center" scope="row"><a href="category?cid=${c.cid}" class="card-img"><img src="${c.banner}" alt="${c.cname}"></a></th>
											<td class="text-center"><a href="category?cid=${c.cid}" class="title-link">${c.cname}</a></td>
											<td class="text-center"><a
												href="loadCategory?cid=${c.cid}"
												class="btn btn-outline-dark btn-sm" title="Edit"> <i
													class="bi bi-pencil-square"></i>
											</a> <a href="#" class="btn btn-outline-danger btn-sm delete-btn"
												data-cid="${c.cid}" title="Delete"> <i
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
			  <div class="modal-dialog modal-xl modal-dialog-scrollable">
			    <div class="modal-content">
			      <form action="add" method="post" enctype="multipart/form-data">
			        <div class="modal-header bg-dark text-white">
			          <h5 class="modal-title fw-bold">Thêm Danh Mục Mới</h5>
			          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			        </div>
			        <div class="modal-body py-4">
			          <c:if test="${not empty errorMessage}">
			            <div class="alert alert-danger alert-dismissible fade show" role="alert">
			              ${errorMessage}
			              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			            </div>
			          </c:if>
			          <div class="container-fluid">
			            <div class="row">
			              <!-- Cột trái: Thông tin -->
			              <div class="col-md-7 mb-4">
			                <div class="mb-4">
			                  <label for="cname" class="form-label text-dark fw-bold">Tên danh mục</label>
			                  <input name="cname" type="text" class="form-control border-dark" id="cname" 
			                         placeholder="Nhập tên danh mục" required>
			                </div>
			
			                <div class="mb-4">
			                  <label for="cdesc" class="form-label text-dark fw-bold">Mô tả</label>
			                  <textarea name="cdesc" class="form-control border-dark" id="cdesc" rows="5" 
			                            placeholder="Nhập mô tả chi tiết..."></textarea>
			                </div>
			
			                <div class="form-group mb-4 mt-2">
			                  <label for="IsActive" class="form-check-label">Hiển thị: </label>
			                  <input class="form-check-input" type="checkbox" name="IsActive" value="true" id="IsActive" ${isChecked}>
			                </div>
			              </div>
			
			              <!-- Cột phải: Upload ảnh -->
			              <div class="col-md-5 mb-4">
			                <label class="form-label text-dark fw-bold mb-2">Ảnh danh mục <span class="text-danger">*</span></label>
			                <div class="upload-box position-relative d-flex flex-column justify-content-center align-items-center" id="imageUploadBox">
			                  <input type="file" class="d-none" name="cimage" id="cimage" accept="image/*" required>
			
			                  <!-- Prompt -->
			                  <div id="imagePrompt" class="text-center">
			                    <i class="bi bi-cloud-upload fs-1 text-muted"></i>
			                    <p class="mb-1 fw-semibold">Kéo thả hình ảnh vào đây hoặc nhấn để chọn</p>
			                    <small class="text-muted">JPG, PNG, tối đa 5MB</small>
			                  </div>
			
			                  <!-- Loading -->
			                  <div id="loadingSpinner" class="d-none text-center">
			                    <div class="spinner-border text-dark mb-2" role="status"></div>
			                    <p class="text-muted">Đang xử lý ảnh...</p>
			                  </div>
			
			                  <div id="imageConfirmed" class="d-none text-center">
			                    <img id="previewImage" src="#" alt="Preview" class="img-fluid mt-2 rounded shadow-sm" style="max-height: 220px;">
			                    <div class="mt-2">
			                      <button type="button" class="btn btn-outline-dark btn-sm rounded-pill" onclick="changeImage()">
			                        <i class="bi bi-arrow-repeat me-1"></i> Thay ảnh
			                      </button>
			                    </div>
			                  </div>
			                </div>
			                <small id="imageError" class="text-danger d-none">Vui lòng chọn ảnh hợp lệ</small>
			              </div>
			            </div>
			          </div>
			        </div>
			
			        <div class="modal-footer border-top-0">
			          <button type="button" class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal" onclick="window.location.href='category-manager'">Hủy bỏ</button>
			          <button type="submit" class="btn btn-dark rounded-pill px-4" id="submitBtn">Lưu lại</button>
			        </div>
			      </form>
			    </div>
			  </div>
			</div>

	
	<!-- Modal Edit -->
<div class="modal fade" id="modalEdit" tabindex="-1">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
      <form action="edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="cid" value="${detail.cid}">
        <div class="modal-header bg-dark text-white">
          <h5 class="modal-title fw-bold">Cập Nhật Danh Mục</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="window.location.href='category-manager'"></button>
        </div>
        <div class="modal-body py-4">
          <div class="container-fluid">
            <div class="row">
              <!-- Cột trái: Thông tin -->
              <div class="col-md-7 mb-4">
                <div class="mb-4">
                  <label for="editCname" class="form-label text-dark fw-bold">Tên danh mục</label>
                  <input name="cname" type="text" class="form-control border-dark" id="editCname" 
                         value="${detail.cname}" placeholder="Nhập tên danh mục" required>
                </div>
            
                <div class="mb-4">
                  <label for="editCdesc" class="form-label text-dark fw-bold">Mô tả</label>
                  <textarea name="cdesc" class="form-control border-dark" id="editCdesc" rows="8" 
                            placeholder="Nhập mô tả chi tiết...">${detail.cdesc}</textarea>
                </div>
            
                <div class="form-group mb-4 mt-2">
                  <label for="editIsActive" class="form-check-label">Hiển thị: </label>
                  <input class="form-check-input" type="checkbox" name="IsActive" value="true" id="editIsActive" ${isChecked}>
                </div>
              </div>

              <!-- Cột phải: Upload ảnh -->
              <div class="col-md-5 mb-4">
                <label class="form-label text-dark fw-bold mb-2">Ảnh danh mục</label>
                <div class="upload-box position-relative d-flex flex-column justify-content-center align-items-center" id="editImageUploadBox">
                  <input type="file" class="d-none" name="cimage" id="editCimage" accept="image/*">
                  
                  <!-- Hiển thị ảnh hiện tại -->
                  <c:if test="${not empty detail.banner}">
                    <div id="currentImage" class="text-center">
                      <img src="${detail.banner}" alt="Current Image" class="img-fluid mt-2 rounded shadow-sm" style="max-height: 220px;">
                      <div class="mt-2">
                        <button type="button" class="btn btn-outline-dark btn-sm rounded-pill" onclick="showUploadEdit()">
                          <i class="bi bi-arrow-repeat me-1"></i> Thay ảnh
                        </button>
                      </div>
                      <input type="hidden" name="currentImage" value="${detail.banner}">
                    </div>
                  </c:if>

                  <!-- Prompt (chỉ hiển thị nếu không có ảnh hiện tại) -->
                  <div id="editImagePrompt" class="text-center ${not empty detail.banner ? 'd-none' : ''}">
                    <i class="bi bi-cloud-upload fs-1 text-muted"></i>
                    <p class="mb-1 fw-semibold">Kéo thả hình ảnh vào đây hoặc nhấn để chọn</p>
                    <small class="text-muted">JPG, PNG, tối đa 5MB</small>
                  </div>

                  <!-- Loading -->
                  <div id="editLoadingSpinner" class="d-none text-center">
                    <div class="spinner-border text-dark mb-2" role="status"></div>
                    <p class="text-muted">Đang xử lý ảnh...</p>
                  </div>

                  <div id="editImageConfirmed" class="d-none text-center">
                    <img id="editPreviewImage" src="#" alt="Preview" class="img-fluid mt-2 rounded shadow-sm" style="max-height: 220px;">
                    <div class="mt-2">
                      <button type="button" class="btn btn-outline-dark btn-sm rounded-pill" onclick="changeEditImage()">
                        <i class="bi bi-arrow-repeat me-1"></i> Thay ảnh
                      </button>
                    </div>
                  </div>
                </div>
                <small id="editImageError" class="text-danger d-none">Vui lòng chọn ảnh hợp lệ</small>
              </div>
            </div>
          </div>
        </div>
    
        <div class="modal-footer border-top-0">
          <button type="button" class="btn btn-outline-secondary rounded-pill px-4" data-bs-dismiss="modal" onclick="window.location.href='category-manager'">Hủy bỏ</button>
          <button type="submit" class="btn btn-dark rounded-pill px-4" id="editSubmitBtn">Lưu lại</button>
        </div>
      </form>
    </div>
  </div>
</div>


	<!-- End Modal Edit-->

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
    const datatable = window.simpleDatatable; // Giả sử bạn đã lưu instance datatable vào biến toàn cục
    
    // Nếu datatable instance không tồn tại, thử tìm nó trong document
    if (!datatable) {
      const datatableEl = document.querySelector('.datatable');
      if (datatableEl && datatableEl.simpleDatatable) {
        datatable = datatableEl.simpleDatatable;
      }
    }
    
    if (datatable) {
      // Lấy toàn bộ dữ liệu từ datatable
      const allData = datatable.data;
      
      // Lọc dữ liệu dựa trên keyword
      const filteredData = allData.filter(item => {
        // Chuyển đổi item thành chuỗi để tìm kiếm
        const itemText = Object.values(item).join(' ').toLowerCase();
        return itemText.includes(keyword);
      });
      
      // Cập nhật lại datatable với dữ liệu đã lọc
      datatable.update(filteredData);
    } else {
      // Fallback nếu không tìm thấy datatable instance
      const rows = document.querySelectorAll(".datatable tbody tr");
      rows.forEach(row => {
        const rowText = row.innerText.toLowerCase();
        row.style.display = rowText.includes(keyword) ? "" : "none";
      });
    }
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
	            const cid = this.getAttribute("data-cid");
	            confirmDeleteBtn.href = "delete?cid=" + cid;
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
	
	<script>
  const input = document.getElementById('cimage');
  const preview = document.getElementById('previewImage');
  const imagePrompt = document.getElementById('imagePrompt');
  const loadingSpinner = document.getElementById('loadingSpinner');
  const imageConfirmed = document.getElementById('imageConfirmed');
  const imageError = document.getElementById('imageError');
  const form = document.querySelector('form');

  function changeImage() {
    removeImage();
    input.click();
  }

  function removeImage() {
    input.value = "";
    preview.src = "#";
    imagePrompt.classList.remove('d-none');
    imageConfirmed.classList.add('d-none');
    imageError.classList.add('d-none');
  }

  input.addEventListener('change', function () {
    if (this.files && this.files[0]) {
      const file = this.files[0];
      
      // Kiểm tra kích thước file
      if (file.size > 5 * 1024 * 1024) {
        imageError.textContent = 'File vượt quá kích thước cho phép (5MB)';
        imageError.classList.remove('d-none');
        removeImage();
        return;
      }
      
      // Kiểm tra loại file
      const validTypes = ['image/jpeg', 'image/png', 'image/gif'];
      if (!validTypes.includes(file.type)) {
        imageError.textContent = 'Chỉ chấp nhận file ảnh (JPG, PNG, GIF)';
        imageError.classList.remove('d-none');
        removeImage();
        return;
      }
      
      imageError.classList.add('d-none');
      imagePrompt.classList.add('d-none');
      imageConfirmed.classList.add('d-none');
      loadingSpinner.classList.remove('d-none');

      const reader = new FileReader();
      reader.onload = function (e) {
        setTimeout(() => {
          preview.src = e.target.result;
          loadingSpinner.classList.add('d-none');
          imageConfirmed.classList.remove('d-none');
        }, 1000);
      };
      reader.readAsDataURL(file);
    }
  });

  // Drag-drop
  const dropBox = document.getElementById('imageUploadBox');
  ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(evt =>
    dropBox.addEventListener(evt, e => {
      e.preventDefault();
      e.stopPropagation();
    }, false)
  );
  
  dropBox.addEventListener('drop', e => {
    const files = e.dataTransfer.files;
    if (files.length > 0) {
      input.files = files;
      input.dispatchEvent(new Event('change'));
    }
  });
  
  dropBox.addEventListener('click', () => input.click());

  // Xử lý khi submit form
  form.addEventListener('submit', function(e) {
    const submitBtn = this.querySelector('#submitBtn');
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Đang xử lý...';
    
    // Thêm validation nếu cần
    if (!input.files || input.files.length === 0) {
      e.preventDefault();
      imageError.textContent = 'Vui lòng chọn ảnh danh mục';
      imageError.classList.remove('d-none');
      submitBtn.disabled = false;
      submitBtn.innerHTML = 'Lưu lại';
    }
  });
</script>

<script>
//Script xử lý cho modal Edit
const editInput = document.getElementById('editCimage');
const editPreview = document.getElementById('editPreviewImage');
const editImagePrompt = document.getElementById('editImagePrompt');
const editLoadingSpinner = document.getElementById('editLoadingSpinner');
const editImageConfirmed = document.getElementById('editImageConfirmed');
const editImageError = document.getElementById('editImageError');
const currentImageDiv = document.getElementById('currentImage');
const editImageUploadBox = document.getElementById('editImageUploadBox');

// Hàm reset trạng thái upload ảnh
function resetEditImageState() {
  editInput.value = "";
  editPreview.src = "#";
  editImageError.classList.add('d-none');
  editImageConfirmed.classList.add('d-none');
  editLoadingSpinner.classList.add('d-none');
  
  // Chỉ hiển thị prompt nếu không có ảnh hiện tại
  if (!currentImageDiv || currentImageDiv.classList.contains('d-none')) {
    editImagePrompt.classList.remove('d-none');
  }
}

// Hàm hiển thị dialog chọn ảnh
function showEditImageDialog() {
  resetEditImageState();
  editInput.click();
}

// Hàm xử lý khi click nút "Thay ảnh"
function handleChangeImage() {
  if (currentImageDiv) {
    currentImageDiv.classList.add('d-none');
  }
  showEditImageDialog();
}

// Xử lý khi chọn file
editInput.addEventListener('change', function() {
  if (!this.files || !this.files[0]) return;
  
  const file = this.files[0];
  
  // Validate file
  if (file.size > 5 * 1024 * 1024) {
    editImageError.textContent = 'File vượt quá kích thước cho phép (5MB)';
    editImageError.classList.remove('d-none');
    return;
  }
  
  if (!['image/jpeg', 'image/png', 'image/gif'].includes(file.type)) {
    editImageError.textContent = 'Chỉ chấp nhận file ảnh (JPG, PNG, GIF)';
    editImageError.classList.remove('d-none');
    return;
  }
  
  // Hiển thị loading
  editImageError.classList.add('d-none');
  editImagePrompt.classList.add('d-none');
  editImageConfirmed.classList.add('d-none');
  editLoadingSpinner.classList.remove('d-none');

  // Đọc và hiển thị ảnh preview
  const reader = new FileReader();
  reader.onload = (e) => {
    editPreview.src = e.target.result;
    editLoadingSpinner.classList.add('d-none');
    editImageConfirmed.classList.remove('d-none');
  };
  reader.readAsDataURL(file);
});

// Xử lý drag and drop
['dragenter', 'dragover', 'dragleave', 'drop'].forEach(evt => {
  editImageUploadBox.addEventListener(evt, (e) => {
    e.preventDefault();
    e.stopPropagation();
    
    // Thêm hiệu ứng khi kéo file vào
    if (evt === 'dragenter' || evt === 'dragover') {
      editImageUploadBox.classList.add('border-primary', 'border-2');
    } else {
      editImageUploadBox.classList.remove('border-primary', 'border-2');
    }
  });
});

editImageUploadBox.addEventListener('drop', (e) => {
  const files = e.dataTransfer.files;
  if (files.length > 0) {
    editInput.files = files;
    editInput.dispatchEvent(new Event('change'));
  }
});

// Xử lý click toàn bộ vùng upload
editImageUploadBox.addEventListener('click', (e) => {
  // Ngăn sự kiện click lan lên các phần tử con
  if (e.target !== editImageUploadBox && !e.target.classList.contains('btn')) return;
  
  if (currentImageDiv && !currentImageDiv.classList.contains('d-none')) {
    handleChangeImage();
  } else {
    editInput.click();
  }
});

// Gán sự kiện cho nút "Thay ảnh" (nếu có)
const changeImageBtn = editImageUploadBox.querySelector('.btn');
if (changeImageBtn) {
  changeImageBtn.addEventListener('click', (e) => {
    e.stopPropagation();
    handleChangeImage();
  });
}
</script>
</body>

</html>