
<html>
<head>
    <title>summer.Question.ua</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}style.css">
    <style>
        body { background: dodgerblue }
    </style>
</head>
<body>
<% Boolean havAllTheQuestionsBeenAnswered = (Boolean)session.getAttribute("havAllTheQuestionsBeenAnswered"); %>
<%-- //чи відповіли на всі питання--%>
<% Integer countQuestion1Yes = (Integer)session.getAttribute("countQuestion1Yes"); %>
<% Integer countQuestion1No = (Integer)session.getAttribute("countQuestion1No"); %>
<% Integer countQuestion2Yes = (Integer)session.getAttribute("countQuestion2Yes"); %>
<% Integer countQuestion2No = (Integer)session.getAttribute("countQuestion2No"); %>
<% if (    havAllTheQuestionsBeenAnswered== null  || havAllTheQuestionsBeenAnswered == false) { %>

<h1 style="  text-align: center; color: white; margin-bottom: 40px">Summer survey</h1>
<form action="/questionnaire" method="POST"  style="  text-align: center; color: white; margin-bottom: 40px">
<%-- опитування--%>
    <p  ><b>Do you have an air conditioner at home?</b></p >
    <p><input name="question1" type="radio" value="1">Yes</p>
    <p><input name="question1" type="radio" value="2">No</p>

    <p  ><b>Have you been to a resort this summer?</b></p >
    <p><input name="question2" type="radio" value="1">Yes</p>
    <p><input name="question2" type="radio" value="2">No</p>

    <p><input type="submit" value="send"></p>
</form>
<% } else { %>


<table  cellspacing="0" border="1" style="width: 50% ; color: white ; background: darksalmon" align="center" >
    <tr><%--вивід таблиці--%>
        <th>Number</th>
        <th >Yes</th>
        <th>No</th>
    </tr>
    <tr>
        <th>1</th>
        <td><%=countQuestion1Yes%></td>
        <td><%=countQuestion1No%></td>
    </tr>
    <tr>
        <th>2</th>
        <td><%=countQuestion2Yes%></td>
        <td><%=countQuestion2No%></td>

    </tr>
</table>
<br><center><a href="/questionnaire?a=exit"  style="color: white ;text-align:center">Go through again</a>

</center>
<% } %>
</body>
</html>
