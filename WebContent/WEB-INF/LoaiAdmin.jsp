<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<td valign="top" width="200">
				<%ArrayList<loaibean> dsloai = (ArrayList<loaibean>) 
				request.getAttribute("dsloai");
				%>
				<table width="200" class="table table-hover table-boder">
					<%for(loaibean k: dsloai){ %>
					<tr>
						<td><%=k.getMaloai() %></td>
						<td><%=k.getTenloai() %></td>
						<td>
						<a href="LoaiAdminController?mlchon=<%=k.getMaloai() %>">
							Chon
						</a>
						</td>
						<td>
						<a href="LoaiAdminController?mlchon=<%=k.getMaloai() %>">
							Xoa
						</a>
						</td>
					</tr>
					<%} %>
				</table>
			</td>
	<form action="LoaiAdminController" method="post">
		<label>Ma loai: </label>
		<input type="text" name="txtmaloai" placeholder="Ma loai" value=""><br>
		<input type="text" name="txttenloai" placeholder="Ten loai" value=""><br>
		<input type="button" name="butthem"  value="Them"><br>
		<input type="button" name="butsua" value="Sua"><br>
		
	</form>
</body>
</html>