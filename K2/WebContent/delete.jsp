<%@ page contentType="text/html; charset=utf-8"%>
<%@  page import="java.sql.*"%>
<html>
<head>
<title>K2</title>
</head>

<%
	String idx = request.getParameter("idx");

	try {

		String DriverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@61.252.141.82:1521:orcl";
		String user = "iahs2";
		String pwd = "iahs2";

		Connection con = DriverManager.getConnection(url, user, pwd);
		Statement stmt = con.createStatement();
		String sql = "delete from BOARD2 where idx = " + idx;
		stmt.executeUpdate(sql);
		con.close();
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>
<script>
	alert("삭제가 되었습니다");
	location.href = 'main.jsp';
</script>
<body>

</body>
</html>
