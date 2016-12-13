<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 实现搜索的3个必须引入的包 -->
	<script type="text/javascript" src="sources/js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="sources/js/jquery.hideseek.min.js"></script>
	<script type="text/javascript" src="sources/js/initializers.js"></script>
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/bootstrap.min.js"></script>
	<!-- 实现动画必须引入的包 -->
	<link href="sources/css/animate.css" rel="stylesheet" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="sources/css/demo.css" type="text/css">
<link rel="stylesheet" href="sources/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="sources/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="sources/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="sources/js/jquery.ztree.exedit.js"></script>
	<script type="text/javascript" src="sources/js/ztree_config.js"></script>
	<title>我的主页</title>
	<!-- 分块的样式 -->
	<style>
		.city {
			float: left;
			margin: 5px;
			padding: 20px;
			width: 48.7%;
			height: 100px;
			overflow: hidden;
			background-color: rgba(255,255,255,	 0.60);
		}
		.city1 {
			margin: 0 auto;
			height: 300px;
 			width: 500px;
			padding: 50px;			
		} 
		.white {
			float: left;
			margin: 5px;
			padding: 20px;
			width: 48.5%;
			height: 100px;
			overflow: hidden;
			background-color: #6BB50B;
		}
		.inputs {
			float: right;
			width: 500px;
			margin: 8px;
		}
		.W {
			background-color: #ffffff;
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
            $('#main').addClass('active');

        });

    </script>
</head>
<body>

