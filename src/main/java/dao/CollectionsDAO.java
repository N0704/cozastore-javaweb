package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Collections;
import utils.DBConnection;

public class CollectionsDAO {
	public List<Collections> getAllCollections() {
	    List<Collections> list = new ArrayList<>();
	    String query = "SELECT * FROM [Collections]";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Collections(rs.getInt(1), 
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(5),
									  rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
	
	public Collections getCollectionsByID(String collection_id) {
        String query = "SELECT * FROM [Collections] WHERE collection_id = ?";
        try {
        	Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, collection_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Collections(rs.getInt(1), 
									  rs.getString(2),
									  rs.getString(3),
									  rs.getString(5),
									  rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }
	
	public void deleteCollections(String collection_id) {
        String query = "DELETE FROM [Collections] WHERE collection_id = ?";
        PreparedStatement ps;
        try {
        	Connection conn = DBConnection.getConnection();
            ps = conn.prepareStatement(query);
			ps.setString(1, collection_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
	
	public void insertCollections(String name, String banner, String hashtag, String style) {
	    String query = "INSERT INTO [dbo].[Categories] ([cname], [banner], [hashtag], [style]) VALUES(?,?,?,?)";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	    	ps.setString(1, name);
            ps.setString(2, banner);
            ps.setString(3, hashtag);
            ps.setString(4, style);
            ps.executeUpdate();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void editCollections(String collection_id, String name, String banner, String hashtag, String style) {
	    String query = "UPDATE [dbo].[Collections] SET [name] = ? ,[banner] = ? ,[hashtag] = ? ,[style] = ? WHERE collection_id = ?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	    	ps.setString(1, name);
            ps.setString(2, banner);
            ps.setString(3, hashtag);
            ps.setString(4, style);
            ps.setString(5, collection_id);
            ps.executeUpdate();

	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	public static void main(String[] args) {
		CollectionsDAO pdao = new CollectionsDAO();
        List<Collections> listCo = pdao.getAllCollections();

        for (Collections o : listCo) {
            System.out.println(o);
        }

	}

}
