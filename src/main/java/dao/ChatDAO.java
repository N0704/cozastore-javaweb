package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import utils.DBConnection;

public class ChatDAO {
	public String getChatResponse(String userInput) {
	    boolean askForNew = userInput.toLowerCase().contains("mới");

	    StringBuilder query = new StringBuilder(
	        "SELECT pname, pdesc, price, discount, stock, created_at FROM Products"
	    );

	    String[] keywords = userInput.split("\\s+");
	    boolean hasKeywords = false;

	    // Nếu không hỏi "mới", thì tìm theo tên
	    if (!askForNew) {
	        hasKeywords = true;
	        query.append(" WHERE ");
	        for (int i = 0; i < keywords.length; i++) {
	            query.append("pname LIKE ?");
	            if (i < keywords.length - 1) query.append(" OR ");
	        }
	    } else {
	        // Nếu hỏi "mới", chỉ lấy top mới nhất
	        query.append(" pname LIKE ? ORDER BY created_at DESC");
	    }

	    if (askForNew) {
	        query.insert(7, "TOP 5 "); // thêm TOP 5 sau SELECT
	    }

	    StringBuilder result = new StringBuilder();
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query.toString())) {

	        if (hasKeywords) {
	            for (int i = 0; i < keywords.length; i++) {
	                stmt.setString(i + 1, "%" + keywords[i] + "%");
	            }
	        }

	        ResultSet rs = stmt.executeQuery();
	        boolean found = false;
	        while (rs.next()) {
	            found = true;
	            result.append("Tên: ").append(rs.getString("pname"))
	                  .append(", Mô tả: ").append(rs.getString("pdesc"))
	                  .append(", Giá: ").append(rs.getBigDecimal("price"))
	                  .append(", Giảm giá: ").append(rs.getInt("discount"))
	                  .append("%, Tồn kho: ").append(rs.getInt("stock"))
	                  .append(", Ngày thêm: ").append(rs.getTimestamp("created_at"))
	                  .append("\n");
	        }

	        if (!found) return "Không tìm thấy sản phẩm.";
	        return result.toString();

	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Có lỗi xảy ra khi tìm kiếm sản phẩm.";
	    }
	}

}
