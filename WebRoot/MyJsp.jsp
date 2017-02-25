<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="stylesheet" type="text/css"
	href="dist/css/wangEditor.min.css">



</head>
<body>
<div style="width: 90%">

<textarea id="textarea1" style="height:400px;max-height:500px;">
    <p>请输入内容...</p>
</textarea>
</div>
	<script type="text/javascript"
		src="dist/js/lib/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="dist/js/wangEditor.min.js"></script>
	<script type="text/javascript">
    var editor = new wangEditor('textarea1');
    editor.create();
</script>
</body>
</html>
