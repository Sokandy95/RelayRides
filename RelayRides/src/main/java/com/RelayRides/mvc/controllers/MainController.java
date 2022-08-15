package com.RelayRides.mvc.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
		
        // Bind empty User and LoginUser objects to the JSP to capture form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
		
		System.out.println("Password: " + newUser.getPassword());
        
        User user = userService.register(newUser, result);
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
    		System.out.println("Password: " + newUser.getPassword());
            return "login.jsp";
        }
        
        // Store ID from the DB in session,
        session.setAttribute("userId", user.getId());
        // in other words, log them in
    
        return "redirect:/dashboard";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = userService.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login.jsp";
        }
    
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
    
        return "redirect:/dashboard";
    }
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
    	
    	// get userId from session to cast to Long; session.getAttribute("userId") returns an object
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userService.findById(userId));
    	model.addAttribute("listings", listingService.getAllListings());
    	model.addAttribute("bookings", bookingService.getAllBookings());
    	
    	return "dashboard.jsp";
    	
    }
	
}
