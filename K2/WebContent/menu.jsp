<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String id = (String) session.getAttribute("id");
	try {

		String DriverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@61.252.141.82:1521:orcl";
		String user = "iahs2";
		String pwd = "iahs2";
		ResultSet rs = null;
		Class.forName(DriverName);
		Connection con = DriverManager.getConnection(url, user, pwd);
		Statement stmt = con.createStatement();

		String sql = "select * from member";
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
%>

<body>
	<table class="table table-striped">
		<thead>
			<th><a href="main.jsp"><img
					src="http://www.pngall.com/wp-content/uploads/2/I-Letter-PNG-Free-Image.png"
					width="50" height="50"></a></th>
			<th>아이디 : <%=id%></th>
			<th><a href="writing.jsp">글쓰기</a></th>
			<th><a href="logout.jsp">로그아웃</a></th>
		</thead>
	</table>
	<%
		con.close();
			}
		} catch (Exception e) {
		}
	%>
</body>
</html>