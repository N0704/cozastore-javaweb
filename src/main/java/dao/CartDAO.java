package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import utils.DBConnection;

public class CartDAO {
	
	public List<Cart> getCartWithProductInfo(int uid) {
	    List<Cart> list = new ArrayList<>();
	    String query = "SELECT c.*, p.pname as pname, p.price as price, p.img as img, p.discount as discount " +
	                   "FROM [Cart] c JOIN [Products] p ON c.pid = p.pid " +
	                   "WHERE c.uid = ?";
	    try {
	        Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, uid);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Cart cart = new Cart(
	                rs.getInt("id"),
	                rs.getInt("uid"),
	                rs.getInt("pid"),
	                rs.getInt("quantity")
	            );
	            cart.setPname(rs.getString("pname"));
	            cart.setPrice(rs.getBigDecimal("price"));
	            cart.setImg(rs.getString("img"));
	            cart.setDiscount(rs.getInt("discount"));
	            list.add(cart);
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // nên in lỗi để dễ debug
	    }
	    return list;
	}
	
	public int countCartItemsByUserId(int uid) {
	    String query = "SELECT COUNT(*) FROM Cart WHERE uid = ?";
	    try (
	    	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, uid);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}
	
	public void addToCart(int uid, int pid, int quantity) {
	    String checkQuery = "SELECT quantity FROM [dbo].[Cart] WHERE uid = ? AND pid = ?";
	    String insertQuery = "INSERT INTO [dbo].[Cart] ([uid], [pid], [quantity]) VALUES (?, ?, ?)";
	    String updateQuery = "UPDATE [dbo].[Cart] SET [quantity] = [quantity] + ? WHERE uid = ? AND pid = ?";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
	        
	        checkStmt.setInt(1, uid);
	        checkStmt.setInt(2, pid);
	        ResultSet rs = checkStmt.executeQuery();
	        
	        if (rs.next()) {
	            int currentQty = rs.getInt("quantity");
	            int newQty = currentQty + quantity;

	            if (newQty > 5) {
	                // Giới hạn không cho vượt quá 5
	                System.out.println("Mỗi items mua tối đa 5 sản phẩm");
	                return;
	            }

	            // Cập nhật số lượng mới
	            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
	                updateStmt.setInt(1, newQty);
	                updateStmt.setInt(2, uid);
	                updateStmt.setInt(3, pid);
	                updateStmt.executeUpdate();
	            }
	        } else {
	            if (quantity > 5) {
	                System.out.println("Mỗi items mua tối đa 5 sản phẩm");
	                return;
	            }

	            // Thêm mới nếu chưa có trong giỏ
	            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
	                insertStmt.setInt(1, uid);
	                insertStmt.setInt(2, pid);
	                insertStmt.setInt(3, quantity);
	                insertStmt.executeUpdate();
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public List<Cart> getCartByuID(int uid) {
	    List<Cart> list = new ArrayList<>();
	    String query = "SELECT * FROM [Cart]  WHERE uid = ?";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, uid);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt(1), 
									  rs.getInt(2),
									  rs.getInt(3),
									  rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
	
	public void updateQuantity(int uid, int pid, int quantity) {
        String query = "UPDATE [dbo].[Cart] SET [quantity] = ? WHERE uid = ? AND pid = ?";
        PreparedStatement ps;
        try {
        	Connection conn = DBConnection.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, uid);
            ps.setInt(3, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
	
	public void deleteCartItem(int uid, int pid) {
        String query = "DELETE FROM [Cart] WHERE uid = ? AND pid = ?";
        PreparedStatement ps;
        try {
        	Connection conn = DBConnection.getConnection();
            ps = conn.prepareStatement(query);
			ps.setInt(1, uid);
			ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}