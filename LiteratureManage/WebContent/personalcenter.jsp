<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人中心</title>
<!-- 去往开始和结尾 -->
<script type="text/javascript">
    var goToWhere = function (where)
    {
        var me = this;
        clearInterval (me.interval);
        me.site = [];
        var dom = !/.*chrome.*/i.test (navigator.userAgent) ? document.documentElement : document.body;
        var height = !!where ? dom.scrollHeight : 0;
        me.interval = setInterval (function ()
        {
            var speed = (height - dom.scrollTop) / 16;
            if (speed == me.site[0])
            {
                clearInterval (me.interval);
                return null;
            }
            dom.scrollTop += speed;
            me.site.unshift (speed);
        }, 16);
    };
</script>
</head>
<body>
    <%String usermail = null; %>
    <%String username = null; %>
    <% try { %>
	<% usermail = (String) session.getAttribute("usermail"); %>
	<% username = (String) session.getAttribute("username"); %>
	<% } catch (Exception e) { %>
	<% out.print("404 ERROR!"); %>
	<%} %>
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
					<p>
						<br> <br>
					</p>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-8 column">
					<h2>分享</h2>
					</br>
					<div class="btn-group">
					<!-- 分享标题下的用户名和邮箱 -->
						<button data-toggle="dropdown" class="btn btn-info dropdown-toggle"> 
							<span class="glyphicon glyphicon-user "></span><% out.print(username); %> &nbsp;	
							<span class="glyphicon glyphicon-envelope "></span><%out.print(usermail);%>"&nbsp;						
							<span class="caret"></span>
						</button>
					<!-- 属于该按钮的下拉菜单 -->
						<ul class="dropdown-menu">
							<li><a href="#">操作</a></li>
							<li class="divider"></li>
							<li><a href="#">其它</a></li>
						</ul>
					</div>
					<!-- 刷新页面执行打印分享信息动作 -->
					<s:action name="printShareInfo" executeResult="true" />
  					<hr>
  					<%try { %>
					<% ArrayList<Map<String, String>> list = (ArrayList<Map<String, String>>) session.getAttribute("sharelist");%>
    				<% for (int i = list.size() - 1; i >= 0; --i) { %>
  
    				<div class="panel panel-info">
        				<div class="panel-heading">
            				<h3 class="panel-title">
                				<div class="container">
                    				<div class="row clearfix">
                        				<div class="col-md-2 column">
                            				<!--用户头像-->
                            				<img src=<%out.print( "sources/pics/Avatar.png");%> height="80" width="80" lass="img-rounded" />
                        				</div>
                        				<div class="col-md-6 column" style="color: rgb(0, 0, 0);">
                            				<h4 >
                                				<!--用户名和作品名-->
                                				<span class="glyphicon glyphicon-user "></span>&nbsp;
                                				<% out.print(list.get(i).get("1")); %> 
                                			</h4>
                                			<hr align="left" style="border:0;background-color:#ff0000;height:1px;width:70%;"/>
                                			<span class="glyphicon glyphicon-file"></span>
                                   			<% out.print("<a style=\"color: rgb(0, 0, 0);\">" + list.get(i).get("3") + "</a>");%>
                           
                        				</div>
                    				</div>
                				</div>
            				</h3>
        				</div>
        				<div class="panel-body">
            				<!--评论-->
            				<div class="wall">
            				<span class="glyphicon  glyphicon-comment "></span>&nbsp;
                			<% out.print(list.get(i).get("5")); %>
                			<div style="text-align:right"><a class="btn" href="#" >
                				查看更多 >></a></div>
            				</div>
        				</div>
        				<div class="panel-footer">           		
                			<div style="text-align:left;">
                  				<!--时间-->
                  				<span class="glyphicon  glyphicon-time "></span>
                   				<span style="font-weight:bold;"> &nbsp;&nbsp;&nbsp;<% out.print(list.get(i).get("6"));%>&nbsp;&nbsp;&nbsp;</span>
               				</div>
               				<!-- 按钮 -->
           					<div style="text-align:right;">
           						<!--good-->
        						<button type="button" class="btn btn-sm btn-success " >
									<span class="glyphicon glyphicon-thumbs-up "></span> 点赞 &nbsp;<span class="badge "><% out.print(list.get(i).get("7"));%></span>
								</button>
                				<!--bad-->
                				<button type="button" class=" btn btn-sm btn-warning" >
            						<span class="glyphicon glyphicon-thumbs-down"></span> 反对 &nbsp;<span class="badge"><% out.print(list.get(i).get("8"));%></span>
        						</button>
                				<!--添加到自己的资料库-->
                				<button type="button" class="btn btn-sm btn-primary "  >
									<span class="glyphicon glyphicon-bookmark "  ></span> 收藏 &nbsp;<span class="badge ">0</span>		
								</button>
							</div>
        				</div>
    				</div>
   					 <% } %>
   					 <% } catch(Exception e) { %>
   					 <% out.println("ERROR"); %>
   					 <%} %>
			<div style="text-align:right">
				<a class="btn" href="#" >查看更多 >></a></div>
            </div>		
			
			<div class="col-md-4 column">
				<br>
				<div class="panel panel-default">
    				<div class="panel-heading">
    				    <span class="glyphicon glyphicon-th-list"></span>
    					<span style="font-weight:bold;">你的阅读列表</span>
    					<div style="text-align:right;">
    					<a id="upload" href="#upload-modal"  data-toggle="modal">
        				    <button type="button" class="btn btn-success btn-sm" >上传你的新的文件</button>
        				    </a>
        				</div>
    				</div>
    				<div class="panel-body">
        			    <div class="input-group">
                   			<input type="text" class="form-control" placeholder="搜索你的资料库">
                    		<span class="input-group-btn">
                        		<button class="btn btn-default" type="button">
                        		   搜索
                        		</button>
                        		
                    		</span>
                   		</div><!-- /input-group -->
    				</div>
					<table class="table table-hover"">
						<tbody>
					
					<!-- 刷新页面执行查找书籍 -->
					    <s:action name="getArticle" executeResult="true" />
					    <%try { %>
						<% ArrayList<Map<String, String>> list1 = (ArrayList<Map<String, String>>) session.getAttribute("personalbooklist");
						  for (int i = 0; i < list1.size(); ++i) { %>
							<tr><td><a href=readArticle?url=<% out.print(list1.get(i).get("2"));%>&articlename=<% out.print(list1.get(i).get("3"));%>>
							<span class="glyphicon glyphicon-paperclip"></span>
							<% 	out.print(list1.get(i).get("1"));%>
							</a>
							</td>
							</tr>
							<% } %>
											
						</tbody>
					</table>
					<div class="panel-footer">
					<div style="text-align: right;">	
					<span><a href="mainPage">查看更多 >></a></span>
				</div>
					</div>
				</div>
				
				<br>
				<!-- 百分比 -->
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
						<%} catch (Exception e) { %>
						<% out.print("ERROR"); %>
						<%} %>
						<span class="sr-only">40% 完成</span>
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
				<span class="icon-bar"></span><span class="icon-bar"></span>
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
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<img src="sources/pics/Avatar.png" height="20" width="20" />
				<strong class="caret"></strong></a>
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


	<div class="row clearfix">
		<div class="col-md-12 column"></div>
	</div>
	<hr>
	<footer>
	    <p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
	</footer>
