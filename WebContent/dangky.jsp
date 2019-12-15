<%@page import="bean.loaibean"%>
<%@page import="bo.gioHangBo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
<link href="css/style1.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>Shop Homepage - Start Bootstrap Template</title>

</head>
<body>
				<%
				ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
				String ml = request.getParameter("ml");
				ArrayList<sachbean> ds = (ArrayList<sachbean>)request.getAttribute("dssach");
				long sl=0;
		      	gioHangBo ktgh = (gioHangBo)session.getAttribute("gh"); 
		      		
		      	if(ktgh != null){
		      		sl = ktgh.ds.size();
		      	}
				
				%>

    <!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		    <a class="navbar-brand" href="sachcontroller">Trang Chủ</a>
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item active">
		        <a class="nav-link" href="dangky.jsp">Đăng Ký <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="dangnhap.jsp">Đăng Nhập</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link disabled" href="htgio.jsp">Giỏ Hàng(<%= sl%>)</a>
		      </li>
		    </ul>
		    <form class="form-inline my-2 my-lg-0" action="sachcontroller" method ="post">
		      <input class="form-control mr-sm-2" type="search" name="txttk" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>
		  </div>
	</nav>
	

	<div class="row">
			<div class="col-6 col-md-4 btn-black " style="display: flex;justify-content: center;align-items: center;height:100vh">
				<div>
			            <h2>Application<br> Login Page</h2>
			            <p>Login or register from here to access.</p>
			     </div>
			</div>
			
            <div class="col-6 col-md-4 ">
            	<h2 style="text-align: center;">  Page Register </h2>
                 <form action="ThemTaiKhoangController" method="post">
                  <div class="form-group">
                     <label>Họ Tên</label>
                     <input class="form-control" id="HotenKH" name="HotenKH" type="text" value="">
                  </div>
                  <div class="form-group">
                     <label>Tên Đăng Nhập</label>
                        <input class="form-control" id="TenDN" name="TenDN" type="text" value="">
                  </div>
 					<div class="form-group">
                     <label>Mật Khẩu</label>
                      <input class="form-control" id="Matkhau" name="Matkhau" type="password">
                  </div>
                  <div class="form-group">
                     <label>Nhập Lại Mật Khẩu</label>
                    <input class="form-control" id="Matkhaunhatrlai" name="Matkhaunhatrlai" type="password">
                  </div>
                  <div class="form-group">
                     <label>Email</label>
                      <input class="form-control" id="Email" name="Email" type="text" value="">
                  </div>
 					<div class="form-group">
                     <label>Đại Chỉ</label>
                     <input class="form-control" id="Diachi" name="Diachi" type="text" value="">
                  </div>
                  
                  <div class="form-group">
                     <label>Số Điện Thoại</label>
						<input class="form-control" id="Dienthoai" name="Dienthoai" type="text" value="">
                  </div>
                  <input class="btn btn-secondary" type="submit" value="Đăng Ký">
                  
               </form>
               </div>
               </div>


    <!-- /.container -->
    <!-- jQuery -->
    <script src="/Scripts/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Scripts/bootstrap.min.js"></script>
</body>
</html>
