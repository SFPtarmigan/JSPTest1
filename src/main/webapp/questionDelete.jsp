<jsp:useBean id="pjdbc" class="hx.util.JdbcUtil" scope="session"/>
<%
    String id = request.getParameter("qid");
    pjdbc.deleteQuestiondelete(id);
%>