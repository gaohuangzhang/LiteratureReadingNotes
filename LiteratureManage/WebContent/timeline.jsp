<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
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
								<input class="form-control" type="text" placeholder="搜索内容"/>
							</div>
							<button type="submit" class="btn btn-default">开始搜索</button>
						</form>
						<ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="sources/pics/Avatar.png" height="20" width="20" /><strong class="caret"></strong></a>
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
	</div>
	<div class="modal-shiftfix">
    	<div class="container-fluid main-content">
        	<div class="page-title">
          		<h1>时间轴</h1>
        	</div>
        	<ul class="timeline animated">
          		<li>
            		<div class="timeline-time">
              			<strong>11.9</strong>下午 4:53
            		</div>
            		<div class="timeline-icon"></div>
            		<div class="timeline-content">
              			<h2>上传了233.pdf</h2>
              			<button class="btn btn-info" href="#">详细信息 >></button>
            		</div>
          		</li>
          		<li>
            		<div class="timeline-time">
              			<strong>11.9</strong>下午 6:14
            		</div>
            		<div class="timeline-icon">
              			<div class="bg-warning">
                			<i class="icon-quote-right"></i>
              			</div>
            		</div>
            		<div class="timeline-content">
        				<h2>与他人分享了233.pdf</h2>
        				<button class="btn btn-info" href="#">详细信息 >></button>
            		</div>
          		</li>
          		<li>
            		<div class="timeline-time">
              			<strong>11.9</strong>上午 9:00
            		</div>
            		<div class="timeline-icon">
              			<div class="bg-info">
                			<i class="icon-camera"></i>
              			</div>
            		</div>
            		<div class="timeline-content">
   						<h2>评论了用户dongchangzhang关于233.pdf的笔记</h2>
   						<button class="btn btn-info" href="#">详细信息 >></button>
            		</div>
          		</li>
          		<li>
            		<div class="timeline-time">
              			<strong>11.10</strong>上午 10:00
            		</div>
            		<div class="timeline-icon">
              			<div class="bg-info">
                			<i class="icon-camera"></i>
              			</div>
            		</div>
            		<div class="timeline-content">
   						<h2>评论了用户dongchangzhang关于233.pdf的笔记</h2>
   						<p>2333333333333333333333333333333333333333333333333333333</p>
   						<button class="btn btn-info" href="#">详细信息 >></button>
            		</div>
          		</li>
          		<li>
            		<div class="timeline-time">
              			<strong>11.9</strong>上午 9:00
            		</div>
            		<div class="timeline-icon">
              			<div class="bg-info">
                			<i class="icon-camera"></i>
              			</div>
            		</div>
            		<div class="timeline-content img">
   						<h2>评论了用户dongchangzhang关于233.pdf的笔记</h2>
   						<img src="sources/pics/1.jpg" height=100% width=100%>
   						<button class="btn btn-info" href="#">详细信息 >></button>
            		</div>
          		</li>
        	</ul>
      	</div>
    </div>
    <link href="sources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  	<link href="sources/css/bootstrap.css" rel="stylesheet" type="text/css">
  	<link href="sources/css/custom.css" rel="stylesheet" type="text/css">
    <script src="sources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery-ui.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="sources/js/fullcalendar.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.easy-pie-chart.js" type="text/javascript"></script>
    <script src="sources/js/jquery.isotope.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.fancybox.pack.js" type="text/javascript"></script>
    <script src="sources/js/select2.js" type="text/javascript"></script>
    <script src="sources/js/jquery.inputmask.min.js" type="text/javascript"></script>
    <script src="sources/js/jquery.validate.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap-fileupload.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap-timepicker.js" type="text/javascript"></script>
    <script src="sources/js/bootstrap-colorpicker.js" type="text/javascript"></script>
    <script src="sources/js/daterange-picker.js" type="text/javascript"></script>
    <script src="sources/js/date.js" type="text/javascript"></script>
    <script src="sources/js/fitvids.js" type="text/javascript"></script>
    <script src="sources/js/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="sources/js/main.js" type="text/javascript"></script>
    <script src="sources/js/modernizr.custom.js" type="text/javascript"></script>
</body>
</html>