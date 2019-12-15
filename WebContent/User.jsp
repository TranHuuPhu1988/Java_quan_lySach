<%@page import="bean.quanlyuserbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
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
		<div class="border border-primary p-3">
			<td width="200px">
				<%
					ArrayList<quanlyuserbean> dsuser = (ArrayList<quanlyuserbean>)request.getAttribute("dsUser");
				%>
				<table width="200px" class="table table-hover table-boder">
					<tr>
						<th>Họ Tên</th>
						<th>Đại Chỉ</th>
						<th>Mật Khẩu</th>
						<th>Tên Đăng Nhập</th>
						<th>Số điện thoại</th>
						<th colspan="2" style="text-align: center;">Actions</th>
					</tr>
					<%
						for (quanlyuserbean k : dsuser) {
					%>
					<tr>
						<td><%=k.getHoten()%></td>
						<td><%=k.getDaichi()%></td>
						<td><%=k.getPassword()%></td>
						<td><%=k.getTendangnhap()%></td>
						<td><%=k.getSodienthoai()%></td>
						<td width="100px"><a href="LoaiAdminController?mlchon=<%=k.getMakhachhang()%>">
								Xóa <i class="fa fa-check-square"></i>
						</a></td>

					</tr>
					<%
						}
					%>
				</table>
			</td>
		</div>
</body>
</html>