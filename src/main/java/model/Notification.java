package model;

import java.sql.Timestamp;

public class Notification {
	private int id;
    private int pid;
    private String message;
    private boolean is_read;
    private Timestamp created_at;
    private String pname;
    private String img;
    
	public Notification() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Notification(int id, int pid, String message, boolean is_read, Timestamp created_at) {
		super();
		this.id = id;
		this.pid = pid;
		this.message = message;
		this.is_read = is_read;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean isIs_read() {
		return is_read;
	}

	public void setIs_read(boolean is_read) {
		this.is_read = is_read;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
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



	@Override
	public String toString() {
		return "Notification [id=" + id + ", pid=" + pid + ", message=" + message + ", is_read=" + is_read
				+ ", created_at=" + created_at + ", pname=" + pname + ", img=" + img + "]";
	}

	
	
	
	
	
    
}
