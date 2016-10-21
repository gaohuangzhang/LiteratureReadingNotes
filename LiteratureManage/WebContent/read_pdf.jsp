<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <script src="sources/js/jquery.sidr.min.js"></script>
    <link rel="stylesheet" href="sources/css/jquery.sidr.light.min.css">
  <style>
		.city {
			float: left;
			margin: 5px;
			padding: 20px;
			width:100%;		
			background-color: #F9F9F9;
		} 
	</style>
	<title>阅读PDF</title>
	<!-- pdf阅读器 -->
	<script type="text/javascript">
		$(function() {
			$('a.media').media({
				width : 1150,
				height : 700
			});
		});
	</script>
	<!-- 文本编辑器 -->
	<script>
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="content"]', {
			allowFileManager : true,
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
<script >
window.onbeforeunload = function(event) {
	alert(111);
	return confirm("确定退出吗");
	} 
</script>
</head>
<body style="background:#e8e8e8;">

 <div class=" animated flash	" style="padding:10px;float:right;">
<a id="right-menu" href="#sidr"><img src="sources/pics/menu.gif"/></a>
</div>
<div id="sidr" style="display: none;">
  <!-- Your content -->
  <ul>
    <li > &nbsp;&nbsp;&nbsp;操作</li>
    <li>
       <button type="submit" class="btn btn-sm btn-block" form="note">####保存文章笔记并且退出####</button>
    </li>
    <li><a href=mainPage>返回主页</a></li>
    <li><a href=personalCenter>返回个人中心</a></li>
	<li><a href=fileManage>内容管理</a></li>
	<li><a href=timeLine>时间线</a></li>
	<li><a href=settings>设置</a></li>
	
	
  </ul>
</div>
	<!-- style="background:#C7EDCC" -->
	<div class="container">
		<div class="row clearfix">
			<div class="row clearfix">
				<!-- 防止遮盖 -->
				<div class="col-md-12 column">
					<p><br><br></p>
				</div>
			</div>
			<div class="col-md-12 column">
				<!-- 文件名 -->
				<h5 class="text-center">			
					<% out.print(request.getParameter("articlename"));%>
				</h5>
				<!-- 标签栏 -->
				<div class="tabbable" id="tabs-960120">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#panel-1" data-toggle="tab">阅读</a>
						</li>
						<li>
							<a href="#panel-2" data-toggle="tab">记录笔记</a>
						</li>
						<li>
							<a href="#panel-3" data-toggle="tab">已有笔记</a>
						</li>
					</ul>
					<div class="tab-content ">
						<!-- 显示pdf -->
						<div class="tab-pane  fade in active" id="panel-1">
							<a class="media" href="<% out.print(request.getParameter("url"));%>"></a>						
						</div>
						<!-- 显示输入框和文本编辑器 -->
						<div class="tab-pane  animated fadeInUp" id="panel-2">
							<div class="panel panel-default">
								<div class="panel-body">      			   
									<form action="saveAndLeave" id="note" method="post">
										<!-- 标题栏 -->
										<div class="form-group">
										<input type="text" name="notename" value="我的笔记" class="pull-right" placeholder="输入评论标题" style="width:60%;"/>
										<input type='text' name="id" class="pull-left" readonly style="width:5%;" value=<%out.print(request.getAttribute("id")); %>></input>
											
										</div >
										<br><br>
										<!-- 文本区域 -->
										
										<textarea name="content" style="width:100%;height:500px;visibility:hidden;">KindEditor</textarea>
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
						</div>
						<% ArrayList<Map<String, String>> note = (ArrayList<Map<String, String>>) session.getAttribute("note");%>
						<div class="tab-pane " id="panel-3">
						<%for (int i = note.size() -1; i >= 0; --i) { %>
						
						<div class="city animated fadeInUp">
						<h2>
						<%out.print(note.get(i).get("1")); %>
						</h2>
						<%out.print(note.get(i).get("3")); %>
						<br></br>
						<%out.print(note.get(i).get("2")); %>
						</div>
					   <%} %>	
						</div>
					</div>	
				</div>
				<!-- 顶部栏 -->
				
			</div>
		</div>
		<hr style="height:10px;border:none;border-top:1px groove #000000;" />
		<footer>
			<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
		</footer>
	</div>
</body>
</html>
