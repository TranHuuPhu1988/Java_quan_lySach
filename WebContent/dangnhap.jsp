
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
<link href="css/style1.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Insert title here</title>
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
		      	if (request.getAttribute("ktradangky") != null) {
					out.print("<script>alert('đăng ký thành công mời bạn đăng nhập');</script>");
				}
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
		<li style="padding-top: 7px;"><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in text-white"></span> Đăng Nhập</a></li>
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
	<div class="row">
			<div class="col-6 col-md-4 btn-black"  style="display: flex;justify-content: center;align-items: center; height: 95vh;">
				<div>
			            <h2>Application<br> Login Page</h2>
			            <p>Login or register from here to access.</p>
			     </div>
			</div>
      
      	
         <div class="col-6 col-md-4">
         <h2 style="text-align: center">Page Login</h2>

                 <form action="sachcontroller" method="post">
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" name="TenDN" class="form-control" placeholder="User Name">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="Matkhau"  class="form-control" placeholder="Password">
                  </div>
                  <button type="submit" class="btn btn-black">Login</button>
               
                  	<a href="dangky.jsp" class="btn btn-secondary">   
                  	Register
                  	</a>
                  
                  
               </form>
            </div>

      </div>

</body>
</html>