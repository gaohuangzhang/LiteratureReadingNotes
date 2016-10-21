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
<title>我的主页</title>
<!-- 分块的样式 -->
<style>
	.city {
		float: left;
		margin: 5px;
		padding: 20px;
		width: 48.5%;
		height: 100px;
		
		background-color: #F9f9f9;
	}
	.white {
		float: left;
		margin: 5px;
		padding: 20px;
		width: 48.5%;
		height: 100px;
		
		background-color: #B3FFB3;
	}
	.inputs {
	float: right;
	width:500px;
	margin: 8px;
	}
</style> 
<!-- 去往开始和结尾 -->
<script type="text/javascript">
   	var goToWhere = function (where) {
       	var me = this;
       	clearInterval (me.interval);
       	me.site = [];
       	var dom = !/.*chrome.*/i.test (navigator.userAgent) ? document.documentElement : document.body;
       	var height = !!where ? dom.scrollHeight : 0;
       	me.interval = setInterval (function () {
           	var speed = (height - dom.scrollTop) / 16;
           	if (speed == me.site[0]) {
               	clearInterval (me.interval);
               	return null;
           	}
           	dom.scrollTop += speed;
           	me.site.unshift (speed);
       	}, 16);
   	};
</script>
</head>
<body style="background:#e8e8e8;">
	<!-- 得到当前用户信息 -->
	<% String usermail = (String) session.getAttribute("usermail"); %>
	<% String username = (String) session.getAttribute("username"); %>
	<!-- 没有登录或者掉线 设置页面隐藏-->
	<% if (usermail == null) {%>
	<% out.println("你的输入不合法哎，瞧瞧是不是掉线了呢 ╮(╯▽╰)╭"); %>
	<% out.print("<div class=\"container\"  style=\"display: none\">");%>
	<!-- session中含有登录信息 -->
	<% } else { %>
	<% out.print("<div class=\"container\" >");%>
	<% } %>
	<div class="row clearfix">	
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<p><br><br><br><br></p>
					
				</div>
				<div class="col-md-4 column; animated pulse"  style='text-align:center'>
					<!-- 显示头像 -->
					<img src="sources/pics/Avatar.png" height="200" width="200" class="img-rounded"/>
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
					<br>
					<!-- 载入页面过程中执行action 得到各种书籍 -->
					<s:action name="getAllKindOfArticles" executeResult="true" />
					<!--从session中得到所有书籍 -->
					<% int not_read = 0; %>
					<% int read_little = 0; %>
					<% int read_all = 0; %>
					<% int all_files = 0; %>
					<% ArrayList<Map<String, String>> notread = (ArrayList<Map<String, String>>) session.getAttribute("notread");%>
					<% ArrayList<Map<String, String>> readlittle = (ArrayList<Map<String, String>>) session.getAttribute("readlittle");%>
					<% ArrayList<Map<String, String>> readall = (ArrayList<Map<String, String>>) session.getAttribute("readall");%>
					<% ArrayList<Map<String, String>> all = (ArrayList<Map<String, String>>) session.getAttribute("all");%>
					<% not_read = notread.size(); %>
					<% read_little = readlittle.size(); %>
					<% read_all = readall.size(); %>
					<% all_files = all.size(); %>
					<!-- 选项卡栏 -->				
					<div class="tabbable" id="tabs-79182">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#panel-779078" data-toggle="tab">未读内容&nbsp;<span class="badge"><%out.println(not_read); %></span></a>
							</li>
							<li>
								<a href="#panel-238826" data-toggle="tab">已经粗读&nbsp;<span class="badge"><%out.println(read_little); %></span></a>
							</li>
							<li>
							 	<a href="#panel-238827" data-toggle="tab">已经精读&nbsp;<span class="badge"><%out.println(read_all); %></span></a>
							</li>
							<li>
								<a href="#panel-238828" data-toggle="tab">全部内容&nbsp;<span class="badge"><%out.println(all_files); %></span></a>
							</li>
						</ul>						
						
						<!-- 那些信息们 -->
						<div class="tab-content">
							<div class="tab-pane fade in active" id="panel-779078">	
							<!-- 搜索入口1 -->
							<div class="animated fadeInRight ">		
								<input class="inputs" id="search-highlight1" name="search-highlight1" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list1" autocomplete="off"/>
							</div>	
							<!-- 没有读的 -->
							<div class=" vertical highlight_list1">
								<% for (int i = not_read - 1; i >= 0; i--) { %>								
								<div class="city animated fadeInRight "  onMouseMove="this.className='white'" onmouseout="this.className='city'">
									<h5>
										<span class="glyphicon glyphicon-paperclip" style="color: rgb(81, 119, 197);"> 
											<a href=readArticle?url=<% out.print(notread.get(i).get("2"));%>&articlename=<% out.print(notread.get(i).get("1"));%>&id=<% out.print(notread.get(i).get("3"));%>>
											<%out.print(notread.get(i).get("1")); %></a>
										</span>
									</h5>
									<span class="glyphicon glyphicon-tags" style="color: rgb(81, 119, 197);"> 标签</span>
								</div>								
								<% } %>	
								
							</div>
							<%if (not_read == 0) {%>
								<div class="city animated fadeInRight ">
								<h4>已经没有未读的内容了，真棒</h4>
								</div>
								<%} %>
							</div>
							<div class="tab-pane fade" id="panel-238826">								
							<!-- 已经粗读过哦 -->	
							<div class="animated fadeInRight " >										 
								<input class="inputs" id="search-highlight2" name="search-highlight2" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list2" autocomplete="off">
							</div>
								<div class=" vertical highlight_list2" onMouseMove="this.className='white'" onmouseout="this.className='city'">						
								<% for (int i = read_little - 1; i >= 0; i--) { %>
								<div class="city  animated fadeInRight" >
									<h5>
										<span class="glyphicon glyphicon-paperclip" style="color: rgb(81, 119, 197);">  
											<a href=readArticle?url=<% out.print(readlittle.get(i).get("2"));%>&articlename=<% out.print(readlittle.get(i).get("1"));%>&id=<% out.print(notread.get(i).get("3"));%>>
											<%out.print(readlittle.get(i).get("1")); %></a>
										</span>
									</h5>
									<span class="glyphicon glyphicon-tags" style="color: rgb(81, 119, 197);"> </span>
								</div>
								<% } %>	
								
								</div>
								<%if (read_little == 0) {%>
								<div class="city animated fadeInRight ">
								<h4>这是空的呢，加油啊！</h4>
								</div>
								<%} %>
							</div>
							<div class="tab-pane fade" id="panel-238827">
								<!--  	已经精读过哦 -->	
							<div class="animated fadeInRight " >	
							<input class="inputs" id="search-highlight3" name="search-highlight3" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list3" autocomplete="off">
							</div>
								<div class=" vertical highlight_list3">
								<% for (int i = read_all - 1; i >= 0; i--) { %>
								<div class="city  animated fadeInRight" onMouseMove="this.className='white'" onmouseout="this.className='city'">
									<h5>
										<span class="glyphicon glyphicon-paperclip" >  
	  										<a href=readArticle?url=<% out.print(readall.get(i).get("2"));%>&articlename=<% out.print(readall.get(i).get("1"));%>&id=<% out.print(notread.get(i).get("3"));%>>
	    									<%out.print(readall.get(i).get("1")); %></a>
	    								</span>
	  								</h5>
									<span class="glyphicon glyphicon-tags" style="color: rgb(81, 119, 197);"></span>
								</div>
								<% } %>
								</div>
								<%if (read_all == 0) {%>
								<div class="city animated fadeInRight ">
								<h4>还没有精读过的内容，要努力啊！</h4>
								</div>
								<%} %>
							</div>					
							<div class="tab-pane fade" id="panel-238828">
							<!--  全部哦 -->		
							<div class="animated fadeInRight " >		 
							<input class="inputs" id="search-highlight4" name="search-highlight4" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list4" autocomplete="off">
							</div>	
								<div class="vertical highlight_list4">						
								<% for (int i = all_files - 1; i >= 0; i--) { %>
								<div class="city  animated fadeInRight" onMouseMove="this.className='white'" onmouseout="this.className='city'" >	
									<h5>
										<span class="glyphicon glyphicon-paperclip" style="color: rgb(81, 119, 197);">  
											<a href=readArticle?url=<% out.print(all.get(i).get("2"));%>&articlename=<% out.print(all.get(i).get("1"));%>&id=<% out.print(notread.get(i).get("3"));%>>		
											<%out.print(all.get(i).get("1")); %></a>
										</span>						
									</h5>
									<span class="glyphicon glyphicon-tags" style="color: rgb(81, 119, 197);"></span>
								</div>
								<% } %>
								</div>
								<%if (all_files == 0) {%>
								<div class="city animated fadeInRight ">
								<h4>你还没有添加过内容呢，我等你哦！</h4>
								</div>
								<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav class="navbar navbar-default navbar-fixed-top scroll-hide" role="navigation ">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href=personalCenter?<%out.print("2333"); %>><span class="glyphicon glyphicon-cloud "></a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<form action="search" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="搜索内容"/>
						</div>
						<button type="submit" class="btn btn-default">开始搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right" style="padding-right:10px;">					
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="sources/pics/Avatar.png" height="20" width="20" /><strong class="caret"></strong></a>
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