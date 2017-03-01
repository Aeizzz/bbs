<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<header> </header>
<body>
	<form id="form"
		action="${pageContext.request.contextPath }/PostServlet?method=findByPost" method="post">
	</form>

	<script type="text/javascript">
		window.onload = function() {
			var form = document.getElementById("form");
			form.submit();
		};
	</script>
</body>
</html>
