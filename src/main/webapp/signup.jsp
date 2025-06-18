<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký - COZA Việt Nam</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/register.css?v1.1">
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h1>Tạo Tài Khoản</h1>
            <p>Điền thông tin để tạo tài khoản mới</p>
        </div>
        
        <form action="signup" method="post">          
            <div class="input-group">
                <label for="fullname">Họ và tên</label>
                <input type="text" name="fullname" id="fullname" placeholder="Nhập địa họ và tên của bạn" required>
            </div>
                       
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Nhập địa chỉ email" required>
                <c:if test="${not empty mess}">
				    <p>${mess}</p>
				</c:if>
            </div>
            
            <div class="input-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" name="username" id="username" placeholder="Chọn tên đăng nhập" required>
                 <c:if test="${not empty error}">
				    <p>${error}</p>
				</c:if>
            </div>
            
            <input type="hidden" name="avatar" id="avatar" value="https://i.imgur.com/nrM9YZ1.png" required>
            
            <div class="input-group">
                <label for="password">Mật khẩu</label>
                <div class="password-container">
                    <input type="password" name="password" id="password" placeholder="Tạo mật khẩu" required>
                    <i class="fas fa-eye toggle-password" id="togglePassword"></i>
                </div>
            </div>
            
            <div class="input-group">
                <label for="confirm-password">Xác nhận mật khẩu</label>
                <div class="password-container">
                    <input type="password" id="confirm-password" placeholder="Nhập lại mật khẩu" required>
                    <i class="fas fa-eye toggle-password" id="toggleConfirmPassword"></i>
                </div>
            </div>
            
            <div class="terms">
                <input type="checkbox" id="agree-terms" required>
                <label for="agree-terms">Tôi đồng ý với <a href="#">Điều khoản dịch vụ</a> và <a href="#">Chính sách bảo mật</a></label>
            </div>
            
            <button type="submit" class="register-button">ĐĂNG KÝ</button>
            
            <div class="login-link">
                Đã có tài khoản? <a href="login.html">Đăng nhập ngay</a>
            </div>
            
            <div class="social-register">
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
        document.addEventListener('DOMContentLoaded', function() {
            // Toggle password visibility
            const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#password');
            
            togglePassword.addEventListener('click', function() {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
            
            // Toggle confirm password visibility
            const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
            const confirmPassword = document.querySelector('#confirm-password');
            
            toggleConfirmPassword.addEventListener('click', function() {
                const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPassword.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
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