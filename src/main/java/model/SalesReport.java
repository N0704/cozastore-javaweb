package model;

import java.math.BigDecimal;

public class SalesReport {
	private int totalQuantity;
    private BigDecimal totalRevenue;
    
	public SalesReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SalesReport(int totalQuantity, BigDecimal totalRevenue) {
		super();
		this.totalQuantity = totalQuantity;
		this.totalRevenue = totalRevenue;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public BigDecimal getTotalRevenue() {
		return totalRevenue;
	}

	public void setTotalRevenue(BigDecimal totalRevenue) {
		this.totalRevenue = totalRevenue;
	}

	@Override
	public String toString() {
		return "SalesReport [totalQuantity=" + totalQuantity + ", totalRevenue=" + totalRevenue + "]";
	}
    
    
	
}
