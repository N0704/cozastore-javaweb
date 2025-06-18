package model;
import java.util.ArrayList;
import java.util.List;

public class Categories {
	 private int cid;
	    private String cname;
	    private String banner;
	    private String cdesc;
	    private boolean IsActive;
	    private List<Products> products;
	    private List<BestSellerProduct> bestseller;
	    
		public Categories() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Categories(int cid, String cname, String banner, String cdesc, boolean isActive) {
			super();
			this.cid = cid;
			this.cname = cname;
			this.banner = banner;
			this.cdesc = cdesc;
			this.IsActive = isActive;
			this.products = new ArrayList<>();
			this.bestseller = new ArrayList<>();
		}

		public int getCid() {
			return cid;
		}

		public void setCid(int cid) {
			this.cid = cid;
		}

		public String getCname() {
			return cname;
		}

		public void setCname(String cname) {
			this.cname = cname;
		}


		public String getBanner() {
			return banner;
		}

		public void setBanner(String banner) {
			this.banner = banner;
		}

		public String getCdesc() {
			return cdesc;
		}

		public void setCdesc(String cdesc) {
			this.cdesc = cdesc;
		}

		public boolean isActive() {
			return IsActive;
		}

		public void setActive(boolean isActive) {
			this.IsActive = isActive;
		}

		public List<Products> getProducts() {
			return products;
		}

		public void setProducts(List<Products> products) {
			this.products = products;
		}
		

		public List<BestSellerProduct> getBestseller() {
			return bestseller;
		}

		public void setBestseller(List<BestSellerProduct> bestseller) {
			this.bestseller = bestseller;
		}

		@Override
		public String toString() {
			return "Categories [cid=" + cid + ", cname=" + cname + ", banner=" + banner + ", cdesc=" + cdesc
					+ ", IsActive=" + IsActive + ", products=" + products + ", bestseller=" + bestseller + "]";
		}

		

		
		
	    
}
