<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body bgcolor="wheat">
	<center>
		<h1>Doctor Profile</h1>
	</center>
	<%@ include file="doctor_header.jsp" %>
	<br>
	<br>

	<table align="center" height="150" style="width:80%; background-color: #f1f1c1">
		<tr>
			<td>Doctor Id</td>
			<td>Username</td>
			<td>Email</td>
			<td>Phone</td>
			<td>Specialist</td>
			<td>Action</td>
		</tr>
		<%@page import="java.sql.*"%>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
			String username = "root";
			String password = "Pinpai.1";
			Connection con = DriverManager.getConnection(url, username, password);
			Object ob = session.getAttribute("id");
			int id =(Integer) ob;
			PreparedStatement ps = con.prepareStatement("select * from doctor where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=
					rs.getString("id")
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
				<td><a href="updateprofile_doctor.jsp?id=<%=rs.getInt("id")%>">
				Update
				</a></td>
		</tr>
		<%
			}
		%>

	</table>
</body>
</html>