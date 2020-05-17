<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>K2</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String verifide = "n";

	try {

		String DriverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@61.252.141.82:1521:orcl";
		String user = "iahs2";
		String pwd = "iahs2";

		Class.forName(DriverName);
		Connection con = DriverManager.getConnection(url, user, pwd);
		Statement stmt = con.createStatement();
		String sql = "INSERT INTO member" + "(id, password, verifide)" + "VALUES('" + id + "' ,,  '" + password
				+ "', '" + verifide + "')";
		stmt.executeUpdate(sql);
		con.close();
	} catch (Exception e) {
		out.println(e.getMessage());
		out.println("실패");
	}
%>
<script>
	location.href = 'login.jsp';
</script>
<body>

</body>
</html>
