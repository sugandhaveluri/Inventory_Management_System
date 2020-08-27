package com.virtusa_Inventory_delivery.crud;

public class delivery {
	int pid;
	String cName;
	String pDelivered;
	String dStatus;
	
	public delivery()
	{
	}

	public delivery(int pid, String cName, String pDelivered, String dStatus) {
		super();
		this.pid = pid;
		this.cName = cName;
		this.pDelivered = pDelivered;
		this.dStatus = dStatus;
	}

	public delivery(String cName, String pDelivered, String dStatus) {
		super();
		this.cName = cName;
		this.pDelivered = pDelivered;
		this.dStatus = dStatus;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getpDelivered() {
		return pDelivered;
	}

	public void setpDelivered(String pDelivered) {
		this.pDelivered = pDelivered;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}
	

	

}

