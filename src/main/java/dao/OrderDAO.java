package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.OrderDetails;
import model.Orders;
import utils.DBConnection;

public class OrderDAO {
    public int createOrder(int userId, String fullname, String phone, String address,
                           String paymentMethod, BigDecimal total, List<Cart> items) {
    	int orderId = -1;
        Connection conn = null;
        PreparedStatement psOrder = null;
        PreparedStatement psOrderDetail = null;
        PreparedStatement psUpdateStock = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Bắt đầu giao dịch

            // 1. Insert vào bảng Orders
            String sqlOrder = "INSERT INTO Orders(uid, fullname, phone, address, paymentmethod, total) " +
                              "VALUES (?, ?, ?, ?, ?, ?)";
            psOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userId);
            psOrder.setString(2, fullname);
            psOrder.setString(3, phone);
            psOrder.setString(4, address);
            psOrder.setString(5, paymentMethod);
            psOrder.setBigDecimal(6, total);
            psOrder.executeUpdate();

            rs = psOrder.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // 2. Insert từng sản phẩm vào OrderDetails
            String sqlDetail = "INSERT INTO OrderDetails(orderid, pid, quantity, price) VALUES (?, ?, ?, ?)";
            psOrderDetail = conn.prepareStatement(sqlDetail);

         // 3. Trừ stock
            String sqlUpdateStock = "UPDATE Products SET stock = stock - ? WHERE pid = ?";
            psUpdateStock = conn.prepareStatement(sqlUpdateStock);

            for (Cart item : items) {
                // Insert order detail
                psOrderDetail.setInt(1, orderId);
                psOrderDetail.setInt(2, item.getPid());
                psOrderDetail.setInt(3, item.getQuantity());
                psOrderDetail.setBigDecimal(4, item.getPrice());
                psOrderDetail.addBatch();

                // Trừ tồn kho
                psUpdateStock.setInt(1, item.getQuantity());
                psUpdateStock.setInt(2, item.getPid());
                psUpdateStock.addBatch();
            }

            psOrderDetail.executeBatch();
            psUpdateStock.executeBatch();

            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (conn != null) try { conn.rollback(); } catch (Exception ex) { ex.printStackTrace(); }
            orderId = -1;
        } finally {
            try {
                if (rs != null) rs.close();
                if (psOrder != null) psOrder.close();
                if (psOrderDetail != null) psOrderDetail.close();
                if (psUpdateStock != null) psUpdateStock.close();
                if (conn != null) conn.setAutoCommit(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return orderId;
    }
      
    public List<Orders> getAllOrders() {
    	List<Orders> list = new ArrayList<>();
    	String query = "SELECT * FROM [Orders] \r\n"
    			+ "ORDER BY \r\n"
    			+ "    CASE \r\n"
    			+ "        WHEN status = N'Đang xử lý' THEN 1"
    			+ "        WHEN status = 'Đã xác nhận' THEN 2"
    			+ "        WHEN status = 'Hoàn thành' THEN 3"
    			+ "        ELSE 4 "
    			+ "    END,\r\n"
    			+ "    orderdate DESC";
    	try (Connection conn = DBConnection.getConnection();
    		     PreparedStatement ps = conn.prepareStatement(query);
    		     ResultSet rs = ps.executeQuery()) {
    		    while (rs.next()) {
    		    	list.add(new Orders(rs.getInt(1), 
    		    					rs.getInt(2), 
								  rs.getString(3),
								  rs.getString(4),
								  rs.getString(5),
								  rs.getString(6),
								  rs.getBigDecimal(7),
								  rs.getTimestamp(8),
								  rs.getString(9),
								  rs.getString(10)));
    		    }

    		} catch (Exception e) {
    		    e.printStackTrace(); // hoặc ghi log
    		}
        return list;
    }
    
    public List<Orders> getDashboardOrders() {
    	List<Orders> list = new ArrayList<>();
    	String query = "SELECT TOP 10 * FROM [Orders] \r\n"
    			+ "ORDER BY \r\n"
    			+ "    orderdate DESC";
    	try (Connection conn = DBConnection.getConnection();
    		     PreparedStatement ps = conn.prepareStatement(query);
    		     ResultSet rs = ps.executeQuery()) {
    		    while (rs.next()) {
    		    	list.add(new Orders(rs.getInt(1), 
	    					rs.getInt(2), 
						  rs.getString(3),
						  rs.getString(4),
						  rs.getString(5),
						  rs.getString(6),
						  rs.getBigDecimal(7),
						  rs.getTimestamp(8),
						  rs.getString(9),
						  rs.getString(10)));
    		    }

    		} catch (Exception e) {
    		    e.printStackTrace(); // hoặc ghi log
    		}
        return list;
    }
    
    public Orders getOrderById(int orderId) {
    	String query = "SELECT * FROM Orders WHERE orderid = ?";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, orderId);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	Orders o = new Orders();
                o.setOrderid(rs.getInt("orderid"));
                o.setUid(rs.getInt("uid"));
                o.setFullName(rs.getString("fullname"));
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setPaymentMethod(rs.getString("paymentmethod"));
                o.setTotal(rs.getBigDecimal("total"));
                o.setOrderdate(rs.getTimestamp("orderdate"));
                o.setStatus(rs.getString("status"));
                o.setPayment_status(rs.getString("payment_status"));
                return o;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<OrderDetails> getOrderDetails(int orderId) {
    	List<OrderDetails> list = new ArrayList<>();
        String query = "SELECT od.*, p.pname, p.img, p.discount as discount FROM OrderDetails od " +
                     "JOIN Products p ON od.pid = p.pid WHERE od.orderid = ?";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, orderId);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	OrderDetails od = new OrderDetails();
                od.setOrderdetailid(rs.getInt("orderdetailid"));
                od.setOrderid(rs.getInt("orderid"));
                od.setPid(rs.getInt("pid"));
                od.setQuantity(rs.getInt("quantity"));
                od.setPrice(rs.getBigDecimal("price"));
                od.setPname(rs.getString("pname"));
                od.setImg(rs.getString("img"));
                od.setDiscount(rs.getInt("discount"));
                list.add(od);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE Orders SET status = ? WHERE orderid = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean updatePayStatus(Orders order) {
        String sql = "UPDATE orders SET payment_status = ? WHERE orderid = ?";
        try (Connection conn = DBConnection.getConnection();
        	PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, order.getPayment_status());
            stmt.setInt(2, order.getOrderid());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Orders> getOrdersWithProductCount(int uid) {
	 	List<Orders> list = new ArrayList<>();
	    String query = """
	        SELECT o.orderid, o.total,
	            o.orderdate, o.status, COUNT(od.pid) AS product_count 
	        FROM Orders o LEFT JOIN OrderDetails od ON o.orderid = od.orderid
	        Where o.uid = ?
	        GROUP BY o.orderid, o.total, o.orderdate, o.status
	        ORDER BY orderdate DESC
	    """;

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	    	ps.setInt(1, uid);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	            	 Orders order = new Orders();
			            order.setOrderid(rs.getInt("orderid"));
			            order.setTotal(rs.getBigDecimal("total"));
			            order.setOrderdate(rs.getTimestamp("orderdate"));
			            order.setStatus(rs.getString("status"));
			            order.setProductCount(rs.getInt("product_count")); 
			            list.add(order);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
    
    public static void main(String[] args) {
		OrderDAO dao = new OrderDAO();
        List<Orders> listC = dao.getAllOrders();

        for (Orders c : listC) {
            System.out.println(c);
        }
    }
    
}

