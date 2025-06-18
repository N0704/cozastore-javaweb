package model;

public class Users {
	 private int uid;
	    private String email;
	    private String username;
	    private String password;
	    private String fullname;
	    private String phone;
	    private String address;
	    private String role;
	    private boolean isActive;
	    private String avatar;
	    
		public Users() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Users(int uid, String email, String username, String password, String fullname, String phone,
				String address, String role, boolean isActive, String avatar) {
			super();
			this.uid = uid;
			this.email = email;
			this.username = username;
			this.password = password;
			this.fullname = fullname;
			this.phone = phone;
			this.address = address;
			this.role = role;
			this.isActive = isActive;
			this.avatar = avatar;
		}

		public int getUid() {
			return uid;
		}

		public void setUid(int uid) {
			this.uid = uid;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getFullname() {
			return fullname;
		}

		public void setFullname(String fullname) {
			this.fullname = fullname;
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

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public boolean isActive() {
			return isActive;
		}

		public void setActive(boolean isActive) {
			this.isActive = isActive;
		}

		public String getAvatar() {
			return avatar;
		}

		public void setAvatar(String avatar) {
			this.avatar = avatar;
		}

		@Override
		public String toString() {
			return "Users [uid=" + uid + ", email=" + email + ", username=" + username + ", password=" + password
					+ ", fullname=" + fullname + ", phone=" + phone + ", address=" + address + ", role=" + role
					+ ", isActive=" + isActive + ", avatar=" + avatar + "]";
		}
		
		

		
	    
		
	    
    
	
	


	
	
	
}
