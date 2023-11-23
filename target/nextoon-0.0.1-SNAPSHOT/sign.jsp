<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEXTOON</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="js/sign.js"></script>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
		crossorigin="anonymous">
	<link rel="stylesheet" href="css/sign.css" />
	<div class="body">
		<div class="veen">
			<div class="login-btn splits">
				<p>Already an user?</p>
				<button class="active">Login</button>
			</div>
			<div class="rgstr-btn splits">
				<p>Don't have an account?</p>
				<button>Register</button>
			</div>
			<div class="wrapper">
				<form action="action/loginAction.jsp" method="post" id="login" tabindex="500">
					<h3>Login</h3>
					<div class="id">
						<input type="text" name="id"> <label>ID</label>
					</div>
					<div class="passwd">
						<input type="password" name="password"> <label>Password</label>
					</div>
					<div class="submit">
						<button class="dark">Login</button>
					</div>
				</form>
				<form action="action/registerAction.jsp" method="post" id="register" tabindex="502" >
					<h3>Register</h3>
					<div class="id">
						<input type="text" name="id"> <label>ID</label>
					</div>
					<div class="name">
						<input type="text" name="name"> <label>Name</label>
					</div>
					<div class="password">
						<input type="password" name="password"> <label>Password</label>
					</div>
					<div class="passwordCheck">
						<input type="password" name="passwordCheck"> <label>Password Check</label>
					</div>
					<div class="number">
						<input type="text" name="number"> <label>PhoneNumber</label>
					</div>
					<div class="email">
						<input type="email" name="email"> <label>Email</label>
					</div>
					<div class="submit">
						<button class="dark">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<style type="text/css">
.site-link {
	padding: 5px 15px;
	position: fixed;
	z-index: 99999;
	background: #fff;
	box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
	right: 30px;
	bottom: 30px;
	border-radius: 10px;
}

.site-link img {
	width: 30px;
	height: 30px;
}
</style>
</body>
</html>