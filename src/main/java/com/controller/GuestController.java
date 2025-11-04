package com.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.UserEntity;

import com.repository.UserRepository;


 
@Controller
public class GuestController {
	
	
	@Autowired
	UserRepository userRepositary;

	
	@GetMapping("/")
	public String root () {
		return "Welcome";
	}
	
	@GetMapping("login")
	 public String login() {
		return "Login"; 
	}


	
	@PostMapping("authentication")
	public String authentication(String email,String password) {

	    Optional<UserEntity> op =  userRepositary.findByEmail(email);

	    if (op.isPresent()) {
	        UserEntity user = op.get();

	        
	        if (user.getPassword().equals(password)) {
	        	if(user.getRole().equals("Faculty")) {
	        		
	        		return "redirect:/facultyDashboard";
	        	} 
	        	}
	        }

	          return "Login"  ;
	    }


	
	@GetMapping("logout")
	public String logout() {
		return "Login";
	}
	
	
	
	}
	
