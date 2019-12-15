package bo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao loai = new loaidao();
	public ArrayList<loaibean> getloai() throws Exception{
		return loai.getloai();
	}
	public boolean KtTrungma(String maloai) throws Exception{
		return loai.KtTrungma(maloai);
	}
	 
	public boolean KtLoaiSach(String maloai) throws Exception{
		return loai.KtLoaiSach(maloai);
	}	
	
	public int them(String maloai,String tenloai) throws Exception{
		return loai.them(maloai, tenloai);
	}
	
	public int Xoa(String maloai) throws Exception{
		return loai.Xoa(maloai);
	}
	
	public int Sua(String maloai,String tenloaimoi) throws Exception{
		return loai.Sua(maloai, tenloaimoi);
	}
	public loaibean chon(String maloai) throws Exception{
		for(loaibean l:loai.getloai())
			if(l.getMaloai().equals(maloai))
				return l;
		return null;
	}
	
}
