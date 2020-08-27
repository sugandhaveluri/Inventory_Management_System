package com.virtusa_Inventory_delivery.crud;



public class goods {
	int pid;
	String productName;
	//String Quantity;
	String Damaged;
	String Perishable;
	String proCat;
	String pDLid;
	String DLdate;
	String IntFile;
	
	
	
	public goods() {
		
	}
	public goods(int pid, String productName, String Damaged, String Perishable,  String proCat,
			String pDLid, String DLdate,String IntFile ) {
		
		this.pid = pid;
		this.productName = productName;
		this.Damaged = Damaged;
		this.Perishable = Perishable;
		
		this.proCat = proCat;
		this.pDLid = pDLid;
		this.DLdate = DLdate;
		this.IntFile = IntFile;
		
	}

	
	public goods(String productName, String Damaged, String Perishable, String proCat, String pDLid, String DLdate,String IntFile)
			 {
	
		this.productName = productName;
		this.Damaged = Damaged;
		this.Perishable = Perishable;
		
		this.proCat = proCat;
		this.pDLid = pDLid;
		this.DLdate = DLdate;
		this.IntFile = IntFile;
		
	}
	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getDamaged() {
		return Damaged;
	}


	public void setDamaged(String Damaged) {
		this.Damaged = Damaged;
	}


	public String getPerishable() {
		return Perishable;
	}


	public void setPerishable(String Perishable) {
		this.Perishable = Perishable;
	}


	

	public String getProCat() {
		return proCat;
	}


	public void setProCat(String proCat) {
		this.proCat = proCat;
	}


	public String getpDLid() {
		return pDLid;
	}


	public void setpDLid(String pDLid) {
		this.pDLid = pDLid;
	}


	public String getIntFile() {
		return IntFile;
	}


	public void setIntFile(String IntFile) {
		this.IntFile = IntFile;
	}


	public String getDLdate() {
		return DLdate;
	}


	public void setDLdate(String DLdate) {
		this.DLdate = DLdate;
	}
	@Override
	public String toString() {
		return "goods [pid=" + pid + ", productName=" + productName + ", Damaged=" + Damaged + ", Perishable="
				+ Perishable + ", proCat=" + proCat + ", pDLid=" + pDLid + ", DLdate=" + DLdate + ", IntFile=" + IntFile
				+ "]";
	}
	
	


	

		
}
