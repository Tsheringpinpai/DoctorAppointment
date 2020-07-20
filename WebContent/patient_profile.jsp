<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body bgcolor="wheat">
	<center>
		<h1>Patient Profile</h1>
	</center>
	<table align="center" height="150">
		<tr>
			<td><a href="patient_profile.jsp">Profile</a></td>
			<td><a href="index.html">Logout</a></td>
		</tr>
	</table>

	<br>
	<br>
	<br>
	<br>
	<table align="center" height="150" style="width:80%; background-color: #f1f1c1">
		<tr>
			<td>Patient Id</td>
			<td>Username</td>
			<td>Email</td>
			<td>Phone</td>
		</tr>
		<%@page import="java.sql.*"%>
		<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
			String username = "root";
			String password = "Pinpai.1";
			Connection con = DriverManager.getConnection(url, username, password);
			Object ob = session.getAttribute("id");
			int id =(Integer) ob;
			PreparedStatement ps = con.prepareStatement("select * from patient where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td>
				<%=
					rs.getInt("id")
				%>
			</td>
			<td>
				<%=
					rs.getString("username")
				%>
			</td>
			<td>
				<%=
					rs.getString("email")
				%>
			</td>
			<td>
				<%=
					rs.getLong("phone")
				%>
			</td>
		</tr>
		<%
			}
		%>

	</table>
</body>
</html>