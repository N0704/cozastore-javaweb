package model;
import java.util.ArrayList;
import java.util.List;

public class Collections {
	private int collection_id;
	private String name;
	private String banner;
	private String hashtag;
	private String style;
	private List<Products> products;
	
	public Collections() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Collections(int collection_id, String name, String banner, String hashtag, String style) {
		super();
		this.collection_id = collection_id;
		this.name = name;
		this.hashtag = hashtag;
		this.banner = banner;
		this.style = style;
		this.products = new ArrayList<>();
	}

	public int getCollection_id() {
		return collection_id;
	}

	public void setCollection_id(int collection_id) {
		this.collection_id = collection_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public List<Products> getProducts() {
		return products;
	}

	public void setProducts(List<Products> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Collections [collection_id=" + collection_id + ", name=" + name + ", banner=" + banner + ", hashtag="
				+ hashtag + ", style=" + style + ", products=" + products + "]";
	}

	


	
}
