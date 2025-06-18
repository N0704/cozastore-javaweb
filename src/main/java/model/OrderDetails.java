package model;

import java.math.BigDecimal;

public class OrderDetails {
	private int orderdetailid;
    private int orderid;
    private int pid;
    private int quantity;
    private BigDecimal price;
    private String pname;
    private String img;
    private int discount;
    
	public OrderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDetails(int orderdetailid, int orderid, int pid, int quantity, BigDecimal price) {
		super();
		this.orderdetailid = orderdetailid;
		this.orderid = orderid;
		this.pid = pid;
		this.quantity = quantity;
		this.price = price;
	}
	public int getOrderdetailid() {
		return orderdetailid;
	}
	public void setOrderdetailid(int orderdetailid) {
		this.orderdetailid = orderdetailid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
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
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return "OrderDetails [orderdetailid=" + orderdetailid + ", orderid=" + orderid + ", pid=" + pid + ", quantity="
				+ quantity + ", price=" + price + ", pname=" + pname + ", img=" + img + ", discount=" + discount + "]";
	}
	
	
	
    
}
