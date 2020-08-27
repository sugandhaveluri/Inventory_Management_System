<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.virtusa_Inventory_delivery.crud.goods" %>
<%@page import="com.virtusa_Inventory_delivery.crud.GoodsDao" %>
<%@page import="com.virtusa_Inventory_delivery.crud.ConnectionDao" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>



<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <title>EasyShip warehouse</title>

        <style>
        
            .inner{
                margin: 15px 0;
            }
        </style>
    </head>
    <body>
        <div  >
            <nav class="navbar navbar-light bg-primary">
                <a class="navbar-brand" href="check_delivery_status.jsp" style="color: white">Check Delivery Status</a>
                
                 
               
</nav>
        </div>
<div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-md-3">
                        <h3>
							Enter Goods Information</h3>
							<form action="AddGoodServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Product Name</label>
                                <input class="form-control" name="pName" placeholder="Product Name" required>
                            </div>
                            <div class="form-group" >
                                <label>Damaged or Not</label>
                                <select id="inputState" class="form-control" name="pDamaged" required>
                                    <option selected disabled>Choose Status</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                            <div class="form-group" >
                                <label>Perishable Item or Not</label>
                                <select id="inputState" class="form-control" name="pPerishable" required>
                                    <option selected disabled>Choose Status</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
							
                          
							<div class="form-group" >
                                <label>Product Category</label>
                                <select id="inputState" class="form-control" name="pCategory" required>
                                    <option selected disabled>Choose Category</option>
                                    <option value="Food Raw Materials">Food Raw Materials</option>
                                    <option value="Electronics">Electronics</option>
                                    <option value="Automobiles">Automobiles</option>
                                    <option value="Clothing and Accessories">Clothing and Accessories</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Delivery Agent ID</label>
                                 <select id="inputState" class="form-control" name="pDLid" required>
                                    <option selected disabled>Choose Delivery Agent</option>
                                    <option value="DL101">DL101</option>
                                    <option value="DL102">DL102</option>
                                    <option value="DL103">DL103</option>
                                    <option value="DL104">DL104</option>
                                </select>
                                
                            </div>
                            <div class="form-group">
                            <label>Delivery Date</label>
                             <input type="text" name="DLdate"  placeholder="dd/MM/yyyy"/> 
                             </div>
                            <div class="form-group">
                                	<label> Inventory File </label>
                                	<input type="file" class="form-control" name="IntFile" placeholder="Choose an Inventory file"  required>
                            	</div>
                            	
							<button type="submit" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-primary">Reset</button>
                        </form>
					</div>
					
					<div class="col-md-9">
                        <h3>
							Goods Information From Database</h3>
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
								<td><b>Product Id</b></td>
								<td><b>Product Name</b></td>
								
								<td><b>Damaged or Not</b></td>
								<td><b>Perishable</b></td>
								
								<td><b>Product Category</b></td>
								<td><b>Delivery Agent Id</b></td>
								<td><b>Delivery Date</b></td>
								<td><b>Inventory File</b></td>
								<td><b>Edit Details</b></td>
								<td><b>Delete</b></td>
								
								
								
								</tr>
								<%
								try{ 
								connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees","root","#SumaSuresh@995");
								statement=connection.createStatement();
								String sql ="SELECT * FROM employees.inventory";
								
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
								%>
								<tr>
								<td><%=resultSet.getString("pid") %></td>
								
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
									<a href='edit_form.jsp?id=<%=resultSet.getInt("pid") %>'>Edit</a>
									</td>
									<td><a href="DeleteGoodServlet?id=<%=resultSet.getInt("pid") %>">Delete</a></td>
									
								
								
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
				</div>
				</div>
				</div>
				<!-- Optional JavaScript -->
				        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
				        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
				        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
				        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
				    </body>
				</html>

