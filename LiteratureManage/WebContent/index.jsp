<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="sources/css/animate2.css" rel="stylesheet">
	<link href="sources/css/icomoon.css" rel="stylesheet"> 
	<link href="sources/css/themify-icons.css" rel="stylesheet">
	<link href="sources/css/bootstrap.css" rel="stylesheet">
	<link href="sources/css/magnific-popup.css" rel="stylesheet">
	<link href="sources/css/owl.carousel.min.css" rel="stylesheet">
	<link href="sources/css/owl.theme.default.min.css" rel="stylesheet">
	<link href="sources/css/style.css" rel="stylesheet">
	<link href="sources/css/toastr.css" rel="stylesheet">
	<script src="sources/js/modernizr-2.6.2.min.js"></script>
	<script src="sources/js/jquery.min.js"></script>
	<script src="sources/js/jquery-3.1.1.min.js"></script>
	<script src="sources/js/jquery.easing.1.3.js"></script>
	<script src="sources/js/bootstrap.min.js"></script>
	<script src="sources/js/jquery.waypoints.min.js"></script>
	<script src="sources/js/owl.carousel.min.js"></script>
	<script src="sources/js/jquery.countTo.js"></script>
	<script src="sources/js/jquery.magnific-popup.min.js"></script>
	<script src="sources/js/magnific-popup-options.js"></script>
	<script src="sources/js/main2.js"></script>
	<script src="sources/js/messages_zh.js"></script>
	<script src="sources/js/toastr.js"></script>
	<script src="sources/js/jquery.validate.js"></script>
	<script type="text/javascript">
		var VALID;
		$().ready(function() {
	        $("#signup_form").validate({
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
                     		dataFilter: function(data) { 
                     			var json = eval("(" + data + ")");
                                if (json.valid == true) {
                                	VALID = true;
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
		function submit() {
			$.ajax({
				type: "post",
				url: "signup.action",
				data: {
					"name": eval(document.getElementById('name')).value,
					"mail": eval(document.getElementById('mail')).value,
					"passwd": eval(document.getElementById('passwd')).value,
					"valid": VALID
				},
				dataType: "json",
				success: function(data) {
					if (data.correct)
						toastr.success("注册成功");
					else
						toastr.error("注册失败");
					$('#signup-modal').modal('toggle');
				}
			});
		}
	</script>
	<style>
		.error {
            color: red;
        }
        .valid {
            color: green;
        }
        .footer {
                color: #777;
                padding: 19px 0;
                background-color: rgba(41, 54, 89, 0.85);
                position: absolute;
                bottom: 0;
                width: 100%;
                height: 200px;
                font-family: "Microsoft YaHei", "Arial", "Times Roman", "Courier", "Verdana", "Century Gothic";
        }
    </style>
	<title>LiteratureManager Welcome</title>
</head>
<body>
	<div class="gtco-loader" style="display:none;"></div>
	<div id="page">
		<a href="#" class="js-gtco-nav-toggle gtco-nav-toggle gtco-nav-white"><i></i></a>
		<div id="gtco-offcanvas">
			<ul>
				<li class="active"><a href="#">主页</a></li>
				<li class="offcanvas-has-dropdown">关于
					<ul class="dropdown">
						<li><a href="about.jsp">帮助</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">
				<div class="row">
					<div class="col-sm-4 col-xs-12">
						<div id="gtco-logo">
							<a href="#">读而思之<em>.</em></a>
						</div>
					</div>
					<div class="col-xs-8 text-right menu-1">
						<ul>
							<li class="active"><a href="#">主页</a></li>
							<li class="has-dropdown">
								<a href="#">帮助</a>
								<ul class="dropdown" style="display: none;">
									<li><a href="about.jsp">关于</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<header id="gtco-header" class="gtco-cover" role="banner" style="background-image:url(sources/pics/bg11.jpg);">
			<div class="overlay"></div>
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<h1 class="animate-box fadeInUp animated-fast" data-animate-effect="fadeInUp">文献阅读笔记</h1>
								<h2 class="animate-box fadeInUp animated-fast" data-animate-effect="fadeInUp">为用户创造更好的文献管理</h2>
								<p class="animate-box fadeInUp animated-fast" data-animate-effect="fadeInUp">
									<a id="login" href="#login-modal" data-toggle="modal" class="btn btn-white btn-lg btn-outline">登录</a>
									<a id="signup" href="#signup-modal" data-toggle="modal" class="btn btn-white btn-lg btn-outline">注册</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div id="gtco-features-3">
			<div class="gtco-container">
				<div class="gtco-flex">
					<div class="feature feature-1 animate-box fadeInUp animated-fast" data-animate-effect="fadeInUp">
						<div class="feature-inner">
							<span class="icon"><i class="ti-search"></i></span>
							<h3>阅读 & 评论</h3>
							<p>就像其他同类网站做的那样，阅读文章，发表评论</p>
							<p><a href="#" class="btn btn-white btn-outline">Learn More</a></p>
						</div>
					</div>
					<div class="feature feature-2 animate-box fadeInUp animated-fast" data-animate-effect="fadeInUp">
						<div class="feature-inner">
							<span class="icon"><i class="ti-announcement"></i></span>
							<h3>分享 & 下载</h3>
							<p>与他人分享，下载你感兴趣或对你有帮助的</p>
							<p><a href="#" class="btn btn-white btn-outline">Learn More</a></p>
						</div>
					</div>
					<div class="feature feature-3 animate-box fadeInUp animated-fast" data-animate-effect="fadeInUp">
						<div class="feature-inner">
							<span class="icon"><i class="ti-timer"></i></span>
							<h3>创建你自己的树</h3>
							<p>将意义非凡的痕迹记录在这儿</p>
							<p><a href="#" class="btn btn-white btn-outline">Learn More</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer id="gtco-footer" role="contentinfo" class="footer">
			<div class="gtco-container">
				<div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <a href="https://github.com/gaohuangzhang">关注我们</a>
                                <a href="mailto:dongchangzhang@gmail.com">联系我们</a>
                                <br><hr style="height:1px;border:none;border-top:1px solid #555555;" /> (C) TEAM 高文成 黄沛 张东昌 @2016
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</footer>
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
					<form id="signup_form" method="post">
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
					<button type="submit" id="signup_button" class="btn btn-primary" onclick="submit();">注册</button>
				</div>
			</div>
		</div>
    </div>
	<div class="gototop js-top active">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
</body>
</html>







