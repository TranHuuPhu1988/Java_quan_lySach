package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import bean.loaibean;
import bean.sachbean;

public class sachdao {
	DungChung dc = new DungChung();
	
	public ArrayList<sachbean> getSach() throws Exception {
		ArrayList<sachbean> danhsach = new ArrayList<sachbean>();
		//b1: Ket noi vao CSDL
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql = "Select * from sach";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ves
		
		while(rs.next()){
			int maNXB = rs.getInt("MaNXB");
			String masach = rs.getString("masach");
			String tensach = rs.getString("tensach");
			String tacgia = rs.getString("tacgia");
			String anh = rs.getString("anh");
			int gia = rs.getInt("gia");
			Date ngaynhap = rs.getDate("ngaynhap");
			String maloai = rs.getString("maloai");
			int soluong = rs.getInt("soluong");
			String sotap = rs.getString("sotap");
			sachbean s = new sachbean(masach, tensach, tacgia, anh, gia, ngaynhap, maloai,soluong,sotap,maNXB);
			danhsach.add(s);
		}
		
		//b3:Dong ket noi
		rs.close();
		dc.cn.close();
		
		return danhsach;
	}
	
	public boolean KtTrungma(String masach) throws Exception{
		//Kiem tra xem co loai nay trong bang loai hay khong ?
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		
		String sql = "SELECT masach FROM sach WHERE masach=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ve
		boolean kq= rs.next();
		
		//b3:Dong ket noi
		rs.close();
		return kq;
	
	}
	public int them(String masach,String tensach,String tacgia,int gia,java.sql.Date ngaynhap,String image,int soluong,String sotap,String maloai) throws Exception{

			dc.KetNoi();
				
			if(KtTrungma(masach)) return 0;
		
			String sql = "INSERT INTO sach(masach,tensach,tacgia,gia,NgayNhap,anh,soluong,sotap,maloai)VALUES(?,?,?,?,?,?,?,?,?);";
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, masach);
			cmd.setString(2, tensach);
			cmd.setString(3, tacgia);
			cmd.setInt(4, gia);
			cmd.setDate(5, ngaynhap);
			cmd.setString(6, image);
			cmd.setInt(7, soluong);
			cmd.setString(8, sotap);
			cmd.setString(9, maloai);
			
			int kq = cmd.executeUpdate();
			cmd.close();
			dc.cn.close();
			return kq;
	}
	
	public boolean KtLoai(String maloai) throws Exception{
		String sql = "Select maloai from loai where maloai=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ve
		boolean kq= rs.next();
		rs.close();
		return kq;
	}
	
	public int Xoa(String maloai,String masach) throws Exception{
		dc.KetNoi();
//		if(KtLoai(maloai)) return 0;
		System.out.print("masach là : "+ masach);
		String sql = "DELETE FROM sach WHERE masach=?";
		
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
		return kq;
	}
	
	public int Sua(String masach,String tensachmoi,String tentacgiamoi) throws Exception{
		
		dc.KetNoi();
		//if(KtLoaiSach(maloai)) return 0;
		String sql = "Update sach set tensach=? , tacgia=? where masach=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, tensachmoi);
		cmd.setString(2, tentacgiamoi);
		cmd.setString(3, masach);
		int kq = cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
		return kq;
	}
}
