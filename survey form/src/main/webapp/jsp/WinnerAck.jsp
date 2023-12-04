<!--Sreelalitha -->
<!-- Winner Acknowledgement Page, which is displayed when mean is greater than 90  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Winner Acknowledgement</title>
</head>
<body bgcolor="#006633">

    
        <font color="#FFCC33" style="font-family: 'Times'"><center><h2>Thank you for submitting the form</h2>
        <h3>Congratulations...!!! You have won two movie tickets.</h3>
        <h4>Mean :  ${dataBean.getMean()}</h4>
        <h4>Standard Deviation is: ${dataBean.getStd()}</h4></center></font>
        
         <div>
  
      <center><img src="img/winner.jpg" alt="Winner"></center>

    </div>
          <font color="#FFCC33"><h4> List of student ID's available in database:</h4> </font>
        <ul>
            <%
                List<String> sids = (List<String>) request.getAttribute("stdids");
                for (String id : sids) {
            %>
            <li><b><a style="color: #fc3" href="stddata?param=<%=id%>"><%= id %></a></b></li>
            <%
                }
            %>
        </ul>
        

</body>
</html>