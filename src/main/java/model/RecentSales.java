package model;

import java.math.BigDecimal;

public class RecentSales {
	private int pid;
	private String customerName;
    private String productName;
    private BigDecimal price;
    private String status;
    
	public RecentSales() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecentSales(int pid, String customerName, String productName, BigDecimal price, String status) {
		super();
		this.pid = pid;
		this.customerName = customerName;
		this.productName = productName;
		this.price = price;
		this.status = status;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RecentSales [pid=" + pid + ", customerName=" + customerName + ", productName=" + productName + ", price=" + price
				+ ", status=" + status + "]";
	}
    
	
    
}
