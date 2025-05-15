<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="pjdbc" class="hx.util.JdbcUtil" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type= "text/css" href = "resources/index.css">
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<body>
    <div class="grid_container">
        <div class="grid_item1">
        <h4>用户信息管理</h4> 
        <ol>
            <li id="li1">用户信息注册</li>
            <li id="li2">用户信息查询</li>
            <li id="li3">用户信息修改</li>
            <li id="li4">用户信息删除</li>
        </ol>
        <h4>试题信息管理</h4>
        <ol>
            <li id="li5">试题信息注册</li>
            <li id="li6">试题信息查询</li>
            <li id="li7">试题信息更新</li>
        </ol>
        <h4>考试出题管理</h4>
        <ol>
            <li id="li8">试题信息出题</li>
        </ol>
        </div>
        <script>
        $(document).ready(function(){
            $("#li1").click(function(){
                $("#screen1").attr("src","userRegister.jsp");
            });
            $("#li2").click(function(){
                $("#screen1").attr("src","userQuery.jsp");
            });
            $("#li3").click(function(){
                $("#screen1").attr("src","userUpdate.jsp");
            });
            $("#li4").click(function(){
                $("#screen1").attr("src","userDelete.jsp");
            });
            $("#li5").click(function(){
                $("#screen1").attr("src","questionRegister.jsp");
            });
            $("#li6").click(function(){
                $("#screen1").attr("src","questionQuery.jsp");
            });
            $("#li7").click(function(){
                $("#screen1").attr("src","questionUpdate.jsp");
            });
            $("#li8").click(function(){
                $("#screen1").attr("src","questionOut.jsp");
            });
        });
        </script>
        <div class="grid_item1">
            <iframe src="" frameborder="0" width="100%" height="100%" scrolling="no" id="screen1"></iframe>
        </div>
    </div>
</body>
</html>
