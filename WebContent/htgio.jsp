<%@page import="java.text.DecimalFormat"%>
<%@page import="bo.gioHangBo"%>
<%@page import="bean.giohangbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="css/style1.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Giỏ hàng</title>
</head>

<body>
<%			long sl=0;
	      	gioHangBo ktgh = (gioHangBo)session.getAttribute("gh"); 
	      		
	      	if(ktgh != null){
	      		sl = ktgh.ds.size();
	      	}
	   
	      %>

	<!--  begin nav -->
<nav class="navbar navbar-expand-lg bg-dark text-white">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand text-white" href="sachcontroller">Trang Chủ</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
    <% if(session.getAttribute("tendangnhap") != null){ %>
    	<li class="nav-item active">
        <a class="nav-link text-white" href="dangky.jsp">Đăng Xuất <span class="sr-only">(current)</span></a>
      </li>

     <%}else{ %>
      <li style="display:none" class="nav-item active">
        <a class="nav-link text-white" href="dangky.jsp">Đăng Ký <span class="sr-only">(current)</span></a>
      </li>
     <%} %>
      <li class="nav-item">
		<% if(session.getAttribute("tendangnhap") == null){ %>
		<li style="padding-top:7px"><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in text-white"></span> Đăng Nhập</a></li>
		<%}else{ %>
		<li style="align-items: center;
   		 display: flex;color:blue;"><span class="glyphicon glyphicon-log-in"></span> 
		Xin Chào <%=session.getAttribute("tendangnhap")%></li>
		<%} %>
      
      <li class="nav-item">
        <a class="nav-link disabled text-white" href="htgio.jsp">Giỏ Hàng(<%= sl%>)</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="sachcontroller" method ="post">
      <input class="form-control mr-sm-2" type="search" name="txttk" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<!--  end nav -->	
		<%
			if(session.getAttribute("gh") != null){
				gioHangBo gh =(gioHangBo) session.getAttribute("gh");
		%>		
		<div class="container">
			<h1 align="center" style="color: blue">GIỎ HÀNG</h1>
				<table width="1000" align="center" cellpadding="0" cellspacing="0" border="1" class="table table-hover">
					<tr>
					<div class="row" style="display: flex;justify-content: space-between;">
							<div >
								<h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
							</div>
							<div>
								
									<span > <a class="btn btn-primary btn-sm btn-block" href="sachcontroller">Continue shopping</a> </span>

							</div>
						</div>
					</tr>
					
					<tr class="bg-info">
						<th>
							<input class="btn btn-success" type="submit" value="Xóa" style="color: while">
						</th>
						<th>Mã sách</th>
						<th>Tên sách</th>
						<th>Tác giả</th>
						<th>Đơn giá</th>
						<th>Số lượng</th>
						<th>Thành tiền</th>
						<th>Tùy chọn</th>
					</tr>
					<% for(giohangbean g: gh.ds){ %>
					<tr align="center">
						<td>
							<form action="mua.jsp">
								<input class="btn btn-success" type="checkbox" value="<%= g.getMasach()%>" name="ms">
							</form>  
						</td>
						<td><%=g.getMasach()%> </td>
						<td><%=g.getTensach()%> </td>
						<td><%=g.getTacgia()%> </td>
						<td><%=g.getGia() %> </td>
						<td>
							<form action="mua.jsp" method="post" style="display: flex;">
								<input type="hidden" value="<%= g.getMasach()%>" name="ms">
								<input type="hidden" value="<%= g.getGia()%>" name="gia">
								<input type="number"  value="<%=g.getSoluong()%>" name="soluong">
								<input type="hidden" value="2" name="kt">
								<input class="btn btn-primary" type="submit" value="Cập nhật" class="btn-link">
							</form>
						</td>
						<td><%=g.getThanhtien() %> </td>
						<td>
							<form action="mua.jsp" method="post">
								<input type="hidden" value="<%=g.getMasach()%>" name="ms">
								<input type="hidden" value="<%=g.getGia()%>" name="gia">
								<input type="hidden" value="<%=g.getSoluong()%>" name="soluong">
								<input type="hidden" value="3" name="kt">
								<input class="btn btn-success" type="submit" value="Xóa" class="btn-link">
							</form>
						</td>
					</tr>
					<%} %>
				</table>
			
				<br><br>
		<div style="display:flex; justify-content: space-evenly;">
		<%DecimalFormat dd = new DecimalFormat("###,###");%>
			<div align="center"><h3>Tổng tiền: <%= dd.format(gh.Tong()) %></h3></div>
				<%if(gh.Tong() == 0){ %>
					<%response.sendRedirect("home.jsp"); %>
				<%} %>
			<div>

				<form action="" method="post">

					<input class="pl-3 pr-4 bg-success text-white" type="submit" value="Thanh Toán" class="btn-link">
				</form>

			</div>	
		<% }else{%>
			<h1 style="text-align: center;">Giỏ hàng trống</h1>
		<%} %>
		</div>
</div>
</body>
</html>