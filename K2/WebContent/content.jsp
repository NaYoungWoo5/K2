<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">



<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">



<title>K2</title>



<script>
	$(document).on('click', '#btnSave', function(e) {

		e.preventDefault();

		$("#form").submit();

	});

	$(document)
			.on(
					'click',
					'#btnList',
					function(e) {

						e.preventDefault();

						location.href = "${pageContext.request.contextPath}/board/getBoardList";

					});
</script>

<style>
body {
	margin-bottom: 30px;
}

article {
	margin-top: 30px;
	margin-bottom: 100px;
}
</style>

</head>
<%
	String idx = request.getParameter("idx");

	try {
		String DriverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@61.252.141.82:1521:orcl";
		String user = "iahs2";
		String pwd = "iahs2";
		ResultSet rs = null;
		Class.forName(DriverName);
		Connection con = DriverManager.getConnection(url, user, pwd);

		Statement stmt = con.createStatement();
		String sql = "select * from board2 where idx = " + idx;
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
%>

<jsp:include page="menu.jsp" />
<body>
	<article>
		<div class="container" role="main">

			<h2>게시글조회</h2>

			<div class="mb-3">

				<label for="title">제목 :</label>
				<%=rs.getString("title")%>
			</div>



			<div class="mb-3">

				<label for="reg_id">작성자 :</label>
				<%=rs.getString("writer")%>

			</div>



			<div class="mb-3">

				<label for="content">내용 :</label>

				<%=rs.getString("content")%>

			</div>
			<div style="float: right; margin: 10px">
				<a class="btn btn-dark" href="main.jsp">목록보기</a> <a
					class="btn btn-danger"
					href='delete.jsp?idx=<%=rs.getString("idx")%>'>삭제</a>
			</div>
		</div>
	</article>


	<%
		con.close();
			}

		} catch (Exception e) {
		}
	%>

</body>
<jsp:include page="footer.jsp" />
</html>
