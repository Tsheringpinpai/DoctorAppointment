<%@ page import="java.sql.*"%>
<%
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
		String username = "root";
		String password = "Pinpai.1";
		Connection con = DriverManager.getConnection(url, username, password);
		
		String user = request.getParameter("user");
		String email = request.getParameter("email");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String specialist = request.getParameter("specialist");
		String appointment_date = request.getParameter("appointment_date");
		String appointment_time = request.getParameter("appointment_time");
		
		Object o = session.getAttribute("id");
		int i = (Integer) o;
		
		PreparedStatement ps = con.prepareStatement("insert into patient_appointment values(aid, ?,?,?,?,?,?,status,?)");
		ps.setString(1, user);
		ps.setString(2, email);
		ps.setInt(3, phone);
		ps.setString(4, specialist);
		ps.setString(5, appointment_date);
		ps.setString(6, appointment_time);
		ps.setInt(7, i);
		int x = ps.executeUpdate();
		if(x!=0){
			response.sendRedirect("./patient_home.html?msg=applied");
		}
		%>