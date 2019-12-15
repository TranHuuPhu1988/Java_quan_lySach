package bean;

public class nhaxuatbanBean {
	private String manhaxuatban;
	private String tennhaxuatban;
	private String diachi;
	private String sodienthoai;
	
	public String getTennhaxuatban() {
		return tennhaxuatban;
	}
	public void setTennhaxuatban(String tennhaxuatban) {
		this.tennhaxuatban = tennhaxuatban;
	}
	public String getDiachi() {
		return diachi;
	}
	public String getManhaxuatban() {
		return manhaxuatban;
	}
	public void setManhaxuatban(String manhaxuatban) {
		this.manhaxuatban = manhaxuatban;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSodienthoai() {
		return sodienthoai;
	}
	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	public nhaxuatbanBean(String manhaxuatban, String tennhaxuatban, String diachi, String sodienthoai) {
		super();
		this.manhaxuatban = manhaxuatban;
		this.tennhaxuatban = tennhaxuatban;
		this.diachi = diachi;
		this.sodienthoai = sodienthoai;
	}
	public nhaxuatbanBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
