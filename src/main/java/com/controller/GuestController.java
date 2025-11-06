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
        return "Welcome";
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
                if ("Faculty".equalsIgnoreCase(user.getRole())) {
                    return "redirect:/facultyDashboard";
                } else if ("Student".equalsIgnoreCase(user.getRole())) {
                    return "redirect:/studentDashboard";
                } else if ("Admin".equalsIgnoreCase(user.getRole())) {
                    return "redirect:/dashboard";
                }
            }
        }

        // If authentication fails
        return "Login";
    }

    @GetMapping("/logout")
    public String logout() {
        return "Login";
    }
}
