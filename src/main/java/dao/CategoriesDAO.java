package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Categories;
import utils.DBConnection;

public class CategoriesDAO {
	public List<Categories> getAllCategories() {
	    List<Categories> list = new ArrayList<>();
	    String query = "SELECT * FROM [Categories]";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1), 
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(4),
									  rs.getBoolean(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
	
	public List<Categories> getCategories() {
	    List<Categories> list = new ArrayList<>();
	    String query = "SELECT * FROM [Categories] WHERE IsActive = 1";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1), 
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(4),
									  rs.getBoolean(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
	
	public Categories getCategoriesByID(String cid) {
        String query = "SELECT * FROM [Categories] WHERE cid = ?";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Categories(rs.getInt(1), 
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(4),
									  rs.getBoolean(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
	
	
	public void deleteCategories(String cid) {
        String query = "DELETE FROM [Categories] WHERE cid = ?";
        PreparedStatement ps;
        try {
        	Connection conn = DBConnection.getConnection();
            ps = conn.prepareStatement(query);
			ps.setString(1, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
	
	public boolean insertCategories(String cname, String banner, String cdesc, boolean IsActive) {
	    String query = "INSERT INTO [dbo].[Categories] ([cname], [banner], [cdesc], [IsActive]) VALUES(?,?,?,?)";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setString(1, cname);
	        ps.setString(2, banner);
	        ps.setString(3, cdesc);
	        ps.setBoolean(4, IsActive);
	        
	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public boolean editCategories(String cid, String cname, String banner, String cdesc, boolean IsActive) {
	    String query = "UPDATE [dbo].[Categories] SET [cname] = ? ,[banner] = ? ,[cdesc] = ? ,[IsActive] = ? WHERE cid = ?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	    	ps.setString(1, cname);
            ps.setString(2, banner);
            ps.setString(3, cdesc);
            ps.setBoolean(4, IsActive);
            ps.setString(5, cid);
	        
	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
		
	
	public static void main(String[] args) {
		CategoriesDAO dao = new CategoriesDAO();
        List<Categories> listC = dao.getAllCategories();

        for (Categories c : listC) {
            System.out.println(c);
        }
    }
}
