package model;

import java.math.BigDecimal;

public class BestSellerProduct {
	private int pid;
    private String pname;
    private String img;
    private BigDecimal price;
    private int discount;
    private int stock;
    private int sold;
    private BigDecimal revenue;
    
	public BestSellerProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public BigDecimal getRevenue() {
		return revenue;
	}

	public void setRevenue(BigDecimal revenue) {
		this.revenue = revenue;
	}

	@Override
	public String toString() {
		return "BestSellerProduct [pid=" + pid + ", pname=" + pname + ", img=" + img + ", price=" + price
				+ ", discount=" + discount + ", stock=" + stock + ", sold=" + sold + ", revenue=" + revenue + "]";
	}

	
	
	
	
	
	
    
    
}
