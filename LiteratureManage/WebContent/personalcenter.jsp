<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/jquery-3.1.1.min.js"></script>
	<script src="sources/js/bootstrap.min.js"></script>
	<script src="sources/js/modernizr.custom.js" type="text/javascript"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>个人中心</title>
	<link href="sources/css/animate.css" rel="stylesheet" type="text/css">
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
	<style>
		.city {
			float: left;
			margin: 5px;
			padding: 20px;			
			background-color: #F9F9F9;
		} 
		.city1 {
			float: left;
			margin: 2px;
			padding: 10px;			
			background-color: #e8e8e8;
			width: 99%;
		} 
	</style>
</head>
<body style="background:#e8e8e8;">
    <% String usermail = null; %>
    <% String username = null; %>
    <% try { %>
	<% usermail = (String) session.getAttribute("usermail"); %>
	<% username = (String) session.getAttribute("username"); %>
	<% } catch (Exception e) { %>
	<% out.print("404 ERROR!"); %>
	<% } %>
	<% if (usermail == null) {%>
	<%
		out.println("你的输入不合法哎，瞧瞧是不是掉线了呢 ╮(╯▽╰)╭");
	%>
	<%
		out.print("<div class=\"container\"  style=\"display: none\">");
	%>
	<% } else { %>
	<% out.print("<div class=\"container\" >"); %>
	<% } %>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<p><br><br><br><br></p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<h2>分享</h2>
					<br>
					<div class="btn-group">
						<!-- 分享标题下的用户名和邮箱 -->
						<button data-toggle="dropdown" class="btn  dropdown-toggle"> 
							<span class="glyphicon glyphicon-user "> <% out.print(username); %></span> &nbsp;	
						</button>			
					</div>
					<!-- 刷新页面执行打印分享信息动作 -->
					<s:action name="printShareInfo" executeResult="true" />
  				<hr style="height:10px;border:none;border-top:2px groove #f1f1f1;" />
  					<% try { %>
					<% ArrayList<Map<String, String>> list = (ArrayList<Map<String, String>>) session.getAttribute("sharelist");%>
    				<% for (int i = list.size() - 1; i >= 0; --i) { %>		
    				<!-- 头像 -->	
    				<div class="city animated fadeInLeft" style="width:20%;background-color:#e8e8e8;text-align:center;" >
							<img src=<%out.print( "sources/pics/Avatar.png");%> height="80" width="80" lass="img-rounded" />		
							<h4> <% out.print(list.get(i).get("1")); %>	</h4>	
					</div>	
					<div class="city animated fadeInRight" style="width:77%;background-color:#e8e8e8;">
						分享了：
						<a href=readArticle?url=<% out.print(list.get(i).get("4"));%>&articlename=<% out.print(list.get(i).get("3"));%>>
							<% out.print(list.get(i).get("3") ); %>
						</a>
						<hr>
						<span class="glyphicon  glyphicon-comment "></span>&nbsp;
							西施越溪女，出自苎萝山。秀色掩今古，荷花羞玉颜。浣纱弄碧水，自与清波闲。皓齿信难开，沉吟碧云间。勾践徵绝艳，扬蛾入吴关。提携馆娃宫，杳渺讵可攀。一破夫差国，千秋竟不还。
										
						<br><br>
						<span class="glyphicon  glyphicon-time "> <span style="font-weight:bold;"><% out.print(list.get(i).get("6"));%>&nbsp;&nbsp;&nbsp;</span></span>
                   				<% out.print(list.get(i).get("5")); %>
					</div>
   					<% } %>
   					<% } catch(Exception e) { %>
   					<% out.println("ERROR"); %>
   					<% } %>
					<div style="text-align:right">
						<a class="btn" href="#" >查看更多 >></a>
					</div>
            	</div>		
				<div class="col-md-4 column">
					<br>
					
					<div class="panel" style="background:#f9f9f9;">
    					<div class="panel-heading">
    						<div style="text-align:right;">
    							<a id="upload" href="#upload-modal" data-toggle="modal">
        				    		<button type="button" class="btn btn-success" >上传新的文件</button>
        				    	</a>
        					</div>
    					</div>
    					<div class="panel-body">
        			    	<div class="input-group">
                   				<input type="text" class="form-control" placeholder="搜索你的资料库">
                    			<span class="input-group-btn">
                        			<button class="btn btn-default" type="button">搜索</button>	
                    			</span>
                   			</div>
								<!-- 刷新页面执行查找书籍 -->
					    		<s:action name="getArticle" executeResult="true" />
					    		<br>
					    		<% try { %>
								<% ArrayList<Map<String, String>> list1 = (ArrayList<Map<String, String>>) session.getAttribute("personalbooklist");
								int max_size = 9;
								int min_size = 0;
								if (list1.size() >= max_size) {
									max_size = list1.size() - 1;
									min_size = max_size - 9;
								} else {
									max_size = list1.size() - 1;
									min_size = 0;
								}
						  	       for (int i = max_size; i >= min_size ; --i) { %>
								    <div class="city1">
										<a href=readArticle?url=<% out.print(list1.get(i).get("2"));%>&articlename=<% out.print(list1.get(i).get("3"));%>>
											<span class="glyphicon glyphicon-paperclip"> <% out.print(list1.get(i).get("1")); %></span>
											
										</a>
									</div>
								
								<% } %>				
							<% } catch (Exception e) { %>
							<% out.print("ERROR"); %>
							<% } %>
							<div style="text-align: right;">	
								<span><a href="mainPage"> <br>查看更多 >></a></span>
							</div>
						</div>
					</div>
					<br>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-default navbar-fixed-top scroll-hide" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href=personalCenter>阅读</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<form action="search" class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input class="form-control" type="text" placeholder="搜索内容" />
					</div>
					<button type="submit" class="btn btn-default">开始搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right" style="padding-right: 10px;">
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
		<div class="row clearfix">
			<div class="col-md-12 column"></div>
		</div>
		<hr style="height:10px;border:none;border-top:1px groove #000000;" />
		<footer>
	    	<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
		</footer>
	</div>
	<div class="modal fade" id="upload-modal" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-open"></span>上传文件</h4>
				</div>
				<div class="modal-body" style="width: 400px; margin-left: 90px;">
				
					<form action="fileUpLoad" id="upload_form"  method="post" enctype="multipart/form-data">
						<div class="form-group">
                			<input name="articlename"  class="form-control" type="text" placeholder="请在这儿输入文件名" required style="padding-left: 30px; height: 42px;" />
    					</div>
    					<div class="form-group">
        					<input name="file" id='file' class="upload" type="file"  required style="border:1px solid #ccc;background:#fff;color:#000;padding:5px 15px;width:370px;" />
        				</div>
    				</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" form="upload_form" >上传</button>
					
				</div>
			</div>
		</div>
	</div>

	<div id="back-up" onclick="goToWhere(0)" style=" position: fixed; cursor: pointer; right: 90px; bottom: 160px;">
		<img src= "sources/pics/up.png" />
	</div>
	<div id="back-up" onclick="goToWhere(1)" style="position: fixed; cursor: pointer; right: 90px; bottom: 50px;">
		<img src= "sources/pics/down.png" />
	</div>
	
</body>
</html>