package com.RelayRides.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.RelayRides.mvc.services.BookingService;
import com.RelayRides.mvc.services.FileService;
import com.RelayRides.mvc.services.ListingService;
import com.RelayRides.mvc.services.UserService;
import com.RelayRides.mvc.models.LoginUser;
import com.RelayRides.mvc.models.User;

@Controller
public class MainController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private ListingService listingService;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/")
	public String homePage() {
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		
        // Bind empty User and LoginUser objects to the JSP to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	
}
