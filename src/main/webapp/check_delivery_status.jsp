<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.virtusa_Inventory_delivery.crud.ConnectionDao" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
%>
<div class="col-md-9">
                       
							<h1 align="center">Goods Delivery Status</h1>
							<%
								String driverName = "com.mysql.cj.jdbc.Driver";
								
								
								
								try {
								Class.forName(driverName);
								} catch (ClassNotFoundException e) {
								e.printStackTrace();
								}
								
								Connection connection = null;
								Statement statement = null;
								ResultSet resultSet = null;
								%>
								
								<table align="center" cellpadding="9" cellspacing="9" border="5">
								<tr>
								
								</tr>
								<tr>
								<td><b>Product id</b></td>
								<td><b>Customer Name</b></td>
								
								<td><b>Delivered or Not</b></td>
								<td><b>Delivery Message</b></td>
								</tr>
								<%
								
								try{ 
								connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees","root","#SumaSuresh@995");
								statement=connection.createStatement();
								//String sql ="SELECT * FROM employees.inventory where pDLid= "+DL_id;
								  String sql = "SELECT * FROM employees.delivery_status";
								  

								
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
								%>
								<tr>
								<td><%=resultSet.getInt("pid") %></td>
								<td><%=resultSet.getString("cName") %></td>
									
									<td><%=resultSet.getString("pDelivered") %></td>
									<td><%=resultSet.getString("dStatus") %></td>
								</tr>
								
								<% 
								}

								} 
								catch (Exception e) {
								e.printStackTrace();
								}
								%>
								</table>
							
                        
				</div>


</body>
</html>