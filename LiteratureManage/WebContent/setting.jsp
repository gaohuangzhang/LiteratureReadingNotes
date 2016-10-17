<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LiteratureManager Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column" style='text-align:center'>
			<img alt="140x140" src="sources/pics/setting1.png" />
			<h3>
				设置
			</h3>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-6 column">
			<form role="form">
				<div class="form-group">
					 <label for="name">昵称</label><input type="text" class="form-control" id="name" />
				</div>
				<div class="form-group">
					 <label for="oldpasswd">旧密码</label><input type="password" class="form-control" id="oldpasswd" />
				</div>
				<div class="form-group">
					 <label for="newpasswd">新密码</label><input type="password" class="form-control" id="newpasswd" />
				</div>
				<div class="form-group">
					<label for="passwd_confirm">新密码确认</label>
					 <input class="form-control" type="password" id="passwd_confirm" />
				</div>
				<button type="submit" class="btn btn-default">更改</button>
			</form>
		</div>
		<div class="col-md-6 column" style='text-align:center'>
			<img alt="140x140" src="sources/pics/setting2.jpg" /> <button type="button" class="btn btn-lg btn-info">返回</button>
		</div>
	</div>
</div>
<link href="sources/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="sources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>
	<script src="sources/jquery-3.1.1/jquery-3.1.1.min.js"></script>
	<script src="sources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>







