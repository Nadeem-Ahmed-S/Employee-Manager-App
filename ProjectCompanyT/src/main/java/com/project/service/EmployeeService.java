package com.project.service;

import java.util.List;

import com.project.model.Employee;
import com.project.model.Manager;


public interface EmployeeService {
	
	Manager authenticateUser(Manager manager);
	List<Employee> getAllEmployees();
	 void hireEmployee(int eid, int mid); 
	 List<Employee> getMyEmployees(int mid);
	
}
