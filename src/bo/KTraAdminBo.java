package bo;

import java.util.ArrayList;

import bean.adminbean;
import bean.quanlyuserbean;
import dao.admindao;

public class KTraAdminBo {
	admindao adminDao = new admindao();
	
	ArrayList<adminbean> dsAdmin;
	
//	public ArrayList<adminbean> getDsAdmin() throws Exception {
//		dsAdmin = adminDao.getAdmin();
//		return dsAdmin;
//	}
	public String KtDangNhapAmin(String username , String password) throws Exception{

		
		for(adminbean admin : adminDao.getAdmin()) {
			
			if(admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
				
				return admin.getHoten();
			}
		}
		return null;
	}
}
