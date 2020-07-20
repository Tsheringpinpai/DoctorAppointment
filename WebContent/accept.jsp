<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
	String username = "root";
	String password = "Pinpai.1";
	Connection con = DriverManager.getConnection(url, username, password);
	
	String id = request.getParameter("id");
	int aid = Integer.parseInt(id);
	String user = (String)session.getAttribute("user");
	
	PreparedStatement ps = con.prepareStatement("update patient_appointment set status='Accepted by "+user+"' where aid=?");
	ps.setInt(1, aid);
	int x = ps.executeUpdate();
	if(x!=0){
		response.sendRedirect("./appointment_details.jsp?msg=Accepted");
	}
%>