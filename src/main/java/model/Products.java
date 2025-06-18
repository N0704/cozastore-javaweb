package model;

import java.math.BigDecimal;

public class Products {
	private int pid;
    private String pname;
    private String pdesc;
    private String pci;
    private BigDecimal price;
    private String img;
    private boolean isActive;
    private int cid;
    private int collection_id;
    private int discount;
    private int stock;
    
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Products(int pid, String pname, String pdesc, String pci, BigDecimal price, String img,
			boolean isActive, int cid, int collection_id, int discount, int stock) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdesc = pdesc;
		this.pci = pci;
		this.price = price;
		this.img = img;
		this.isActive = isActive;
		this.cid = cid;
		this.collection_id = collection_id;
		this.discount = discount;
		this.stock = stock;
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

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public String getPci() {
		return pci;
	}

	public void setPci(String pci) {
		this.pci = pci;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getCollection_id() {
		return collection_id;
	}

	public void setCollection_id(int collection_id) {
		this.collection_id = collection_id;
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

	@Override
	public String toString() {
		return "Products [pid=" + pid + ", pname=" + pname + ", pdesc=" + pdesc + ", pci=" + pci + ", price=" + price + ", img=" + img + ", isActive=" + isActive + ", cid=" + cid + ", collection_id="
				+ collection_id + ", discount=" + discount + ", stock=" + stock + "]";
	}

	
	
    
	
    
	
    
}
