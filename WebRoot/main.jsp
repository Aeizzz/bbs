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

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>

</head>

<body class="gray-bg">

	<div class="row border-bottom">
		<nav class="navbar navbar-fixed-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<form role="search" class="navbar-form-custom" method="post"
				action="<c:url value="/PostServlet"/>">
				<input type="hidden" name="method" value="searchpost" />
				<div class="form-group">
					<input type="text" name="search" placeholder="请输入您需要查找的帖子 …"
						class="form-control" name="top-search" id="top-search" />
				</div>
			</form>
		</div>

		<ul class="nav navbar-top-links navbar-right">
			<c:choose>
				<c:when test="${empty sessionScope.session_user}">
					<li><a href="login.jsp"> <i class="fa fa-sign-in"></i>登陆
					</a></li>
					<li><a href="register.jsp">注册 </a></li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${sessionScope.session_user.admin eq true}">
							<li><a
								href="<c:url value="/servlet/AdminServlet?method=findAll"/>">
									管理中心 </a></li>
						</c:when>
					</c:choose>
					<li><a href="edit.jsp">发表帖子</a></li>
					<li><a
						href="<c:url value="/ChangeUserServlet?method=findUserPostById&uid=${sessionScope.session_user.uid}"/>">
							<c:choose>
								<c:when test="${empty sessionScope.session_user.name}">
						${sessionScope.session_user.username}
					</c:when>
								<c:otherwise>
						${sessionScope.session_user.name}
					</c:otherwise>
							</c:choose>

					</a></li>

					<li><a
						href="<c:url value="ChangeUserServlet?method=changeUser&uid=${sessionScope.session_user.uid}"/>">修改资料</a></li>

					<li><a href="<c:url value="/UserServlet?method=quite"/>">
							<i class="fa fa-sign-out"></i>退出
					</a></li>
				</c:otherwise>
			</c:choose>
		</ul>

		</nav>
	</div>

	<div class="wrapper wrapper-content">
		<div class="row animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="wrapper wrapper-content animated fadeInRight">

						<div class="ibox-content m-b-sm border-bottom">
							<div class="p-xs">
								<div class="pull-left m-r-md">
									<a href="index.jsp"><i
										class="fa fa-globe text-navy mid-icon"></i></a>
								</div>
								<h2>欢迎来到论坛</h2>
								<span>你可以自由选择你感兴趣的文章。</span>
							</div>
						</div>

						<div class="ibox-content forum-container">

							<div class="forum-title">
								<div class="pull-right forum-desc">
									<samll>总文章数：${pageBean.tr}</samll>
								</div>
								<h3>文章</h3>
							</div>
							<c:forEach items="${pageBean.beanList}" var="list">
								<div class="forum-item active">
									<div class="row">
										<div class="col-md-9">
											<a
												href="<c:url value="/PostServlet?method=findPostById&pid=${list.pid}"/>"
												class="forum-item-title">${list.title}</a>

										</div>
										<div class="">
											<span style="font-size: 20px">作者： <c:choose>
													<c:when test="${empty list.name}">
											${list.username}
											</c:when>
													<c:otherwise>
											${list.name}
											</c:otherwise>
												</c:choose>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div>

							<c:choose>
								<c:when test="${pageBean.pc > 1}">
									<a
										href="<c:url value="/PostServlet?method=findByPost&page=${pageBean.pc-1}"/>">
										<button class="btn-lg btn-primary">
											<span>←</span>上一页
										</button>
									</a>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${pageBean.pc < pageBean.tp}">
									<a
										href="<c:url value="/PostServlet?method=findByPost&page=${pageBean.pc+1}"/>">
										<button class="btn-lg btn-primary next">
											下一页 <span>→</span>
										</button>
									</a>
								</c:when>
							</c:choose>


						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <div class="text-center">
		<div class="btn-group">
			<button class="btn btn-white" type="button">
				<a href="<c:url value="/PostServlet?method=findByPost&page=${PageBean.pc-1 }"/>"><i class="fa fa-chevron-left"></i></a>
			</button>
			<a href="<c:url value="/PostServlet?method=findByPost&page=${PageBean.pc-1 }"/>"><button class="btn btn-white">${PageBean.pc-1 }</button></a>
			<button class="btn btn-white  active">${PageBean.pc}</button>
			<a href="<c:url value="/PostServlet?method=findByPost&page=${PageBean.pc+1 }"/>"><button class="btn btn-white">${PageBean.pc+1 }</button></a>
			<a href="<c:url value="/PostServlet?method=findByPost&page=${PageBean.pc+2 }"/>"><button class="btn btn-white">${PageBean.pc+2 }</button></a>
			<a href="<c:url value="/PostServlet?method=findByPost&page=${PageBean.pc+3 }"/>"><button class="btn btn-white">${PageBean.pc+3 }</button></a>
			<button class="btn btn-white" type="button">
				<a href="<c:url value="/PostServlet?method=findByPost&page=${PageBean.pc+1 }"/>"><i class="fa fa-chevron-right"></i></a>
			</button>
		</div>
	</div> --%>
</body>
</html>
