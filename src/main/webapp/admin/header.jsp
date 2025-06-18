<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
 <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="home" class="logo d-flex align-items-center">
        <img src="admin/assets/img/logo-01.png" alt="">
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->
        
        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">${count}</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications" style="width:360px;">
            <li class="dropdown-header">
              Thông báo mới
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
			<c:forEach items="${notifications}" var="noti">
			<c:if test="${noti.is_read == false}">
            <li class="notification-item" style="background-color: #f6f9ff;">
              <a href="mark-as-read?pid=${noti.pid}&id=${noti.id}" 
           	style="display: flex; align-items: center; text-decoration: none; color: inherit;">
            <img style="width:60px; height:75px; border-radius:3px; margin-right:10px;" 
                 src="${noti.img}" alt="${noti.pname}">
            <div>
                <h4>Thông Báo</h4>
                <p>${noti.message}</p>
            </div>
        	</a>
            </li>
            </c:if>
            <c:if test="${noti.is_read == true}">
            <li class="notification-item" style="background-color: #fff;">
              <a href="loadProduct?pid=${noti.pid}" 
           	style="display: flex; align-items: center; text-decoration: none; color: inherit;">
            <img style="width:60px; height:75px; border-radius:3px; margin-right:10px;" 
                 src="${noti.img}" alt="${noti.pname}">
            <div>
                <h4>Thông Báo</h4>
                <p>${noti.message}</p>
            </div>
        	</a>
            </li>
            </c:if>
			</c:forEach>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="notification">Xem tất cả</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li>

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center" href="#" data-bs-toggle="dropdown">
            <img src="${sessionScope.acc.avatar}" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.acc.fullname}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${sessionScope.acc.fullname}</h6>
              <span>Quản trị viên</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="profile">
                <i class="bi bi-person"></i>
                <span>Tài khoản của tôi</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Đăng xuất</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->