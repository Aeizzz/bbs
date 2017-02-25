<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'edit.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="dist/css/wangEditor.min.css">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<form action="<c:url value="/EditPostServlet"/>" method="post">
						<input type="hidden" name="method" value="edit" />
						<div class="ibox-title">
							<input name="title" type="text" placeholder="Title?"
								value="${post.title}" />
							<p style="color: red; font-weight: 900">${msg }</p>
						</div>
						<div class="ibox-content">
							<textarea name="content" id="content" rows="10" style="height:400px;">${post.content}</textarea>
						</div>
						<button type="submit" class="btn">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>






	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>

	<script type="text/javascript" src="dist/js/lib/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="dist/js/wangEditor.min.js"></script>
	
	<script type="text/javascript">
		var editor = new wangEditor('content');
		editor.create();
	</script>


</body>
</html>
