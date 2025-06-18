package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utils.DBConnection;
import utils.PasswordUtils;
import model.Users;

public class UsersDAO {
	public List<Users> getAllUser(int uid) {
	    List<Users> list = new ArrayList<>();
	    String query = "SELECT* FROM [Users] WHERE uid != ? ";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, uid);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Users(rs.getInt(1), 
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getString(6),
								rs.getString(7),
								rs.getString(8),
								rs.getBoolean(9),
								rs.getString(10)));
            }
        } 
        	catch (Exception e) {
        }
        return list;
    }
	
	public Users getUser(int uid) {
	    String query = "SELECT * FROM [Users] WHERE uid = ?";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, uid);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	 return new Users(rs.getInt(1), 
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getString(6),
								rs.getString(7),
								rs.getString(8),
								rs.getBoolean(9),
								rs.getString(10));
            }
        } 
        	catch (Exception e) {
        }
        return null;
    }
	
	public Users login(String username) {
        String query = "SELECT * FROM [Users] WHERE username = ?";
        PreparedStatement ps;
        try {
        	Connection conn = DBConnection.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1),
	                        rs.getString(2),
	                        rs.getString(3),
	                        rs.getString(4),
	                        rs.getString(5),
	                        rs.getString(6),
	                        rs.getString(7),
	                        rs.getString(8),
	                        rs.getBoolean(9),
	                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }
	
	
	
	public void signup(String email, String username, String password, String fullname, String phone, String address, String avatar) {
	    String query = "INSERT INTO [dbo].[Users] "
	                 + "([email], [username], [password], [fullname], [phone], [address], [avatar]) "
	                 + "VALUES (?, ?, ?, ?, ?, ?, ?)";
	    
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) { 
				        ps.setString(1, email);
				        ps.setString(2, username);
				        ps.setString(3, password); 
				        ps.setString(4, fullname);
				        ps.setString(5, phone);
				        ps.setString(6, address);
				        ps.setString(7, avatar);
				        ps.executeUpdate();        
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    } 
	}
	
	 public Users checkLogin(String email, String password) {
	        String sql = "SELECT * FROM Users WHERE email = ? AND password = ? AND IsActive = 1";
        PreparedStatement ps;
        try {
        	Connection conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1),
	                        rs.getString(2),
	                        rs.getString(3),
	                        rs.getString(4),
	                        rs.getString(5),
	                        rs.getString(6),
	                        rs.getString(7),
	                        rs.getString(8),
	                        rs.getBoolean(9),
	                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
	}
	
	public Users findByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE email = ?";
        PreparedStatement ps;
        try {
        	Connection conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1),
	                        rs.getString(2),
	                        rs.getString(3),
	                        rs.getString(4),
	                        rs.getString(5),
	                        rs.getString(6),
	                        rs.getString(7),
	                        rs.getString(8),
	                        rs.getBoolean(9),
	                        rs.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
	}
	
	public boolean isUsernameExists(String username) {
	    String sql = "SELECT 1 FROM Users WHERE username = ?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, username);
	        ResultSet rs = ps.executeQuery();
	        return rs.next();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	public boolean isEmailExists(String email) {
	    String sql = "SELECT 1 FROM Users WHERE email = ?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();
	        return rs.next();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	    public int countCustomers() {
	    	String query = "SELECT COUNT(*) FROM Users WHERE role = 'User' AND IsActive = 1";
		    
		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query); 
		    ResultSet rs = ps.executeQuery()) {
		        if (rs.next()) return rs.getInt(1);       
		    } catch (Exception e) {
		        e.printStackTrace(); 
		    } 
		    return 0;
		}
	    
	    public void assignRole(String uid, String role) {
	        String sql = "UPDATE Users SET role = ? WHERE uid = ?";
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            
	        	ps.setString(1, role);
	            ps.setString(2, uid);
	            
	            ps.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public void updateAccount(String uid, String fullname, String phone, String email, String address) {
	        String sql = "UPDATE Users SET fullname = ?,phone = ?,email = ?,address = ? WHERE uid = ?";
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            
	        	ps.setString(1, fullname);
	        	ps.setString(2, phone);
	        	ps.setString(3, email);
	        	ps.setString(4, address);
	            ps.setString(5, uid);
	            
	            ps.executeUpdate();
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public boolean checkPassword(int uid, String currentPassword) {
	        String sql = "SELECT password FROM Users WHERE uid = ?";
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {

	            ps.setInt(1, uid);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                String hashedPassword = rs.getString("password");
	                return PasswordUtils.checkPassword(currentPassword, hashedPassword);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }


	    public void updatePassword(int uid, String newHashedPassword) {
	        String sql = "UPDATE Users SET password = ? WHERE uid = ?";
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {

	            ps.setString(1, newHashedPassword);
	            ps.setInt(2, uid);
	            ps.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public void insertGoogleUser(Users u) {
	        if (findByEmail(u.getEmail()) == null) {
	            String sql = "INSERT INTO Users(email, username, fullname, avatar, password) VALUES (?, ?, ?, ?, 'GOOGLE')";
	            try (Connection conn = DBConnection.getConnection();
	                 PreparedStatement ps = conn.prepareStatement(sql)) {
	                ps.setString(1, u.getEmail());
	                ps.setString(2, u.getEmail());
	                ps.setString(3, u.getFullname());
	                ps.setString(4, u.getAvatar());
	                ps.executeUpdate();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }

	
	
}


