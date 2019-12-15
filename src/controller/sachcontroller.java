package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.KTraAdminBo;
import bo.kiemtradangnhapbo;
import bo.loaibo;
import bo.nhaxuatbanbo;
import bo.sachbo;

/**
 * Servlet implementation class sachcontroller
 */
@WebServlet("/sachcontroller")
public class sachcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sachcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    sachbo sbo = new sachbo();
    loaibo lbo = new loaibo();
    nhaxuatbanbo nxbbo = new nhaxuatbanbo();
    kiemtradangnhapbo ktrabo = new kiemtradangnhapbo();
    KTraAdminBo ktraADbo = new KTraAdminBo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			//Tao ra 1 bien req de chuyen sach ve trang htsach.jsp
			
			//lấy về tên đăng nhập mk 
			String Tendangnhap=null;
			String MatKhau=null;
			if(request.getParameter("TenDN") !=null && request.getParameter("Matkhau") !=null) {
				Tendangnhap = request.getParameter("TenDN");
				MatKhau = request.getParameter("Matkhau");
			}
			
			String ml = request.getParameter("ml");
			String key = request.getParameter("txttk");
			String manhaxuatban = request.getParameter("mxb");
			
			request.setAttribute("dsNXB", nxbbo.getdsNXB());
			request.setAttribute("dsloai", lbo.getloai());
			request.setAttribute("dsNXB", nxbbo.getdsNXB());

			if(ml!=null) {
				request.setAttribute("dssach", sbo.TimMaLoai(ml));
			}else if(key != null) {
				request.setAttribute("dssach", sbo.Tim(key));
			}else {
				request.setAttribute("dssach", sbo.getsach());
			}
			if(manhaxuatban !=null) {
				
			request.setAttribute("dssach", sbo.TimNhaXuatBan(manhaxuatban));
			}
			
			
			if(Tendangnhap != null && MatKhau !=null) {
			
				String Usernameadmin = ktraADbo.KtDangNhapAmin(Tendangnhap, MatKhau);
				if(Usernameadmin != null ) {
					
					response.sendRedirect("LoaiAdminController");
					return;
				}else {
				String username = ktrabo.KtDangNhap(Tendangnhap, MatKhau);
				if(username !=null) {
					HttpSession session = request.getSession();
					session.setAttribute("tendangnhap", username);
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.forward(request, response);
				}
				}
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
