package com.virtusa_Inventory_delivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.virtusa_Inventory_delivery.dao.Database_Connection;
import com.virtusa_Inventory_delivery.dao.Employee_dao;
import com.virtusa_Inventory_delivery.model.Employee;

/**
 * Servlet implementation class User_Login_Servlet
 */

public class User_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		//fetch data from login form
        
        String loginEmail = request.getParameter("username");
        String loginPass = request.getParameter("password");
        
        Employee_dao db =  new Employee_dao(Database_Connection.getConnection());
        Employee user = db.login(loginEmail, loginPass);
       // Employee dl=db.Delivery_login(loginEmail, loginPass);
        if(user != null)
        {
            HttpSession session = request.getSession();
            session.setAttribute("login", user);
            response.sendRedirect("Invent_form.jsp");
        }
        
        else
        {
			//PrintWriter out = null;
			//out.println("User not found");
			response.getWriter().append("User not found");
        }
	}

}
