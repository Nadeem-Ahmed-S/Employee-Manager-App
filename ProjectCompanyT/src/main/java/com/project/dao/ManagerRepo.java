package com.project.dao;

import org.springframework.data.repository.CrudRepository;

import com.project.model.Manager;

public interface ManagerRepo extends CrudRepository<Manager, Integer> {

	Manager findBymUserName(String string);
	
}
