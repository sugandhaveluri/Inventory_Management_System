<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 
 <%@page import="com.virtusa_Inventory_delivery.crud.goods" %>
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

        <title>edit goods</title>

        <style>
        
            .inner{
                margin: 15px 0;
            }
        </style>
    </head>
    <body>
        <div>
            <nav class="navbar navbar-light bg-primary">
                <a class="navbar-brand" style="color:white">EasyShip Warehouse</a>
               
</nav>
        </div>
 <%
        int id=Integer.parseInt(request.getParameter("id"));
        //out.println(id);
        
        HttpSession ss  = request.getSession();
        ss.setAttribute("pid",id);
        //goods gd=new goods();
        //out.println(gd.getPid());

 %>

	<div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-md-5">
                        <h3>
							Submit Delivery Status</h3>
							<br>
							<br>
							<form action="Delivery_Status_Servlet" method="post">
							<h2><b>Product id: <%out.println(id); %></b></h2>
							
							<input type="hidden" value="<%= request.getParameter("pid") %>" name="pid">
							<br>
							
							
                            <div class="form-group">
                                <label>Customer Name</label>
                                <input class="form-control" name="cName" placeholder="Customer Name" required>
                            </div>
                            <br>
                            
							<div class="form-group" >
                                <label>Delivered or Not</label>
                                <select id="inputState" class="form-control" name="pDelivered" required>
                                    <option selected disabled>Choose Status</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                            <br>
						<div class="form-group" >
                                <label>Delivery Status</label>
                                <select id="inputState" class="form-control" name="dStatus" required>
                                    <option selected disabled>Choose Status</option>
                                    <option value="Sucessfully Delivered">Sucessfully Delivered</option>
                                    <option value="Door Lock">Door Lock</option>
                                    <option value="Damaged Product">Damaged Product</option>
                                    <option value="Return Request">Return Request</option>
                                </select>
                            </div>
							
                            <br>
                            <br>
                            
							
                          <button type="submit" class="btn btn-primary">Submit</button>
                          
                            <button type="reset" class="btn btn-primary">Reset</button>
                        </form>
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

			
				