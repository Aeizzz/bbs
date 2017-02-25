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

<title>My JSP 'search.jsp' starting page</title>

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
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<h2>
							为您找到相关结果约${count}个： <span class="text-navy">${search}</span>
						</h2>
						<div class="search-form">
							<form action="<c:url value="/PostServlet"/>" method="post">
								<input type="hidden" name="method" value="searchpost">
								<div class="input-group">
									<input type="text" placeholder="${search}" name="search"
										class="form-control input-lg">
									<div class="input-group-btn">
										<button class="btn btn-lg btn-primary" type="submit">
											搜索</button>
									</div>
								</div>

							</form>
						</div>


						<c:forEach items="${ postlist}" var="post">

							<div class="hr-line-dashed"></div>
							<div class="search-result">
								<h3>
									<a
										href="<c:url value="/PostServlet?method=findPostById&pid=${post.pid}"/>">${post.title}</a>
								</h3>

								<!-- <p>不像前台Theme目录的改变可以通过后台界面配置,后台的主题目录要自己修改相应的配置文件。
								Theme目录的配置再Adminhtml模块,打开后台的配置文件 $MAGENO_DIR\app\code...</p> -->
							</div>
						</c:forEach>
						<div class="hr-line-dashed"></div>
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



</body>
</html>
