<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!--图标样式-->
    <link rel="stylesheet" type="text/css" href="sources/css/bootstrap.min.tmp.css" />

    <!--主要样式-->
    <link rel="stylesheet" type="text/css" href="sources/css/tree.style.css" />

    <script type="text/javascript" src="sources/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
            $('.tree li.parent_li > span').on('click', function(e) {
                var children = $(this).parent('li.parent_li').find(' > ul > li');
                if (children.is(":visible")) {
                    children.hide('fast');
                    $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
                } else {
                    children.show('fast');
                    $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
                }
                e.stopPropagation();
            });
        });
    </script>

</head>

<body>
	<s:action name="Searchtree" executeResult="true" />
	<% String username = (String) session.getAttribute("username"); %>
	<% String[] tree = (String[]) session.getAttribute("tree");%>
    <div class="tree well">
        <ul>
            <li>
                <span> <%out.print(username); %></span> <a href="">Goes somewhere</a>
                <ul>
                    <li>
                        <span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
                        <ul>
                            <li>
                                <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
                        <ul>
                            <li>
                                <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
                            </li>
                            <li>
                                <span><i class="icon-minus-sign"></i> Grand Child</span> <a href="">Goes somewhere</a>
                                <ul>
                                    <li>
                                        <span><i class="icon-minus-sign"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
                                        <ul>
                                            <li>
                                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
                                            </li>
                                            <li>
                                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
                                    </li>
                                    <li>
                                        <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <span><i class="icon-folder-open"></i> Parent2</span> <a href="">Goes somewhere</a>
                <ul>
                    <li>
                        <span><i class="icon-leaf"></i> Child</span> <a href="">Goes somewhere</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

</body>

</html>