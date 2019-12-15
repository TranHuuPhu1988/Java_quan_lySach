package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.loaibean;


public class loaidao {
	DungChung dc = new DungChung();
	public boolean KtTrungma(String maloai) throws Exception{
		//Kiem tra xem co loai nay trong bang loai hay khong ?
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		String sql = "SELECT maloai FROM loai WHERE maloai=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ve
		boolean kq= rs.next();
		
		//b3:Dong ket noi
		rs.close();
		return kq;
	
	}
	
	public int them(String maloai,String tenloai) throws Exception{
		dc.KetNoi();
			if(KtTrungma(maloai)) return 0;
			String sql = "INSERT INTO loai(maloai,tenloai)VALUES(?,?);";
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, maloai);
			cmd.setString(2, tenloai);
			int kq = cmd.executeUpdate();
			cmd.close();
			dc.cn.close();
			return kq;
	}
	 
	public boolean KtLoaiSach(String maloai) throws Exception{
		String sql = "Select maloai from sach where maloai=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ve
		boolean kq= rs.next();
		rs.close();
		return kq;
	}
	
	public int Xoa(String maloai) throws Exception{
		dc.KetNoi();
		if(KtLoaiSach(maloai)) return 0;
		String sql = "Delete from loai where maloai=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		int kq = cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
		return kq;
	}
	
	public int Sua(String maloai,String tenloaimoi) throws Exception{
		
		dc.KetNoi();
		if(KtLoaiSach(maloai)) return 0;
		String sql = "Update loai set tenloai=? where maloai=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, tenloaimoi);
		cmd.setString(2, maloai);
		int kq = cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
		return kq;
	}
	
	public ArrayList<loaibean> getloai() throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		
		//b1: Ket noi vao CSDL
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql = "Select * from loai";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ve
		while(rs.next()){
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			loaibean s = new loaibean(maloai, tenloai);
			ds.add(s);
		}
		//b3:Dong ket noi
		rs.close();
		dc.cn.close();
		
		return ds;
	}
}
