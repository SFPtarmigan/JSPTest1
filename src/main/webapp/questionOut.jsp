<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.String"%>
<jsp:useBean id="pjdbc" class="hx.util.JdbcUtil" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    </head>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     <body>
            <form>
            <table border="1">
                <tbody>
                    <tr>
                        <td>试题编号</td>
                        <td>题目信息</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>作答</td>
                    </tr>
                    <%=pjdbc.selectQuestionRandom(4)%>
                    <%-- 随机输出数据库中的四条数据 --%>
                    <tr>
                        <td><button type="button" id="submitResult">提交</button>
                        <td><button type="reset" id="resetbutton">Reset</button></td>
                    </tr>
                </tbody>
            </table>
            </form>
     </body>
     <script>
    $(document).ready(function(){
        $("#submitResult").click(function(){
            var result = 0 ;
            if($("#question1").text() == $("input[name='answer1']:checked").val()){
                result += 1;
            }
            if($("#question2").text() == $("input[name='answer2']:checked").val()){
                result += 1;
            }
            if($("#question3").text() == $("input[name='answer3']:checked").val()){
                result += 1;
            }
            if($("#question4").text() == $("input[name='answer4']:checked").val()){
                result += 1;
            }
            window.location.href="scor.jsp?result="+result*25;
        });
    });
     </script>
</html>