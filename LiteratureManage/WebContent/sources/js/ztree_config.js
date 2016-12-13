var setting1 = {
    view: {
        addHoverDom: addHoverDom,
        removeHoverDom: removeHoverDom,
        selectedMulti: false,

        showIcon: false

    },
    check: {
        enable: false,
        chkStyle: "checkbox",
        chkboxType: { "Y": "s", "N": "s" }
    },
    edit: {
        enable: false,
        editNameSelectAll: false,
        showRemoveBtn: false,
        showRenameBtn: false
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
    if (treeNode.url)
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

    var btn = $("#addBtn_" + treeNode.tId);
    if (btn) btn.bind("click", function() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
        zTree.addNodes(treeNode, { id: (100 + newCount), pId: treeNode.id, name: "new node" + (newCount++) });
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
    var msg1 = "";
    treeObj.expandAll(true);
    for (var i = 0; i < nodes.length; i++) {

        msg1 += nodes[i].id + " " + nodes[i].name + " " + nodes[i].pId + " " + nodes[i].url + "\n";

    }
    if (msg1 == "")
        alert("树不可为空")
    else {
        $.ajax({
            type: "post",
            url: "updateMysql.action",
            data: {
                "msg1": msg1,
            },
            success: function() {
                alert("成功保存");
            },
            dataType: "json"
        })
    }
}

function count() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
    checkCount = zTree.getCheckedNodes(true);
    var msg2 = "";
    for (var i = 0; i < checkCount.length; i++) {
        msg2 += checkCount[i].id + " " + checkCount[i].name + " " + checkCount[i].pId + " " + checkCount[i].url + "\n";
    }
    if (msg2 == "")
        alert("选择不可为空")
    else {
        $.ajax({
            type: "post",
            url: "generateDocu.action",
            data: {
                "msg2": msg2,
            },
            success: function() {
                alert("成功");
            },
            dataType: "json"
        })
    }
}
$(document).ready(function() {

    $.ajax({
        url: "searchAllBooks.action",
        type: "get",
        dataType: "json",
        success: initZtree
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