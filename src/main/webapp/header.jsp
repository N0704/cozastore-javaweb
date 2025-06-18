<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
				<!-- Topbar -->
	<div class="top-bar">
		<div class="content-topbar flex-sb-m h-full container">
			<div id="topbar-text">
				<div class="slider-topbar-text">
					<div class="item-topbar" style="width: 100%; display: inline-block;">
						<a href="/pages/chinh-sach-doi-tra">Dễ dàng mua sắm và đổi trả trong vòng 30 ngày kể từ khi nhận sản phẩm</a>
					</div>
					<div class="item-topbar" style="width: 100%; display: inline-block;">
						<a href="/collections/new-arrivals/">Super Fan Week - Nhận ngay nón bóng chày cho đơn hàng nguyên giá từ 3.990K</a>
					</div>
					<div class="item-topbar" style="width: 100%; display: inline-block;">
						<a href="/collections/new-arrivals/">Ưu đãi 10% cho đơn hàng nguyên giá đầu tiên* | Nhập mã: COZAWELCOME</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="home" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<c:forEach items="${menu}" var="o">
							<li>
								<a href="category?cid=${o.cid}">${o.menuName}</a>
							</li>
							</c:forEach>
							
							<li>
								<a href="discount" style="color:red;">Giảm giá</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<a href="cart" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="${sessionScope.cartItemCount != null ? sessionScope.cartItemCount : 0}">
							<i class="zmdi zmdi-shopping-cart"></i>
						</a>

						<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
						<c:if test="${sessionScope.acc.role == 'Admin'}">
						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" id="profileDropdown">
							<i class="zmdi zmdi-account-circle"></i>
						</a>
						
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile" id="dropdownMenu"
								  style="display: none; position: absolute; inset: 23px 69px auto auto; margin: 0px; transform: translate(-16px, 38px);">
								  <li class="dropdown-header">
								    <h6>${sessionScope.acc.fullname}</h6>
								    <span>Quản trị viên</span>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="profile" target="_blank">
								      <i class="fa fa-user"></i>
								      <span>Tài khoản của bạn</span>
								    </a>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="dashboard" target="_blank">
								      <i class="fa fa-gear"></i>
								      <span>Quản lý hệ thống</span>
								    </a>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
								      <i class="fa fa-question-circle"></i>
								      <span>Need Help?</span>
								    </a>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="logout">
								      <i class="fa fa-sign-out"></i>
								      <span>Đăng xuất</span>
								    </a>
								  </li>
								</ul>
							</c:if>
							
						<c:if test="${sessionScope.acc == null}">
		                    <a href="login.jsp" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
							<i class="zmdi zmdi-account-circle"></i>
						</a>			
                		</c:if>	
                		
                		<c:if test="${sessionScope.acc.role == 'User'}">
						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" id="profileDropdown">
							<i class="zmdi zmdi-account-circle"></i>
						</a>
						
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile" id="dropdownMenu"
								  style="display: none; position: absolute; inset: 23px 69px auto auto; margin: 0px; transform: translate(-16px, 38px);">
								  <li class="dropdown-header">
								    <h6>${sessionScope.acc.fullname}</h6>
								    <span>ID: ${sessionScope.acc.uid}</span>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="account">
								      <i class="fa fa-user"></i>
								      <span>Tài khoản của bạn</span>
								    </a>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="orders">
								      <i class="fa fa-file-text-o"></i>
								      <span>Đơn hàng</span>
								    </a>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="">
								      <i class="fa fa-question-circle"></i>
								      <span>Need Help?</span>
								    </a>
								  </li>
								  <li><hr class="dropdown-divider"></li>
								  <li>
								    <a class="dropdown-item d-flex align-items-center" href="logout">
								      <i class="fa fa-sign-out"></i>
								      <span>Đăng xuất</span>
								    </a>
								  </li>
								</ul>
							</c:if>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<a href="cart" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</a>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart">
					<i class="zmdi zmdi-account-circle"></i>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<li>
					<a href="index.html">Home</a>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="product.html">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="blog.html">Blog</a>
				</li>

				<li>
					<a href="about.html">About</a>
				</li>

				<li>
					<a href="contact.html">Contact</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form action="search" method="get" class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input name="txt" class="plh2" type="text" placeholder="Tìm kiếm sản phẩm...">
				</form>
			</div>
		</div>
	</header>

	

		
</body>
</html>