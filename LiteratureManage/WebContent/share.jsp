<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 实现搜索的3个必须引入的包 -->
<script type="text/javascript" src="sources/js/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="sources/js/jquery.hideseek.min.js"></script>
<script type="text/javascript" src="sources/js/initializers.js"></script>
<!-- 实现动画必须引入的包 -->
<link href="sources/css/animate.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分享文章</title>
<style>
.W{
		background-color: #ffffff;
		}
		.G {
		background-color:#6BB50B;
		}
		a {
		color: #000000;
		}</style>
</head>
<body >
<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>
	<!-- 得到当前用户信息 -->
	<% String usermail = (String) session.getAttribute("usermail"); %>
	<% String username = (String) session.getAttribute("username"); %>
	<!-- 没有登录或者掉线 设置页面隐藏-->
	<% if (usermail == null) {%>
	<div class="city1" style="text-align:center;">
		<div class="alert animated wobble" style="background-color:#d8d8d8;">
			<a href="#" class="close" data-dismiss="alert">
				&times;
			</a>
			<h3> <strong>失败</h3>
			<a href="index.jsp">瞧瞧是不是掉线了呢,这里重新登录</a>
		</div>
	</div>
	<% out.print("<div class=\"container\"  style=\"display: none\">");%>
	<!-- session中含有登录信息 -->
	<% } else { %>
	<% out.print("<div class=\"container\" >");%>
	<% } %>
	<div class="row clearfix">	
	
	<div class="col-md-12 column">
			<nav class="navbar navbar-default  navbar-inverse navbar-fixed-top" style="background:#036564;border:none" role="navigation">
				<div class="navbar-header" style="padding-left:18%;">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">GHZ</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#"></a>
				</div>
				
				<div class="collapse navbar-collapse" style="font-size: 16px;" bs-example-navbar-collapse-1">
					<ul  class="nav navbar-nav">
						<li  onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a  href=personalCenter style="color:#ffffff;">个人中心</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=mainPage  style="color:#ffffff;">我的主页</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=fileManage style="color:#ffffff;">内容管理</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=timeLine style="color:#ffffff;">最佳回忆</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
						<a href=search style="color:#ffffff;">站内检索</a>
						</li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right" style="padding-right:20%;">
					
						
						<li class="dropdown" >
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="sources/pics/Avatar.png" height="20" width="20" onMouseMove="this.className='animated  pulse'" onmouseout="this.className=''"/></a>
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
		
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<p><br><br><br><br></p>
				</div>
				<div class="col-md-4 column; animated pulse"  style='text-align:center'>
					<!-- 显示头像 -->
					<img src="sources/pics/Avatar.png" height="240" width="240" class="img-rounded"/>
					<p class="text-center">
						<hr>
						<span class="glyphicon glyphicon-user "></span>
						<!-- 显示用户名和邮箱 -->
						<%
					    	out.print(username);
						%>
						<br><br>
						<span class="glyphicon glyphicon-send "></span>
						<% 
							out.print(usermail);
						%>
					</p>
				</div>
				<div class="col-md-8 column">	
				<%
				String articlename = request.getParameter("articlename");
				String id = request.getParameter("id");
				%>				
					<h1>内容分享</h1>
					<hr>
					<form action="share">
						<input name="id"  style="display:none;" value=<%out.print(id);%> />
						<h3>为<%out.print(articlename); %>添一句感想</h3>
						<textarea name="feeling" rows="5" required="required" style="width:100%;" class="animated fadeInRight"></textarea>
						<br><br>
						<input type="submit" value="分享" class="btn pull-right animated fadeInRight"/>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column"></div>
	</div>
	<hr style="height:10px;border:none;border-top:1px groove #000000;" />
	<footer>
		<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
	</footer>
	<div id="back-up" onclick="goToWhere(0)" style=" position: fixed; cursor: pointer; right: 90px; bottom: 160px;">
		<img src= "sources/pics/up.png" />
	</div>
	<div id="back-up" onclick="goToWhere(1)" style="position: fixed; cursor: pointer; right: 90px; bottom: 50px;">
		<img src= "sources/pics/down.png" />
	</div>
	 <!-- JS -->
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/bootstrap.min.js"></script>
</body>
</html>