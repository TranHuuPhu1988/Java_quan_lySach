package bean;

public class adminbean {
	private String username;
	private String password;
	private String hoten;
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
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public adminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adminbean(String username, String password, String hoten) {
		super();
		this.username = username;
		this.password = password;
		this.hoten = hoten;
	}
	
}
