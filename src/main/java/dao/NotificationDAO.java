package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Notification;
import utils.DBConnection;

public class NotificationDAO {
	public List<Notification> getUnreadNotifications() {
	    List<Notification> list = new ArrayList<>();
	    String sql = "SELECT TOP 3 n.*, p.pname, p.img " +  // Thêm khoảng trắng sau p.img
	                "FROM Notification n " +
	                "LEFT JOIN Products p ON n.pid = p.pid " +
	                "ORDER BY n.created_at DESC";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {
	        
	        while (rs.next()) {
	            Notification n = new Notification();
	            n.setId(rs.getInt("id"));
	            n.setPid(rs.getInt("pid"));
	            n.setMessage(rs.getString("message"));
	            n.setIs_read(rs.getBoolean("is_read"));
	            n.setCreated_at(rs.getTimestamp("created_at"));  // Sửa createdAt -> created_at
	            n.setPname(rs.getString("pname"));
	            n.setImg(rs.getString("img"));
	            list.add(n);
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // Nên ghi log lỗi cụ thể
	        // Hoặc ném custom exception: throw new DataAccessException("Error fetching notifications", e);
	    }
	    return list;
	}
	
	public List<Notification> getNotifications() {
	    List<Notification> list = new ArrayList<>();
	    String sql = "SELECT TOP 10 n.*, p.pname, p.img " +  // Thêm khoảng trắng sau p.img
	                "FROM Notification n " +
	                "LEFT JOIN Products p ON n.pid = p.pid " +
	                "ORDER BY n.created_at DESC";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {
	        
	        while (rs.next()) {
	            Notification n = new Notification();
	            n.setId(rs.getInt("id"));
	            n.setPid(rs.getInt("pid"));
	            n.setMessage(rs.getString("message"));
	            n.setIs_read(rs.getBoolean("is_read"));
	            n.setCreated_at(rs.getTimestamp("created_at"));  // Sửa createdAt -> created_at
	            n.setPname(rs.getString("pname"));
	            n.setImg(rs.getString("img"));
	            list.add(n);
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // Nên ghi log lỗi cụ thể
	        // Hoặc ném custom exception: throw new DataAccessException("Error fetching notifications", e);
	    }
	    return list;
	}
	
	public void markAsRead(String id) {
	    String sql = "UPDATE Notification SET is_read = 1 WHERE id = ?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, id);
	        stmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public int countNotification() {
	    String query = "SELECT COUNT(*) FROM Notification WHERE is_read = 0";
	    try (
	    	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query)) {
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}
}
