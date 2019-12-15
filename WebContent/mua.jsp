<%@page import="bean.giohangbean"%>
<%@page import="bo.gioHangBo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Giỏ hàng</title>
</head>
<body>
	<%
		//lấy các giá trị từ trang home.jsp khi khách hàng mua sách
		String ms = request.getParameter("ms");
		String ts = request.getParameter("ts");
		String tg = request.getParameter("tg");
		String giatam = request.getParameter("gia");
		String soluong = request.getParameter("soluong");
		String kt = request.getParameter("kt");
		
		if(giatam != null) {
			long gia = Long.parseLong(giatam);
			gioHangBo gh = null;
			//Kiem tra xem da tao session, neu chua thi tao 1 session de luu gioHangBo
			if(session.getAttribute("gh") == null){
				// khởi tạo session 
				gh = new gioHangBo();
				session.setAttribute("gh", gh);
			}
			//b1: Gan session vao bien: gh
			gh = (gioHangBo)session.getAttribute("gh");
			//b2: Thay doi bien gh 
			
			// kt được lấy từ trang home.jsp khi khách hàng mua sản phẩm
			if(Long.parseLong(kt) == 1){
				gh.them(ms, ts, tg, gia, 1);
			//kt được lấy từ trang htgio.jsp khi khách hàng Cập Nhật số lượng sản phẩm
			}else if(Long.parseLong(kt) == 2){
				gh.CapNhat(ms, ts, tg, gia, Long.parseLong(soluong));
			//kt được lấy từ trang htgio.jsp khi khách hàng Xóa sản phẩm
			}else if(Long.parseLong(kt) == 3){
				gh.Xoa(ms, ts, tg, gia, Long.parseLong(soluong));
			}
			
			//b3: Luu lai vao bien session
			session.setAttribute("gh", gh);
			//chuyển trang 
			response.sendRedirect("htgio.jsp");
			
		}
	%>
</body>
</html>