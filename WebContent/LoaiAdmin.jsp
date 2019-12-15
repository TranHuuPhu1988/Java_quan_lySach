<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.nhaxuatbanBean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.gioHangBo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%

		if (request.getAttribute("ktnhap") != null) {
			out.print("<script>alert('nhập không được mô');</script>");
		}
		if (request.getAttribute("ktsua") != null) {
			out.print("<script>alert('không được sửa mô');</script>");
		}
		if (request.getAttribute("ktxoa") != null) {
			out.print("<script>alert('không đượcs xóa mô');</script>");
		}
		loaibean l1 = (loaibean) request.getAttribute("chonloai");
	%>
	<nav class="navbar navbar-expand-lg bg-dark text-white">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand text-white" href="#">Page Admin</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">


	<li class="nav-item">
        <a class="nav-link text-white" href="dangnhap.jsp">Đăng Xuất <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link text-white" href="SachAdmincontroller">Quản Lý Sách <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link text-white" href="LoaiAdminController">Quản Lý Loại Sách <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link text-white" href="QuanLyUser">Quản Lý User <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="sachcontroller" method ="post">
      <input class="form-control mr-sm-2" type="search" name="txttk" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
	<div class="border border-primary m-4">
	<h1 style="text-align: center;">QUẢN LÝ LOẠI SÁCH</h1>
	
		<form action="LoaiAdminController" method="post" class="border p-3">
			<div class="form-group">
				<label for="exampleInputEmail1">Mã Loại</label> 
				<input type="text"
					class="form-control" id="exampleInputEmail1" name="txtmaloai"
					aria-describedby="emailHelp" placeholder="Nhập mã Loại"
					value="<%=(l1 != null ? l1.getMaloai() : "")%>"
				> 
				<small
					id="emailHelp" class="form-text text-muted">nhận vào mã
					loại mà bạn muốn
				</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Tên Loại</label> 
				<input
					type="text" class="form-control" id="exampleInputPassword1"
					name="txttenloai" placeholder="Nhập tên loại"
					value="<%=(l1 != null ? l1.getTenloai() : "")%>"
				> 
				<small
					id="emailHelp" class="form-text text-muted">nhận vào tên
					loại mà bạn muốn
				</small>
			</div>

			<input type="submit" name="butthem" class="btn btn-primary"value="Thêm">
			 <input type="submit" name="butsua" class="btn btn-primary" value="Sửa">
		</form>
		<div class="border border-primary p-3">
			<td width="200px">
				<%
					ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
				%>
				<table width="200px" class="table table-hover table-boder">
					<tr>
						<th>Mã Loại</th>
						<th>Tên Loại</th>
						<th colspan="2" style="text-align: center;">Actions</th>
					</tr>
					<%
						for (loaibean k : dsloai) {
					%>
					<tr>
						<td><%=k.getMaloai()%></td>
						<td><%=k.getTenloai()%></td>
						<td width="100px"><a href="LoaiAdminController?mlchon=<%=k.getMaloai()%>">
								Chon <i class="fa fa-check-square"></i>
						</a></td>
						<td width="100px"><a href="LoaiAdminController?mlXoa=<%=k.getMaloai()%>">
								Xóa <i class="fa fa-window-close"></i>
						</a></td>

					</tr>
					<%
						}
					%>
				</table>
			</td>
		</div>
	</div>
</body>
</html>