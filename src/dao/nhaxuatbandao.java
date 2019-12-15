package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.nhaxuatbanBean;

public class nhaxuatbandao {
	DungChung dc = new DungChung();
	
	public ArrayList<nhaxuatbanBean> getNhaXuatBan() throws Exception{
		ArrayList<nhaxuatbanBean> dsNhaXuatban = new ArrayList<nhaxuatbanBean>();
		
		dc.KetNoi();
		
		String sql = "Select * from NHAXUATBAN";
		
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ves
		
		while(rs.next()) {
			String maNXB = rs.getString("MaNXB");
			String TenNXB = rs.getString("TenNXB");
			String DiaChi = rs.getString("Diachi");
			String SoDienThoai = rs.getString("DienThoai");
			
			nhaxuatbanBean nxb = new nhaxuatbanBean(maNXB, TenNXB, DiaChi, SoDienThoai);
			
			dsNhaXuatban.add(nxb);
		}
		
		rs.close();
		dc.cn.close();
		
		return dsNhaXuatban;
		
	}
}
