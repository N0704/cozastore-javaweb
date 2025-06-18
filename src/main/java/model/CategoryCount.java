package model;

public class CategoryCount {
	 private String cname;
	 private int count;
	public CategoryCount() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryCount(String cname, int count) {
		super();
		this.cname = cname;
		this.count = count;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CategoryCount [cname=" + cname + ", count=" + count + "]";
	}
	 
	 
}
