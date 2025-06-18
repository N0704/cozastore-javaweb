package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Menu;
import utils.DBConnection;

public class MenuDAO {
	public List<Menu> getAllMenu() {
	    List<Menu> list = new ArrayList<>();
	    String query = "SELECT * FROM [Menu]";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1), 
								rs.getString(2),
								rs.getInt(3),
								rs.getBoolean(4)));
            }
        } 
        	catch (Exception e) {
        }
        return list;
    }
	
	public List<Menu> getMenu() {
	    List<Menu> list = new ArrayList<>();
	    String query = "SELECT * FROM [Menu] WHERE IsActive = 1";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Menu(rs.getInt(1), 
								rs.getString(2),
								rs.getInt(3),
								rs.getBoolean(4)));
            }
        } 
        	catch (Exception e) {
        }
        return list;
    }
	
	public static void main(String[] args) {
		MenuDAO dao = new MenuDAO();
        List<Menu> menu = dao.getMenu();

        for (Menu m : menu) {
            System.out.println(m);
        }
    }
	
	// Thêm menu mới
	public void insertMenu(String menuName, int cid, boolean isActive) {
	    String sql = "INSERT INTO Menu (MenuName, cid, IsActive) VALUES (?, ?, ?)";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, menuName);
	        ps.setInt(2, cid);
	        ps.setBoolean(3, isActive);

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


    // Cập nhật menu
	public void updateMenu(int menuID, String menuName, int cid, boolean isActive) {
	    String sql = "UPDATE Menu SET MenuName = ?, cid = ?, IsActive = ? WHERE MenuID = ?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, menuName);
	        ps.setInt(2, cid);
	        ps.setBoolean(3, isActive);
	        ps.setInt(4, menuID);

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


    // Xóa menu theo ID
    public void deleteMenu(int menuID) {
        String sql = "DELETE FROM Menu WHERE MenuID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, menuID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
 // ✅ Lấy menu theo ID
    public Menu getMenuByID(String menuID) {
        String sql = "SELECT * FROM Menu WHERE MenuID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, menuID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Menu(
                    rs.getInt("MenuID"),
                    rs.getString("MenuName"),
                    rs.getInt("cid"),
                    rs.getBoolean("IsActive")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
