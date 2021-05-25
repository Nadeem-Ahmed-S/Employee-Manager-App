package com.project.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="manager")
public class Manager {
	
	@Id
	@GeneratedValue
	private int mId;
	private String mName;
	private String mLocation;
	private String mUserName;
	private String mPassword;
	@Transient
	private String confirmPassword;
	
	@OneToMany(mappedBy = "manager",cascade = CascadeType.ALL) 
	private Set<Employee> employees;

	public Manager() {
		super();
	}

	public Manager(int mId, String mName, String mLocation, String mUserName, String mPassword, String confirmPassword,
			Set<Employee> employees) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mLocation = mLocation;
		this.mUserName = mUserName;
		this.mPassword = mPassword;
		this.confirmPassword = confirmPassword;
		this.employees = employees;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmLocation() {
		return mLocation;
	}

	public void setmLocation(String mLocation) {
		this.mLocation = mLocation;
	}

	public String getmUserName() {
		return mUserName;
	}

	public void setmUserName(String mUserName) {
		this.mUserName = mUserName;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Set<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

	
	
}