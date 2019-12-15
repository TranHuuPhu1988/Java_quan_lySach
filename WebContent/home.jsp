<%@page import="bean.nhaxuatbanBean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.gioHangBo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Trang chủ</title>
<link href="css/style1.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body class="bg-light">
	 			<%
				ArrayList<nhaxuatbanBean> dsNXB = (ArrayList<nhaxuatbanBean>)request.getAttribute("dsNXB");
				
				ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
				String ml = request.getParameter("ml");
				ArrayList<sachbean> ds = (ArrayList<sachbean>)request.getAttribute("dssach");
				long sl=0;
		      	gioHangBo ktgh = (gioHangBo)session.getAttribute("gh"); 
		      		
		      	if(ktgh != null){
		      		sl = ktgh.ds.size();
		      	}
		    	if (request.getAttribute("ktdangky") != null) {
					out.print("<script>alert('đăng ký thành công');</script>");
				}
		    	String tendangnhap= null;
		      	if(request.getParameter("tendangnhap")!=null){
		      		tendangnhap= request.getParameter("tendangnhap");
		      	};
		      	
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
		<li style="padding-top:7px" class="nav-item"><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in text-white"></span> Đăng Nhập</a></li>
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

 <!--begin Page Content -->	
	<div style="    margin-left: 20px;
    margin-right: 20px;">
        <div class="row">
            <div class="col-md-3">
              
                <div class="list-group mt-5">
                  <p class="text-success text-justify text-center list-group-item btn btn-secondary"> CHỦ ĐỀ SÁCH</p>
                 <%for(loaibean k: dsloai){ %>
						<a href="sachcontroller?ml=<%=k.getMaloai()%>"  class="list-group-item">
						<%= k.getTenloai() %>
						</a>
               	 <%} %>
                </div>

                
                <div class="list-group">
                <p class="text-success text-justify text-center list-group-item btn btn-secondary"> NHÀ XUẤT BẢN </p>
                <%for(nhaxuatbanBean nxb : dsNXB){ %>
                    <a href="sachcontroller?mxb=<%=nxb.getManhaxuatban()%>" class="list-group-item">
                       <%=nxb.getTennhaxuatban() %>
                    </a> 
                 <%} %>
                </div>
            </div>
            <!-- BEGIN carousel -->
            <div class="col-md-9 mt-5">
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				  </ol>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="d-block w-100" src="images/ancient-place.jpg" alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/riverside-city.jpg" alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/kayaks.jpg" alt="Third slide">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			 <div>
  			<!-- END carousel -->
                    <h3 style="Text-align:Center; color:red"> SÁCH MỚI </h3>
                    <div class="row">

                   <%
			
					int ss = ds.size();
					for(int i=0; i<ss; i++){
						sachbean s = ds.get(i);
						
					%>
					  <div class="col-6 col-md-4 bg-light text-primary">
						<div class="card" style="width: 18rem;height: 26rem;">
						  <img class="card-img-top" src="<%=s.getImage() %>" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title"><%=s.getTensach() %></h5>
						 	<span class="text-success">Giá Bán : <%=s.getGia() %></span>
						    <a class="btn btn-primary ml-4" href="mua.jsp?ms=<%= s.getMasach()%>&ts=<%= s.getTensach()%>&tg=<%= s.getTacgia()%>&gia=<%= s.getGia()%>&kt=1">
											Đặt Mua
							</a>
						  </div>
						</div>
						</div>
<%--                        	
                            <div style="display: flex;align-items: center;flex-direction: column;">
                            
                                    <img alt="." src="<%=s.getImage() %>" width="200" />
                                    <div style="display: flex;align-items: center;flex-direction: column;">
                                        <br />
                                        <h4 style="text-align: center;">
                                           <%=s.getTensach() %>
                                        </h4>
                                       
                                   
                                    </div>
   							</div>
                            </div> --%>
                              
                     <%
					}
                     %>  
                      
                    </div>

                    Trang 1/3;
                    <div class="MenuTrang">

                        <div class="pagination-container"><ul class="pagination"><li class="active"><a>1</a></li><li><a href="/BookStore?page=2">2</a></li><li><a href="/BookStore?page=3">3</a></li><li class="PagedList-skipToNext"><a href="/BookStore?page=2" rel="next">»</a></li></ul></div>
                    </div>
                    <style>
                        .MenuTrang li {
                            display: inline;
                        }
                    </style>
                </div>

            </div>
        </div>
    </div>
 <!--end Page Content -->
 
 <div class="container">
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; MVC 5</p>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>