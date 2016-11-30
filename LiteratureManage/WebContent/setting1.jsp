<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LiteratureManager Welcome</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <link href="sources/css/animate.css" rel="stylesheet" type="text/css">
	  <style>
.W{
		background-color: #ffffff;
		}
		.G {
		background-color:#6BB50B;
		}
	</style>
</head>
<body>
	<% int i = 2; %>
    <% try { %>
	<% i = (int) session.getAttribute("i"); %>
	<% } catch (Exception e) { %>
	<% i=2; %>
	<% } %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<p><br><br><br><br></p>
			</div>
			<div class="col-md-12 column">
			<nav class="navbar navbar-default  navbar-inverse navbar-fixed-top" style="background:#036564;border:none" role="navigation">
				<div class="navbar-header" >
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">GHZ</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">读而思之</a>
				</div>
				
				<div class="collapse navbar-collapse" style="font-size: 16px;" bs-example-navbar-collapse-1">
					<ul  class="nav navbar-nav">
						<li  onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a  href=personalCenter style="color:#ffffff;font-size: 16px;">个人中心</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=mainPage  style="color:#ffffff;font-size: 16px;">我的主页</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=fileManage style="color:#ffffff;font-size: 16px;">内容管理</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
							 <a href=timeLine style="color:#ffffff;font-size: 16px;">最佳回忆</a>
						</li>
						<li onMouseMove="this.className='G animated  swing'" onmouseout="this.className=''">
						<a href=search style="color:#ffffff;font-size: 16px;">站内检索</a>
						</li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right" style="padding-right:15px;">
					
						
						<li class="dropdown" >
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="sources/pics/Avatar.png" height="20" width="20" onMouseMove="this.className='animated  pulse'" onmouseout="this.className=''"/></a>
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
		<div class="row clearfix">
			<div class="col-md-3 column">
				<div class="panel panel-success">
    			
    				<div class="panel-body">
       					<ul class="nav  nav-stacked">
							<li class="active"><a href="setting1.jsp">修改密码</a></li>
							<li><a href="setting2.jsp">个人信息</a></li>
							
						</ul>
    				</div>
				</div>
				
			</div>
			<div class="col-md-9 column">
				<h1>修改我的密码</h1>
				<hr>
				<form action="setting1" id="setting_form" method="post">
					<div class="form-group">
					 	<label>旧密码</label><input name="oldpasswd" type="password" class="form-control" id="oldpasswd" />
					 	<span class=""></span>
					</div>
					<div class="form-group">
						<label>新密码</label>
						<input name="passwd" type="password" class="form-control" id="passwd" />
					 	<span class=""></span>
					</div>
					<div class="form-group">
						<label>新密码确认</label>
					 	<input class="form-control" name="passwd_confirm" type="password" id="passwd_confirm" />
					 	<span class=""></span>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn " form="setting_form">更改</button>
					</div>
					<% if(i==1) {
					   		out.print("<div class=\"alert alert-success\"><button type=\"but" + "ton\" class=\"close\" data-dismiss=\"alert\">×</button>" + "<h4>提示!</h4> <strong>更改成功!</strong></div>");
					   }
					   else if(i==0) {
						 	out.print("<div class=\"alert alert-error\"><button type=\"but" + "ton\" class=\"close\" data-dismiss=\"alert\">×</button>" + "<h4>提示!</h4> <strong>更改失败，密码错误!</strong></div>");
					   }
					%>
				</form>
			</div>
		</div>
		<hr>
		<footer>
					<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
				</footer>
	</div>
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/jquery-3.1.1.min.js"></script>
	<script src="sources/js/bootstrap.min.js"></script>
	<style>
		.state2 {
			color: #000;
		}
		.state3 {
			color: red;
		}
		.state4 {
			color: green;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			var passwdConfirm = false;
			var passwdsetting = false;
			//验证旧密码
			
			$('input[name="passwd"]').focus(function() {
				$(this).next().text('密码应大于等于6位').addClass('state2');}).blur(function() {
					if ($(this).val().length >= 6 && $(this).val() != '') {
						$(this).next().text('输入成功').removeClass().addClass('state4');
						passwdsetting = true;
					}
					else {
						$(this).next().text('密码应大于等于6位').removeClass().addClass('state3');
					}
				});
			//验证确认密码
			$('input[name="passwd_confirm"]').focus(function() {
				$(this).next().text('请输入相同的密码').addClass('state2');}).blur(function() {
					if ($(this).val() != '' && $(this).value == $('input[name="passwd"]').value) {
						passwdConfirm = true;
						$(this).next().text('输入成功').removeClass().addClass('state4');
					}
					else {
						$(this).next().text('请输入相同的密码').removeClass().addClass('state3');
					}
				});
			//所有验证通过方可提交表单
			$('.submit').click(function() {
				if (passwdsetting && passwdConfirm) {
					$('form').submit();
				}
				else {
					return false;
				}
			});
		});
	</script>
</body>
</html>







