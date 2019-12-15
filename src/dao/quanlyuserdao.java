package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.quanlyuserbean;

public class quanlyuserdao {
	DungChung dc = new DungChung();
	
	public ArrayList<quanlyuserbean> getUser() throws Exception{
		ArrayList<quanlyuserbean> dsNXB = new ArrayList<quanlyuserbean>();
		dc.KetNoi();
		
		String sql = "Select * from KhachHang";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ves
		
		while(rs.next()) {
			int makhachhang = rs.getInt("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String tendangnhap = rs.getString("tendn");
			String email = rs.getString("email");
			String sodienthoai = rs.getString("sodt");
			String password = rs.getString("pass");
			
			quanlyuserbean qlub = new quanlyuserbean(makhachhang, hoten, diachi, sodienthoai, email, tendangnhap, password);
			
			dsNXB.add(qlub);
			}
		rs.close();
		dc.cn.close();
		return dsNXB;
		
	} 
	
	public int ThemTaiKhoang(String hoten,String diachi,String sodienthoai,String email,String tendangnhap,String password) throws Exception{
		dc.KetNoi();
		String sql = 
				"INSERT INTO KhachHang(hoten,diachi,sodt,email,tendn,pass)Values(?,?,?,?,?,?)";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		//cmd.setInt(1, makh);	
		cmd.setString(1, hoten);
		cmd.setString(2, diachi);
		cmd.setString(3, sodienthoai);
		cmd.setString(4, email);
		cmd.setString(5, tendangnhap);
		cmd.setString(6, password);
		
		int kq = cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
		return kq;
	}
	
	
}
