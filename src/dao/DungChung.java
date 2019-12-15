package dao;

import java.sql.DriverManager;


public class DungChung {
	public java.sql.Connection cn;
	public void KetNoi() throws Exception{
		//b1: Xac dinh he quan tri CSDL
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.print("Da xac dinh HQTCSDL");
		//b2: Ket noi vao csdl
		String url = "jdbc:sqlserver://DESKTOP-RTQ2N2T\\SQLEXPRESS:1433;databaseName=QlSach;user=sa; password=123456";
		cn = DriverManager.getConnection(url);
		System.out.print("Da ket noi");
	}
}
