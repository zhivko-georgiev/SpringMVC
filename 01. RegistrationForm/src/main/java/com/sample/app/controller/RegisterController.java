package com.sample.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.app.model.User;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class RegisterController {
 
    @RequestMapping(method = RequestMethod.GET)
    public String showRegisterForm(Model model) {
        User userForm = new User();    
        model.addAttribute("registerForm", userForm);
         
        return "registerPage";
    }
     
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("registerForm") User user) {
 
    	return "registrationSuccess";
    }
}