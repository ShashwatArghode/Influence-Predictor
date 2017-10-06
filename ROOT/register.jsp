<!doctype html>

<head>

	<!-- Basics -->
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<title>Login</title>

	<!-- CSS -->
	
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/styles.css">
	
</head>

	<!-- Main HTML -->
	
<body>
	
	<!-- Begin Page Content -->
	
	<div id="container">
		
		<form method="post" action="registration.jsp">
		
		<label for="name">Username:</label>
		
		<input type="name" name="uname" class="placeholder" placeholder="username" required>
		
		<label for="password">Password:</label>
		
		<p><a href="#">Forgot your password?</a>
		
		<input type="password" name="pass" class="placeholder" placeholder="password" required>
		<label for="email" >Email:</label>
		
		<input type="email" name="email" class="placeholder" placeholder="example@example.com" required>


		<label for="checkbox">Subscribe to:</label>
<p>
<input type="checkbox" name="symc1"><label class="check" for="checkbox">Norton</label>
		<input type="checkbox" name="symc2"><label class="check" for="checkbox">NetBackUp</label>
		<input type="checkbox" name="symc3"><label class="check" for="checkbox">Storage Foundation</label>
	<input type="checkbox" name="symc4"><label class="check" for="checkbox">Endpoint</label>
		</p>
		<div id="lower">
		
		<input type="checkbox" name="subscribe"><label class="check" for="checkbox">Subscribe to our Daily Digest.</label>
		
		<input type="submit" value="Login">
		
		</div>
		
		</form>
		
	</div>
	
	
	<!-- End Page Content -->
	
</body>

</html>	