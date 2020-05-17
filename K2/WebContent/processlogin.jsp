<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	session.setAttribute("sessionId", id);

	String DriverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@61.252.141.82:1521:orcl";
	String user = "iahs2";
	String pwd = "iahs2";
	Class.forName(DriverName);
	Connection con = DriverManager.getConnection(url, user, pwd);

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select password from member where id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);

	rs = pstmt.executeQuery();

	if (rs.next()) {
		if (password.equals(rs.getString("password"))) {
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		} else {
%>
<script>
	alert('패스워드 틀림');
	history.back();
</script>
<%
	}
	} else {
%>
<script>
	alert('아이디 없음');
	location.href = 'login.jsp';
	history.back();
</script>
<%
	}
%>