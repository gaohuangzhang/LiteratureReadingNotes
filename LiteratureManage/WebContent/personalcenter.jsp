<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人中心</title>
</head>
<body>

	<%
		String usermail = (String) session.getAttribute("usermail");
	%>
	<%
		String username = (String) session.getAttribute("username");
	%>
	<%
		if (usermail == null) {
	%>
	<%
		out.println("你的输入不合法哎，瞧瞧是不是掉线了呢 ╮(╯▽╰)╭");
	%>
	<%
		out.print("<div class=\"container\"  style=\"display: none\">");
	%>
	<%
		} else {
	%>
	<%
		out.print("<div class=\"container\" >");
	%>
	<%
		}
	%>

	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<p>
						<br> <br>
					</p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<h2>分享</h2>
					</br>

					<s:action name="printShareInfo" executeResult="true" />

					<%
						out.print("<p>当前用户：" + username + "(" + usermail + ")" + "</p>");
						ArrayList<Map<String, String>> list = (ArrayList<Map<String, String>>) session.getAttribute("sharelist");
						for (int i = list.size() - 1; i >= 0; --i) {
							out.print("<hr>");

							out.print("<img src=\"sources/pics/Avatar.png\" height=\"80\" width=\"80\"/>");
							out.print("<P><br>");
							out.print("<a>" + list.get(i).get("1") + "(" + list.get(i).get("2") + ")" + "</a>"
									+ "&nbsp;&nbsp;分享了文章：");
							out.print("<a>" + list.get(i).get("3") + "</a>" + "<br>");
					%>
					<table class="table table-hover table-bordered">
					<% 
					out.print("<tr>");
					out.print("<th>");
							out.print(list.get(i).get("5"));
					out.print("</th>");
					out.print("</tr>");
					%>
					</table>
					<% 
							out.print("分享时间：" + list.get(i).get("6") +"<br>");
							out.print("<br><img src=\"sources/pics/like.png\" height=\"30\" width=\"30\"/>" + "&nbsp;&nbsp;&nbsp;"
									+ list.get(i).get("7") + "&nbsp;&nbsp;&nbsp;"
									+ "<img src=\"sources/pics/dislike.png\" height=\"30\" width=\"30\"/>" + "&nbsp;&nbsp;&nbsp;"
									+ list.get(i).get("8"));
							out.print("</P>");
						}
					%>

					<a class="btn" href="#">查看更多 >></a>
					</p>
				</div>
				<div class="col-md-4 column">
					<h2>继续阅读</h2>
					<br>
					<table class="table table-hover table-bordered">

						<tbody>
							<s:action name="getArticle" executeResult="true" />
							<%
								ArrayList<Map<String, String>> list1 = (ArrayList<Map<String, String>>) session
										.getAttribute("personalbooklist");
								for (int i = 0; i < list1.size(); ++i) {
									out.print("<tr class=\"success\">");
									out.print("<td>" + list1.get(i).get("1") + "</td>");
									out.print("</tr>");
								}
							%>
						</tbody>

					</table>
					<div style="text-align: right;">
						<span><a href="mainPage">查看更多 >></a></span>
					</div>
					<br>
					<div class="progress active progress-striped">

						<%
							if (list1.size() == 0) {
								out.print("<div class=\"progress-bar progress-success\" role=\"progressbar\" aria-valuenow=\"60\"");
								out.print(" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 100%;\">100%");
							} else {
								out.print("<div class=\"progress-bar progress-success\" role=\"progressbar\" aria-valuenow=\"60\"");
								out.print(" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 10%;\">10%");
							}
						%>

						<span class="sr-only">40% 完成</span>
					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href=personalCenter>阅读</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<form action="search" class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input class="form-control" type="text" placeholder="搜索内容" />
				</div>
				<button type="submit" class="btn btn-default">开始搜索</button>
			</form>
			<ul class="nav navbar-nav navbar-right" style="padding-right: 10px;">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><img src="sources/pics/Avatar.png"
						height="20" width="20" /><strong class="caret"></strong></a>
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
	<!-- /container -->
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