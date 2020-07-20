<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
	String username = "root";
	String password = "Pinpai.1";
	Connection con = DriverManager.getConnection(url, username, password);
	
	String user = request.getParameter("user");
	String email=request.getParameter("email");
	String phone = request.getParameter("phone");
	int mobile = Integer.parseInt(phone);
	String specialist = request.getParameter("specialist");
	String id = request.getParameter("id");
	int x = Integer.parseInt(id);
	
	PreparedStatement ps = con.prepareStatement("update doctor set username=?, email=?, phone=?, specialist=? where id=?");
	ps.setString(1, user);
	ps.setString(2, email);
	ps.setInt(3, mobile);
	ps.setString(4, specialist);
	ps.setInt(5, x);
	int k = ps.executeUpdate();
	if(k!=0){
		response.sendRedirect("./doctor_profile.jsp");
	}
%>