package com.project.dao;

import org.springframework.data.repository.CrudRepository;

import com.project.model.Employee;

public interface EmployeeRepo extends CrudRepository<Employee, Integer> {

	Employee findByeName(String eName);
	
	

}
