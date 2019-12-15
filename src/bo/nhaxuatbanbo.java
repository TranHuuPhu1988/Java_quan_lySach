package bo;

import java.util.ArrayList;

import bean.nhaxuatbanBean;
import dao.nhaxuatbandao;

public class nhaxuatbanbo {
	nhaxuatbandao dao = new nhaxuatbandao();
	
	ArrayList<nhaxuatbanBean> dsNXB;
	
	public ArrayList<nhaxuatbanBean> getdsNXB() throws Exception{
		dsNXB = dao.getNhaXuatBan();
		return dsNXB;
	}
}
