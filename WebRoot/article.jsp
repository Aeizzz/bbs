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

<title>My JSP 'article.jsp' starting page</title>

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
	<div class="wrapper wrapper-content  animated fadeInRight article">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="ibox">
					<div class="ibox-content">
						<div class="pull-right">
							<c:if test="${!empty sessionScope.session_user}">
								<c:if test="${sessionScope.session_user.uid eq post.uid}">

									<a
										href="<c:url value="/EditPostServlet?method=changepost&pid=${post.pid}"/>">
										<button class="btn btn-white btn-xs" type="button">修改</button>
									</a>
								</c:if>
							</c:if>

							<button class="btn btn-white btn-xs" type="button">
								<c:choose>
									<c:when test="${empty post.name}">
									${post.username}
									</c:when>
									<c:otherwise>
									${post.name}
									</c:otherwise>
								</c:choose>
							</button>
						</div>
						<div class="pull-left">
							<button class="btn btn-white btn-xs" type="button">${post.creattime}</button>

						</div>
						<div class="text-center article-title">
							<h1>${post.title}</h1>
						</div>
						<div>${post.content}</div>
						<hr>

					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>

	<!-- simditor -->
	<script type="text/javascript" src="js/plugins/markdown/markdown.js"></script>
	<script type="text/javascript" src="js/plugins/markdown/to-markdown.js"></script>
	<script type="text/javascript"
		src="js/plugins/markdown/bootstrap-markdown.js"></script>
	<script type="text/javascript"
		src="js/plugins/markdown/bootstrap-markdown.zh.js"></script>



</body>
</html>
