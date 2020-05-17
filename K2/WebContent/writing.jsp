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
	padding-bottom: 30px;
}
</style>

</head>
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
		String sql = "select * from member ";
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
%>
<body>
	<jsp:include page="menu.jsp" />
	<article>

		<div class="container" role="main">

			<h2>글쓰기</h2>

			<form action="./writepro.jsp" method="post">

				<div class="mb-3">

					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력해 주세요">

				</div>



				<div class="mb-3">

					<label for="reg_id">작성자</label> <input type="text" name="name"
						value="<%=id%>">

				</div>



				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="content" id="content"
						placeholder="내용을 입력해 주세요"></textarea>

				</div>

				<input type="submit"> <input type="reset" value="다시 입력">
			</form>
		</div>

	</article>
	<jsp:include page="footer.jsp" />
	<%
		con.close();
			}
		} catch (Exception e) {
		}
	%>
</body>

</html>