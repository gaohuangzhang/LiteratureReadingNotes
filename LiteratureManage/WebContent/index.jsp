<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="sources/css/toastr.css" rel="stylesheet">
	<link href="sources/css/animate.css" rel="stylesheet">
	<script src="sources/js/messages_zh.js"></script>
	<script src="sources/js/jquery-3.1.1.min.js"></script>
	<script src="sources/js/toastr.js"></script>
	<script src="sources/js/bootstrap.min.js"></script>
	<script src="sources/js/jquery.validate.js"></script>
	<script type="text/javascript">
		$().ready(function() {
	        $("#signup_form").validate({
	        	onsubmit: false,
            	success: "valid",
             	rules: {
                	name: {
                    	required: true,
                     	minlength: 1
                 	},
                 	mail: {
                     	required: true,
                     	email: true,
                     	remote: {
                     		url: "EmailValidate.action",
                     		type: "post",
                     		cache: false,
                     		data: {
                     			mail: function() {
                     				return $("#mail").val();
                     			}
                     		},
                     		dataType: "json",
                     		dataFilter: function(data, type) {  
                                if (data == "true") {  
                                    return true;  
                                }
                                else {  
                                    return false;  
                                }  
                            }
                     	}
                 	},
                 	passwd: {
                     	required: true,
                     	minlength: 6,
                     	maxlength: 20
                 	},
                 	passwd_confirm: {
                     	required: true,
                     	equalTo: "#passwd"
                 	}
             	},
		        messages: {
                 	name: {
				    	required: "请输入用户名",
				        minlength: "不能少于1个字符"
			        },
                 	mail: {
                     	required: "请输入邮箱",
                     	remote: "该邮箱已经存在"
                 	},
                 	passwd: {
                     	required: "请输入密码",
                     	minlength: "不能少于6个字符",
                     	maxlength: "不能大于20个字符"
                 	},
                 	passwd_confirm: {
                    	required: "必需字段",
                     	equalTo: "请输入相同的密码"
                 	}
		        }
	       	});
     	});
		$('#signup_button').click(function () {
            toastr.success("注册成功");
        });
	</script>
	<style>
		.error {
            color: red;
        }
        .valid {
            color: green;
        }
        .W{
			background-color: #ffffff;
		}
		.G {
			background-color:#6BB50B;
		}
	</style>
	<title>LiteratureManager Welcome</title>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" style="background:#036564;border:none" role="navigation">
					<div class="navbar-header">
					 	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="home-navbar">
					 		<span class="sr-only">Toggle navigation</span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 	</button> 
					 	<a class="navbar-brand" href="#" style="padding-left: 20px; color: #ffffff;">主页</a>
					</div>
					<div class="collapse navbar-collapse" id="home-navbar">
						<ul class="nav navbar-nav navbar-right" style="padding-right: 10px;">
							<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
								<a id="login" href="#login-modal" role="button" class="btn" data-toggle="modal" style="color:#ffffff;">登录</a>
							</li>
							<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
								<a id="signup" href="#signup-modal" role="button" class="btn" data-toggle="modal" style="color:#ffffff;">注册</a>
							</li>
							<li class="dropdown">
							 	<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:#ffffff;">帮助<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href=about>关于</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<div><br><br><br><br></div>
	<div class="carousel slide" id="carousel-345074" data-ride="carousel">
		<ol class="carousel-indicators">
			<li class="active" data-slide-to="0" data-target="#carousel-345074"></li>
			<li data-slide-to="1" data-target="#carousel-345074"></li>
			<li data-slide-to="2" data-target="#carousel-345074"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img alt="" src="sources/pics/1.jpg"/>
				<div class="carousel-caption">
					<h4>阅读 & 评论</h4>
					<p>就像其他同类网站做的那样，阅读文章，发表评论</p>
				</div>
			</div>
			<div class="item">
				<img alt="" src="sources/pics/2.jpg"/>
				<div class="carousel-caption">
					<h4>分享 & 下载</h4>
					<p>与他人分享，下载你感兴趣或对你有帮助的</p>
				</div>
			</div>
			<div class="item">
				<img alt="" src="sources/pics/3.jpg"/>
				<div class="carousel-caption">
					<h4>创建你自己的树</h4>
					<p>将意义非凡的痕迹记录在这儿</p>
				</div>
			</div>
		</div> 
		<a class="left carousel-control" href="#carousel-345074" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
		<a class="right carousel-control" href="#carousel-345074" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	</div>
	<div><br><br><br></div>
	<div class="row">
		<div class="col-md-4">
			<div class="thumbnail">
				<img alt="300x200" src="sources/pics/1.jpg" />
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					<p>
						<a class="btn btn-primary" href="#">Action</a> 
						<a class="btn" href="#">Action</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<img alt="300x200" src="sources/pics/2.jpg" />
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					<p>
						<a class="btn btn-primary" href="#">Action</a> 
						<a class="btn" href="#">Action</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<img alt="300x200" src="sources/pics/3.jpg" />
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					<p>
						<a class="btn btn-primary" href="#">Action</a> 
						<a class="btn" href="#">Action</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 页脚 -->
	<hr>
	<div class="container site-footer-container">
		<div class="site-footer" role="contentinfo">
			<ul class="site-footer-links">
				<li>&copy;2016 LiteratureManager</li>
			</ul>
		</div>
	</div>
	<!-- 登录界面 -->
	<div class="modal fade" id="login-modal" role="dialog" aria-labelledby="myLogin" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">登录</h4>
				</div>
				<div class="modal-body" style="width: 400px; margin-left: 90px;">
					<form action="signIn" id="login_form" method="post">
						<div class="form-group">
							<input name="mail" class="form-control" type="email" placeholder="请在这儿输入登录邮箱" required="required" style="padding-left: 30px; height: 42px;" />
						</div>
						<div class="form-group">
							<input name="passwd" class="form-control" type="password" placeholder="请在这儿输入密码" required="required" style="padding-left: 30px; height: 42px;" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" form="login_form">登录</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 注册界面 -->
	<div class="modal fade" id="signup-modal" role="dialog" aria-labelledby="mySignUp" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">注册</h4>
				</div>
				<div class="modal-body" style="width: 400px; margin-left: 90px;">
					<form action="signUp" id="signup_form" method="post">
						<div class="form-group">
							<input id="name" name="name" class="form-control" type="text" placeholder="请在这儿输入用户名" style="padding-left: 30px; height: 42px;" />
						</div>
						<div class="form-group">
							<input id="mail" name="mail" class="form-control" type="text" placeholder="请在这儿输入注册邮箱" style="padding-left: 30px; height: 42px;" />
						</div>
						<div class="form-group">
							<input id="passwd" name="passwd" class="form-control" type="password" placeholder="请在这儿输入密码" style="padding-left: 30px; height: 42px;" />
						</div>
						<div class="form-group">
							<input id="passwd_confirm" name="passwd_confirm" class="form-control" type="password" placeholder="请再次输入密码" style="padding-left: 30px; height: 42px;" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="signup_button" type="submit" class="btn btn-primary" form="signup_form">注册</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>