</div>
</div>

<div class="modal fade" id="upload-modal" role="dialog" aria-labelledby="myLogin" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-open"></span>上传文件</h4>
			</div>
			<div class="modal-body" style="width: 400px; margin-left: 90px;">
				<form action="fileUpLoad" id="upload_form"  method="post" enctype="multipart/form-data">
					<div class="form-group">
                		<input name="articlename"  class="form-control" type="text" placeholder="请在这儿输入文件名" required style="padding-left: 30px; height: 42px; " />
    				</div>
    				<div class="form-group">
        				<input name="file" class="upload" type="file"  required style="border:1px solid #ccc;background:#fff;color:#000;padding:5px 15px;width:370px;" />
        			</div>
    			</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-success" form="upload_form">上传</button>
			</div>
		</div>
	</div>
</div>	
<div id="back-up" onclick="goToWhere(0)"
    style=" position: fixed; cursor: pointer; right: 90px; bottom: 160px;"><img src= "sources/pics/up.png" /></div>
<div id="back-up" onclick="goToWhere(1)"
     style="position: fixed; cursor: pointer; right: 90px; bottom: 50px;"><img src= "sources/pics/down.png" /></div>
<link href="sources/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="sources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>
<script src="sources/jquery-3.1.1/jquery-3.1.1.min.js"></script>
<script src="sources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>