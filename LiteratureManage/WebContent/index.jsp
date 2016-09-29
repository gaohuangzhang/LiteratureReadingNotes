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
					 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					 			<span class="sr-only">Toggle navigation</span>
					 			<span class="icon-bar"></span>
					 			<span class="icon-bar"></span>
					 			<span class="icon-bar"></span>
					 		</button> 
					 		<a class="navbar-brand" href="#">Home</a>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									<input type="text" class="form-control" />
								</div> 
								<button type="submit" class="btn btn-default">Search</button>
							</form>
							<ul class="nav navbar-nav navbar-right">
								<li><a id="modal-657074" href="#modal-container-657074" role="button" class="btn" data-toggle="modal">Sign in</a></li>
								<li><a href="#">Sign up</a></li>
								<li class="dropdown">
							 		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Help<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="#">About</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</nav>
					<div class="jumbotron">
						<h1>Hello, world!</h1>
						<p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
						<p><a class="btn btn-primary btn-large" href="#">Learn more</a></p>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="modal-container-657074" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">标题</h4>
					</div>
					<div class="modal-body">内容...</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>