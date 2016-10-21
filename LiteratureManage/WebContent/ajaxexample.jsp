<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
 <script src="sources/js/jquery-3.1.1.min.js"></script>
        

        <input id="name" type="text">
        <input type="button" value="ok" onclick="javascript:clickButton();" clientidmode="Static">
        <SCRIPT type="text/javascript">
            
            function clickButton()
            {    
                var url = 'ajaxRequest.action';
                
                var params = {
                        name:eval(document.getElementById('name')).value
                };
                
                jQuery.post(url, params, callbackFun, 'json');
            }
            function callbackFun(data)
            {
            	
               alert(data.result);//对应HelloWorld类的message属性
                    //获取数据后渲染页面
            }
        </SCRIPT>	
</body>
</html>