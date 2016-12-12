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
<% String avatar = (String) session.getAttribute("avatar"); %>
<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg11.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>
	<% int i = 2; %>
    <% try { %>
	<% i = (int) session.getAttribute("i"); %>
	<% session.removeAttribute("i"); %>
	<% } catch (Exception e) { %>
	<% i=2; %>
	<% } %>
	<% int j = 2; %>
    <% try { %>
	<% j = (int) session.getAttribute("j"); %>
	<% session.removeAttribute("j"); %>
	<% } catch (Exception e) { %>
	<% j = 2; %>
	<% } %>
	
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<p><br><br><br><br></p>
				
			</div>
			 <%@ include file="nav.jsp" %>
		</div>
		<div class="row clearfix">
	
			
				<div class="col-md-2 column">
				<div class="panel panel-success" style="background-color: rgba(255,255,255,	 0.60);">
					<div class="panel-body">
						<ul class="nav nav-stacked">
							<li class="active"><a href="#panel-1" data-toggle="tab">修改密码</a></li>
							<li><a href="#panel-2" data-toggle="tab">更换头像</a></li>
							<li><a href="#panel-3" data-toggle="tab">修改信息</a></li>
							
							
						</ul>
					</div>
				</div>
			</div>
			
			<div class="col-md-10 column">
			<div class="tab-content">
			<div class="tab-pane fade in active" id="panel-1">
				<h1>修改我的密码</h1>
				<br>
				<form action="setting1" id="setting_form1" method="post">
					<div class="form-group">
					 	<label>旧密码</label><input name="oldpasswd" style="width:50%;background-color: rgba(255,255,255,	 0.60);" type="password" class="form-control" id="oldpasswd" />
					 	<span class=""></span>
					</div>
					<div class="form-group">
						<label>新密码</label>
						<input name="passwd" type="password" style="width:50%;background-color: rgba(255,255,255,	 0.60);" class="form-control" id="passwd" />
					 	<span class=""></span>
					</div>
					<div class="form-group">
						<label>新密码确认</label>
					 	<input class="form-control" style="width:50%;background-color: rgba(255,255,255,	 0.60);" name="passwd_confirm" type="password" id="passwd_confirm" />
					 	<span class=""></span>
					</div>
					<div class="modal-footer" style="border:none">
						<button type="submit"  id="submit1" style="width:30%;background-color: #84735F;color:#ffffff" class="btn " form="setting_form1">更改</button>
					</div>
					
				</form>
				</div>
				<div class="tab-pane fade" id="panel-2">
						<!-- 显示头像 -->
						<h1>当前头像</h1><br>	
						<div style="float:left;width:30%;">
						<img src="<%out.println(avatar); %>" style="" height="200" width="200" class="img-rounded" />
						</div>
						<div style="float:left;width:70%;">
						<form action="upload_avatar" id="setting_form3" method="post" enctype="multipart/form-data">
						<div class="form-group">
						<label>选择你喜欢的头像并上传</label>
					 	<input  name="file" id='file' class="upload" type="file" accept=".jpeg,.svg,.gif,.jpg,.png" style="width:70%;background-color: rgba(255,255,255,	 0.60);"  />
					 	
					</div>
					<div class="modal-footer"  style="border:none">
						<button type="submit" id="submit3"  class="btn " style="width:50%;background-color: #84735F;color:#ffffff" form="setting_form3">上传头像</button>
					</div>
					</form>
						</div>
						
					</div>
					<div class="tab-pane fade" id="panel-3">
					<h1>设置个人信息</h1>
					<br>
				<form action="setting2" id="setting_form2" method="post">
					<div class="form-group">
						<label>昵称</label>
					 	<input name="name" type="text" style="width:50%;background-color: rgba(255,255,255,	 0.60);" class="form-control" id="name" />
					 	<span class=""></span>
					</div>
					<div class="modal-footer"  style="border:none">
						<button type="submit" id="submit2"  class="btn " style="width:30%;background-color: #84735F;color:#ffffff" form="setting_form2">更改</button>
					</div>
					
				</form>
						
					</div>
					
				</div>
				<% if(i==1) {
					   		out.print("<div class=\"alert alert-success\"><button type=\"but" + "ton\" class=\"close\" data-dismiss=\"alert\">×</button>" + "<h4>提示!</h4> <strong>更改成功!</strong></div>");
					   }
					   else if(i==0) {
						 	out.print("<div class=\"alert alert-error\"><button type=\"but" + "ton\" class=\"close\" data-dismiss=\"alert\">×</button>" + "<h4>提示!</h4> <strong>更改失败，密码错误!</strong></div>");
					   }
					%>
					<% if(j==1) {
							out.print("<div class=\"alert alert-success\"><button type=\"but" + "ton\" class=\"close\" data-dismiss=\"alert\">×</button>" + "<h4>提示!</h4> <strong>更改成功!</strong></div>");
				   	   }
				   	   else if(i==0) {
					   		out.print("<div class=\"alert alert-error\"><button type=\"but" + "ton\" class=\"close\" data-dismiss=\"alert\">×</button>" + "<h4>提示!</h4> <strong>更改失败，密码错误!</strong></div>");
				   	   }
				 	%>
			</div>
		</div>
		
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
			$('#submit1').click(function() {
				
				if (passwdsetting && passwdConfirm) {
					$('#setting_form1').submit();
				}
				else {
					return false;
				}
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {
			var namesetting = false;
			//验证用户名
			$('input[name="name"]').focus(function() {
				$(this).next().text('用户名应大于2个字符').addClass('state2');}).blur(function() {
					if ($(this).val().length > 2 && $(this).val() != '') {
						$(this).next().text('输入成功').removeClass().addClass('state4');
						namesetting = true;
					}
					else {
						$(this).next().text('用户名应大于2个字符').removeClass().addClass('state3');
					}
				});
			//所有验证通过方可提交表单
			$('#submit2').click(function() {
				
				if (namesetting) {
					$('#setting_form2').submit();
				}
				else {
					return false;
				}
			});
		});
	</script>
	 <br><br><br><br><br><br><br><br><br><br>
	<%@ include file="bottom.jsp" %>
</body>
</html>







