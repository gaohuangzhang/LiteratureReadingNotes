<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="sources/kindeditor/themes/default/default.css" rel="stylesheet">
	<script src="sources/js/jquery-3.1.1.min.js"></script>
	<script src="sources/js/jquery.media.js"></script>
	<script src="sources/js/bootstrap.min.js"></script>
	<script charset="utf-8" src="sources/kindeditor/kindeditor-min.js"></script>
	<script charset="utf-8" src="sources/kindeditor/lang/zh_CN.js"></script>
 	<link href="sources/css/animate.css" rel="stylesheet" type="text/css">
    <script src="sources/js/jquery.sidr.js"></script>
    <link rel="stylesheet" href="sources/css/jquery.sidr.light.min.css">
  	<style>
		.city {
			margin: 5px;
			padding: 20px;
			width:100%;		
			background-color: #F9F9F9;
		} 
		.city1 {
			float: left;
			margin: 5px;
			padding: 5px;
			width:70%;
			border: 1px;		

		} 
		.editor{
			width:100%;
			height: 100%;	
		} 
	</style>
	<title>阅读PDF</title>
	<!-- pdf阅读器 -->
	<script type="text/javascript">
		if (window.innerWidth)
			winWidth = window.innerWidth;
		else if ((document.body) && (document.body.clientWidth))
			winWidth = document.body.clientWidth;
		if (window.innerHeight)
			winHeight = window.innerHeight;
		else if ((document.body) && (document.body.clientHeight))
			winHeight = document.body.clientHeight;
		if (winWidth > 1920) {
			winWidth *= 0.635;
			winHeight *= 0.8;
		}
		else if (winWidth === 1920) {
			winWidth *= 0.635;
			winHeight *= 0.8;
		}
		else {
			winWidth *= 0.635;
			winHeight *= 0.8;
		}
		$(function() {
			$('a.media').media({
				width : winWidth,
				height : winHeight
			});
		});
	</script>
	<!-- 文本编辑器 -->
	<script>
		var editor;
		
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="content"]', {
			allowFileManager : true,
			 allowImageUpload:true,
			 uploadJson:'sources/kindeditor/jsp/upload_json.jsp',
			 afterUpload: function(){this.sync();},
			 afterBlur: function(){this.sync();}, 
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});	
			K('input[name=getHtml]').click(function(e) {
				alert(editor.html());
			});
			K('input[name=clear]').click(function(e) {
				editor.html('');
			});
		});	
	</script>	
	<script>
		$(document).ready(function() {
   			 $('#right-menu').sidr({
		      name: 'sidr-right',
		      side: 'right',
		      source: ' #sidr'
		    });
		});
	</script>
	<!--<script >
		window.onbeforeunload = function(event) {
			alert(111);
			return confirm("确定退出吗");
		} 
	</script>-->
	<script type="text/javascript">
		function clickButton()
		{    
			var url = 'markReadStatus.action';
			var params = {
					id:eval(document.getElementById('arid')).value
			};
			jQuery.post(url, params, callbackFun, 'json');
		}
		function callbackFun(data)
		{
		   alert(data.result);
            }
    </script>	
    <script>
        function changeFrameHeight(){
            var ifm= document.getElementById("iframepage"); 
            ifm.height=document.documentElement.clientHeight * 0.8;
        }
        window.onresize=function(){  
             changeFrameHeight();  
        } 
        </script>
