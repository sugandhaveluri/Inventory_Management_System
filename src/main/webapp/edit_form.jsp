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

 %>

	<div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-md-10">
                        <h3>
							Edit Goods Information</h3>
							<form action="Edit_Good_Servlet" method="post">
							
							<input type="hidden" value="<%= request.getParameter("pid") %>" name="pid">
							
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

			
				