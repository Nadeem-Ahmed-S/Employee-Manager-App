package com.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Employee {
	
	@Id
	@GeneratedValue
	private int eId;
	private String eName;
	private String eLocation;
	
	@ManyToOne
	@JoinColumn(name="manager_id")
	private Manager manager;

	public Employee() {
		super();
	}

	public Employee(int eId, String eName, String eLocation, Manager manager) {
		super();
		this.eId = eId;
		this.eName = eName;
		this.eLocation = eLocation;
		this.manager = manager;
	}

	public int geteId() {
		return eId;
	}

	public void seteId(int eId) {
		this.eId = eId;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String geteLocation() {
		return eLocation;
	}

	public void seteLocation(String eLocation) {
		this.eLocation = eLocation;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "Employee [eId=" + eId + ", eName=" + eName + ", eLocation=" + eLocation + ", manager=" + manager + "]";
	}
	
	
}
