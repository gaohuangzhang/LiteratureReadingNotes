<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
    <script src="sources/js/jquery-3.1.1.min.js"></script>
    <script src="sources/js/jquery.sidr.min.js"></script>
    <link rel="stylesheet" href="sources/css/jquery.sidr.dark.min.css">
  </head>
  <body>
  <a id="simple-menu" href="#sidr">Toggle menu</a>

<div id="sidr">
  <!-- Your content -->
  <ul>
    <li><a href="#">List 1</a></li>
    <li class="active"><a href="#">List 2</a></li>
    <li><a href="#">List 3</a></li>
  </ul>
</div>

<script>
$(document).ready(function() {
  $('#simple-menu').sidr();
});
</script>
 
<a id="right-menu" href="#right-menu">Right Menu</a>

<script>
$(document).ready(function() {
   
    $('#right-menu').sidr({
      name: 'sidr-right',
      side: 'right'
    });
});
</script>
  </body>
</html>