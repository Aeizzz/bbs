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

<title>My JSP 'changeuser.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="css/plugins/markdown/bootstrap-markdown.min.css" />
<link href="css/style.css?v=4.1.0" rel="stylesheet">



</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
	<p style="color: red; font-weight: 900">${msg }</p>
	<form action="<c:url value="/ChangeUserServlet"/>" method="post" class="m-t">
		<input type="hidden" name="method" value="changeload">
		<div class="col-md-12">
			<div class="form-group">
				<div class="col-sm-9">
					<p>用户名,不改则留空</p>
					<input type="text" name="username" class="form-control"
						placeholder="请输入用户名" value="${user.username}"><span
						class="help-block m-b-none"></span>

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9">
					<p>姓名,不改则留空</p>
					<input type="text" name="name" class="form-control"
						placeholder="请输入姓名">
					<c:choose>
						<c:when test="${empty user.name}">
					${user.name} 
					</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					<span class="help-block m-b-none"></span>

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-9">
					<p>密码,不改则留空</p>
					<input type="password" class="form-control" name="passworld"
						placeholder="请输入密码，留空则不变">
				</div>
			</div>
		</div>
		<input type="submit" name="submit" value="修改" />
		
		
	</form>
</div>
	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>

</body>
</html>
