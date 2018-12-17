<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>错误页面</title>
    <link rel="stylesheet" href="<%=basePath%>templates/style/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>templates/style/plugins/font-awesome/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>templates/style/build/css/app.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>templates/style/build/css/themes/green.css" media="all">
</head>
<body>
    <i class="layui-icon" style="line-height:20rem; font-size:20rem; color: #393D50;">&#x1006;</i>
    <p style="font-size: 20px; font-weight: 300; color: #999;">${msg}</p>
</body>
</html>
