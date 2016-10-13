<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的主页</title>
</head>
<body>
<% String usermail = (String) session.getAttribute("usermail"); %>
<% String username = (String) session.getAttribute("username"); %>
<% if (usermail == null) {%>
<% out.println("你的输入不合法哎，瞧瞧是不是掉线了呢 ╮(╯▽╰)╭"); %>
<% out.print("<div class=\"container\"  style=\"display: none\">");%>
<%} else { %>
<% out.print("<div class=\"container\" >");%>
<%} %>

	<div class="row clearfix">	
		<div class="col-md-12 column">
			<div class="row clearfix">
			<div class="col-md-12 column">
						<p>
							<br>
							<br>
							<br>
							<br>
						</p>
					</div>
				<div class="col-md-4 column;" style='text-align:center'>
					<img src="sources/pics/Avatar.png" height="200" width="200" class="img-rounded"/>
					
					<p class="text-center">
					<br>
					
					<%
						
					   
					    out.print(username);
					    out.print("<br>");
						out.print(usermail);
						%>
					</p>
				</div>
				<div class="col-md-8 column">
					<h2>
						我的收藏
					</h2>
					<br>
					<div class="tabbable" id="tabs-79182">
						<ul class="nav nav-tabs">
							<li class="active">
								 <a href="#panel-779078" data-toggle="tab">未读内容</a>
							</li>
							<li >
								 <a href="#panel-238826" data-toggle="tab">已经粗读</a>
							</li>
							<li>
								 <a href="#panel-238827" data-toggle="tab">已经粗读</a>
							</li>
							<li>
								 <a href="#panel-238828" data-toggle="tab">全部</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-779078">
								<p>
									这些没读过
								</p>
							</div>
							<div class="tab-pane" id="panel-238826">
								<p>
									已经粗读过哦
									<%
						
						out.print("<p>adsf" + usermail+ "</p>");
						%>
								</p>
							</div>
							<div class="tab-pane" id="panel-238827">
								<p>
									已经精读过哦
								</p>
							</div>
							<div class="tab-pane" id="panel-238828">
								<p>
									全部哦
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href=personalCenter?<%out.print("2333"); %>>阅读</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					
					<form action="search" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="搜索内容"/>
						</div>
						<button type="submit" class="btn btn-default">开始搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><img src="sources/pics/Avatar.png" height="20" width="20" /><strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href=mainPage>我的主页</a></li>
								<li><a href=fileManage>内容管理</a></li>
								<li><a href=timeLine>时间线</a></li>
								
								<li><a href=settings>设置</a></li>
								<li class="divider"></li>
								<li><a href=signOut>注销</a></li>
							</ul></li>
					</ul>
				</div>
				</nav>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column"></div>
		</div>
		<hr>
		<footer>
		<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
		</footer>
	</div>

</div>


	<!-- end your code here -->

	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link href="sources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
		rel="stylesheet">

	<!-- 可选的Bootstrap主题文件（一般不使用） -->
	<script src="sources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="sources/jquery-3.1.1/jquery-3.1.1.min.js"></script>

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="sources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>