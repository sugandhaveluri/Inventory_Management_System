package com.virtusa_Inventory_delivery.model;

public class Employee 
{
	String username;
	String password;
	
	public  Employee() 
    {
    }
    
   

    public  Employee(String username, String password) 
    {
        this.username = username;
        this.password = password;
    }
    
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	

}
