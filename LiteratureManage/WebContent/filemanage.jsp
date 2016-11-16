<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LiteratureManager Welcome</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/jquery-3.1.1.min.js"></script>
	<script src="sources/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="sources/css/demo.css" type="text/css">
    <link rel="stylesheet" href="sources/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="sources/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="sources/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="sources/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="sources/js/jquery.ztree.exedit.js"></script>
    <link href="sources/css/animate.css" rel="stylesheet" type="text/css">
	<SCRIPT type="text/javascript">
		//<!--
		var setting1 = {
				view: {
	                addHoverDom: addHoverDom,
	                removeHoverDom: removeHoverDom,
	                selectedMulti: false
	            },
	            check: {
	        		enable: true,
	        		chkStyle: "checkbox",
	        		chkboxType: { "Y": "s", "N": "s" }
	        	},
	            edit: {
	                enable: true,
	                editNameSelectAll: true,
	                showRemoveBtn: true,
	                showRenameBtn: true
	            },
	            data: {
	                simpleData: {
	                    enable: true
	                }
	            },
	            callback: {
	                // 调用方法 后面是函数名 到下面找
	                beforeDrag: beforeDrag,
	                beforeDrop: beforeDrop,
	                beforeEditName: beforeEditName,
	                beforeRemove: beforeRemove,
	                beforeRename: beforeRename,
	                beforeClick: beforeClick,
	                onRemove: onRemove,
	                onRename: onRename
	            }
		}
		var setting2 = {
			edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		}
        var log, className = "dark";
        function beforeDrag(treeId, treeNodes) {
            return true;
        }
        function beforeEditName(treeId, treeNode) {
            className = (className === "dark" ? "" : "dark");
            showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            setTimeout(function() {
                if (confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？")) {
                    setTimeout(function() {
                        zTree.editName(treeNode);
                    }, 0);
                }
            }, 0);
            return false;
        }
        function beforeRemove(treeId, treeNode) {
            className = (className === "dark" ? "" : "dark");
            showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.selectNode(treeNode);
            return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
        }
        function onRemove(e, treeId, treeNode) {
            showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        }
        function beforeRename(treeId, treeNode, newName, isCancel) {
            className = (className === "dark" ? "" : "dark");
            showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
            if (newName.length == 0) {
                setTimeout(function() {
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.cancelEditName();
                    alert("节点名称不能为空.");
                }, 0);
                return false;
            }
            return true;
        }
        // 点击时候 执行的动作 现在是打开链接
        function beforeClick(treeId, treeNode) {
            window.open(treeNode.url);
            return true;
        }
        function onRename(e, treeId, treeNode, isCancel) {
            showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
        }
        function showRemoveBtn(treeId, treeNode) {
            return !treeNode.isFirstNode;
        }
        function showRenameBtn(treeId, treeNode) {
            return !treeNode.isLastNode;
        }
        function showLog(str) {
            if (!log) log = $("#log");
            log.append("<li class='" + className + "'>" + str + "</li>");
            if (log.children("li").length > 8) {
                log.get(0).removeChild(log.children("li")[0]);
            }
        }
        function getTime() {
            var now = new Date(),
                h = now.getHours(),
                m = now.getMinutes(),
                s = now.getSeconds(),
                ms = now.getMilliseconds();
            return (h + ":" + m + ":" + s + " " + ms);
        }
        var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			var sObj = $("#" + treeNode.tId + "_span");
			if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
			var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
			sObj.after(addStr);
			var btn = $("#addBtn_"+treeNode.tId);
			if (btn) btn.bind("click", function(){
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
				return false;
			});
		};
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_" + treeNode.tId).unbind().remove();
        };
        function selectAll() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
        }
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			return targetNode ? targetNode.drop !== false : true;
		}
		
		//$(document).ready(function(){
		//	$("#selectAll").bind("click", selectAll);
		//	$.fn.zTree.init($("#treeDemo"), setting, zNodes1);
		//	$.fn.zTree.init($("#treeDemo2"), setting2, zNodes2);
			
		//});
		//-->
		// 点击我定义的那个按钮执行action
        function myFunction() {
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
            var nodes = treeObj.transformToArray(treeObj.getNodes());

            var msg = "";
            treeObj.expandAll(true);

            alert(nodes.length)
            for (var i = 0; i < nodes.length; i++) {
				
                msg += nodes[i].id + "-" + nodes[i].name + "-" + nodes[i].pId +"-"+nodes[i].url+ "\n";
				
            }
            $("#msg").val();
            $("#msg").val(msg);
            alert(msg)
        }
        function count() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
            checkCount = zTree.getCheckedNodes(true);

            var classpurview = "";
            for(var i=0;i<checkCount.length;i++) {
                 classpurview += checkCount[i].id + "-" + checkCount[i].name + "-" + checkCount[i].pId +"-"+checkCount[i].url+ "\n";
            }
            alert(classpurview);
        }
        $(document).ready(function() { 
        
        	$.ajax( {  
                url : "searchAllBooks.action",  
                type : "get",  
                dataType : "json",  
                success : initZtree  
            });  
        }); 
        function initZtree(json) {  
            var data2 = (json.result2);  
            var data1 = (json.result1);  
            var zNodes1 = eval("(" + data1 + ")");
            $.fn.zTree.init($('#treeDemo1'), setting1, zNodes1);
           var zNodes2 = eval("(" + data2 + ")");
            $.fn.zTree.init($('#treeDemo2'), setting2, zNodes2);  
        }  
	</script>
	<style type="text/css">
        .ztree li span.button.add {
        	wideth:100px;
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
            *vertical-align: middle
        }
    </style>
    <style>
		.W {
			background-color: #ffffff;
		}
		.G {
			background-color: #6BB50B;
		}
	</style>
