<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>K2</title>
</head>
<%
	request.setCharacterEncoding("euc-kr");
	String title = request.getParameter("title");
	String writer = request.getParameter("name");
	String content = request.getParameter("content");

	try {

		String DriverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@61.252.141.82:1521:orcl";
		String user = "iahs2";
		String pwd = "iahs2";

		Class.forName(DriverName);
		Connection con = DriverManager.getConnection(url, user, pwd);
		Statement stmt = con.createStatement();
		String sql = "INSERT INTO BOARD2" + "(idx, title, writer, content)" + "VALUES(board2_seq.NEXTVAL,'"
				+ title + "' , '" + writer + "' ,  '" + content

				+ "')";
		stmt.executeUpdate(sql);
		con.close();
	} catch (Exception e) {
		out.println(e.getMessage());
		out.println("실패");
	}
%>
<script>
	location.href = 'main.jsp';
</script>
<body>

</body>
</html>
