<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="StyleSheet" href="sources/css/tree.css" type="text/css">
	<script type="text/javascript" src="sources/js/tree.js"></script>
	<script type="text/javascript">
	<% String username = (String) session.getAttribute("username"); %>
	<% ArrayList<String> tree = (ArrayList) session.getAttribute("tree");%>
		var Tree = new Array;
		// nodeId | parentNodeId | nodeName | nodeUrl
		Tree[0] = "1|0|Page 1|#";
		Tree[1]	 = "2|1|Page 1.1|#";
		Tree[2]  = "3|1|Page 1.2|#";
		Tree[3]  = "4|3|Page 1.2.1|#";
		Tree[4]  = "5|1|Page 1.3|#";
		Tree[5]  = "6|2|Page 1.1.1|#";
		Tree[6]  = "7|6|Page 1.1.1.1|#";
		Tree[7]  = "8|6|Page 1.1.1.2|#";
		Tree[8]  = "9|1|Page 1.4|#";
		Tree[9]  = "10|9|Page 1.4.1|#";
		Tree[10] = "11|0|Page 2|#";
	</script>
</head>

<body>


<br /><br />
<br /><br />

<div class="tree">
<script type="text/javascript">
	createTree(Tree);
</script>
</div>

<br /><br />


</body>
</html>
