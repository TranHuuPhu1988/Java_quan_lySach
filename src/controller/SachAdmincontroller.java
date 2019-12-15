package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.sachbean;
import bo.sachbo;


/**
 * Servlet implementation class SachAdmincontroller
 */
@WebServlet("/SachAdmincontroller")
public class SachAdmincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SachAdmincontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    sachbo sbo = new sachbo();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			//lây dữ liệu chức năng và xóa
			String masach= null;
			String maloai = null;
			if(request.getParameter("msdelete") != null && request.getParameter("mldetete") != null) {
				masach = request.getParameter("msdelete");
				maloai = request.getParameter("mldetete");
				
			}
			
			//lấy dữ liệu chức năng thêm
			
			String txtmasach = request.getParameter("txtmasach");
			String txttacgia = request.getParameter("txttacgia");
			String txttensach = request.getParameter("txttensach");
			int longgia = 0;
			int intsoluong = 0;
			Date datengaynhap = null;
			if(request.getParameter("longgia") !=null && request.getParameter("intsoluong") !=null) {
				String tmplonggia = request.getParameter("longgia");
				longgia = Integer.parseInt(tmplonggia, 10);
				String tmpintsoluong = request.getParameter("intsoluong");
				intsoluong = Integer.parseInt(tmpintsoluong,10);
			}
			if(request.getParameter("datengaynhap") !=null) {
				String tmpdatengaynhap = request.getParameter("datengaynhap");
				datengaynhap = Date.valueOf(tmpdatengaynhap);
			}
			
			String txtimage = null;
			txtimage = request.getParameter("txtimage");
			String intsotap = request.getParameter("intsotap");
			String txtmaloai = request.getParameter("txtmaloai");

			
		
			if(request.getParameter("ms") !=null) {
				sachbean sb = sbo.Chon(request.getParameter("ms"));
				request.setAttribute("masach", sb);;
			}
			if(masach != null && maloai !=null) {
//				System.out.println(masach);
//				System.out.println(maloai);
					int n = sbo.Xoa(maloai, masach);
					if( n == 0) {
						request.setAttribute("kqxoa", 0);
					}
			}
			if( request.getParameter("btn_Them") != null) {
//				System.out.println(txtmasach);	
				if(txtmasach != null && txttensach != null && txttacgia !=null && datengaynhap !=null 
						&& txtimage !=null && intsotap!=null && txtmaloai!=null) {
					int n = sbo.Them(txtmasach, txttensach, txttacgia, longgia, datengaynhap,txtimage, intsoluong, intsotap, txtmaloai);
					if (n==0) {
						request.setAttribute("kqthem", 0);
					}
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("SachAdmin.jsp");
					rd.forward(request, response);
				}
			}
			if(request.getParameter("btn_Sua")!=null) {
				if(txtmasach != null && txttensach != null && txttacgia !=null) {
//					System.out.println(txtmasach);
//					System.out.println(txttensach);
//					System.out.println(txttacgia);
					int n = sbo.Sua(txtmasach, txttensach, txttacgia);
					if(n==0) {
						request.setAttribute("kqsua", 0);
					}
				}
			}
			
			request.setAttribute("dsSach", sbo.getsach());
			RequestDispatcher rd = request.getRequestDispatcher("SachAdmin.jsp");
			rd.forward(request, response);
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
