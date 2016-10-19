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
	<% int i = 2; %>
    <% try { %>
	<% i = (int) session.getAttribute("i"); %>
	<% } catch (Exception e) { %>
	<% i=2; %>
	<% } %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<p><br><br><br><br></p>
			</div>
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href=personalCenter?<%out.print("2333"); %>>阅读</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<form action="search" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="搜索内容"/>
						</div>
						<button type="submit" class="btn btn-default">开始搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img src="sources/pics/Avatar.png" height="20" width="20" />
								<strong class="caret"></strong>
							</a>
							<ul class="dropdown-menu">
								<li><a href=mainPage>我的主页</a></li>
								<li><a href=fileManage>内容管理</a></li>
								<li><a href=timeLine>时间线</a></li>
								<li><a href=settings>设置</a></li>
								<li class="divider"></li>
								<li><a href=signOut>注销</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="row clearfix">
			<div class="col-md-2 column">
				<div class="panel panel-primary">
    				<div class="panel-heading">
        				<h3 class="panel-title">内容管理</h3>
    				</div>
    				<div class="panel-body">
       					<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="#panel-1" data-toggle="tab">修改笔记</a></li>
							<li><a href="#panel-2" data-toggle="tab">构建分类树</a></li>
							<li><a href="#panel-3" data-toggle="tab">分类 链接文档</a></li>
							<li><a href="#panel-4" data-toggle="tab">类别修改</a></li>
							<li><a href="#panel-5" data-toggle="tab">修改阅读状态</a></li>
							<li><a href="#panel-6" data-toggle="tab">生成标准文档</a></li>
							<li><a href="#panel-7" data-toggle="tab">删除</a></li>
							<li><a href="#panel-8" data-toggle="tab">上传文档 加入系统</a></li>
						</ul>
    				</div>
				</div>
				<footer>
					<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
				</footer>
			</div>
			<div class="col-md-10 column">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="panel-1">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">修改笔记</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-2">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">构建分类树</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-3">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">分类 链接文档</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-4">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">类别修改</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-5">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">修改阅读状态</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-6">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">生成标准文档</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-7">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">删除</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-8">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">上传文档 加入系统</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/jquery-3.1.1.min.js"></script>
	<script src="sources/js/bootstrap.min.js"></script>
</body>
</html>







