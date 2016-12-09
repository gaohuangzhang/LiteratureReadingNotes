<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		.city1 {
			margin: 5px;
			padding: 20px;
			width: 100%;		
			background-color: #F9F9F9;
		} 
		.inputs {
			float: right;
			width: 500px;
			margin: 8px;
		}
		.W {
			background-color: #ffffff;
		}
		.G {
			background-color: #6BB50B;
		}
		body{
		font-family: "Microsoft YaHei", "Arial", "Times Roman", "Courier", "Verdana", "Century Gothic";
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
	<script>
        $(document).ready(function(){
            $('#search').addClass('active');

        });

    </script>
</head>
<body >

<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg11.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>

	<!-- 得到当前用户信息 -->
	<% String usermail = (String) session.getAttribute("usermail"); %>
	<% String username = (String) session.getAttribute("username"); %>
	<!-- 没有登录或者掉线 设置页面隐藏-->
	<% if (usermail == null) { %>
	<% out.println("你的输入不合法哎，瞧瞧是不是掉线了呢 ╮(╯▽╰)╭"); %>
	<% out.print("<div class=\"container\"  style=\"display: none\">"); %>
	<!-- session中含有登录信息 -->
	<% } else { %>
	<% out.print("<div class=\"container\" >"); %>
	<% } %>
	<!-- 导航栏 -->
	 <%@ include file="nav.jsp" %>
	<div class="row clearfix">
		<br><br><br>
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h1>站内检索</h1><br>
						<div class="tabbable" id="tabs-436201">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#panel-1" data-toggle="tab">用户</a>
								</li>
								<li>
									<a href="#panel-2" data-toggle="tab">文章</a>
								</li>
								<li>
									<a href="#panel-3" data-toggle="tab">笔记</a>
								</li>
								<li>
									<a href="#panel-4" data-toggle="tab">类别</a>
								</li>
							</ul>
							<br>
							<div class="tab-content">
								<!-- get all informations -->
								<s:action name="getInfo" executeResult="true" />
								<div class="tab-pane active" id="panel-1">
									<input class="form-control pull-right" style="width: 60%" id="search-highlight1"  placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list1" autocomplete="off" />
									<br><br>
									<div class="vertical highlight_list1 ">
									<% ArrayList<Map<String, String>> users = (ArrayList<Map<String, String>>)session.getAttribute("users"); %>
									<% for (int i = 0; i != users.size(); ++i) { %>
										<div class="city1 animated fadeInRight">
											<a href=seePeopleInfo?userid=<% out.println(users.get(i).get("1")); %>>
												<% out.println(users.get(i).get("2")); %> 
											</a>
										</div>
									<% } %>
									</div>
								</div>
								<div class="tab-pane" id="panel-2">		
									<input class="form-control pull-right" style="width: 60%" id="search-highlight2" name="search-highlight2" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list2" autocomplete="off" />
									<br><br>
									<div class="vertical highlight_list2">
									<% ArrayList<Map<String, String>> articles = (ArrayList<Map<String, String>>)session.getAttribute("articles"); %>
									<% for (int i = 0; i != articles.size(); ++i) { %>												
										<div class="city1 animated fadeInRight">
											<a href=readArticle?url=<% out.print(articles.get(i).get("3")); %>&articlename=<% out.print(articles.get(i).get("2")); %>&id=<% out.print(articles.get(i).get("1")); %>>											
												<% out.println(articles.get(i).get("2")); %> 
											</a>										
										</div>
									<% } %>			
									</div>
								</div>
								<div class="tab-pane" id="panel-3">
									<input class="form-control pull-right" style="width: 60%" id="search-highlight3" name="search-highlight3" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list3" autocomplete="off" />
									<br><br>
									<div class="vertical highlight_list3">
									<% ArrayList<Map<String, String>> notes = (ArrayList<Map<String, String>>)session.getAttribute("notes"); %>
									<% for (int i = 0; i != notes.size(); ++i) { %>
										<div class="city1 animated fadeInRight">
										在<% out.println(notes.get(i).get("6")); %>  你在文章
											<a href=readArticle?url=<% out.print(notes.get(i).get("3")); %>&articlename=<% out.print(notes.get(i).get("2")); %>&id=<% out.print(notes.get(i).get("1")); %>>
												<% out.println(notes.get(i).get("2")); %> 
											</a>上记录了笔记
											<hr>
											<% out.println(notes.get(i).get("5")); %>  
											<br>
											<% out.println(notes.get(i).get("7")); %>  
										</div>
									<% } %>
									</div>
								</div>
								<div class="tab-pane" id="panel-4">
									<form class="form-horizontal animated pulse" role="form">
										<div class="form-group" >
											<input class="form-control pull-right" id="inputEmail31" type="submit" style="width: 10%;" />
											<input class="form-control pull-right" id="inputEmail3" type="text" style="width: 60%;" />
										</div>
									</form>
									<hr>
									<p>
										Howdy, I'm in Section 4.
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
