<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Online View PDF</title>

<!-- end your code here -->

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="sources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">

	<!-- 可选的Bootstrap主题文件（一般不使用） -->
	<script src="sources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="sources/jquery-3.1.1/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="sources/jquery-3.1.1/jquery.media.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="sources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


	<script type="text/javascript">
		$(function() {
			$('a.media').media({
				width : 1100,
				height : 500
			});
		});
	</script>
	<script>
		/**
		 * 文本框根据输入内容自适应高度
		 * @param                {HTMLElement}        输入框元素
		 * @param                {Number}                设置光标与输入框保持的距离(默认0)
		 * @param                {Number}                设置最大高度(可选)
		 */
		var autoTextarea = function(elem, extra, maxHeight) {
			extra = extra || 0;
			var isFirefox = !!document.getBoxObjectFor
					|| 'mozInnerScreenX' in window, isOpera = !!window.opera
					&& !!window.opera.toString().indexOf('Opera'), addEvent = function(
					type, callback) {
				elem.addEventListener ? elem.addEventListener(type, callback,
						false) : elem.attachEvent('on' + type, callback);
			}, getStyle = elem.currentStyle ? function(name) {
				var val = elem.currentStyle[name];

				if (name === 'height' && val.search(/px/i) !== 1) {
					var rect = elem.getBoundingClientRect();
					return rect.bottom - rect.top
							- parseFloat(getStyle('paddingTop'))
							- parseFloat(getStyle('paddingBottom')) + 'px';
				}
				;

				return val;
			} : function(name) {
				return getComputedStyle(elem, null)[name];
			}, minHeight = parseFloat(getStyle('height'));

			elem.style.resize = 'none';

			var change = function() {
				var scrollTop, height, padding = 0, style = elem.style;

				if (elem._length === elem.value.length)
					return;
				elem._length = elem.value.length;

				if (!isFirefox && !isOpera) {
					padding = parseInt(getStyle('paddingTop'))
							+ parseInt(getStyle('paddingBottom'));
				}
				;
				scrollTop = document.body.scrollTop
						|| document.documentElement.scrollTop;

				elem.style.height = minHeight + 'px';
				if (elem.scrollHeight > minHeight) {
					if (maxHeight && elem.scrollHeight > maxHeight) {
						height = maxHeight - padding;
						style.overflowY = 'auto';
					} else {
						height = elem.scrollHeight - padding;
						style.overflowY = 'hidden';
					}
					;
					style.height = height + extra + 'px';
					scrollTop += parseInt(style.height) - elem.currHeight;
					document.body.scrollTop = scrollTop;
					document.documentElement.scrollTop = scrollTop;
					elem.currHeight = parseInt(style.height);
				}
				;
			};

			addEvent('propertychange', change);
			addEvent('input', change);
			addEvent('focus', change);
			change();
		};
	</script>
	<style>
#textarea {
	display: block;
	margin: 0 auto;
	overflow: hidden;
	font-size: 14px;
	width: 100%;
	height: 100%;
	line-height: 24px;
	padding: 2px;
}

textarea {
	outline: 0 none;
	border-color: rgba(82, 168, 236, 0.8);
	box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px
		rgba(82, 168, 236, 0.6);
}
</style>
	</head>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<p>
						</br> </br> </br> 
					</p>
				</div>
				<div class="col-md-12 column">
					<div class="col-md-12 column">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<h3></h3>
								
								<a class="media" href="<% out.print(request.getParameter("url"));%>">PDF</a>
							</div>
						</div>
						<div class="row clearfix">
							<div class="col-md-12 column">
								<h3>这里记录你的笔记</h3>
								<textarea id="textarea" placeholder="回复内容"></textarea>
								<script>
									var text = document
											.getElementById("textarea");
									autoTextarea(text);// 调用
								</script>

							</div>
						</div>
						<nav class="navbar navbar-default navbar-fixed-top"
							role="navigation">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span><span
									class="icon-bar"></span><span class="icon-bar"></span><span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href=personalCenter>阅读</a>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">

							<form action="search" class="navbar-form navbar-left"
								role="search">
								<div class="form-group">
									<input class="form-control" type="text" placeholder="搜索内容" />
								</div>
								<button type="submit" class="btn btn-default">开始搜索</button>
							</form>
							<ul class="nav navbar-nav navbar-right"
								style="padding-right: 10px;">

								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"><img src="sources/pics/Avatar.png"
										height="20" width="20" /><strong class="caret"></strong></a>
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
					</div>
				</div>
			</div>
			<hr>
				<footer>
				<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
				</footer>
	</body>
</html>
