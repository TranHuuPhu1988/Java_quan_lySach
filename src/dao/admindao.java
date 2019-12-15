package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.adminbean;

public class admindao {
	DungChung dc = new DungChung();
	
	public ArrayList<adminbean> getAdmin() throws Exception{
		dc.KetNoi();
		ArrayList<adminbean> dsadmin = new ArrayList<adminbean>();
		String sql = "SELECT * FROM Admin";
		
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery(); //Lay du lieu ves
		
		while(rs.next()) {
			String username = rs.getString("UserAdmin");
			String PassAdmin = rs.getString("PassAdmin");
			String Hoten = rs.getString("Hoten");
			
			adminbean adb = new adminbean(username, PassAdmin, Hoten);
			
			dsadmin.add(adb);
		}
		rs.close();
		dc.cn.close();
		
		return dsadmin;
		
	}
}
