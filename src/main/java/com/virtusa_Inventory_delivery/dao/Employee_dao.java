package com.virtusa_Inventory_delivery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.virtusa_Inventory_delivery.model.Employee;

public class Employee_dao 
{
		
	Connection con ;
    public Employee_dao(Connection con) 
    {
        this.con = con;
    }
    
    // User Login
    public Employee login(String email, String pass)
    {
    	Employee usr=null;
        try
        {
            String query ="select * from login where username=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next())
            {
                usr = new Employee();
                usr.setUsername(rs.getString("username"));
                usr.setPassword(rs.getString("password"));
                
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return usr;
    }
    
    public Employee Delivery_login(String email, String pass)
    {
    	Employee usr=null;
        try
        {
            String query ="select * from employees.Delivery_Login where username=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next())
            {
                usr = new Employee();
                usr.setUsername(rs.getString("username"));
                usr.setPassword(rs.getString("password"));
                
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return usr;
    }


}
