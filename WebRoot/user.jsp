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

<title>My JSP 'user.jsp' starting page</title>

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
	<div class="wrapper wrapper-content">
		<!-- 个人资料 -->

		<div class="ibox-title">
			<h5>姓名：${sessionScope.session_user.name}</h5>
			<h5>用户名：${sessionScope.session_user.username}</h5>
			<h5>创建时间：${sessionScope.session_user.creattime}</h5>
		</div>
		<!-- 所写文章 -->
		<div class="content">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>所写文章</h5>
				</div>
				<div class="ibox-content">

					<div>
						<div class="feed-activity-list">

								<c:forEach items="${postList}" var="post">
								<div class="feed-element">
									<div class="row">
										<div class="col-md-9">
											<div>
												<a
													href="<c:url value="/PostServlet?method=findPostById&pid=${post.pid}" />"
													class="forum-item-title">${post.title}</a>
											</div>
										</div>
										<div>
										<a href="<c:url value="EditPostServlet?method=delete&pid=${post.pid}"/>"><span style="font-size: 20px" class="">删除</span></a>
										</div>
									</div>
								</div>
							</c:forEach>


						</div>

					</div>

				</div>
			</div>

		</div>




	</div>



	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>

	<script src="js/content.js?v=1.0.0"></script>




</body>
</html>
