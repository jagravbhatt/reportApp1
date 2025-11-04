package com.controller;
import com.repository.UserRepository;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.UserEntity;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;
	
    @GetMapping("newuser")   
    public String newuser() {
        return "NewUser";   
    }
    
    
    @PostMapping("saveuser")
    public String saveUser(@ModelAttribute UserEntity userEntity) {

    	userRepository.save(userEntity);
    	System.out.println("hi");
        return "redirect:/listusers";        
    }
    
    @GetMapping("listusers")
    public String listUser(Model model) {
        List<UserEntity> userList = userRepository.findAll();
        model.addAttribute("userList", userList);
        System.out.println("list user ");
        return "listuser";
    }

    
    @GetMapping("liststudents")
    public String listStudent(Model model) {
        List<UserEntity> studentList = userRepository.findByRole("Student");
        model.addAttribute("studentList", studentList);
        return "ListStudent";
    }
    @GetMapping("listfaculty")
    public String listFaculty(Model model) {
        List<UserEntity> userList = userRepository.findByRole("Faculty");
        model.addAttribute("userList", userList);
        return "ListFaculty";
    }

    @GetMapping("dashboard")
    public String dashboard() {
        return "AdminDashboard";
    }	

    @GetMapping("edituser")
    public String editUser(@RequestParam("userId") Integer userId, Model model) {
        UserEntity user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id: " + userId));
        model.addAttribute("user", user);
        return "UpdateUser";  
    }

	
    @PostMapping("updateuser")
    public String updateUser(@ModelAttribute UserEntity userEntity) {
        userRepository.save(userEntity);  
        return "redirect:/listusers";      
    }

    @GetMapping("deleteuser")
    public String deleteUser(@RequestParam("userId") Integer userId) {
        
        UserEntity user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id: " + userId));

        userRepository.delete(user); 
        return "redirect:/deleteUser"; 
    }
   
    
    
}
    
