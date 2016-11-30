<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
	<TITLE></TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
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
	                showRemoveBtn: showRemoveBtn,
	                showRenameBtn: showRenameBtn
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
		};
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
					beforeDrag: beforeDrag,
					beforeDrop: beforeDrop,
					beforeClick: beforeClick
				}
			};
		var zNodes1 = [{
            id: 1,
            pId: 0,
            name: "父节点 1",
            open: true
        }, {
            id: 11,
            pId: 1,
            name: "叶子节点 1-1",
            url: "http://www.baidu.com"
        }, {
            id: 2,
            pId: 0,
            name: "父节点 2",
            open: true
        }, {
            id: 21,
            pId: 2,
            name: "叶子节点 2-1"
        }];
		var zNodes2 =[
		 			{ id:1, pId:0, name:"zTree Home", url:"http://www.ztree.me/", target:"_blank"},
		 			{ id:2, pId:0, name:"zTree in Google", url:"http://code.google.com/p/jquerytree/", target:"_blank"},
		 			{ id:3, pId:0, name:"zTree in Iteye", url:"http://ztreeapi.iteye.com/", target:"_blank"},
		 			{ id:4, pId:0, name:"Nothing...", url:"", target:"_blank", click:"alert('我是不会跳转的...');"}
		 		];
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
            if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId +
                "' title='add node' onfocus='this.blur();'></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_" + treeNode.tId);
            if (btn) btn.bind("click", function() {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.addNodes(treeNode, {
                    id: (100 + newCount),
                    pId: treeNode.id,
                    name: "new node" + (newCount++)
                });
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
		
		$(document).ready(function(){
			$("#selectAll").bind("click", selectAll);
			$.fn.zTree.init($("#treeDemo"), setting, zNodes1);
			$.fn.zTree.init($("#treeDemo2"), setting2, zNodes2);
			
		});
		//-->
		// 点击我定义的那个按钮执行action
        function myFunction() {
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes = treeObj.transformToArray(treeObj.getNodes());

            var msg = "name--id--pid\n";
            treeObj.expandAll(true);

            alert(nodes.length)
            for (var i = 0; i < nodes.length; i++) {

                msg += nodes[i].name + "--" + nodes[i].id + "--" + nodes[i].pId + "\n";
            }
            $("#msg").val();
            $("#msg").val(msg);
            alert(msg)
        }
	</SCRIPT>
	<style type="text/css">
        .ztree li span.button.add {
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
            *vertical-align: middle
        }
    </style>
</HEAD>

<BODY>
<div class="row clearfix">
			<div class="col-md-2 column">
				<div class="panel panel-primary">
    				<div class="panel-heading">
        				<h3 class="panel-title">内容管理</h3>
    				</div>
    				<div class="panel-body">
       					<ul class="nav nav-pills nav-stacked">
							<li class="active"><a href="#panel-1" data-toggle="tab">修改笔记</a></li>
							<li><a href="#panel-2" data-toggle="tab">构建分类树</a></li>
							<li><a href="#panel-3" data-toggle="tab">分类 链接文档</a></li>
							<li><a href="#panel-4" data-toggle="tab">类别修改</a></li>
							<li><a href="#panel-5" data-toggle="tab">修改阅读状态</a></li>
							<li><a href="#panel-6" data-toggle="tab">生成标准文档</a></li>
							<li><a href="#panel-7" data-toggle="tab">删除</a></li>
							<li><a href="#panel-8" data-toggle="tab">上传文档 加入系统</a></li>
						</ul>
    				</div>
				</div>
				<footer>
					<p>&copy; TEAM 高文成 黄沛 张东昌 @2016</p>
				</footer>
			</div>
			<div class="col-md-10 column">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="panel-1">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">修改笔记</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-2">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">构建分类树</h3>
    						</div>
    						<div class="panel-body"><div class="content_wrap">
	<div>
	<button onclick="myFunction()">点击这里</button>
	</div>
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="right">
		<ul id="treeDemo2" class="ztree"></ul>
	</div>
</div>
</div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-3">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">分类 链接文档</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-4">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">类别修改</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-5">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">修改阅读状态</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-6">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">生成标准文档</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-7">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">删除</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
					<div class="tab-pane fade" id="panel-8">
						<div class="panel panel-primary">
    						<div class="panel-heading">
        						<h3 class="panel-title">上传文档 加入系统</h3>
    						</div>
    						<div class="panel-body"></div>
    					</div>
					</div>
				</div>
			</div>
		</div>
</BODY>
</HTML>
