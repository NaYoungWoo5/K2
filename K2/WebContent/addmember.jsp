<%@ page contentType="text/html; charset=utf-8"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f8f8f8;
	padding: 60px 0;
}

#login-form>div {
	margin: 15px 0;
}
</style>

<div class="container">
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-success">
			<div class="panel-heading">
				<div class="panel-title">회원가입</div>
			</div>
			<div class="panel-body">
				<form action="processAddMember.jsp" method="post">
					<div>
						<input type="text" class="form-control" name="id" placeholder="ID"
							autofocus>
					</div>
					<div>
						<input type="password" class="form-control" name="password"
							placeholder="Password">
					</div>
					<th>성별</th>
					<td><select name="gender" id="gender">
							<option value="0">선택하세요.</option>
							<option value="A01">남자</option>
							<option value="A02">여자</option>
							<option value="A03">기타</option>
					</select></td>
					</tr>
					<div>
						<button type="submit" class="form-control btn btn-primary">회원가입</button>
					</div>
					<div>
						<a href="login.jsp" class="btn btn-default btn-lg active"
							role="button">로그인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>