<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>K2</title>
</head>
<%
	try {
		String DriverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@61.252.141.82:1521:orcl";
		String user = "iahs2";
		String pwd = "iahs2";
		ResultSet rs = null;
		Class.forName(DriverName);
		Connection con = DriverManager.getConnection(url, user, pwd);

		Statement stmt = con.createStatement();
		String sql = "select * from BOARD2 ";
		rs = stmt.executeQuery(sql);
%>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<h2>inpyung</h2>
		<p>게시판</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<%
				while (rs.next()) {
						out.print("<tbody>");
						out.print("<tr>");
						out.print("<td>" + rs.getString("idx") + "</td>");
						out.print("<td> <a href='content.jsp?idx=" + rs.getString("idx") + "'>" + rs.getString("title")
								+ "</a></td>");
						out.print("<td>" + rs.getString("writer") + "</td>");
						out.print("</tr>");
						out.print("</tbody>");
					}
			%>
		</table>
	</div>
	<jsp:include page="footer.jsp" />
	<%
		con.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>

</body>
</html>