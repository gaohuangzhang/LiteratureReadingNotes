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
<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg11.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>
	<% int i = 2; %>
    <% try { %>
	<% i = (int) session.getAttribute("i"); %>
	<% } catch (Exception e) { %>
	<% i=2; %>
	<% } %>
	<%@ include file="nav.jsp" %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<p><br><br><br><br></p>
			</div>
			
		</div>
		<div class="row clearfix">
			<div class="col-md-3 column">
				<div class="panel panel-success">
    			
    				<div class="panel-body">
       					<ul class="nav nav-stacked">
							<li><a href="setting1.jsp">修改密码</a></li>
							<li class="active"><a href="setting2.jsp">个人信息</a></li>
			
						</ul>
    				</div>
				</div>
				
			</div>
			<div class="col-md-9 column">
				<h1>设置个人信息</h1>
					<br>
				<form action="setting2" id="setting_form" method="post">
					<div class="form-group">
						<label>昵称</label>
					 	<input name="name" type="text" class="form-control" id="name" />
					 	<span class=""></span>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn" form="setting_form">更改</button>
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
			var namesetting = false;
			//验证用户名
			$('input[name="name"]').focus(function() {
				$(this).next().text('用户名应大于3个字符').addClass('state2');}).blur(function() {
					if ($(this).val().length > 3 && $(this).val() != '') {
						$(this).next().text('输入成功').removeClass().addClass('state4');
						namesetting = true;
					}
					else {
						$(this).next().text('用户名应大于3个字符').removeClass().addClass('state3');
					}
				});
			//所有验证通过方可提交表单
			$('.submit').click(function() {
				if (namesetting) {
					$('form').submit();
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







