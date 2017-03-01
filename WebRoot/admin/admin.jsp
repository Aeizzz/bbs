<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>My JSP 'admin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">



</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content">
		<!-- 管理员信息 -->
		<div class="ibox-title">
			<h5>姓名：${sessionScope.session_user.name}</h5>
			<h5>用户名：${sessionScope.session_user.username}</h5>
			<h5>创建时间：<fmt:formatDate pattern="yyy-MM-dd hh:mm:ss" value="${sessionScope.session_user.creattime}"/></h5>
		</div>
		<!-- 所有的人员信息，可以设置管理员，删除用户 -->
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>用户信息</h5>

						</div>
						<div class="ibox-content">

							<table
								class="table table-striped table-bordered table-hover dataTables-example">
								<thead>
									<tr>
										<th>用户名</th>
										<th>姓名</th>
										<th>创建时间</th>
										<th>管理员</th>
										<th>删除</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${UserList}" var="user">
										<tr class="gradeX">
											<td>${user.username}</td>
											<td>${user.name }</td>
											<td><fmt:formatDate pattern="yyy-MM-dd hh:mm:ss" value="${user.creattime }"/></td>
											<td class="center"><c:choose>
													<c:when test="${user.admin eq true }">
														<a href="<c:url value="/servlet/AdminServlet?method=updateAdmin&uid=${user.uid}"/>">取消管理员</a>
													</c:when>
													<c:otherwise>
														<a href="<c:url value="/servlet/AdminServlet?method=updateAdmin&uid=${user.uid}"/>">设置管理员</a>
													</c:otherwise>
												</c:choose></td>
											<td class="center"><a href="<c:url value="/servlet/AdminServlet?method=deleteUser&uid=${user.uid}"/>">删除用户</a></td>
										</tr>
									</c:forEach>

								</tbody>
								<tfoot>
									<tr>
										<th>用户名</th>
										<th>姓名</th>
										<th>创建时间</th>
										<th>管理员</th>
										<th>删除</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>




			<!-- 查看所有的文章，可以删除 -->
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>帖子信息</h5>

						</div>
						<div class="ibox-content">

							<table
								class="table table-striped table-bordered table-hover dataTables-example">
								<thead>
									<tr>
										<th>文章ID</th>
										<th>文章标题</th>
										<th>作者姓名</th>
										<th>创建时间</th>
										
										<th>删除</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${PostList}" var="post">
										<tr class="gradeX">
											<td>${post.pid}</td>
											<td><a href="<c:url value="/PostServlet?method=findPostById&pid=${post.pid}"/>">${post.title}</a></td>
											<td>${post.name}</td>
											<td><fmt:formatDate pattern="yyy-MM-dd hh:mm:ss" value="${post.creattime }"/></td>
											
											<td><a href="<c:url value="/servlet/AdminServlet?method=deletePost&pid=${post.pid}"/>">删除</a></td>
										</tr>
									</c:forEach>

								</tbody>
								<tfoot>
									<tr>
										<th>文章ID</th>
										<th>文章标题</th>
										<th>作者姓名</th>
										<th>创建时间</th>
										<th>删除</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>







	</div>




	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>



	<script src="js/plugins/jeditable/jquery.jeditable.js"></script>

	<!-- Data Tables -->
	<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>


	<!-- Page-Level Scripts -->
	<script>
		$(document).ready(function() {
			$('.dataTables-example').dataTable();

			/* Init DataTables */
			var oTable = $('#editable').dataTable();

			/* Apply the jEditable handlers to the table */
			oTable.$('td').editable('../example_ajax.php', {
				"callback" : function(sValue, y) {
					var aPos = oTable.fnGetPosition(this);
					oTable.fnUpdate(sValue, aPos[0], aPos[1]);
				},
				"submitdata" : function(value, settings) {
					return {
						"row_id" : this.parentNode.getAttribute('id'),
						"column" : oTable.fnGetPosition(this)[2]
					};
				},

				"width" : "90%",
				"height" : "100%"
			});

		});
	</script>
</body>
</html>
