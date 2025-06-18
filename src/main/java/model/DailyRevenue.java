package model;

import java.math.BigDecimal;

public class DailyRevenue {
	private String date;
    private BigDecimal revenue;
    private int count;
	public DailyRevenue() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DailyRevenue(String date, BigDecimal revenue, int count) {
		super();
		this.date = date;
		this.revenue = revenue;
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public BigDecimal getRevenue() {
		return revenue;
	}
	public void setRevenue(BigDecimal revenue) {
		this.revenue = revenue;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "DailyRevenue [date=" + date + ", revenue=" + revenue + ", count=" + count + "]";
	}
	
	
    
}
