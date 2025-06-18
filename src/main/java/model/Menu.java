package model;

public class Menu {
	private int MenuID;
	private String MenuName;
	private int cid;
	private boolean IsActive;
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Menu(int menuID, String menuName, int cid, boolean isActive) {
		super();
		MenuID = menuID;
		MenuName = menuName;
		this.cid = cid;
		IsActive = isActive;
	}
	public int getMenuID() {
		return MenuID;
	}
	public void setMenuID(int menuID) {
		MenuID = menuID;
	}
	public String getMenuName() {
		return MenuName;
	}
	public void setMenuName(String menuName) {
		MenuName = menuName;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public boolean isIsActive() {
		return IsActive;
	}
	public void setIsActive(boolean isActive) {
		IsActive = isActive;
	}
	@Override
	public String toString() {
		return "Menu [MenuID=" + MenuID + ", MenuName=" + MenuName + ", cid=" + cid + ", IsActive=" + IsActive + "]";
	}
	
	
	
}