</head>
<body>
	<% int i = 2; %>
    <% try { %>
	<% i = (int) session.getAttribute("i"); %>
	<% } catch (Exception e) { %>
	<% i = 2; %>
	<% } %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<p><br><br><br><br></p>
			</div>
			<div class="col-md-12 column">
				<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" style="background: #036564; border: none;" role="navigation">
					<div class="navbar-header">
					 	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					 		<span class="sr-only">GHZ</span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 	</button> 
					 	<a class="navbar-brand" href="#">读而思之</a>
					</div>
					<div class="collapse navbar-collapse" style="font-size: 16px;" bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
								<a href=personalCenter style="color: #ffffff; font-size: 16px;">个人中心</a>
							</li>
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
								<a href=mainPage  style="color: #ffffff; font-size: 16px;">我的主页</a>
							</li>
							<li class="active" onMouseMove="this.className='G animated swing'" onmouseout="this.className='active'">
								<a href=fileManage style="color: #ffffff; font-size: 16px;">内容管理</a>
							</li>
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
								<a href=timeLine style="color:#ffffff; font-size: 16px;">最佳回忆</a>
							</li>
							<li onMouseMove="this.className='G animated swing'" onmouseout="this.className=''">
								<a href=search style="color: #ffffff; font-size: 16px;">站内检索</a>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right" style="padding-right: 15px;">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<img src="sources/pics/Avatar.png" height="20" width="20" onMouseMove="this.className='animated pulse'" onmouseout="this.className=''" />
								</a>
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
			<div class="col-md-2 column">
				<div class="panel panel-success">
    				<div class="panel-body">
       					<ul class="nav nav-stacked">
							<li class="active"><a href="#panel-1" data-toggle="tab">修改笔记</a></li>
							<li><a href="#panel-2" data-toggle="tab">建分类树</a></li>
							<li><a href="#panel-5" data-toggle="tab">阅读状态</a></li>
							<li><a href="#panel-6" data-toggle="tab">标准文档</a></li>
							<li><a href="#panel-7" data-toggle="tab">删除文档</a></li>
							<li><a href="#panel-8" data-toggle="tab">上传文档</a></li>
						</ul>
    				</div>
				</div>
			</div>
			<div class="col-md-10 column">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="panel-1">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">修改笔记</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-2">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">构建分类树</h3>
    						</div>
    						<div class="panel-body">
    							<div class="content_wrap">
    								
										<div class="zTreeDemoBackground left">
											<ul id="treeDemo1" class="ztree "></ul>
										</div>
										<div class="right">
											<ul id="treeDemo2" class="ztree pull-right"></ul>
										</div>
								</div>
								<div><button onclick="myFunction()">保存树</button></div>
								<div><button onclick="count()">下载子树</button></div>
							</div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-3">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">分类 链接文档</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-4">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">类别修改</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-5">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">修改阅读状态</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-6">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">生成标准文档</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-7">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">删除</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-8">
						<div class="panel panel-success">
    						<div class="panel-heading">
        						<h3 class="panel-title">上传文档</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<footer>
			<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
		</footer>
	</div>
	<link href="sources/css/bootstrap.min.css" rel="stylesheet">
	<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="sources/js/bootstrap.min.js"></script>
</body>
</html>







