package bo;

import java.util.ArrayList;

import bean.nhaxuatbanBean;
import bean.sachbean;
import dao.sachdao;

public class sachbo {
	sachdao dao = new sachdao();
	ArrayList<sachbean> ds;
	ArrayList<nhaxuatbanBean> dsnxb;
	public ArrayList<sachbean> getsach() throws Exception{
		ds = dao.getSach();
		return ds;
	}
	
	public ArrayList<sachbean> TimMaLoai(String maloai)throws Exception {
		ArrayList<sachbean> tam = new ArrayList<sachbean>();
		for(sachbean s:ds) 
			if(s.getMaloai().equals(maloai))
				tam.add(s);
		return tam;
		
	}
	
	public ArrayList<sachbean> Tim(String key)throws Exception {
		ArrayList<sachbean> tam = new ArrayList<sachbean>();
		for(sachbean s:ds) 
			if(s.getTensach().toLowerCase().trim().contains(key.toLowerCase().trim()) || s.getTacgia().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(s);
		return tam;
		
	}

	public ArrayList<sachbean> TimNhaXuatBan(String manhaxuatban)throws Exception {
		ArrayList<sachbean> tam = new ArrayList<sachbean>();
		
		for(sachbean s:ds)
			if(s.getMaNXB() == Integer.parseInt(manhaxuatban))
				tam.add(s);

		return tam;
	}

	public sachbean Chon(String masach) throws Exception{
		for(sachbean s:dao.getSach()) {
			if(s.getMasach().equals(masach))
				return s;
		}
		return null;
	}
	
	public int Sua(String masach,String tensachmoi,String tentacgiamoi) throws Exception {
		return dao.Sua(masach, tensachmoi, tentacgiamoi);
	}
	
	public int Xoa(String maloai,String masach) throws Exception{
		return dao.Xoa(maloai, masach);
	}
	
	public int Them(String masach,String tensach,String tacgia,int gia,java.sql.Date ngaynhap,String image,int soluong,String sotap,String maloai) throws Exception{
		return dao.them(masach, tensach, tacgia, gia, ngaynhap, image, soluong, sotap, maloai);
	}
	
}
