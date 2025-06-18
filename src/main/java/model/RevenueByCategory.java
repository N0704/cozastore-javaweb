package model;

import java.math.BigDecimal;

public class RevenueByCategory {
	private String cname;
    private BigDecimal revenue;
	public RevenueByCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RevenueByCategory(String cname, BigDecimal revenue) {
		super();
		this.cname = cname;
		this.revenue = revenue;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public BigDecimal getRevenue() {
		return revenue;
	}
	public void setRevenue(BigDecimal revenue) {
		this.revenue = revenue;
	}
	@Override
	public String toString() {
		return "RevenueByCategory [cname=" + cname + ", revenue=" + revenue + "]";
	}
    
    
}
