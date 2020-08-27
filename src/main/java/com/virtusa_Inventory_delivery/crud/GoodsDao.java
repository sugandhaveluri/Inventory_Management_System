package com.virtusa_Inventory_delivery.crud;

import java.sql.Connection;

import java.sql.PreparedStatement;



public class GoodsDao {
	Connection con;
	public GoodsDao(Connection con)
	{
		this.con=con;
	}
	
	public boolean addGoods(goods good)
	{
		boolean test=false;
		String query="insert into employees.inventory (pName,pDamaged,pPerishable,pCategory,pDLid, DLdate,IntFile) values(?,?,?,?,?,?,?)";
		 try {
			 PreparedStatement pst = this.con.prepareStatement(query);
			 pst.setString(1,good.getProductName());
			 
			 pst.setString(2,good.getDamaged());
			 pst.setString(3, good.getPerishable());
			 
			 pst.setString(4,good.getProCat());
			 pst.setString(5,good.getpDLid());
			 pst.setString(6, good.getDLdate());
			 pst.setString(7,good.getIntFile());
			 
			 
			 pst.executeUpdate();
			 test=true;
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return test;
		 
	}
	
		public boolean updateGoods(goods gd) {
		// TODO Auto-generated method stub
			//System.out.println(gd_dao.getPid());
		goods gd_dao=gd;
		//System.out.println(gd_dao.getProductName());
		boolean flag=false;
		try {
		
		PreparedStatement ps=this.con.prepareStatement("update employees.inventory set pName=?,pDamaged=?,pPerishable=?,pCategory=?,pDLid=?,DLdate=?,IntFile=? where pid=?");
		//ps.setInt(8,pid);
		
		ps.setString(1,gd_dao.getProductName());
		ps.setString(2,gd_dao.getDamaged());
		ps.setString(3,gd_dao.getPerishable());
		ps.setString(4,gd_dao.getProCat());
		ps.setString(5,gd_dao.getpDLid());
		ps.setString(6,gd_dao.getDLdate());
		ps.setString(7, gd_dao.getIntFile());
		ps.setInt(8,gd_dao.getPid());
		
		ps.executeUpdate();
		flag=true;
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		//boolean check;
		return flag;
	}

	public void delete_Good(int pid) 
	{
		// TODO Auto-generated method stub
	
        try
        {
            
           String query= "delete from employees.inventory where pid = ? ";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, pid);
           pt.executeUpdate();
           
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();;
        }

    }
	
	

}
