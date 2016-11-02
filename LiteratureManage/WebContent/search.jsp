<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全局搜索</title>
 <!-- 搜索 -->
<script type="text/javascript" src="sources/js/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="sources/js/jquery.hideseek.min.js"></script>
<script type="text/javascript" src="sources/js/initializers.js"></script>
<!-- 实现动画必须引入的包 -->
<link href="sources/css/animate.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap -->
<link href="sources/css/bootstrap.min.css" rel="stylesheet">
<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
<script src="sources/js/bootstrap.min.js"></script>
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
	.inputs {
	float: right;
	width:500px;
	margin: 8px;
	}
.W{
		background-color: #ffffff;
		}
		.G {
		background-color:#6BB50B;
		}
		a {
		color:#000000;
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
<body >
<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>

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
<!-- 导航栏 -->
<div class="col-md-12 column">
			<nav class="navbar navbar-default  navbar-inverse navbar-fixed-top" style="background:#036564;border:none" role="navigation">
				<div class="navbar-header" style="padding-left:18%;">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">GHZ</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#"></a>
				</div>
				
				<div class="collapse navbar-collapse" style="font-size: 16px;" bs-example-navbar-collapse-1">
					<ul  class="nav navbar-nav">
						<li  onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a  href=personalCenter style="color:#ffffff;">个人中心</a>
						</li >
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=mainPage  style="color:#ffffff;">我的主页</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=fileManage style="color:#ffffff;">内容管理</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=timeLine style="color:#ffffff;">最佳回忆</a>
						</li>
						<li class="active" onMouseMove="this.className='G animated  swing'" onmouseout="this.className='active'">
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

	<div class="row clearfix">
	<br><br><br>
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
				
				
<h2>搜索</h2>

		
			
<div class="tabbable" id="tabs-436201">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-1" data-toggle="tab">应用</a>
					</li>
					<li>
						 <a href="#panel-2" data-toggle="tab">用户</a>
					</li>
					<li>
						 <a href="#panel-3" data-toggle="tab">文章</a>
					</li>
					<li>
						 <a href="#panel-4" data-toggle="tab">标签</a>
					</li>
					<li>
						 <a href="#panel-5" data-toggle="tab">笔记</a>
					</li>
				</ul>
				<br>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
					<form class="form-horizontal animated  pulse" role="form" >
				<div class="form-group" >
				<input class="form-control pull-right  " id="inputEmail31" type="submit" style="width:10%;"/>
						<input class="form-control pull-right " id="inputEmail3" type="text" style="width:60%;	"/>
			
						
				</div>
			</form>
		<hr>
						<p>
							I'm in Section 1.
						</p>
					</div>
					<div class="tab-pane" id="panel-2">
					<form class="form-horizontal animated  pulse" role="form" >
				<div class="form-group" >
				<input class="form-control pull-right "  id="inputEmail31" type="submit" style="width:10%;"/>
						<input class="form-control pull-right" id="inputEmail3" type="text" style="width:60%;	"/>
			
						
				</div>
			</form>
		<hr>
						<p>
							Howdy, I'm in Section 2.
						</p>
					</div>
					<div class="tab-pane" id="panel-3">
					<form class="form-horizontal animated  pulse" role="form" >
				<div class="form-group" >
				<input class="form-control pull-right " id="inputEmail31" type="submit" style="width:10%;"/>
						<input class="form-control pull-right" id="inputEmail3" type="text" style="width:60%;	"/>
			
						
				</div>
			</form>
		<hr>
						<p>
							Howdy, I'm in Section 3.
						</p>
					</div>
					<div class="tab-pane" id="panel-4">
					<form class="form-horizontal animated  pulse" role="form">
				<div class="form-group" >
				<input class="form-control pull-right" id="inputEmail31" type="submit" style="width:10%;"/>
						<input class="form-control pull-right " id="inputEmail3" type="text" style="width:60%;	"/>
			
						
				</div>
			</form>
		<hr>
						<p>
							Howdy, I'm in Section 4.
						</p>
					</div>
					<div class="tab-pane" id="panel-5">
					<form class="form-horizontal animated  pulse" role="form" >
				<div class="form-group" >
				<input class="form-control pull-right t" id="inputEmail31" type="submit" style="width:10%;"/>
						<input class="form-control pull-right " id="inputEmail3" type="text" style="width:60%;	"/>
			
						
				</div>
			</form>
		<hr>
						<p>
							Howdy, I'm in Section 5.
						</p>
					</div>
				</div>
			</div>
				
				
				
				</div>
			</div>
		</div>
	</div>

</div>          
       
</body>
</html>