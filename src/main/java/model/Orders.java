package model;

import java.math.BigDecimal;
import java.sql.Timestamp; 

public class Orders {
	private int orderid;
    private int uid;
    private String fullName;
    private String phone;
    private String address;
    private String paymentMethod;
    private BigDecimal total;
    private Timestamp orderdate;
    private String status;
    private String payment_status;
    private int productCount;
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(int orderid, int uid, String fullName, String phone, String address, String paymentMethod,
			BigDecimal total, Timestamp orderdate, String status, String payment_status) {
		super();
		this.orderid = orderid;
		this.uid = uid;
		this.fullName = fullName;
		this.phone = phone;
		this.address = address;
		this.paymentMethod = paymentMethod;
		this.total = total;
		this.orderdate = orderdate;
		this.status = status;
		this.payment_status = payment_status;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public Timestamp getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	@Override
	public String toString() {
		return "Orders [orderid=" + orderid + ", uid=" + uid + ", fullName=" + fullName + ", phone=" + phone
				+ ", address=" + address + ", paymentMethod=" + paymentMethod + ", total=" + total + ", orderdate="
				+ orderdate + ", status=" + status + ", payment_status=" + payment_status + "]";
	}
	
	

	
	
    
	
    
	
    
}
