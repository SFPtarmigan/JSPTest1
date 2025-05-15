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
            <table border="1">
                <tbody>
                    <tr>
                        <td>试题编号</td>
                        <td>题目信息</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>D</td>
                        <td>正确答案</td>
                        <td>操作</td>
                    </tr>
                    <%=pjdbc.selectQuestionQuery()%>
                    <!-- 循环输出数据库中的数据 -->
                </tbody>
    </body>
    <script>
    $(document).ready(function(){
        $('.delete').click(function(){
            var id = $(this).attr('qid');
            $.ajax({
                url:'questionDelete.jsp',
                type:'POST',
                data:{qid:id},
                success:function(data){
                    alert('删除成功');
                    window.location.reload();
                },
                error:function(data){
                    alert('删除失败');
                }
            });
        })
    });

    </script>
</html>
