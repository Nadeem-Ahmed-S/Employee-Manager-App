package com.project.service;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EmployeeRepo;
import com.project.dao.ManagerRepo;
import com.project.model.Employee;
import com.project.model.Manager;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	
	  @Autowired 
	  SessionFactory sessionFactory;
	 
	
	@Autowired
	private ManagerRepo managerRepo;
	
	@Autowired
	private EmployeeRepo employeeRepo;
	
	@Override
	public Manager authenticateUser(Manager manager) {
		Manager managerCheck = managerRepo.findBymUserName(manager.getmUserName());
		Manager manager2 = null;
		if(managerCheck != null)
		{
			if(managerCheck.getmUserName().equals(manager.getmUserName()))
			{
				if(managerCheck.getmPassword().equals(manager.getmPassword()))
				{
					manager2 = new Manager();
					manager2 = managerCheck;
				}
				else 
				{
					manager2 =null;
				}
			}
			else 
			{
				manager2 =null;
			}
		}
		return manager2;
	}

	@Override
	public List<Employee> getAllEmployees() {
		List<Employee> employees = (List<Employee>) employeeRepo.findAll();
		return employees;
	}

	
	  @Override 
	  public void hireEmployee(int eid, int mid) 
	  { 
		  Employee employee = employeeRepo.findById(eid).orElse(null);
		  Manager manager = managerRepo.findById(mid).orElse(null);
		  employee.setManager(manager);
		  employeeRepo.save(employee);
	  }
	 

	  @Override
		public List<Employee> getMyEmployees(int mid) {
		  List<Employee> employees1 = (List<Employee>) employeeRepo.findAll();
		  List<Employee> employees = new ArrayList<>();
			for (Employee employee : employees1) {
				if(employee.getManager() != null) {
					if(employee.getManager().getmId() == mid)
					{
						employees.add(employee);
					}
				}
			}
			return employees;
		}

}
