<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			},
			callback: {
                beforeClick: beforeClick
            }
		}
        var log, className = "dark";
        function beforeDrag(treeId, treeNodes) {
            return true;
        }
        function beforeEditName(treeId, treeNode) {
            className = (className === "dark" ? "" : "dark");
            showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
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
            var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
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
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
                    zTree.cancelEditName();
                    alert("节点名称不能为空.");
                }, 0);
                return false;
            }
            return true;
        }
        // 点击时候 执行的动作 现在是打开链接
        function beforeClick(treeId, treeNode) {
        	if(treeNode.url)
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
				var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
				zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
				return false;
			});
		};
        function removeHoverDom(treeId, treeNode) {
            $("#addBtn_" + treeNode.tId).unbind().remove();
        };
        function selectAll() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
            zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
        }
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			return targetNode ? targetNode.drop !== false : true;
		}
        function myFunction() {
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo1");
            var nodes = treeObj.transformToArray(treeObj.getNodes());
            var msg1 = "";
            treeObj.expandAll(true);
            for (var i = 0; i < nodes.length; i++) {
				
                msg1 += nodes[i].id + " " + nodes[i].name + " " + nodes[i].pId +" "+nodes[i].url+ "\n";
				
            }
            if(msg1=="")
            	alert("树不可为空")
            else{
            $.ajax( {
		        type : "post",
		        url : "updateMysql.action",
		        data : {
		            "msg1" : msg1,
		        },
		        success : function() {
		            alert("成功保存");
		        },
		        dataType : "json"
		    })}
        }
        function count() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
            checkCount = zTree.getCheckedNodes(true);
            var msg2 = "";
            for(var i=0;i<checkCount.length;i++) {
                 msg2 += checkCount[i].id + " " + checkCount[i].name + " " + checkCount[i].pId +" "+checkCount[i].url+ "\n";
            }
            if(msg2 =="")
            	alert("选择不可为空")
            else{
            $.ajax( {
                type : "post",
                url : "downloadDocu.action",
                data : {
                    "msg2" : msg2,
                },
                success : function() {
                	document.getElementById('down').setAttribute('href', data.zipPath);
                },
                dataType : "json"
            })}
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
            var data1 = (json.result1);  
            var data2 = (json.result2);  
            var zNodes1 = eval("(" + data1 + ")");
            $.fn.zTree.init($('#treeDemo1'), setting1, zNodes1);
           var zNodes2 = eval("(" + data2 + ")");
            $.fn.zTree.init($('#treeDemo2'), setting2, zNodes2);  
        }  
	</script>
	<script>
        $(document).ready(function(){
            $('#things').addClass('active');

        });

    </script>
<style type="text/css">
.ztree li span.button.add {
	wideth: 100px;
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

body{
		font-family: "Microsoft YaHei", "Arial", "Times Roman", "Courier", "Verdana", "Century Gothic";
		}
</style>
</head>
<body>
 <div style="position: absolute; width: 100%; height: 100%; z-index: -1; left: 0; top: 0;">      
    	<img src="sources/pics/bg11.jpg" style="left: 0; position: fixed; top: 0;" width="100%" height="100%">      
    </div>
	<%
		int i = 2;
	%>
	<%
		try {
	%>
	<%
		i = (int) session.getAttribute("i");
	%>
	<%
		} catch (Exception e) {
	%>
	<%
		i = 2;
	%>
	<%
		}
	%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<p>
					<br>
					<br>
					<br>
					<br>
				</p>
			</div>
			 <%@ include file="nav.jsp" %>
		</div>
		<div class="row clearfix">
			<div class="col-md-2 column">
				<div class="panel panel-success" style="background-color: rgba(255,255,255,	 0.60);">
					<div class="panel-body">
						<ul class="nav nav-stacked">
						<li class="active"><a href="#panel-1" data-toggle="tab">建分类树</a></li>
							<li ><a href="#panel-2" data-toggle="tab">上传文档</a></li>
							
							
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-10 column">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="panel-1">
						<div class="panel" style="background-color: rgba(255,255,255,0.60);border:none;">
							<div class="panel-heading" style="background-color: #84735F;border:none;color:#ffffff">
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
								<div>
									<button class="btn" style="width:20%;background-color: #84735F;color:#ffffff" onclick="myFunction()">保存树</button>
									<button class="btn" style="width:20%;background-color: #84735F;color:#ffffff" onclick="count()">打包</button>
									<a id="down" type="button" class="btn btn_primary" download>下载</a>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade " id="panel-2">
						<div class="panel" style="background-color: rgba(255,255,255,0.60);border:none;">
							<div class="panel-heading" style="background-color: #84735F;border:none;color:#ffffff">
								<h3 class="panel-title">上传文档</h3>
								
							</div>
							<div class="panel-body">
							<ul class="nav nav-tabs">
 								<li class="active" >
 									<a data-toggle="tab" href="#savepdf">
 										<span class="glyphicon glyphicon-open">上传pdf</span>
 									</a>
 								</li>
  								<li>
  									<a data-toggle="tab" href="#saveurl">
  										<span class="glyphicon glyphicon-link">保存url</span>
  									</a>
  								</li>
  								</ul>
  								<div class="tab-content">
    							<div id="savepdf" class="tab-pane fade in active">
									<form action="fileUpLoad" id="upload_form" method="post" enctype="multipart/form-data">
										<div class="form-group">
										<br><br>
                							<input name="articlename" class="form-control" type="text" placeholder="请在这儿输入文件名" required  style="background-color: rgba(255,255,255,0.60);border:none;  width: 60%;" />
    									</div>
    									<div class="form-group">
        									<input name="file" id='file' class="upload" type="file" required style="background-color: rgba(255,255,255,0.60);border:none;  width: 60%;" />
        								</div>
    								</form>
    								<button type="submit" class="btn  pull-right" style="width:20%;background-color: #84735F;color:#ffffff" form="upload_form">上传文件</button>
    							</div>
    				    		<div id="saveurl" class="tab-pane">
                            		<form action="urlUpLoad" method="post" id="urlupload_form">
                                		<div class="form-group">
                                		<br><br>
                				    		<input name="articlename"  class="form-control" type="text" placeholder="请在这儿输入文件名" required style="background-color: rgba(255,255,255,0.60);border:none;  width: 60%;" />
                               	 		</div>
    				            		<div class="form-group">
        						    		<input name="url" id='url'  class="form-control" value="http://" type="text" placeholder="请在这儿输入url" required style="background-color: rgba(255,255,255,0.60);border:none;  width: 60%;" />
        					    		</div>
    					    		</form>
    					    		<button type="submit" class="btn pull-right"style="width:20%;background-color: #84735F;color:#ffffff" form="urlupload_form">上传URL</button>
    				    		</div>
				    		</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	  <%@ include file="bottom.jsp" %>

</body>
</html>
