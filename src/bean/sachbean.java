package bean;

import java.util.Date;

public class sachbean {
	private String masach;
	private String tensach;
	private String tacgia;
	private String image;
	private int gia;
	private Date ngaynhap;
	private String maloai;
	private int soluong;
	private String sotap;
	private int maNXB;
	public sachbean(String masach, String tensach, String tacgia, String image, int gia, Date ngaynhap,
			String maloai, int soluong,String sotap,int maNXB) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.image = image;
		this.gia = gia;
		this.ngaynhap = ngaynhap;
		this.maloai = maloai;
		this.soluong = soluong;
		this.sotap = sotap;
		this.maNXB = maNXB;
	}
	


	public int getMaNXB() {
		return maNXB;
	}



	public void setMaNXB(int maNXB) {
		this.maNXB = maNXB;
	}



	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}



	public String getSotap() {
		return sotap;
	}

	public void setSotap(String sotap) {
		this.sotap = sotap;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}


	public String getMasach() {
		return masach;
	}

	public void setMasach(String masach) {
		this.masach = masach;
	}

	public String getTensach() {
		return tensach;
	}

	public void setTensach(String tensach) {
		this.tensach = tensach;
	}

	public String getTacgia() {
		return tacgia;
	}

	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public java.util.Date getNgaynhap() {
		return ngaynhap;
	}

	public void setNgaynhap(Date ngaynhap) {
		this.ngaynhap = ngaynhap;
	}

	public String getMaloai() {
		return maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	
	
	
}