<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg11.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>
	<!-- 得到当前用户信息 -->
	<% String usermail = (String) session.getAttribute("usermail"); %>
	<% String username = (String) session.getAttribute("username"); %>
	<% String avatar = (String) session.getAttribute("avatar"); %>
	<!-- 没有登录或者掉线 设置页面隐藏-->
	<% if (usermail == null) { %>
	<div class="city1" style="text-align: center;">
		<div class="alert animated wobble" style="background-color: #d8d8d8;">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
			<h3><strong>失败</strong></h3>
			<a href="index.jsp">瞧瞧是不是掉线了呢,这里重新登录</a>
		</div>
	</div>
	<% out.print("<div class=\"container\" style=\"display: none\">"); %>
	<!-- session中含有登录信息 -->
	<% } else { %>
	<% out.print("<div class=\"container\">"); %>
	<% } %>
	<%@ include file="nav.jsp" %>
	<div class="row clearfix">	
		
		<div class="col-md-12 column">
			<div class="row clearfix">
				<!-- 防止标题栏遮盖内容 -->
				<div class="col-md-12 column">
					<p><br><br><br><br></p>
				</div>
				<div class="col-md-3"  style="text-align: center;">
					<!-- 显示头像 -->
					<img src="<%out.print(avatar); %>" height="240" width="240" class="img-rounded" />
					<p class="text-center">
						<br>
						<div style="width:100%;">
							<span class="glyphicon glyphicon-user">
								<!-- 显示用户名和邮箱 -->
								<% out.print(username); %>
							</span>
							<br><br>
							<span class="glyphicon glyphicon-send"><% out.print(usermail); %></span>
						</div>
					</p>
				</div>
				<!-- 所有的书籍信息页面 -->
				<div class="col-md-9 column">	
					<h1>我的书架</h1>				
					<br>
					<!-- 载入页面过程中执行action 得到各种书籍 -->
					<s:action name="getAllKindOfArticles" executeResult="true" />
					<!--从session中得到所有书籍 -->
					<% int not_read = 0; %>
					<% int read_little = 0; %>
					<% int read_all = 0; %>
					<% int all_files = 0; %>
					<% ArrayList<Map<String, String>> notread = (ArrayList<Map<String, String>>) session.getAttribute("notread"); %>
					<% ArrayList<Map<String, String>> readlittle = (ArrayList<Map<String, String>>) session.getAttribute("readlittle"); %>
					<% ArrayList<Map<String, String>> readall = (ArrayList<Map<String, String>>) session.getAttribute("readall"); %>
					<% ArrayList<Map<String, String>> all = (ArrayList<Map<String, String>>) session.getAttribute("all"); %>
					<% not_read = notread.size(); %>
					<% read_little = readlittle.size(); %>
					<% read_all = readall.size(); %>
					<% all_files = all.size(); %>
					<!-- 选项卡栏 -->				
					<div class="tabbable" id="tabs-79182">
						<ul class="nav nav-tabs " style="color:#444444">
							<li class="active">
								<a href="#panel-779078" data-toggle="tab">未读内容&nbsp;<span class="badge"><% out.println(not_read); %></span></a>
							</li>
							<li>
								<a href="#panel-238826" data-toggle="tab">观其大略&nbsp;<span class="badge"><% out.println(read_little); %></span></a>
							</li>
							<li>
							 	<a href="#panel-238827" data-toggle="tab">字斟句酌&nbsp;<span class="badge"><% out.println(read_all); %></span></a>
							</li>
							<li>
								<a href="#panel-238828" data-toggle="tab">全部内容&nbsp;<span class="badge"><% out.println(all_files); %></span></a>
							</li>
							<li>
								<a href="#panel-238829" data-toggle="tab">分门别类&nbsp;</a>
							</li>
						</ul>						
						<!-- 那些信息们 -->
						<div class="tab-content">
							<div class="tab-pane fade in active" id="panel-779078">	
								<!-- 搜索入口1 -->
								<input class="form-control pull-right" style="width: 60%; margin: 12px;background-color: rgba(255,255,255,	 0.60);" id="search-highlight1" name="search-highlight1" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list1" autocomplete="off" />
								<!-- 没有读的 -->
								<div class="vertical highlight_list1">
								<% for (int i = not_read - 1; i >= 0; i--) { %>								
									<div class="city " onMouseMove="this.className='white'" onmouseout="this.className='city'">
										<span class="glyphicon glyphicon-paperclip"> 
											<a style="color: #000000;" href=readArticle?url=<% out.print(notread.get(i).get("2")); %>&articlename=<% out.print(notread.get(i).get("1")); %>&id=<% out.print(notread.get(i).get("3")); %>>
												<%out.print(notread.get(i).get("1")); %>
											</a>
										</span>
										
										<a style="color: #000000;" href=deleteArticle?articleid=<% out.print(notread.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-remove pull-right"> 删除</span>
										</a>
										<hr>
									
										<!-- 分享链接 -->
										<a style="color: #000000;" href=toShare?articlename=<% out.print(notread.get(i).get("1")); %>&id=<% out.print(notread.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-share-alt pull-right"> 分享</span>
										</a>
									</div>								
								<% } %>	
								</div>
								<% if (not_read == 0) { %>
								<div class="city animated fadeInRight">
									<h4>已经没有未读的内容了，真棒</h4>
								</div>
								<% } %>
							</div>
							<div class="tab-pane fade" id="panel-238826">								
								<!-- 已经粗读过哦 -->	
								<!-- 搜索入口2 -->									 
								<input class="form-control pull-right" style="width: 60%; margin: 12px;background-color: rgba(255,255,255,	 0.60);" id="search-highlight2" name="search-highlight2" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list2" autocomplete="off" />
								<!-- 鼠标放在上边显示动态效果 -->
								<div class=" vertical highlight_list2">						
								<% for (int i = read_little - 1; i >= 0; i--) { %>
									<div class="city " onMouseMove="this.className='white'" onmouseout="this.className='city'">
										<span class="glyphicon glyphicon-paperclip">  
											<a style="color: #000000;" href=readArticle?url=<% out.print(readlittle.get(i).get("2")); %>&articlename=<% out.print(readlittle.get(i).get("1")); %>&id=<% out.print(readlittle.get(i).get("3")); %>>
												<% out.print(readlittle.get(i).get("1")); %>
											</a>
										</span>
										
										<a style="color: #000000;" href=deleteArticle?articleid=<% out.print(readlittle.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-remove pull-right"> 删除</span>
										</a>
										
								<hr>
										<!-- 分享链接 -->
										<a style="color: #000000;" href=toShare?articlename=<% out.print(readlittle.get(i).get("1")); %>&id=<% out.print(readlittle.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-share-alt pull-right"> 分享</span>
										</a>
									</div>
								<% } %>	
								<!-- 无内容 -->
								</div>
								<% if (read_little == 0) { %>
								<div class="city animated fadeInRight">
									<h4>这是空的呢，加油啊！</h4>
								</div>
								<% } %>
							</div>
							<div class="tab-pane fade" id="panel-238827">
								<!-- 已经精读过哦 -->	
								<input class="form-control pull-right" style="width: 60%; margin: 12px;background-color: rgba(255,255,255,	 0.60);" id="search-highlight3" name="search-highlight3" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list3" autocomplete="off" />
								<div class=" vertical highlight_list3">
								<% for (int i = read_all - 1; i >= 0; i--) { %>
									<div class="city " onMouseMove="this.className='white'" onmouseout="this.className='city'">
										<span class="glyphicon glyphicon-paperclip">  
	  										<a style="color: #000000;" href=readArticle?url=<% out.print(readall.get(i).get("2")); %>&articlename=<% out.print(readall.get(i).get("1")); %>&id=<% out.print(readall.get(i).get("3"));%>>
	    										<% out.print(readall.get(i).get("1")); %>
	    									</a>
	    								</span>
	    							
										<a  style="color: #000000;" href=deleteArticle?articleid=<% out.print(readall.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-remove pull-right"> 删除</span>
										</a>
	  									<hr>
										<a style="color: #000000;" href=toShare?articlename=<% out.print(readall.get(i).get("1")); %>&id=<% out.print(readall.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-share-alt pull-right"> 分享</span>
										</a>
									</div>
								<% } %>
								</div>
								<% if (read_all == 0) { %>
								<div class="city animated fadeInRight">
									<h4>还没有精读过的内容，要努力啊！</h4>
								</div>
								<% } %>
							</div>					
							<div class="tab-pane fade" id="panel-238828">
								<!-- 全部哦 -->			 
								<input class="form-control pull-right" style="width: 60%; margin: 12px;background-color: rgba(255,255,255,	 0.60);" id="search-highlight4" name="search-highlight4" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list4" autocomplete="off" />
								<div class="vertical highlight_list4">						
								<% for (int i = all_files - 1; i >= 0; i--) { %>
									<div class="city " onMouseMove="this.className='white'" onmouseout="this.className='city'">	
										<span class="glyphicon glyphicon-paperclip">  
											<a style="color: #000000;" href=readArticle?url=<% out.print(all.get(i).get("2")); %>&articlename=<% out.print(all.get(i).get("1")); %>&id=<% out.print(all.get(i).get("3"));%>>		
												<% out.print(all.get(i).get("1")); %>
											</a>
										</span>		
										
										<a style="color: #000000;" href=deleteArticle?articleid=<% out.print(all.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-remove pull-right"> 删除</span>
										</a>	
										<hr>
										<a style="color: #000000;" href=toShare?articlename=<% out.print(all.get(i).get("1")); %>&id=<% out.print(all.get(i).get("3")); %>>
											<span class="glyphicon glyphicon-share-alt pull-right"> 分享</span>
										</a>
									</div>
								<% } %>
								</div>
								<% if (all_files == 0) { %>
								<div class="city animated fadeInRight">
									<h4>你还没有添加过内容呢，我等你哦！</h4>
								</div>
								<% } %>
							</div>
							<div class="tab-pane fade" id="panel-238829">
								<!-- 分类哦 -->		
								
							
													
									
									<br><br>	
									<div class="zTreeDemoBackground left">
										<ul id="treeDemo1" class="ztree "></ul>
									</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	</div>


	<div id="back-up" onclick="goToWhere(0)" style="position: fixed; cursor: pointer; right: 30px; bottom: 80px;">
		<img src="sources/pics/up.png" />
	</div>
	 <br><br><br><br><br><br><br><br><br><br>
	<%@ include file="bottom.jsp" %>

</body>
</html>