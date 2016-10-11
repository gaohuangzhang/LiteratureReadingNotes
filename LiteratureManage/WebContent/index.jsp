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
					 		<a class="navbar-brand" href="#" style="padding-left: 20px;">主页</a>
						</div>
						<div class="collapse navbar-collapse" id="home-navbar">
							<form action="search_issues" class="navbar-form navbar-left" role="search" id="search_form">
								<div class="form-group">
									<input name="issue" type="text" class="form-control" />
								</div> 
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
							<ul class="nav navbar-nav navbar-right" style="padding-right: 10px;">
								<li><a id="login" href="#login-modal" role="button" class="btn" data-toggle="modal">登录</a></li>
								<li><a id="signup" href="#signup-modal" role="button" class="btn" data-toggle="modal">注册</a></li>
								<li class="dropdown">
							 		<a href="#" class="dropdown-toggle" data-toggle="dropdown">帮助<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href=about>关于</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</nav>
				</div>
				<div><br><br><br><br><br></div>
				<div class="carousel slide" id="carousel-345074">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel-345074"></li>
						<li data-slide-to="1" data-target="#carousel-345074"></li>
						<li data-slide-to="2" data-target="#carousel-345074"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt="" src="sources/pics/1.jpg" />
							<div class="carousel-caption">
								<h4>阅读 & 评论</h4>
								<p>就像其他同类网站做的那样，阅读文章，发表评论</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="sources/pics/2.jpg" />
							<div class="carousel-caption">
								<h4>分享 & 下载</h4>
								<p>与他人分享，下载你感兴趣或对你有帮助的</p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="sources/pics/3.jpg" />
							<div class="carousel-caption">
								<h4>创建你自己的树</h4>
								<p>将意义非凡的痕迹记录在这儿</p>
							</div>
						</div>
					</div> 
					<a class="left carousel-control" href="#carousel-345074" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
					<a class="right carousel-control" href="#carousel-345074" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				<div><br><br><br></div>
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="sources/pics/1.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
									<a class="btn btn-primary" href="#">Action</a> 
									<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="sources/pics/2.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
								 	<a class="btn btn-primary" href="#">Action</a> 
								 	<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="300x200" src="sources/pics/3.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
								 	<a class="btn btn-primary" href="#">Action</a> 
								 	<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 页脚 -->
		<hr>
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
						<form action="signIn" id="login_form">
							<div class="form-group">
								<input name="mail" class="form-control" type="email" placeholder="请在这儿输入登录邮箱" required="required" style="padding-left: 30px; height: 42px;" />
							</div>
							<div class="form-group">
								<input name="passwd" class="form-control" type="password" placeholder="请在这儿输入密码" required="required" style="padding-left: 30px; height: 42px;" />
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" form="login_form">登录</button>
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
						<form action="signUp" id="signup_form">
							<div class="form-group">
								<input name="name" class="form-control" type="text" placeholder="请在这儿输入用户名" required="required" style="padding-left: 30px; height: 42px;" />
							</div>
							<div class="form-group">
								<input name="mail" class="form-control" type="text" placeholder="请在这儿输入注册邮箱" required="required" style="padding-left: 30px; height: 42px;" />
							</div>
							<div class="form-group">
								<input name="passwd" class="form-control" type="password" placeholder="请在这儿输入密码" required="required" style="padding-left: 30px; height: 42px;" />
							</div>
							<div class="form-group">
								<input name="passwd_confirm" class="form-control" type="password" placeholder="请再次输入密码" required="required" style="padding-left: 30px; height: 42px;" />
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" form="signup_form">注册</button>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>