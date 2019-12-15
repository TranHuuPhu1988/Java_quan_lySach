<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
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
	sachbean sb = (sachbean)request.getAttribute("masach");
%>
<% 
ArrayList<sachbean> dssach = (ArrayList<sachbean>)request.getAttribute("dsSach");
%>
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
		
		<%}else{ %>
		<li style="align-items: center;
   		 display: flex;color:blue;"><span class="glyphicon glyphicon-log-in"></span> 
		Xin Chào <%=session.getAttribute("tendangnhap")%></li>
		<%} %>
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
    </ul>
    <form class="form-inline my-2 my-lg-0" action="sachcontroller" method ="post">
      <input class="form-control mr-sm-2" type="search" name="txttk" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<div class="border border-primary m-4">
	<h1 style="text-align: center;">QUẢN LÝ SÁCH</h1>
		<form action="SachAdmincontroller" method="post" class="border p-3">
			<div class="form-group">
				<label >Mã Sách</label> 
				<input type="text"
					value="<%=(sb !=null ? sb.getMasach(): "") %>"
					class="form-control" name="txtmasach"
					aria-describedby="emailHelp" placeholder="Nhập mã sách"
				> 
			</div>
			<div class="form-group">
				<label>Tên Sách</label> 
				<input
					value="<%=(sb !=null ? sb.getTensach(): "") %>"
					type="text" class="form-control"
					name="txttensach" placeholder="Nhập tên sách"
				> 
			</div>
			<div class="form-group">
				<label>Tác giả</label> 
				<input type="text"
					value="<%=(sb !=null ? sb.getTacgia(): "") %>"
					class="form-control"  name="txttacgia"
					aria-describedby="emailHelp" placeholder="Nhập Tác giả"
				> 
			</div>
			<div class="form-group">
				<label>Giá</label> 
				<input
					value="<%=(sb !=null ? sb.getGia(): "") %>"
					type="text" class="form-control"
					name="longgia" placeholder="Nhập Giá"
				> 
			</div>
			<div class="form-group">
			
				<label>Số lượng</label> 
				<input type="text"
					value="<%=(sb !=null ? sb.getSoluong(): "") %>"
					class="form-control"  name="intsoluong"
					aria-describedby="emailHelp" placeholder="Nhập số lượng"
				> 
			</div>
			<div class="form-group">
				<label>Ngày Nhập</label> 
				<input
					value="<%=(sb !=null ? sb.getNgaynhap(): "") %>"
					type="datetime" class="form-control"
					name="datengaynhap" placeholder="yyyy-mm-dd"
				> 
			</div>
			<%-- <div class="form-group">
				<label for="file">Ảnh</label> 
				<input
					value="<%=(sb !=null ? sb.getImage(): "") %>"
					type="file" class="form-control" id="file"
					name="txtimage" placeholder="Nhập số tập"
				> 
			</div> --%>
			<div class="form-group">
				<label>Ảnh</label> 
				<input
					value="<%=(sb !=null ? sb.getImage(): "") %>"
					type="text" class="form-control" id="file"
					name="txtimage" placeholder="Nhập số tập"
				> 
			</div> 
			<div class="form-group">
				<label >Số tập</label> 
				<input
					value="<%=(sb !=null ? sb.getSotap(): "") %>"
					type="text" class="form-control"
					name="intsotap" placeholder="Nhập số tập"
				> 
			</div>
			<div class="form-group">
			<label >Mã Loại</label>
		
			    <input 
			    	value="<%=(sb !=null ? sb.getMaloai(): "") %>"
			    	type="text" class="form-control"
			    	name="txtmaloai" placeholder="Nhập Mã loại"
			    >

			</div>
			<input type="submit" name="btn_Them" class="btn btn-primary" value="ADD">
			<input type="submit" name="btn_Sua" class="btn btn-primary" value="SAVE">
		</form>

		<div class="border border-primary p-3">
			<td>
				<table class="table table-hover table-boder table-bordered">
					<tr class="border bg-secondary text-white">
						<th scope="col" width="10px">Mã sách</th>
						<th scope="col">Tên sách</th>
						<th scope="col">Tác giả</th>
						<th scope="col">Giá</th>
						<th scope="col">Số lượng</th>
						<th scope="col">Ngày Nhập</th>
						<th scope="col">Ảnh</th>
						<th scope="col">Số Tập</th>
						<th scope="col">Mã Loại</th>
						<th scope="col">Actions</th>
					</tr>
					<%
					 for (sachbean k : dssach) {
					%>
					<tr>
						<td style="width:4%"><%=k.getMasach() %></td>
						<td style="width:20%"><%=k.getTensach() %></td>
						<td><%=k.getTacgia() %></td>
						<td><%=k.getGia() %></td>
						<td><%=k.getSoluong() %></td>
						<td><%=k.getNgaynhap() %></td>
						<td><%=k.getImage() %></td>
						<td><%=k.getSotap() %></td>
						<td style="width:15%"><%=k.getMaloai() %></td>
						<td>

						<a href="SachAdmincontroller?ms=<%=k.getMasach() %>" class="btn btn-outline-primary" >Select</a>
						<a href="SachAdmincontroller?msdelete=<%=k.getMasach() %>&mldetete=<%=k.getMaloai() %>" width="65px" class="btn btn-outline-danger mt-2" >delete</a>
						</td>
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