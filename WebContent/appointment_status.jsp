<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body bgcolor="wheat">
	<center>
		<h1>Patient Appointment Status</h1>
	</center>
	<table align="center" height="150">
		<tr>
			<td><a href="patient_profile.jsp">Profile</a></td>
			<td><a href="apply_appointment.jsp">Appointment</a></td>
			<td><a href="index.html">Logout</a></td>
		</tr>
	</table>

	<br>
	<br>

	<table align="center" height="150" style="width:80%; background-color: #f1f1c1">
		<tr>
			<td>Id</td>
			<td>Username</td>
			<td>Email</td>
			<td>Phone</td>
			<td>Specialist</td>
			<td>Date</td>
			<td>Time</td>
			<td>Status</td>
		</tr>
		<%@page import="java.sql.*"%>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
			String username = "root";
			String password = "Pinpai.1";
			Connection con = DriverManager.getConnection(url, username, password);
			
			Object o = session.getAttribute("id");
			int i = (Integer) o;
			PreparedStatement ps = con.prepareStatement("select * from patient_appointment where pid=?");
			ps.setInt(1, i);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=
					rs.getString("aid")
				%></td>
			<td><%=
					rs.getString("username")
				%></td>
			<td><%=
					rs.getString("email")
				%></td>
			<td><%=
					rs.getLong("phone")
				%></td>
			<td><%=
					rs.getString("specialist")
				%></td>
			<td><%=
					rs.getString("appointment_date")
				%></td>
				<td><%=
					rs.getString("appointment_time")
				%></td>
				<td><%=
					rs.getString("status")
				%>"</td>
				
		</tr>
		<%
			}
		%>

	</table>
</body>
</html>