<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.String"%>
<jsp:useBean id="pjdbc" class="hx.util.JdbcUtil" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type= "text/css" href = "resources/userQuery.css">
    </head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <body>
        <form action="questionRegister.jsp" method="post">
            <table border="1">
                <tbody>
                        <tr>
                            <td>题目</td>
                            <td><input type="text" name="title"></td>
                        </tr>
                        <tr>
                            <td>A</td>
                            <td><input type="text" name="optionA"></td>
                        </tr>
                        <tr>
                            <td>B</td>
                            <td><input type="text" name="optionB"></td>
                        </tr>
                        <tr>
                            <td>C</td>
                            <td><input type="text" name="optionC"></td>
                        </tr>
                        <tr>
                            <td>D</td>
                            <td><input type="text" name="optionD"></td>
                        </tr>
                        <tr>
                            <td>正确答案</td>
                            <td>
                                <input type="radio" name="answer" value ="A">
                                <input type="radio" name="answer" value ="B">
                                <input type="radio" name="answer" value ="C">
                                <input type="radio" name="answer" value ="D">
                            </td>
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
<%
    String title = request.getParameter("title");
    String optionA = request.getParameter("optionA");
    String optionB = request.getParameter("optionB");
    String optionC = request.getParameter("optionC");
    String optionD = request.getParameter("optionD");
    String answer = request.getParameter("answer");
    if(title != null && optionA != null && optionB != null && optionC != null && optionD != null && answer != null){
        pjdbc.insertQuestionRegister(title,optionA,optionB,optionC,optionD,answer);
    }
%>   