package service;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import java.util.List;

import dao.ProductsDAO;
import model.CategoryCount;
import model.DailyRevenue;
import model.RevenueByCategory;

public class ExportService {
	public void exportDailyRevenue(Sheet sheet) {
	    ProductsDAO dao = new ProductsDAO();
	    List<DailyRevenue> list = dao.getRevenueByDate();

	    // Tạo workbook từ sheet nếu cần
	    Workbook workbook = sheet.getWorkbook();
	    
	    // ===== TẠO CÁC KIỂU ĐỊNH DẠNG =====
	    // Font cho header
	    Font headerFont = workbook.createFont();
	    headerFont.setBold(true);
	    headerFont.setFontHeightInPoints((short)12);
	    headerFont.setColor(IndexedColors.WHITE.getIndex());
	    
	    // Style cho header
	    CellStyle headerStyle = workbook.createCellStyle();
	    headerStyle.setFont(headerFont);
	    headerStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
	    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    headerStyle.setAlignment(HorizontalAlignment.CENTER);
	    headerStyle.setBorderBottom(BorderStyle.THIN);
	    headerStyle.setBorderTop(BorderStyle.THIN);
	    headerStyle.setBorderLeft(BorderStyle.THIN);
	    headerStyle.setBorderRight(BorderStyle.THIN);
	    
	    // Style cho dữ liệu
	    CellStyle dataStyle = workbook.createCellStyle();
	    dataStyle.setBorderBottom(BorderStyle.THIN);
	    dataStyle.setBorderTop(BorderStyle.THIN);
	    dataStyle.setBorderLeft(BorderStyle.THIN);
	    dataStyle.setBorderRight(BorderStyle.THIN);
	    
	    // Style cho cột số tiền
	    CellStyle currencyStyle = workbook.createCellStyle();
	    currencyStyle.cloneStyleFrom(dataStyle);
	    currencyStyle.setDataFormat(workbook.createDataFormat().getFormat("#,##0"));
	    
	    // Style cho ngày tháng
	    CellStyle dateStyle = workbook.createCellStyle();
	    dateStyle.cloneStyleFrom(dataStyle);
	    dateStyle.setDataFormat(workbook.createDataFormat().getFormat("dd/MM/yyyy"));

	    // ===== TẠO TIÊU ĐỀ BÁO CÁO =====
	    Row titleRow = sheet.createRow(0);
	    Cell titleCell = titleRow.createCell(0);
	    titleCell.setCellValue("BÁO CÁO DOANH THU THEO NGÀY");
	    
	    // Style cho tiêu đề
	    CellStyle titleStyle = workbook.createCellStyle();
	    Font titleFont = workbook.createFont();
	    titleFont.setBold(true);
	    titleFont.setFontHeightInPoints((short)16);
	    titleStyle.setFont(titleFont);
	    titleStyle.setAlignment(HorizontalAlignment.CENTER);
	    titleCell.setCellStyle(titleStyle);
	    
	    // Merge cells cho tiêu đề
	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));

	    // ===== TẠO HEADER =====
	    Row header = sheet.createRow(1);
	    String[] headers = {"Ngày", "Doanh thu (VNĐ)", "Đã bán"};
	    for (int i = 0; i < headers.length; i++) {
	        Cell cell = header.createCell(i);
	        cell.setCellValue(headers[i]);
	        cell.setCellStyle(headerStyle);
	        // Tự động điều chỉnh độ rộng cột
	        sheet.autoSizeColumn(i);
	    }

	    // ===== ĐIỀN DỮ LIỆU =====
	    int rowIndex = 2;
	    for (DailyRevenue item : list) {
	        Row row = sheet.createRow(rowIndex++);
	        
	        // Cột ngày
	        Cell dateCell = row.createCell(0);
	        dateCell.setCellValue(item.getDate());
	        dateCell.setCellStyle(dateStyle);
	                
	        // Cột doanh thu
	        Cell revenueCell = row.createCell(1);
	        revenueCell.setCellValue(item.getRevenue().doubleValue());
	        revenueCell.setCellStyle(currencyStyle);
	        
	     // Cột số lượng
	        Cell countCell = row.createCell(2);
	        countCell.setCellValue(item.getCount());
	        countCell.setCellStyle(dataStyle);
	    }

	    // ===== ĐIỀU CHỈNH GIAO DIỆN =====
	    // Đặt độ rộng cột vừa với nội dung
	    for (int i = 0; i < headers.length; i++) {
	        sheet.autoSizeColumn(i);
	        // Thêm padding sau khi autoSize
	        sheet.setColumnWidth(i, sheet.getColumnWidth(i) + 1000);
	    }
	    
	}
	
	public void exportRevenueByCategory(Sheet sheet) {
	    ProductsDAO dao = new ProductsDAO();
	    List<RevenueByCategory> list = dao.getRevenueByCategory();

	    Workbook workbook = sheet.getWorkbook();

	    // ===== FONT & STYLE =====
	    Font headerFont = workbook.createFont();
	    headerFont.setBold(true);
	    headerFont.setFontHeightInPoints((short) 12);
	    headerFont.setColor(IndexedColors.WHITE.getIndex());

	    CellStyle headerStyle = workbook.createCellStyle();
	    headerStyle.setFont(headerFont);
	    headerStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
	    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    headerStyle.setAlignment(HorizontalAlignment.CENTER);
	    headerStyle.setBorderBottom(BorderStyle.THIN);
	    headerStyle.setBorderTop(BorderStyle.THIN);
	    headerStyle.setBorderLeft(BorderStyle.THIN);
	    headerStyle.setBorderRight(BorderStyle.THIN);

	    CellStyle dataStyle = workbook.createCellStyle();
	    dataStyle.setBorderBottom(BorderStyle.THIN);
	    dataStyle.setBorderTop(BorderStyle.THIN);
	    dataStyle.setBorderLeft(BorderStyle.THIN);
	    dataStyle.setBorderRight(BorderStyle.THIN);

	    CellStyle currencyStyle = workbook.createCellStyle();
	    currencyStyle.cloneStyleFrom(dataStyle);
	    currencyStyle.setDataFormat(workbook.createDataFormat().getFormat("#,##0"));

	    // ===== TIÊU ĐỀ BÁO CÁO =====
	    String[] headers = { "Danh mục", "Doanh thu (VNĐ)" };

	    Row titleRow = sheet.createRow(0);
	    Cell titleCell = titleRow.createCell(0);
	    titleCell.setCellValue("DOANH THU THEO TỪNG MỤC");

	    CellStyle titleStyle = workbook.createCellStyle();
	    Font titleFont = workbook.createFont();
	    titleFont.setBold(true);
	    titleFont.setFontHeightInPoints((short) 16);
	    titleStyle.setFont(titleFont);
	    titleStyle.setAlignment(HorizontalAlignment.CENTER);
	    titleCell.setCellStyle(titleStyle);

	    // Merge tiêu đề theo số cột headers
	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, headers.length - 1));

	    // ===== HEADER =====
	    Row header = sheet.createRow(1);
	    for (int i = 0; i < headers.length; i++) {
	        Cell cell = header.createCell(i);
	        cell.setCellValue(headers[i]);
	        cell.setCellStyle(headerStyle);
	    }

	    // ===== DỮ LIỆU =====
	    int rowIndex = 2;
	    for (RevenueByCategory item : list) {
	        Row row = sheet.createRow(rowIndex++);

	        Cell cnameCell = row.createCell(0);
	        cnameCell.setCellValue(item.getCname());
	        cnameCell.setCellStyle(dataStyle);

	        Cell revenueCell = row.createCell(1);
	        revenueCell.setCellValue(item.getRevenue().doubleValue());
	        revenueCell.setCellStyle(currencyStyle);
	    }

	    // ===== CĂN CHỈNH CỘT =====
	    for (int i = 0; i < headers.length; i++) {
	        sheet.autoSizeColumn(i);
	        int currentWidth = sheet.getColumnWidth(i);
	        sheet.setColumnWidth(i, currentWidth + 1000); // Thêm padding
	    }
	}
	
	public void exportCategoryCount(Sheet sheet) {
	    ProductsDAO dao = new ProductsDAO();
	    List<CategoryCount> list = dao.getProductCountByCategory();

	    Workbook workbook = sheet.getWorkbook();

	    // ===== FONT & STYLE =====
	    Font headerFont = workbook.createFont();
	    headerFont.setBold(true);
	    headerFont.setFontHeightInPoints((short) 12);
	    headerFont.setColor(IndexedColors.WHITE.getIndex());

	    CellStyle headerStyle = workbook.createCellStyle();
	    headerStyle.setFont(headerFont);
	    headerStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
	    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    headerStyle.setAlignment(HorizontalAlignment.CENTER);
	    headerStyle.setBorderBottom(BorderStyle.THIN);
	    headerStyle.setBorderTop(BorderStyle.THIN);
	    headerStyle.setBorderLeft(BorderStyle.THIN);
	    headerStyle.setBorderRight(BorderStyle.THIN);

	    CellStyle dataStyle = workbook.createCellStyle();
	    dataStyle.setBorderBottom(BorderStyle.THIN);
	    dataStyle.setBorderTop(BorderStyle.THIN);
	    dataStyle.setBorderLeft(BorderStyle.THIN);
	    dataStyle.setBorderRight(BorderStyle.THIN);

	    CellStyle currencyStyle = workbook.createCellStyle();
	    currencyStyle.cloneStyleFrom(dataStyle);
	    currencyStyle.setDataFormat(workbook.createDataFormat().getFormat("#,##0"));

	    // ===== TIÊU ĐỀ BÁO CÁO =====
	    String[] headers = { "Danh mục", "Số lượng đã bán" };

	    Row titleRow = sheet.createRow(0);
	    Cell titleCell = titleRow.createCell(0);
	    titleCell.setCellValue("SẢN PHẨM ĐÃ BÁN");

	    CellStyle titleStyle = workbook.createCellStyle();
	    Font titleFont = workbook.createFont();
	    titleFont.setBold(true);
	    titleFont.setFontHeightInPoints((short) 16);
	    titleStyle.setFont(titleFont);
	    titleStyle.setAlignment(HorizontalAlignment.CENTER);
	    titleCell.setCellStyle(titleStyle);

	    // Merge tiêu đề theo số cột headers
	    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, headers.length - 1));

	    // ===== HEADER =====
	    Row header = sheet.createRow(1);
	    for (int i = 0; i < headers.length; i++) {
	        Cell cell = header.createCell(i);
	        cell.setCellValue(headers[i]);
	        cell.setCellStyle(headerStyle);
	    }

	    // ===== DỮ LIỆU =====
	    int rowIndex = 2;
	    for (CategoryCount item : list) {
	        Row row = sheet.createRow(rowIndex++);

	        Cell cnameCell = row.createCell(0);
	        cnameCell.setCellValue(item.getCname());
	        cnameCell.setCellStyle(dataStyle);

	        Cell countCell = row.createCell(1);
	        countCell.setCellValue(item.getCount());
	        countCell.setCellStyle(dataStyle);
	    }

	    // ===== CĂN CHỈNH CỘT =====
	    for (int i = 0; i < headers.length; i++) {
	        sheet.autoSizeColumn(i);
	        int currentWidth = sheet.getColumnWidth(i);
	        sheet.setColumnWidth(i, currentWidth + 1000); // Thêm padding
	    }
	}

}
