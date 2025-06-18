package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import model.BestSellerProduct;
import model.CategoryCount;
import model.DailyRevenue;
import model.Products;
import model.RecentSales;
import model.RevenueByCategory;
import model.SalesReport;
import utils.DBConnection;

public class ProductsDAO {
		public List<Products> getAllProducts() {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products]";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
		
		
		public List<Products> getProducts() {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products] WHERE IsActive = 1";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
		
		public List<Products> getProductsByID(String cid) {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products]  WHERE cid = ?";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setString(1, cid);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
		
		public Products getProductByID(String pid) {
	        String query = "SELECT * FROM [Products] WHERE pid = ?";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, pid);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                return new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12));
	            }
	        } catch (Exception e) {
	        }
	        return null;
	    }
		
		public List<Products> getNewProduct() {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products] ORDER BY created_at DESC";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
    					  rs.getInt(11),
    					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
		
		public List<Products> getNewProducts(String price, String sort, String discount) {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products]";
		 // 2. Thêm điều kiện lọc giá
		    if (price != null) {
		        switch (price) {
		            case "under200": query += " WHERE price < 200000"; break;
		            case "200to500": query += " WHERE price BETWEEN 200000 AND 500000"; break;
		            case "500to1000": query += " WHERE price > 500000 AND price <= 1000000"; break;
		            case "over1000": query += " WHERE price > 1000000"; break;
		        }
		    }
		    
		    // 3. Thêm điều kiện giảm giá
		    if (discount != null) {
		        switch (discount) {
		            case "discount10": query += " WHERE discount >= 10"; break;
		            case "discount20": query += " WHERE discount >= 20"; break;
		            case "discount30": query += " WHERE discount >= 30"; break;
		            case "discount50": query += " WHERE discount >= 50"; break;
		        }
		    }
		    
		    // 4. Xử lý sắp xếp (mặc định là mới nhất)
		    query += " ORDER BY ";
		    if ("price_asc".equals(sort)) {
		        query += "price ASC";
		    } else if ("price_desc".equals(sort)) {
		        query += "price DESC"; 
		    } else if ("name_asc".equals(sort)) {
		        query += "pname ASC"; 
		    } else if ("name_desc".equals(sort)) {
		        query += "pname DESC"; 
		    } else if ("oldest".equals(sort)) {
		        query += "created_at ASC";
		    } else {
		        // Mặc định: newest hoặc không có sort
		        query += "created_at DESC";
		    }
		    
		    // Nếu có discount, thêm sắp xếp phụ theo discount
		    if (!query.contains("discount") && !"discount_asc".equals(sort) && !"discount_desc".equals(sort)) {
		        query += ", discount DESC";
		    }
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
    					  rs.getInt(11),
    					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
		
		public List<Products> getNewProductsByID(String cid) {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products]  WHERE cid = ? ORDER BY created_at DESC";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setString(1, cid);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
    					  rs.getInt(11),
    					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
		
		public List<Products> getDiscountedProducts(String price, String sort, String discount) {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products] WHERE discount > 0 AND IsActive = 1";
		    
		    // 2. Thêm điều kiện lọc giá
		    if (price != null) {
		        switch (price) {
		            case "under200": query += " AND price < 200000"; break;
		            case "200to500": query += " AND price BETWEEN 200000 AND 500000"; break;
		            case "500to1000": query += " AND price > 500000 AND price <= 1000000"; break;
		            case "over1000": query += " AND price > 1000000"; break;
		        }
		    }
		    
		    // 3. Thêm điều kiện giảm giá
		    if (discount != null) {
		        switch (discount) {
		            case "discount10": query += " AND discount >= 10"; break;
		            case "discount20": query += " AND discount >= 20"; break;
		            case "discount30": query += " AND discount >= 30"; break;
		            case "discount50": query += " AND discount >= 50"; break;
		        }
		    }
		    
		    // 4. Xử lý sắp xếp (mặc định là mới nhất)
		    query += " ORDER BY ";
		    if ("price_asc".equals(sort)) {
		        query += "price ASC";
		    } else if ("price_desc".equals(sort)) {
		        query += "price DESC"; 
		    } else if ("name_asc".equals(sort)) {
		        query += "pname ASC"; 
		    } else if ("name_desc".equals(sort)) {
		        query += "pname DESC"; 
		    } else if ("oldest".equals(sort)) {
		        query += "created_at ASC";
		    } else {
		        // Mặc định: newest hoặc không có sort
		        query += "created_at DESC";
		    }
		    
		    // Nếu có discount, thêm sắp xếp phụ theo discount
		    if (!query.contains("discount") && !"discount_asc".equals(sort) && !"discount_desc".equals(sort)) {
		        query += ", discount DESC";
		    }
		    
		    try {
		        Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ResultSet rs = ps.executeQuery();
		        
		        while (rs.next()) {
		        	list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
    					  rs.getInt(11),
    					  rs.getInt(12)));
	            }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}
		
		public List<Products> get4LastProducts(int cid) {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT TOP 4* FROM [Products]  WHERE cid = ? ORDER BY created_at DESC";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setInt(1, cid);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
      					  rs.getInt(11),
      					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
		
		public List<Products> getFilteredProducts(String cid, String price, String sort, String discount) {
		    List<Products> list = new ArrayList<>();
		    
		    // 1. Xây dựng câu SQL cơ bản
		    String query = "SELECT * FROM Products WHERE cid = ?";
		    
		    // 2. Thêm điều kiện lọc giá
		    if (price != null) {
		        switch (price) {
		            case "under200": query += " AND price < 200000"; break;
		            case "200to500": query += " AND price BETWEEN 200000 AND 500000"; break;
		            case "500to1000": query += " AND price > 500000 AND price <= 1000000"; break;
		            case "over1000": query += " AND price > 1000000"; break;
		        }
		    }
		    
		    // 3. Thêm điều kiện giảm giá
		    if (discount != null) {
		        switch (discount) {
		            case "discount10": query += " AND discount >= 10"; break;
		            case "discount20": query += " AND discount >= 20"; break;
		            case "discount30": query += " AND discount >= 30"; break;
		            case "discount50": query += " AND discount >= 50"; break;
		        }
		    }
		    
		    // 4. Xử lý sắp xếp (mặc định là mới nhất)
		    query += " ORDER BY ";
		    if ("price_asc".equals(sort)) {
		        query += "price ASC";
		    } else if ("price_desc".equals(sort)) {
		        query += "price DESC"; 
		    } else if ("name_asc".equals(sort)) {
		        query += "pname ASC"; 
		    } else if ("name_desc".equals(sort)) {
		        query += "pname DESC"; 
		    } else if ("oldest".equals(sort)) {
		        query += "created_at ASC";
		    } else {
		        // Mặc định: newest hoặc không có sort
		        query += "created_at DESC";
		    }
		    
		    // Nếu có discount, thêm sắp xếp phụ theo discount
		    if (discount != null) {
		        query += ", discount ASC";
		    }
		    
		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query)) {
		        
		        ps.setString(1, cid);
		        ResultSet rs = ps.executeQuery();
		        
		        while (rs.next()) {
		            list.add(new Products(
		            		rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12)));
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}
		
		
		public List<Products> getTop12ByCid(int cid, String pid) {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT TOP 12 * FROM [Products] WHERE cid = ? AND pid != ? AND IsActive = 1 ORDER BY created_at DESC";
		    
		    try {
		        Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setInt(1, cid);
		        ps.setString(2, pid);
		        ResultSet rs = ps.executeQuery();
		        
		        while (rs.next()) {
		            list.add(new Products(
		            		rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12)));
		        }
		    } catch (Exception e) {
		        e.printStackTrace(); // Nên log lỗi để debug
		    }
		    return list;
		}
		
		public List<Products> getProductsByCollectionId(int collection_id) {
		    List<Products> list = new ArrayList<>();
		    String query = "SELECT * FROM [Products]  WHERE collection_id = ?";
	        try {
	        	Connection conn = DBConnection.getConnection();
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setInt(1, collection_id);
		        ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                list.add(new Products(rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12)));
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
				
		
		public void deleteProducts(String pid) {
	        String query = "DELETE FROM [Products] WHERE pid = ?";
	        PreparedStatement ps;
	        try {
	        	Connection conn = DBConnection.getConnection();
	            ps = conn.prepareStatement(query);
				ps.setString(1, pid);
	            ps.executeUpdate();
	        } catch (Exception e) {
	        }
	    }
		
		public boolean insertProducts(String pname, String pdesc, String pci, BigDecimal price, 
                String img, boolean IsActive, int cid, int collection_id, int discount, int stock) {
String query = "INSERT INTO [dbo].[Products] ([pname], [pdesc], [pci], [price], [img], [IsActive], [cid], [collection_id], [discount], [stock]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			try (Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(query)) {
			
			
					ps.setString(1, pname);
					ps.setString(2, pdesc);
					ps.setString(3, pci);
					ps.setBigDecimal(4, price);
					ps.setString(5, img);
					ps.setBoolean(6, IsActive);	
					ps.setInt(7, cid);
						if(collection_id == 0) {
							ps.setNull(8, Types.INTEGER);
						} else {
							ps.setInt(8, collection_id);
						}
						
					ps.setInt(9, discount);
					ps.setInt(10, stock);
			
					int rowsAffected = ps.executeUpdate();
					return rowsAffected > 0;
			
			} catch (Exception e) {
				System.err.println("Error in insertProducts:");
				e.printStackTrace(); // In toàn bộ stack trace
				return false;
			}
			}
		
		public boolean editProducts(String pid, String pname, String pdesc, String pci, BigDecimal price, String img, boolean IsActive, int cid, int collection_id, int discount, int stock) {
		    String query = "UPDATE [dbo].[Products] SET [pname] = ? ,[pdesc] = ? ,[pci] = ? ,[price] = ? ,[img] = ? , [IsActive] = ?, [cid] = ? ,[collection_id] = ? ,[discount] = ?,[stock] = ? WHERE pid = ?";
		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query)) {
		        
		    	ps.setString(1, pname);
		        ps.setString(2, pdesc);
		        ps.setString(3, pci);
		        ps.setBigDecimal(4, price);
		        ps.setString(5, img);
		        ps.setBoolean(6, IsActive);
		        ps.setInt(7, cid);
		        
		        if(collection_id == 0) {
					ps.setNull(8, Types.INTEGER);
				} else {
					ps.setInt(8, collection_id);
				}
		        
		        ps.setInt(9, discount);
		        ps.setInt(10, stock);
	            ps.setString(11, pid);
		        
		        int rowsAffected = ps.executeUpdate();
		        return rowsAffected > 0;
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		        return false;
		    }
		}
		
		public List<Products> searchByName(String txtSearch, String sort, String price, String discount) {
		    List<Products> list = new ArrayList<>();
		    
		    // 1. Xây dựng câu SQL cơ bản
		    String query = "SELECT * FROM Products WHERE pname LIKE ?";
		    
		    // 2. Thêm điều kiện lọc giá
		    if (price != null) {
		        switch (price) {
		            case "under200": query += " AND price < 200000"; break;
		            case "200to500": query += " AND price BETWEEN 200000 AND 500000"; break;
		            case "500to1000": query += " AND price > 500000 AND price <= 1000000"; break;
		            case "over1000": query += " AND price > 1000000"; break;
		        }
		    }
		    
		    // 3. Thêm điều kiện giảm giá
		    if (discount != null) {
		        switch (discount) {
		            case "discount10": query += " AND discount >= 10"; break;
		            case "discount20": query += " AND discount >= 20"; break;
		            case "discount30": query += " AND discount >= 30"; break;
		            case "discount50": query += " AND discount >= 50"; break;
		        }
		    }
		    
		    // 4. Xử lý sắp xếp (mặc định là mới nhất)
		    query += " ORDER BY ";
		    if ("price_asc".equals(sort)) {
		        query += "price ASC";
		    } else if ("price_desc".equals(sort)) {
		        query += "price DESC"; 
		    } else if ("name_asc".equals(sort)) {
		        query += "pname ASC"; 
		    } else if ("name_desc".equals(sort)) {
		        query += "pname DESC"; 
		    } else if ("oldest".equals(sort)) {
		        query += "created_at ASC";
		    } else {
		        // Mặc định: newest hoặc không có sort
		        query += "created_at DESC";
		    }
		    
		    // Nếu có discount, thêm sắp xếp phụ theo discount
		    if (discount != null) {
		        query += ", discount ASC";
		    }
		    
		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query)) {
		        
		        ps.setString(1, "%" + txtSearch + "%");
		        ResultSet rs = ps.executeQuery();
		        
		        while (rs.next()) {
		            list.add(new Products(
		            		rs.getInt(1), 
							  rs.getString(2),
							  rs.getString(3),
							  rs.getString(4),
							  rs.getBigDecimal(5), 
							  rs.getString(6),
							  rs.getBoolean(7),
							  rs.getInt(8),
							  rs.getInt(9),
  					  rs.getInt(11),
  					  rs.getInt(12)));
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}
		

		public int countSearch(String txtSearch, String price, String discount) {
		    int count = 0;
		    
		    // Xây dựng câu truy vấn đếm
		    String query = "SELECT COUNT(*) FROM Products WHERE pname LIKE ?";
		    
		    // Thêm điều kiện lọc giá
		    if (price != null) {
		        switch (price) {
		            case "under200": query += " AND price < 200000"; break;
		            case "200to500": query += " AND price BETWEEN 200000 AND 500000"; break;
		            case "500to1000": query += " AND price > 500000 AND price <= 1000000"; break;
		            case "over1000": query += " AND price > 1000000"; break;
		        }
		    }
		    
		    // Thêm điều kiện giảm giá
		    if (discount != null) {
		        switch (discount) {
		            case "discount10": query += " AND discount >= 10"; break;
		            case "discount20": query += " AND discount >= 20"; break;
		            case "discount30": query += " AND discount >= 30"; break;
		            case "discount50": query += " AND discount >= 50"; break;
		        }
		    }
		    
		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query)) {
		        
		        ps.setString(1, "%" + txtSearch + "%");
		        ResultSet rs = ps.executeQuery();
		        
		        if (rs.next()) {
		            count = rs.getInt(1);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return count;
		}
		
		
		 public List<BestSellerProduct> getBestSellers(){
		        List<BestSellerProduct> list = new ArrayList<>();
		        String query = """
		            SELECT TOP 5 p.pid, p.pname, p.img, p.price,
		                   SUM(od.quantity) AS sold,
		                   SUM(od.quantity * od.price) AS revenue
		            FROM Products p
		            JOIN OrderDetails od ON p.pid = od.pid
		            JOIN Orders o ON od.orderid = o.orderid
		            WHERE o.status != N'Đã hủy'
		            GROUP BY p.pid, p.pname, p.img, p.price
		            ORDER BY sold DESC
		        """;

		        try (Connection conn = DBConnection.getConnection();
		        	PreparedStatement ps = conn.prepareStatement(query);
		             ResultSet rs = ps.executeQuery()) {
		            while (rs.next()) {
		                BestSellerProduct p = new BestSellerProduct();
		                p.setPid(rs.getInt("pid"));
		                p.setPname(rs.getString("pname"));
		                p.setImg(rs.getString("img"));
		                p.setPrice(rs.getBigDecimal("price"));
		                p.setSold(rs.getInt("sold"));
		                p.setRevenue(rs.getBigDecimal("revenue"));
		                list.add(p);
		            }
		        }
		        	catch (Exception e) {
			        e.printStackTrace();
			    }
		        return list;
		    }
		 
		 public List<BestSellerProduct> getBestSellersByCid(int cid) {
			    List<BestSellerProduct> list = new ArrayList<>();
			    String query = """
			        SELECT TOP 10 
			            p.pid, p.pname, p.img, p.price, p.discount, p.stock,
			            SUM(od.quantity) AS sold,
			            SUM(od.price * od.quantity) AS revenue
			        FROM Products p
			        JOIN OrderDetails od ON p.pid = od.pid
			        JOIN Orders o ON od.orderid = o.orderid
			        WHERE p.cid = ? AND p.IsActive = 1
			        GROUP BY p.pid, p.pname, p.img, p.price, p.discount, p.stock 
			        ORDER BY sold DESC
			    """;

			    try (Connection conn = DBConnection.getConnection();
			         PreparedStatement ps = conn.prepareStatement(query)) {

			        ps.setInt(1, cid); 

			        try (ResultSet rs = ps.executeQuery()) {
			            while (rs.next()) {
			                BestSellerProduct p = new BestSellerProduct();
			                p.setPid(rs.getInt("pid"));
			                p.setPname(rs.getString("pname"));
			                p.setImg(rs.getString("img"));
			                p.setPrice(rs.getBigDecimal("price"));
			                p.setDiscount(rs.getInt("discount"));
			                p.setStock(rs.getInt("stock"));
			                p.setSold(rs.getInt("sold"));
			                p.setRevenue(rs.getBigDecimal("revenue"));
			                list.add(p);
			            }
			        }

			    } catch (Exception e) {
			        e.printStackTrace();
			    }

			    return list;
			}

		 
		 public List<RecentSales> getRecentSales(){
		        List<RecentSales> list = new ArrayList<>();
		        String query = """
		            SELECT TOP 10 p.pid, u.fullname, p.pname, od.price, o.status
		            FROM OrderDetails od
		            JOIN Orders o ON od.orderid = o.orderid
		            JOIN Users u ON o.uid = u.uid
		            JOIN Products p ON od.pid = p.pid
		            ORDER BY orderdate DESC
		        """;

		        try (Connection conn = DBConnection.getConnection();
			        	PreparedStatement ps = conn.prepareStatement(query);
		             ResultSet rs = ps.executeQuery()) {
		            while (rs.next()) {
		            	RecentSales item = new RecentSales();
		            	item.setPid(rs.getInt("pid"));
		                item.setCustomerName(rs.getString("fullname"));
		                item.setProductName(rs.getString("pname"));
		                item.setPrice(rs.getBigDecimal("price"));
		                item.setStatus(rs.getString("status"));
		                list.add(item);
		            }
		        }
		        catch (Exception e) {
			        e.printStackTrace();
			    }
		        return list;
		    }
		 
		 public SalesReport getReport() {
		        SalesReport report = new SalesReport();
		        String query = """
		            SELECT 
		                SUM(od.quantity) AS totalQuantity,
		                SUM(od.quantity * od.price) AS totalRevenue
		            FROM OrderDetails od
		            JOIN Orders o ON od.orderid = o.orderid
		            WHERE o.status != N'Đã hủy'
		        """;

		        try (Connection conn = DBConnection.getConnection();
			        	PreparedStatement ps = conn.prepareStatement(query);
		             ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		                report.setTotalQuantity(rs.getInt("totalQuantity"));
		                report.setTotalRevenue(rs.getBigDecimal("totalRevenue"));
		            }
		        }
			        catch (Exception e) {
				        e.printStackTrace();
				    }
		        return report;
		    }
		 
		 public List<CategoryCount> getProductCountByCategory() {
		        List<CategoryCount> list = new ArrayList<>();
		        String sql = """
		                SELECT c.cname, SUM(od.quantity) AS count
		                FROM OrderDetails od
		                JOIN Products p ON od.pid = p.pid
		                JOIN Categories c ON p.cid = c.cid
		                JOIN Orders o ON od.orderid = o.orderid
		                WHERE o.status != N'Đã hủy'
		                GROUP BY c.cname
		            """;

		        try (Connection conn = DBConnection.getConnection();
		             PreparedStatement ps = conn.prepareStatement(sql);
		             ResultSet rs = ps.executeQuery()) {

		            while (rs.next()) {
		                list.add(new CategoryCount(rs.getString("cname"), 
		                		rs.getInt("count")));
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

		        return list;
		    }
		 
		 public List<RevenueByCategory> getRevenueByCategory() {
		        List<RevenueByCategory> list = new ArrayList<>();
		        String sql = """
		            SELECT c.cname, SUM(od.quantity * od.price) AS revenue
		            FROM OrderDetails od
		            JOIN Products p ON od.pid = p.pid
		            JOIN Categories c ON p.cid = c.cid
		            JOIN Orders o ON od.orderid = o.orderid
		            WHERE o.status != N'Đã hủy'
		            GROUP BY c.cname
		        """;

		        try (Connection conn = DBConnection.getConnection();
		             PreparedStatement ps = conn.prepareStatement(sql);
		             ResultSet rs = ps.executeQuery()) {
		            while (rs.next()) {
		                list.add(new RevenueByCategory(
		                    rs.getString("cname"),
		                    rs.getBigDecimal("revenue")
		                ));
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

		        return list;
		    }
		  
		 
		 public List<DailyRevenue> getRevenueByDate() {
			    List<DailyRevenue> list = new ArrayList<>();
			    String sql = """
			            SELECT CONVERT(VARCHAR(10), o.orderdate, 23) AS order_date,
				               SUM(od.quantity * od.price) AS revenue, SUM(od.quantity) AS count
				        FROM Orders o
				        JOIN OrderDetails od ON o.orderid = od.orderid
				        WHERE o.status != N'Đã hủy'
				        GROUP BY CONVERT(VARCHAR(10), o.orderdate, 23)
				        ORDER BY order_date
			        """;

			        try (Connection conn = DBConnection.getConnection();
			             PreparedStatement ps = conn.prepareStatement(sql);
			             ResultSet rs = ps.executeQuery()) {

			            while (rs.next()) {
			            	DailyRevenue r = new DailyRevenue();
			                r.setDate(rs.getString("order_date"));
			                r.setRevenue(rs.getBigDecimal("revenue"));
			                r.setCount(rs.getInt("count"));
			                list.add(r);
			            }
			    } catch (Exception e) {
			        e.printStackTrace();
			    }

			    return list;
			}
		 
		
		public static void main(String[] args) {
			
	    }
		
		
	
}
