package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.kiemtradangnhapbo;

/**
 * Servlet implementation class ThemTaiKhoangController
 */
@WebServlet("/ThemTaiKhoangController")
public class ThemTaiKhoangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemTaiKhoangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    kiemtradangnhapbo ktrabo = new kiemtradangnhapbo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String HoTen = request.getParameter("HotenKH");
			String TenDN = request.getParameter("TenDN");
			String Matkhau = request.getParameter("Matkhau");
//			String Matkhaunhatrlai =request.getParameter("Matkhaunhatrlai");
			String Email = request.getParameter("Email");
			String Diachi = request.getParameter("Diachi");
			String Dienthoai = request.getParameter("Dienthoai");
			
			request.setAttribute("dsUser", ktrabo.getUserB());
			
			int n = ktrabo.ThemTaiKhoang(HoTen, Diachi, Dienthoai, Email, TenDN, Matkhau);
			if(n!=0) {
				request.setAttribute("ktradangky", n);
				RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {

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
