package com.virtusa_Inventory_delivery.crud;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeliveryDao {
	Connection con;
	public DeliveryDao(Connection con)
	{
		this.con=con;
	}
	
	public boolean addDeliveryStatus(delivery dd)
	{
		boolean test=false;
		String query="insert into employees.delivery_status (pid,cName,pDelivered,dStatus) values(?,?,?,?)";
		 try {
			 PreparedStatement pst = this.con.prepareStatement(query);
			 pst.setInt(1,dd.getPid());
			 
			 pst.setString(2,dd.getcName());
			 pst.setString(3,dd.getpDelivered());
			 
			 pst.setString(4,dd.getdStatus());			 
			 pst.executeUpdate();
			 test=true;
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return test;
		 
	}
	

}
