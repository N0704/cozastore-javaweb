<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ACCESS DENIED</title>
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
            align-items: center;
            text-align: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        a {
			color: #3870F6;
			text-decoration: none;
		}
        
        .success-container {
            width: 100%;
            max-width: 800px;
        }
        
        .icon {
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
        
       .btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: #000;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: 1px solid #000;
        }
        
        .btn:hover {
            background-color: transparent;
            color: #000;
        }
  
        
    </style>
</head>
<body>
    <div class="success-container">
        <div class="icon">
    <svg width="90" height="90" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM4 12C4 7.58 7.58 4 12 4C13.85 4 15.55 4.63 16.9 5.69L5.69 16.9C4.63 15.55 4 13.85 4 12ZM12 20C10.15 20 8.45 19.37 7.1 18.31L18.31 7.1C19.37 8.45 20 10.15 20 12C20 16.42 16.42 20 12 20Z" fill="black"/>
    </svg>
</div>
        <h1>ACCESS DENIED</h1>
        <p>Bạn không có quyền truy cập vào trang này. Nếu bạn cho rằng đây là lỗi, vui lòng liên hệ với quản trị viên hệ thống.</p>
        <a href="home" class="btn">QUAY LẠI TRANG CHỦ</a>
    </div>
    
</body>
</html>