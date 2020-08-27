package com.virtusa_Inventory_delivery.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database_Connection 
{
	private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees","root","#SumaSuresh@995");
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }

}
