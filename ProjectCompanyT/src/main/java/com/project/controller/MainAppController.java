package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.EmployeeRepo;
import com.project.dao.ManagerRepo;
import com.project.model.Employee;
import com.project.model.Manager;
import com.project.service.EmployeeService;

@Controller
public class MainAppController {
	
	@Autowired
	private ManagerRepo managerRepo;
	
	@Autowired
	private EmployeeRepo employeeRepo;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("index.jsp");
		return modelAndView;
	}

	@RequestMapping("/login")
	public ModelAndView login(Manager manager) {
		ModelAndView modelAndView = new ModelAndView("login.jsp");
		modelAndView.addObject(manager);
		return modelAndView;
	}
	
	@RequestMapping("/register")
	public ModelAndView register( Manager manager) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(manager);
		modelAndView.setViewName("register.jsp");
		return modelAndView;
	}

	@RequestMapping("/saveRegister")
	public ModelAndView saveRegister(@ModelAttribute Manager manager) {
		Manager managerCheck = managerRepo.findBymUserName(manager.getmUserName());
		if(managerCheck == null) 
		{
			managerRepo.save(manager);
			return new ModelAndView("login.jsp", "registered", "Registration Success");
		}
		else
		{
			return new ModelAndView("register.jsp", "registered", "UserName already Taken!");
		}
	}
	
	@RequestMapping("/authenticateUser")
	public ModelAndView authenticateUser(HttpServletRequest req,@ModelAttribute Manager manager) {
		Manager manager1 = employeeService.authenticateUser(manager);
		if(manager1 == null)
		{
			return new ModelAndView("login.jsp","registered","Bad Credentials");	
		}
		else
		{
			req.getSession().setAttribute("managerID", manager1.getmId());
			return new ModelAndView("redirect:/home");		
		}
	}
	
	@RequestMapping("/home")
	public ModelAndView home(@ModelAttribute Employee employee) {
		return new ModelAndView("home.jsp","employees",employeeService.getAllEmployees());
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(@ModelAttribute Manager manager) {
		return new ModelAndView("login.jsp","registered","Please Login");
	}
	
	@RequestMapping("/addEmployee")
	public ModelAndView addEmployee() {
		return new ModelAndView("addEmployee.jsp","employee",new Employee());
	}
	
	@RequestMapping("/hireEmployee")
	public ModelAndView hireEmployee(HttpServletRequest req) {
		System.out.println("Hired");
		int mid = (Integer) req.getSession().getAttribute("managerID");
		int eid = Integer.parseInt(req.getParameter("eId"));
		employeeService.hireEmployee(eid, mid);
		return new ModelAndView("redirect:/home");	
	}
	
	@RequestMapping("/saveEmployee")
	public ModelAndView saveEmployee(@ModelAttribute Employee employee) {
		employeeRepo.save(employee);
		return new ModelAndView("redirect:/home");
	}
	
	@RequestMapping("/myEmployees")
	public ModelAndView myEmployees(HttpServletRequest req) {
		int mid = (Integer) req.getSession().getAttribute("managerID");
		List<Employee> employees = employeeService.getMyEmployees(mid);
		return new ModelAndView("myEmployees.jsp","employees", employees);
	}
}
