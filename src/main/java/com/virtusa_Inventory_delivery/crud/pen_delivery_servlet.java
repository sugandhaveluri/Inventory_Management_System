package com.virtusa_Inventory_delivery.crud;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class pen_delivery_servlet
 */
public class pen_delivery_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pen_delivery_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession sss=request.getSession(false);
		int pid = (Integer)sss.getAttribute("pid");
		String cName=request.getParameter("cName");
		String pDelivered=request.getParameter("pDelivered");
		String dStatus=request.getParameter("dStatus");
		delivery dd=new delivery(pid,cName,pDelivered,dStatus);
		try {
			DeliveryDao ddDao=new DeliveryDao(ConnectionDao.getConnection());
			if(ddDao.addDeliveryStatus(dd)) {
				response.sendRedirect("pending_delivery.jsp");
			}
			else {
				response.getWriter().append("User not found");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
