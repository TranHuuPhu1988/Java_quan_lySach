package bo;

import java.util.ArrayList;

import bean.giohangbean;

public class gioHangBo {

	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	
	public void them(String maSach, String tenSach, String tacGia, long gia, long soLuong) {
		giohangbean cart = new giohangbean(maSach, tenSach, tacGia, gia, soLuong);
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if (cart.getMasach().equals(ds.get(i).getMasach())) {
				ds.get(i).setSoluong(ds.get(i).getSoluong() + 1); 
				ds.get(i).setThanhtien(ds.get(i).getSoluong() * ds.get(i).getGia());
				return;
			}
		}
		ds.add(cart);
	}
	
	public void CapNhat(String maSach, String tenSach, String tacGia, long gia, long soLuong) {
		giohangbean cart = new giohangbean(maSach, tenSach, tacGia, gia, soLuong);
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if (cart.getMasach().equals(ds.get(i).getMasach())) {
				ds.get(i).setSoluong(cart.getSoluong()); 
				ds.get(i).setThanhtien(ds.get(i).getSoluong() * ds.get(i).getGia());
				return;
			}
		}
		ds.add(cart);
	}
	
	public void Xoa(String maSach, String tenSach, String tacGia, long gia, long soLuong){
		giohangbean cart = new giohangbean(maSach, tenSach, tacGia, gia, soLuong);
		int n = ds.size();
		for (int i = 0; i < n; i++) {
			if (cart.getMasach().equals(ds.get(i).getMasach())) {
				ds.remove(i);
				break;
			}
		}
	}
	
	public long Tong(){
		long s=0;
		for(giohangbean g:ds){
			s+= g.getThanhtien();
		}
		return s;
	}
}
