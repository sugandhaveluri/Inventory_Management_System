package com.virtusa_Inventory_delivery.crud;

import java.io.IOException;
/**
 * Servlet implementation class User_Login_Servlet
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddGoodServlet
 */

@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB

public class AddGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoodServlet() {
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
		String pName=request.getParameter("pName");
		
		String pDamaged=request.getParameter("pDamaged");
		String pPerishable=request.getParameter("pPerishable");
		
		String pCategory=request.getParameter("pCategory");
		String pDLid=request.getParameter("pDLid");
		String DLdate=request.getParameter("DLdate");
		Part IntFile_part = request.getPart("IntFile");
        String IntFile_filename = extractFileName(IntFile_part );
        String IntFile= "files" + "/" + IntFile_filename;
        //System.out.println(IntFile);
        System.out.println(DLdate);
        
       // Date DLdate=(Date)request.getParameter("DLdate");
        
		goods gd=new goods(pName,pDamaged,pPerishable,pCategory,pDLid, DLdate,IntFile);
		try {
			GoodsDao gddao=new GoodsDao(ConnectionDao.getConnection());
			if(gddao.addGoods(gd)) {
				response.sendRedirect("Invent_form.jsp");
			}
			else {
				response.getWriter().append("User not found");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
     * Extracts file name from HTTP header content-disposition
     */
    public String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
	
}
