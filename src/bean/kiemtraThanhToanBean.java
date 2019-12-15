package bean;

public class kiemtraThanhToanBean {
	private String masach;
	private int giasach;
	private int soluong;
	private String ktrathanhtoan;
	public String getMasach() {
		return masach;
	}
	public void setMasach(String masach) {
		this.masach = masach;
	}
	public int getGiasach() {
		return giasach;
	}
	public void setGiasach(int giasach) {
		this.giasach = giasach;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public String getKtrathanhtoan() {
		return ktrathanhtoan;
	}
	public void setKtrathanhtoan(String ktrathanhtoan) {
		this.ktrathanhtoan = ktrathanhtoan;
	}
	public kiemtraThanhToanBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public kiemtraThanhToanBean(String masach, int giasach, int soluong, String ktrathanhtoan) {
		super();
		this.masach = masach;
		this.giasach = giasach;
		this.soluong = soluong;
		this.ktrathanhtoan = ktrathanhtoan;
	}
	
}
