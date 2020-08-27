=<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
                       
							<h1 align="center">Pending Delivery List</h1>
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
								<td><b>id</b></td>
								<td><b>Product Name</b></td>
								
								<td><b>Damaged or Not</b></td>
								<td><b>Perishable</b></td>
								
								<td><b>Product Category</b></td>
								<td><b>Delivery Agent Id</b></td>
								<td><b>Delivery Date</b></td>
								<td><b>Inventory File</b></td>
								<td><b>Delivery Satus</b></td>
								
								
								
								
								
								</tr>
								<%
								HttpSession ss  = request.getSession();
								String DL_id=(String) ss.getAttribute("login_id");
								//out.println(DL_id);
								Date today=new Date();
								//out.println(today);
								SimpleDateFormat DATE_FORMAT=new SimpleDateFormat("dd/MM/yyyy");
								String ddmmyy=DATE_FORMAT.format(today);
								//out.println(ddmmyy);
								
								try{ 
								connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees","root","#SumaSuresh@995");
								statement=connection.createStatement();
								//String sql ="SELECT * FROM employees.inventory where pDLid= "+DL_id;
								  String sql = "SELECT * FROM employees.inventory where pDLid='"+DL_id+"' and DLdate<'"+ddmmyy+"'";

								
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
								%>
								<tr>
								<td><%=resultSet.getInt("pid") %></td>
								<td><%=resultSet.getString("pName") %></td>
									
									<td><%=resultSet.getString("pDamaged") %></td>
									<td><%=resultSet.getString("pPerishable") %></td>
									
									<td><%=resultSet.getString("pCategory") %></td>
									<td><%=resultSet.getString("pDLid") %></td>
									<td><%=resultSet.getString("DLdate") %></td>
									<td>
                                        
  												<a href="<%=resultSet.getString("IntFile") %>" >
  												<%=resultSet.getString("IntFile") %>
  												</a>
  											
										
                                        </td>
                                       
									
									<td>
									<a href='delivery_status.jsp?id=<%=resultSet.getInt("pid")%> '>Delivery Status</a>
									</td>
									
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