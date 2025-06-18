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
<link href="admin/assets/css/style.css?v1.1" rel="stylesheet">

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
							<h4 class="card-title2">Thông Báo</h4>
							</div>
							
		<c:forEach items="${notification}" var="notis">
			<c:if test="${notis.is_read == false}">
            <div class="notification-item" style="background-color: #f6f9ff; padding: 10px;">
              <a href="mark-as-read?pid=${notis.pid}&id=${notis.id}" 
           	style="display: flex; align-items: center; text-decoration: none; color: inherit;">
            <img style="width:70px; height:85px; border-radius:3px; margin-right:10px;" 
                 src="${notis.img}" alt="${notis.pname}">
            <div>
                <h4 style="font-size: 18px; font-weight: 600; margin-bottom: 5px;">Thông Báo</h4>
                <p style="font-size: 16px;">${notis.message}</p>
            </div>
        	</a>
            </div>
            </c:if>
            <c:if test="${notis.is_read == true}">
            <div class="notification-item" style="background-color: #fff;  padding: 10px;">
              <a href="loadProduct?pid=${notis.pid}" 
           	style="display: flex; align-items: center; text-decoration: none; color: inherit;">
            <img style="width:70px; height:85px; border-radius:3px; margin-right:10px;" 
                 src="${notis.img}" alt="${notis.pname}">
            <div>
                <h4 style="font-size: 18px; font-weight: 600; margin-bottom: 5px;">Thông Báo</h4>
                <p style="font-size: 16px;">${notis.message}</p>
            </div>
        	</a>
            </div>
            </c:if>
		</c:forEach>
							</div>
						</div>
					</div>

				</div>
		</section>

	</main>
	<!-- End #main -->


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


</body>

</html>