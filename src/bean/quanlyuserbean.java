package bean;

public class quanlyuserbean {
	private int makhachhang;
	private String hoten;
	private String daichi;
	private String sodienthoai;
	private String email;
	private String tendangnhap;
	private String password;
	
	public int getMakhachhang() {
		return makhachhang;
	}
	public void setMakhachhang(int makhachhang) {
		this.makhachhang = makhachhang;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDaichi() {
		return daichi;
	}
	public void setDaichi(String daichi) {
		this.daichi = daichi;
	}
	public String getSodienthoai() {
		return sodienthoai;
	}
	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTendangnhap() {
		return tendangnhap;
	}
	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public quanlyuserbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public quanlyuserbean(int makhachhang, String hoten, String daichi, String sodienthoai, String email,
			String tendangnhap, String password) {
		super();
		this.makhachhang = makhachhang;
		this.hoten = hoten;
		this.daichi = daichi;
		this.sodienthoai = sodienthoai;
		this.email = email;
		this.tendangnhap = tendangnhap;
		this.password = password;
	}
	
}
