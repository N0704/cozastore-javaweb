<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN" />
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Hàng Thành Công</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        
        body {
            background-color: #f8f8f8;
            color: #333;
            display: flex;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
            margin-top: 100px;
        }
        
        a {
			color: #3870F6;
			text-decoration: none;
		}
        
        .success-container {
            width: 100%;
            max-width: 800px;
            text-align: center;
        }
        
        .success-icon {
            font-size: 90px;
            color: #000;
            margin-bottom: 20px;
        }
        
        h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #000;
        }
        
        p {
            font-size: 19px;
            color: #666;
            line-height: 1.6;
            margin-bottom:40px;
        }
        
        #checkout-step {
    display: flex;
    justify-content: center;
    padding: 32px 0;
    background-color: #F0F0F0;
    position: fixed;
    bottom: 0;
    width: 100%;
    z-index: 10;
}

.step-footer {
    display: flex;
    flex-direction: row-reverse;
    -webkit-align-items: center;
    align-items: center;
    z-index: 2;
    position: relative;
    zoom: 1;
}


#checkout-step .success-checkout {
    background-color: #2E2E2E;
    text-transform: uppercase;
    min-width: 330px;
    padding: 19px 10px;
    letter-spacing: 1px;
    border-radius: 2px;
    font-size: 15px;
    line-height: 1.25;
    font-weight: 600;
    text-align: center;
    color: white;
    cursor: pointer;
}

#checkout-step .step-footer-previous-link {
    color: #2e2e2e;
    background-color: #FFFFFF;
    text-transform: uppercase;
    min-width: 330px;
    padding: 19px 10px;
    letter-spacing: 1px;
    border-radius: 2px;
    font-size: 15px;
    line-height: 1.25;
    font-weight: 700;
    text-align: center;
    cursor: pointer;
    margin-right: 24px;
}

#checkout-step .step-footer-previous-link svg {
    vertical-align: middle;
    margin-right: 10px;
}
       
        
    </style>
</head>
<body>
  <c:choose>
    <c:when test="${transResult}">
        <div class="success-container">
            <div class="success-icon">✓</div>
            <h1>Thanh Toán Thành Công!</h1>
            <p>Cảm ơn bạn đã mua hàng tại COZA. Đơn hàng của bạn đã được tiếp nhận và đang được xử lý.</p>
        </div>
    </c:when>
    <c:when test="${transResult == false}">
        <div class="success-container">
            <div class="success-icon">✕</div>
            <h1>Thanh Toán Thất Bại!</h1>
            <p>Rất tiếc, giao dịch của bạn không thành công. Vui lòng thử lại hoặc chọn phương thức thanh toán khác. Lỗi: ${errorMessage}</p>
        </div>
    </c:when>
    <c:otherwise>
        <div class="success-container">
            <div class="success-icon">?</div>
            <h1>Lỗi không xác định</h1>
            <p>Không thể xác định trạng thái giao dịch. Vui lòng liên hệ hỗ trợ.</p>
        </div>
    </c:otherwise>
</c:choose>
     <div id="checkout-step">
		<div class="step-footer" id="step-footer-checkout">
    <a class="success-checkout" href="orders"> Xem thông tin đơn hàng</a>									  
    <a class="step-footer-previous-link" href="home">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> 
            <path d="M11.4375 18.75L4.6875 12L11.4375 5.25M5.625 12H19.3125" stroke="#2E2E2E" stroke-linecap="round" stroke-linejoin="round"></path> 
        </svg>quay về trang chủ
    </a>
</div>
	</div>
</body>
</html>