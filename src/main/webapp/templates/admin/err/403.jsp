<%--
  Created by IntelliJ IDEA.
  User: benhailong
  Date: 2018/2/27
  Time: 下午6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>403</title>
    <link rel="stylesheet" href="<%=basePath%>templates/style/plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>templates/style/plugins/font-awesome/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>templates/style/build/css/app.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>templates/style/build/css/themes/green.css" media="all">
</head>
<body>
<div style="text-align: center; padding:11% 0;">
    <i class="layui-icon" style="line-height:20rem; font-size:20rem; color: #393D50;">403</i>
    <p style="font-size: 20px; font-weight: 300; color: #999;">虚，不要告诉别人这里有问题，你可以尝试其他按钮，或者退出重新登了!</p>
</div>
</body>
</html>
