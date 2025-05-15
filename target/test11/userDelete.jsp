<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.String"%>
<jsp:useBean id="pjdbc" class="hx.util.JdbcUtil" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type= "text/css" href = "resources/userDelete.css">
    </head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <body>
        <form action="userDelete.jsp" method="post">
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
                        <td><input type="submit" value="submit"></td>
                        <td><button type="button" id="resetbutton">Reset</button></td>
                </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>