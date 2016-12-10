<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>nav</title>
    <script>
    $(function(){
        var winHeight = $(document).scrollTop();
        var last = 0;

        $(window).scroll(function() {

            var scrollY = $(document).scrollTop();// 获取垂直滚动的距离，即滚动了多少

            if (scrollY > last){ //如果滚动距离大于550px则隐藏，否则删除隐藏类
                $('#navbars').addClass('animated fadeOut');
                last = scrollY;
            }
            else {

                $('#navbars').removeClass('animated fadeOut');

                last = scrollY;
            }
        });
    });
    function On(value)
    {

        $('#'+value).addClass('G');

    }
    function Out(value)
    {
         $('#'+value).removeClass('G');
    }
</script>
<style type="text/css">
	.G {
			background-color: #6BB50B;
		}
		nav{
		font-family: "Microsoft YaHei", "Arial", "Times Roman", "Courier", "Verdana", "Century Gothic";
		}
		
</style>
</head>
<body>
<%String avatar_nav = null; %>
<%try { %>
	<% avatar_nav = (String) session.getAttribute("avatar"); %>
	<%} catch(Exception e) {}%>
    <div id='navbars' style="font-size: 16px;">
      <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" style="background: rgba(113, 93, 68, 0.85); border: none;" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 	<span class="sr-only">GHZ</span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 </button> 
					 <a class="navbar-brand" href="#">读而思之</a>
				</div>
				<div class="collapse navbar-collapse"  bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li  id='person' onMouseMove="On(this.id)" onmouseout="Out(this.id)">
							<a href=personalCenter style="color: #ffffff;">个人中心</a>
						</li  >
						<li id='main' onMouseMove="On(this.id)" onmouseout="Out(this.id)">
							<a href=mainPage style="color: #ffffff;">我的主页</a>
						</li>
						<li  id='things' onMouseMove="On(this.id)" onmouseout="Out(this.id)">
							<a href=fileManage style="color: #ffffff;">内容管理</a>
						</li>
						<li  id='memory' onMouseMove="On(this.id)" onmouseout="Out(this.id)">
							<a href=timeLine style="color: #ffffff;">最佳回忆</a>
						</li>
						<li id='search' onMouseMove="On(this.id)" onmouseout="Out(this.id)">
							<a href=search style="color: #ffffff;">站内检索</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right" style="padding-right:15px;">
					
						
						<li class="dropdown" >
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%out.print(avatar_nav); %>" height="20" width="20" onMouseMove="this.className='animated  pulse'" onmouseout="this.className=''"/></a>
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

	</body>
</html>