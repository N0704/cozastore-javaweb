<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng Nhập</title>
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/login.css?v=1.2">
</head>
<body>
	<div class="login-container">
		<div class="login-header">
			<h1>Đăng Nhập</h1>
			<p>Vui lòng nhập thông tin đăng nhập của bạn</p>
		</div>
		<div class="error ${error}">
			<div class="error-icons">
				<svg viewBox="0 0 16 16">
        	<path fill="none" stroke="#FF424F"
						d="M8 15A7 7 0 108 1a7 7 0 000 14z" clip-rule="evenodd">
        	</path>
					<rect stroke="none" width="7" height="1.5" x="6.061" y="5"
						fill="#FF424F" rx=".75" transform="rotate(45 6.06 5)"></rect>
					<rect stroke="none" width="7" height="1.5" fill="#FF424F" rx=".75"
						transform="scale(-1 1) rotate(45 -11.01 -9.51)"></rect></svg>
			</div>
			<div>
				<div class="error-title">Tên tài khoản của bạn hoặc Mật khẩu không
					đúng, vui lòng thử lại</div>
			</div>
		</div>
		<form action="login" method="post" style="padding-top:15px;">
			<div class="input-group">
				<label for="username">Tên đăng nhập</label> <input type="text"
					id="username" name="username" value="${username}" placeholder="Nhập tên đăng nhập"
					required>
			</div>

			<div class="input-group">
				<label for="password">Mật khẩu</label>
				<div class="password-container">
					<input type="password" id="password" name="password"
						placeholder="Nhập mật khẩu" required> <i
						class="fas fa-eye toggle-password" id="togglePassword"></i>
				</div>
			</div>

			<div class="remember-forgot">
				<div class="remember-me">
					<input type="checkbox" id="remember"> <label for="remember">Ghi
						nhớ đăng nhập</label>
				</div>
				<div class="forgot-password">
					<a href="#">Quên mật khẩu?</a>
				</div>
			</div>

			<button type="submit" class="login-button">ĐĂNG NHẬP</button>

			<div class="signup-link">
				Chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a>
			</div>

			<div class="social-login">
				<p>Hoặc đăng nhập bằng</p>
				<div class="social-icons">
					<a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&access_type=offline&include_granted_scopes=true&response_type=code&redirect_uri=http://localhost:8080/coza_store/login-google&client_id=1029180138035-sa97v49l21995d6iia9tsobtsn2mo63t.apps.googleusercontent.com"
				        class="social-icon">
				        <i class="fab fa-google"></i>
				    </a>
					<div class="social-icon">
						<i class="fab fa-facebook-f"></i>
					</div>
					<div class="social-icon">
						<i class="fab fa-apple"></i>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const togglePassword = document
									.querySelector('#togglePassword');
							const password = document
									.querySelector('#password');

							togglePassword
									.addEventListener(
											'click',
											function() {
												// Toggle the type attribute
												const type = password
														.getAttribute('type') === 'password' ? 'text'
														: 'password';
												password.setAttribute('type',
														type);

												// Toggle the eye icon
												this.classList.toggle('fa-eye');
												this.classList
														.toggle('fa-eye-slash');
											});
						});
	</script>
</body>
</html>