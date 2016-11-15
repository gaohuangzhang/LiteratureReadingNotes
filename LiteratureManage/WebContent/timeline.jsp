<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
	<style>	
		.W{
			background-color: #ffffff;
		}
		.G {
			background-color:#6BB50B;
		}
	</style>
</head>
<body>
	<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    	<img src="sources/pics/bg3.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>
	<% ArrayList<Map<String, String>> actionResult = (ArrayList<Map<String, String>>)session.getAttribute("timeline"); %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default navbar-fixed-top scroll-hide" style="background:#036564;border:none" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">GHZ</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#" style="padding-left: 20px; color: #ffffff;">读而思之</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="font-size: 16px;">
						<ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="sources/pics/Avatar.png" height="20" width="20" /><strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href=settings>设置</a></li>
									<li><a href=about>关于</a></li>
									<li class="divider"></li>
									<li><a href=signOut>注销</a></li>
								</ul>
							</li>
						</ul>
						
						<ul class="nav navbar-nav">
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
							 	<a href=personalCenter style="color:#ffffff;">个人中心</a>
							</li>
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
							 	<a href=mainPage style="color:#ffffff;">我的主页</a>
							</li>
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
							 	<a href=fileManage style="color:#ffffff;">内容管理</a>
							</li>
							<li class="active" onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
							 	<a href=timeLine style="color:#ffffff;">最佳回忆</a>
							</li>
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
								<a href=search style="color:#ffffff;">站内检索</a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<div class="modal-shiftfix">
    	<div class="container-fluid main-content">
        	<div class="page-title">
          		<h1>时间轴</h1>
        	</div>
        	<ul class="timeline animated">
        		<% if (actionResult.size() == 0) { %>
        		<li>
        			<div class="timeline-time">
        				<strong></strong>
        			</div>
        			<div class="timeline-icon"></div>
        			<div class="timeline-content">
        				<h2><% out.print("这里什么都没有哦～"); %></h2>
        			</div>
        		</li>
        		<% }
        		   else {
        			   for (int i = actionResult.size() - 1; i >= 0; i--) { 
        		%>
          		<li>
            		<div class="timeline-time">
              			<strong>
              				<%  
              					int lastIndex_1 = actionResult.get(i).get("2").indexOf(' ');
              					out.print(actionResult.get(i).get("2").substring(0, lastIndex_1)); 
              				%>
              			</strong>
              			<% 
              				int lastIndex_2 = actionResult.get(i).get("2").indexOf('.');
              				out.print(actionResult.get(i).get("2").substring(lastIndex_1 + 1, lastIndex_2));
              			%>
            		</div>
            		<div class="timeline-icon"></div>
            		<div class="timeline-content">
              			<h2><% out.print(actionResult.get(i).get("1")); %></h2>
              			<button class="btn btn-info" href="#">详细信息 >></button>
            		</div>
          		</li>
          			<% } %>
          		<% } %>
        	</ul>
      	</div>
    </div>
    <link href="sources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  	<link href="sources/css/bootstrap.css" rel="stylesheet" type="text/css">
  	<link href="sources/css/custom.css" rel="stylesheet" type="text/css">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="sources/css/animate.css" rel="stylesheet">
	<script src="sources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="sources/js/modernizr.custom.js" type="text/javascript"></script>
    <script src="sources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery-ui.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="sources/js/fullcalendar.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.easy-pie-chart.js" type="text/javascript"></script>
    <script src="sources/js/jquery.isotope.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.fancybox.pack.js" type="text/javascript"></script>
    <script src="sources/js/select2.js" type="text/javascript"></script>
    <script src="sources/js/jquery.inputmask.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.validate.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap-fileupload.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap-timepicker.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap-colorpicker.js" type="text/javascript"></script>
    <script src="sources/js/daterange-picker.js" type="text/javascript"></script>
    <script src="sources/js/date.js" type="text/javascript"></script>
    <script src="sources/js/fitvids.js" type="text/javascript"></script>
    <script src="sources/js/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="sources/js/main.js" type="text/javascript"></script>
    <script src="sources/js/modernizr.custom.js" type="text/javascript"></script>
</body>
</html>