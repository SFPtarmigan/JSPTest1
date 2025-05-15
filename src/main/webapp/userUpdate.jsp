<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="pjdbc" class="hx.util.JdbcUtil" scope="session"/>
<%
    String user = request.getParameter("user");
    String password = request.getParameter("password");
    String newuser = request.getParameter("newuser");
    String newpassword = request.getParameter("newpassword");
    String newsex = request.getParameter("newsex");
    String newemail = request.getParameter("newemail");
    if(user != null && password != null && newuser != null && newpassword != null && newsex != null && newemail != null){
        pjdbc.updateUserUpdate(user,password,newuser,newpassword,newsex,newemail);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type= "text/css" href = "resources/userUpdate.css">
    </head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <body>
        <form action="userUpdate.jsp" method="post">
            <table border="1">
                <tbody>
                    <tr>
                        <td>用户姓名</td>
                        <td><input type="text" name="user"></td>
                    </tr>
                    <tr>
                        <td>用户密码</td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td>新用户姓名</td>
                        <td><input type="text" name="newuser"></td>
                    </tr>
                    <tr>
                        <td>新用户密码</td>
                        <td><input type="password" name="newpassword"></td>
                    </tr>
                    <tr>
                        <td>新用户性别</td>
                        <td><label>男</label><input type="radio" name="newsex" value="1"><label>女</label><input type="radio" name="newsex" value="0"></td>
                    </tr>
                    <tr>
                        <td>新用户邮箱</td>
                        <td><input type="text" name="newemail"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="submit"></td>
                        <td><button type="reset" id="resetbutton">Reset</button></td>
                </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>