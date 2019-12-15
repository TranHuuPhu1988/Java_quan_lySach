package bo;

import java.util.ArrayList;

import bean.quanlyuserbean;
import dao.quanlyuserdao;

public class kiemtradangnhapbo {
	quanlyuserdao qlub = new quanlyuserdao();
	ArrayList<quanlyuserbean> dsUser;
	
	public ArrayList<quanlyuserbean> getUserB() throws Exception{
		dsUser = qlub.getUser();
		return dsUser;
	}
	
	public String KtDangNhap(String tenDangNhap , String maKhau) throws Exception{

		
		for(quanlyuserbean us: qlub.getUser()) {
			System.out.print("Tendangnhap : "+ us.getTendangnhap());
			if(us.getTendangnhap().equals(tenDangNhap) && us.getPassword().equals(maKhau)) {
				
				return us.getTendangnhap();
			}
		}
		return null;
	}
	
	public int ThemTaiKhoang(String hoten,String diachi,String sodienthoai,String email,String tendangnhap,String password) throws Exception{
		return qlub.ThemTaiKhoang(hoten, diachi, sodienthoai, email, tendangnhap, password);
	}
	
}
