<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>LiteratureManager Welcome</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="sources/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="sources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>
		<script src="sources/jquery-3.1.1/jquery-3.1.1.min.js"></script>
		<script src="sources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
						<div class="navbar-header">
					 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="home-navbar">
					 			<span class="sr-only">Toggle navigation</span>
					 			<span class="icon-bar"></span>
					 			<span class="icon-bar"></span>
					 			<span class="icon-bar"></span>
					 		</button> 
					 		<a class="navbar-brand" href="#">主页</a>
						</div>
						<div class="collapse navbar-collapse" id="home-navbar">
							<form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									<input type="text" class="form-control" />
								</div> 
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
							<ul class="nav navbar-nav navbar-right" style="padding-right: 10px;">
								<li><a id="login" href="#login-modal" role="button" class="btn" data-toggle="modal">登录</a></li>
								<li><a id="signup" href="#signup-modal" role="button" class="btn" data-toggle="modal">注册</a></li>
								<li class="dropdown">
							 		<a href="#" class="dropdown-toggle" data-toggle="dropdown">帮助<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="#">关于</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</nav>
					<div class="jumbotron">
						<h1>Literature Manager</h1>
						<p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
						<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more >></a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- 页脚 -->
		<div class="container">
			<footer>&copy;GaoHuangZhang</footer>
		</div>
		<!-- 登录界面 -->
		<div class="modal fade" id="login-modal" role="dialog" aria-labelledby="myLogin" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">登录</h4>
					</div>
					<div class="modal-body" style="width: 400px; margin-left: 90px;">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="请在这儿输入用户名" required="required" style="padding-left: 30px; height: 42px;" />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" placeholder="请在这儿输入密码" required="required" style="padding-left: 30px; height: 42px;" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">登录</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 注册界面 -->
		<div class="modal fade" id="signup-modal" role="dialog" aria-labelledby="mySignUp" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">注册</h4>
					</div>
					<div class="modal-body" style="width: 400px; margin-left: 90px;">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="请在这儿输入用户名" required="required" style="padding-left: 30px; height: 42px;" />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" placeholder="请在这儿输入密码" required="required" style="padding-left: 30px; height: 42px;" />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" placeholder="请再次输入密码" required="required" style="padding-left: 30px; height: 42px;" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">注册</button>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>