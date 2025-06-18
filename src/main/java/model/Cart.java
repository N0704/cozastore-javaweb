package model;

import java.math.BigDecimal;

public class Cart {
		private int id;
		private int uid;
		private int pid;
		private int quantity;
		private String pname;
		private BigDecimal price;
		private String img;
		private int discount;
		
		public Cart() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Cart(int id, int uid, int pid, int quantity) {
			super();
			this.id = id;
			this.uid = uid;
			this.pid = pid;
			this.quantity = quantity;
		}

		

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getUid() {
			return uid;
		}

		public void setUid(int uid) {
			this.uid = uid;
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

		public String getPname() {
			return pname;
		}

		public void setPname(String pname) {
			this.pname = pname;
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

		public int getDiscount() {
			return discount;
		}

		public void setDiscount(int discount) {
			this.discount = discount;
		}

		public BigDecimal getTotalPrice() {
		    // Tính tổng trước giảm giá
		    BigDecimal total = this.price.multiply(BigDecimal.valueOf(this.quantity));
		    
		    // Áp dụng giảm giá nếu có
		    if (this.discount > 0) {
		        BigDecimal discountPercent = BigDecimal.valueOf(this.discount).divide(BigDecimal.valueOf(100));
		        total = total.subtract(total.multiply(discountPercent));
		    }
			return total; 
		}

		@Override
		public String toString() {
			return "Cart [id=" + id + ", uid=" + uid + ", pid=" + pid + ", quantity=" + quantity + ", pname=" + pname
					+ ", price=" + price + ", img=" + img + ", discount=" + discount + "]";
		}

		
		
		
}
