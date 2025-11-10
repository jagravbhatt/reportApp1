package com.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.UserEntity;
import com.repository.UserRepository;

@Controller
public class GuestController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String root() {
        return "Welcome"; // must have Welcome.jsp in /WEB-INF/views/
    }

    @GetMapping("/login")
    public String login() {
        return "Login";
    }

    @PostMapping("/authentication")
    public String authentication(String email, String password) {

        Optional<UserEntity> optionalUser = userRepository.findByEmail(email);

        if (optionalUser.isPresent()) {
            UserEntity user = optionalUser.get();

            if (user.getPassword().equals(password)) {
                // Redirect based on role
                switch (user.getRole().toLowerCase()) {
                    case "faculty": return "redirect:/facultyDashboard";
                    case "student": return "redirect:/studentDashboard";
                    case "admin":   return "redirect:/dashboard";
                }
            }
        }
        return "Login"; // failed
    }

    @GetMapping("/logout")
    public String logout() {
        return "Login";
    }
}
