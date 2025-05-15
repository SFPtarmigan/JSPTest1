<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.String"%>
<%
String score = request.getParameter("result");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    </head>
<body>
    <div>
        你的得分为:<%=score%>
    </div>
</body>
</html>