</head>
<body>
<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>
	<% String usermail = (String) session.getAttribute("usermail"); %>
	<% String username = (String) session.getAttribute("username"); %>
	<% String type = (String) session.getAttribute("type"); %>

	<!-- 侧边栏 -->
	<div class=" animated flash	" style="padding:10px;float:right;">
		<a id="right-menu" href="#sidr"><img src="sources/pics/menu.gif"/></a>
	</div>
	<div id="sidr" style="display: none;">
	<h2>内容选项</h2>
	<ul>
		<button type="submit" class="btn btn-link" form="note">保存文章笔记并且退出</button>
		<hr>
	</ul>
	<h2>快速入口</h2>
	<!-- 侧边栏选项 -->
	<ul>
	    <!-- 获取分享的id和文章名 -->
	    <%
			String articlename = request.getParameter("articlename");
			String id = request.getParameter("id");
		%>
	    <li><a href=toShare?articlename=<%out.print(articlename); %>&id=<%out.print(id); %>>分享这篇文章</a></li>
	    <li><a href=mainPage>返回主页</a></li>
	    <li><a href=personalCenter>返回个人中心</a></li>
		<li><a href=fileManage>内容管理</a></li>
		<li><a href=timeLine>时间线</a></li>
		<li><a href=settings>设置</a></li>
	</ul>
	 
	</div >
	<div class="container-fluid">
		<div class="row-fluid clearfix">
			<div class="row-fluid clearfix">
			
			</div>
			<div class="col-md-8 column">
				<!-- 标签栏 -->
				<div class="tabbable" id="tabs-960120">
					<ul class="nav nav-tabs ">
						<li>
							<a style="color:#000000;"><span class="glyphicon glyphicon-star-empty" > <b>标题：<% out.print(request.getParameter("articlename"));%></b></span></a>
						</li>
						<li class="active">
							<a href="#panel-1" data-toggle="tab"><span class="glyphicon glyphicon-book"> 阅读</span></a>
						</li>
						<li >
							<a href="#panel-3" data-toggle="tab"><span class="glyphicon glyphicon-list-alt"> 查看已有笔记</span></a>	
						</li>
						<li>
							<a type="button"  onclick="javascript:clickButton();" clientidmode="Static"><span class="glyphicon glyphicon-ok">  将内容标记为已精读</span></a>
						</li>
					</ul>
					<div class="tab-content ">
						<!-- 显示pdf -->
						<div class="tab-pane  fade in active" id="panel-1">
						<%if (type == null || type.equals("PDF")) {%>
							<a class="media" href="<% out.print(request.getParameter("url"));%>"></a>
						<% } else { %>	
						<iframe  frameborder="1"  src=<% out.print(request.getParameter("url"));%> 
						style="width:100%; margin:0; padding:0;" id="iframepage"  onload="changeFrameHeight()" >
						您的浏览器不支持嵌入式框架，或者当前配置为不显示嵌入式框架。</iframe>
						<%} %>				
						</div>
						
						<!-- 显示笔记 -->
						<% ArrayList<Map<String, String>> note = (ArrayList<Map<String, String>>) session.getAttribute("note");%>
						<div class="tab-pane " id="panel-3">
						<%for (int i = note.size() -1; i >= 0; --i) { %>
						
						<div class="city animated fadeInUp">
						<h2>
						[<%out.print(note.get(i).get("4")); %>]
						<%out.print(note.get(i).get("1")); %>
						</h2>
						<%out.print(note.get(i).get("3")); %>
						<br></br>
						<%out.print(note.get(i).get("2")); %>
						</div>
					   <%} %>	
					   <%if (note.size() == 0) {%>
					   <div class="city animated fadeInUp">
					   还没有为这篇文章添加过任何笔记。
					   </div>
					   <%} %>
						</div>
					</div>	
				</div>
				<!-- 顶部栏 -->
			</div>
			<div class="col-md-4 column">
			<h1><span class="glyphicon glyphicon-pencil" > 记录笔记</span></h1>
			<hr>
			<div class="panel panel-default" >
				<div class="panel-body">      			   
					<form action="saveAndLeave" id="note" method="post">
						<!-- 标题栏 -->
						<div class="form-group">
							<input type="text" name="notename" value="我的笔记" class="pull-right" placeholder="输入评论标题" style="width:60%;"/>
							<!-- 隐藏的文章id -->
							<input type='text' name="id" id="arid" class="pull-left" readonly style="width:5%;display:none;"  value=<%out.print(request.getAttribute("id")); %>></input>	
						</div >
						<br><br>
						<!-- 文本区域 -->
						<textarea id="texta" name="content" style="width:100%;height:300%;visibility:hidden;"></textarea>
						<br>
						<!-- 右下角按钮 -->
						<div class="btn-toolbar" role="toolbar" style="text-align:right;">
							<input type="button" name="getHtml" value="HTML" />
							<input type="button" name="clear" value="清空" />
							<input type="reset" name="reset" value="撤销" />
							<input type="submit" value="提交并退出"></input>
						</div>		
					</form>
				</div>		
			</div>
			<hr>
		</div>
	</div>
	<footer>
		<hr>
		<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
	</footer>
</div> 
</body> 
</html>
