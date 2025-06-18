package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import service.ExportService;

@WebServlet("/export-excel")
public class ExportExcel extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public ExportExcel() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        
        
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Dữ liệu");
            
            ExportService service = new ExportService();
            switch (type) {
            case "Bao_Cao_Doanh_Thu":
                service.exportDailyRevenue(sheet);
                break;
            case "Doanh_Thu_Theo_Tung_Muc":
            	service.exportRevenueByCategory(sheet);
                break;
            case "San_Pham_Ban_Ra":
            	service.exportCategoryCount(sheet);
                break;
        }

            
            response.setContentType(
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader(
                "Content-Disposition", "attachment; filename=" + type + ".xlsx");
            
            workbook.write(response.getOutputStream());
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                "Lỗi khi xuất file Excel: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}