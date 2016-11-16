<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head> 
	<script type="text/javascript" src="sources/js/jquery-2.0.2.min.js"></script> 
	<script type="text/javascript" src="sources/js/jquery.hideseek.min.js"></script> 
	<script type="text/javascript" src="sources/js/initializers.js"></script> 
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
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
			margin: 5px;
			padding: 10px;		
			height: 150px;
			width: 100%;	
			background-color: #f9f9f9;
		} 
		.city1 {
			margin: 2px;
			padding: 12px;			
			background-color: #f3f3f3;
			width: 99%;
		} 
		.city2 {
			margin: 0 auto;
			height: 300px;
			width: 500px;
			padding: 50px;	
		}		
		.white {
			margin: 2px;
			padding: 12px;			
			background-color: #6BB50B;
			width: 99%;
		} 
		.W {
			background-color: #ffffff;
		}
		.G {
			background-color: #6BB50B;
		}
		a {
			color: #205B4D;
		}
	</style>
</head>
<body>
<!-- background pic -->
    <div style="position: absolute; width: 100%; height: 100%; z-index: -1; left: 0; top: 0;">      
    	<img src="sources/pics/bg3.jpg" style="left: 0; position: fixed; top: 0;" width="100%" height="100%">      
    </div>
    <% String usermail = null; %>
    <% String username = null; %>
    <% try { %>
	<% usermail = (String) session.getAttribute("usermail"); %>
	<% username = (String) session.getAttribute("username"); %>
	<% } catch (Exception e) { %>
	<% out.print("404 ERROR!"); %>
	<% } %>
	<% if (usermail == null) { %>
	<div class="city2" style="text-align: center;">
		<div class="alert animated wobble" style="background-color: #d8d8d8;">
			<a href="#" class="close" data-dismiss="alert">&times;</a>
            <h3><strong>失败</strong></h3>
			<a href="index.jsp">瞧瞧是不是掉线了呢,这里重新登录哦</a>
        </div>
	</div>
	<% out.print("<div class=\"container\" style=\"display: none\">"); %>
	<% } else { %>
	<% out.print("<div class=\"container\">"); %>
	<% } %>
	<div class="row clearfix">
	   <div class="col-md-12 column">
           <nav class="navbar navbar-default navbar-content-center navbar-inverse navbar-fixed-top" style="background: #036564; border: none" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 	<span class="sr-only">GHZ</span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 	</button> 
					 <a class="navbar-brand" href="#">读而思之</a>
				</div>
				<div class="collapse navbar-collapse" style="font-size: 16px;" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active" onMouseMove="this.className='G animated swing'" onmouseout="this.className='active'">
				            <a href=personalCenter style="color: #ffffff;">个人中心</a>
						</li>
						<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
				            <a href=mainPage  style="color: #ffffff;">我的主页</a>
						</li>
						<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
				            <a href=fileManage style="color: #ffffff;">内容管理</a>
						</li>
						<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
				            <a href=timeLine style="color: #ffffff;">最佳回忆</a>
						</li>
						<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
				            <a href=search style="color: #ffffff;">站内检索</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right" style="padding-right: 15px;">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            	<img src="sources/pics/Avatar.png" height="20" width="20" onMouseMove="this.className='animated pulse'" onmouseout="this.className=''"/>
                        	</a>
							<ul class="dropdown-menu">
								<li><a href=settings>设置</a></li>
								<li><a href=about>关于</a></li>
								<li class="divider"></li>
								<li><a href=signOut>注销</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<p><br><br><br><br></p>
				</div>
			</div>
			<div class="row clearfix">
                <div class="col-md-8 column">
				    <h1 class="animated pulse">圈子动态</h1>
					<br>
					<div style="text-align: right; padding: 5px;">
				        <div class="btn-group pull-left">
				        <!-- 分享标题下的用户名 -->
				            <button data-toggle="dropdown" class="btn dropdown-toggle"> 
                                <span class="glyphicon glyphicon-user"><% out.print(username); %></span> &nbsp;	
                            </button>			
					    </div>
					<!-- 搜索分享 -->
					   	<input class="form-control pull-right" style="width: 40%;" id="search-highlight1" name="search-highlight1" placeholder="在这里搜索分享内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list1" autocomplete="off" />
				    </div>			
					<!-- 刷新页面执行打印分享信息动作 -->
					<s:action name="printShareInfo" executeResult="true" />
					<br>
                    <hr style="border-top: 1px groove #f1f1f1;" />
  				
  		            <div class="vertical highlight_list1">
  					<% try { %>
					<% ArrayList<Map<String, String>> list = (ArrayList<Map<String, String>>)session.getAttribute("sharelist"); %>
    				<% for (int i = list.size() - 1; i >= 0; --i) { %>		
    					<!-- 头像 -->
    				    <div class="city animated fadeInLeft" style="overflow: hidden;">
    				        <div class="pull-left" style="width: 20%; text-align: center;">
    							<a href=seePeopleInfo?userid=<% out.println(list.get(i).get("8")); %>>
				                    <img src=<% out.print("sources/pics/Avatar.png"); %> height="100" width="100" class="img-rounded"/>	
				                    <h6><% out.print(list.get(i).get("5")); %></h6>	
                                </a>
				            </div>	
				            <div class="pull-right" style="width: 79%; padding: 10px;">
                                <span class="glyphicon glyphicon-time pull-left"> 
                                    <span style="font-weight: bold;"><% out.print(list.get(i).get("6")); %></span>
                                </span>
				                <br>
				                <h5>
                                    <a href=readArticle?url=<% out.print(list.get(i).get("2")); %>&articlename=<% out.print(list.get(i).get("1")); %>&id=<% out.print(list.get(i).get("3")); %>><% out.print(list.get(i).get("1")); %></a>
                                </h5>
						
				                <% if (list.get(i).get("7") != null) { %>
				                <% if (list.get(i).get("7").length() < 140) { %>
								<% out.print(list.get(i).get("7")); %>
                                <% } else { %>
								<% out.print(list.get(i).get("7").substring(0, 120) + "......"); %>
								<% } %>
                                <% } else { %>
                                <% out.print("他很懒哦，啥都没说呢！"); %>
                                <% } %>
				            </div>
					   </div>	
   					<% } %>
   					<% } catch(Exception e) { %>
   					<% out.println("ERROR"); %>
   					<% } %>
                    </div>
            	</div>			
				<div class="col-md-4 column pull-right">
					<br>
					<div class="panel" style="background: #f9f9f9;" >
    					<div class="panel-heading">
                   			<!-- 上传文件 -->
    				        <a id="upload" class="pull-right" href="#upload-modal" data-toggle="modal">
        				        <button type="button" class="btn" style="background: #036564; color: #ffffff;">上传文件/URL</button>
        				    </a>
        					<br><br>
    					</div>
    					<!-- 搜索书籍 -->
    				    <div class="animated slideInUp" style="width: 90%; margin: 0px auto;">
                   	        <input class="form-control" id="search-highlight2"  name="search-highlight2" placeholder="在这里搜索内容" data-nodata="没有发现结果" type="text" data-list=".highlight_list2" autocomplete="off">
                   	    </div>
    					<div class="panel-body">
				            <!-- 刷新页面执行查找书籍 -->
                            <s:action name="getArticle" executeResult="true" />
                            <div class="vertical highlight_list2" style="max-height: 465px; overflow: hidden;">
                            <% try { %>
				            <% ArrayList<Map<String, String>> list1 = (ArrayList<Map<String, String>>)session.getAttribute("personalbooklist");
						  	   for (int i = list1.size() - 1; i >= 0 ; --i) { %>
                                <div class="city1 animated slideInUp" onMouseMove="this.className='white'" onmouseout="this.className='city1'">
								    <a href=readArticle?url=<% out.print(list1.get(i).get("2")); %>&articlename=<% out.print(list1.get(i).get("1")); %>&id=<% out.print(list1.get(i).get("3")); %>>
								        <span class="glyphicon glyphicon-paperclip"> <% out.print(list1.get(i).get("1")); %></span>			
								    </a>
								</div>
							<% } %>
							<%if (list1.size() == 0) { %>
								<div class="city1 animated slideInUp">空空如也啊！</div>
							<% } %>			
							<% } catch (Exception e) { %>
							<% out.print("ERROR"); %>
							<% } %>
								<div style="text-align: right;">	
									<span><a href="mainPage"><br>查看更多 >></a></span>
								</div>
							</div>
						</div>
						<br>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column"></div>
				<hr style="height: 10px; border: none; border-top: 1px groove #000000;" />
				<footer>
	    			<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
				</footer>
			</div>
			<div class="modal fade" id="upload-modal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<ul class="nav nav-tabs">
 								<li class="active" >
 									<a data-toggle="tab" href="#savepdf">
 										<span class="glyphicon glyphicon-open">上传pdf</span>
 									</a>
 								</li>
  								<li>
  									<a data-toggle="tab" href="#saveurl">
  										<span class="glyphicon glyphicon-link">保存url</span>
  									</a>
  								</li>
  								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							</ul>
						</div>
						<div class="modal-body" style="width: 400px; height: 200px; margin-left: 90px;">
							<div class="tab-content">
    							<div id="savepdf" class="tab-pane fade in active">
									<form action="fileUpLoad" id="upload_form" method="post" enctype="multipart/form-data">
										<div class="form-group">
                							<input name="articlename" class="form-control" type="text" placeholder="请在这儿输入文件名" required style="padding-left: 30px; height: 42px;" />
    									</div>
    									<div class="form-group">
        									<input name="file" id='file' class="upload" type="file" required style="border: 1px solid #ccc; background: #fff; color: #000; padding: 5px 15px; width: 370px;" />
        								</div>
    								</form>
    								<button type="submit" class="btn btn-success pull-right" form="upload_form">上传</button>
    							</div>
    				    		<div id="saveurl" class="tab-pane">
                            		<form action="urlUpLoad" method="post" id="urlupload_form">
                                		<div class="form-group">
                				    		<input name="articlename"  class="form-control" type="text" placeholder="请在这儿输入文件名" required style="padding-left: 30px; height: 42px;" />
                               	 		</div>
    				            		<div class="form-group">
        						    		<input name="url" id='url'  class="form-control" value="http://" type="text" placeholder="请在这儿输入url" required style="padding-left: 30px; height: 42px;" />
        					    		</div>
    					    		</form>
    					    		<button type="submit" class="btn pull-right" style="background: #036564; color: #ffffff;" form="urlupload_form">上传URL</button>
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
</body>
</html>
