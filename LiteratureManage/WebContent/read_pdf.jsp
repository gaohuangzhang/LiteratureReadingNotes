<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body style="background:#e8e8e8;">
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
				<h3 class="text-center">			
					<% out.print(request.getParameter("articlename"));%>
				</h3>
				<!-- 标签栏 -->
				<div class="tabbable" id="tabs-960120">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#panel-921674" data-toggle="tab">阅读</a>
						</li>
						<li>
							<a href="#panel-666652" data-toggle="tab">记录笔记</a>
						</li>
					</ul>
					<div class="tab-content">
						<!-- 显示pdf -->
						<div class="tab-pane fade in active" id="panel-921674">
							<a class="media" href="<% out.print(request.getParameter("url"));%>"></a>						
						</div>
						<!-- 显示输入框和文本编辑器 -->
						<div class="tab-pane fade" id="panel-666652">
							<div class="panel panel-default">
								<div class="panel-body">      			   
									<form>
										<!-- 标题栏 -->
										<div class="form-group">
											<input type="text" class="form-control" placeholder="输入评论标题" style="background-color:#C7EDCC;"/>
										</div >
										<!-- 文本区域 -->
										<textarea name="content" style="width:100%;height:500px;visibility:hidden;">KindEditor</textarea>
										<br>
										<!-- 右下角按钮 -->
										<div class="btn-toolbar" role="toolbar" style="text-align:right;">
											<input type="button" name="getHtml" value="取得HTML" />
											<input type="button" name="clear" value="清空内容" />
											<input type="reset" name="reset" value="Reset" />
										</div>		
									</form>
    							</div>		
							</div>
						</div>
					</div>	
				</div>
				<!-- 顶部栏 -->
				<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background:#F8F8F8">
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
			</div>
		</div>
		<hr style="height:10px;border:none;border-top:1px groove #000000;" />
		<footer>
			<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
		</footer>
	</div>
</body>
</html>
