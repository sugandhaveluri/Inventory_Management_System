package com.virtusa_Inventory_delivery.crud;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Edit_Good_Servlet
 */
public class Edit_Good_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit_Good_Servlet() {
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
		//System.out.println(pid);
		String pName=request.getParameter("pName");
		//System.out.println(pName);
		String pDamaged=request.getParameter("pDamaged");
		//System.out.println(pDamaged);
		String pPerishable=request.getParameter("pPerishable");
		//System.out.println(pPerishable);
		String pCategory=request.getParameter("pCategory");
		//System.out.println(pCategory);
		String pDLid=request.getParameter("pDLid");
		//System.out.println(pDLid);
		String DLdate=request.getParameter("DLdate");
		//System.out.println(DLdate);
		String file=request.getParameter("IntFile");
		String IntFile = "files/" + file;
		//System.out.println(IntFile);
		
		goods gd = new goods();
		

		gd.setPid(pid);
		gd.setProductName(pName);
		//System.out.println(gd.getProductName());
		gd.setDamaged(pDamaged);
		gd.setPerishable(pPerishable);
		gd.setProCat(pCategory);
		gd.setpDLid(pDLid);
		gd.setDLdate(DLdate);
		gd.setIntFile(IntFile);
		try {
			GoodsDao gd_dao=new GoodsDao(ConnectionDao.getConnection());
			if(gd_dao.updateGoods(gd))
			{
				response.sendRedirect("Invent_form.jsp");
			}
			else {
				response.getWriter().append("user not found");
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		

		
	}

}
