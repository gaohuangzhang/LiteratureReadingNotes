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
		
		a {
		color: #000000;
		}</style>
</head>
<body >


<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg11.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
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
	
	  <%@ include file="nav.jsp" %>
		
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<p><br><br><br><br></p>
				</div>
				<div class="col-md-3 column; animated pulse"  style='text-align:center'>
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
				<div class="col-md-9 column">	
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
	</div>
	
	
	 <!-- JS -->
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/bootstrap.min.js"></script>
	<%@ include file="bottom.jsp" %>
</body>
</html>