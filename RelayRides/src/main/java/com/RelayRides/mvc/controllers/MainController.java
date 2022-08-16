package com.RelayRides.mvc.controllers;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.RelayRides.mvc.services.BookingService;
import com.RelayRides.mvc.services.FileService;
import com.RelayRides.mvc.services.ListingService;
import com.RelayRides.mvc.services.UserService;
import com.RelayRides.mvc.models.Listing;
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
	
	SimpleDateFormat outputFormatter = new SimpleDateFormat("MM/dd/yyyy");
	
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
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	// log out user
    	session.setAttribute("userId", null);
    	// redirect to login page
    	return "redirect:/";
    }
    
    @GetMapping("/listing/new")
    public String newListing(Model model, HttpSession session, @ModelAttribute("listing") Listing listing) {
    	
    	User user = userService.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	return "newListing.jsp";
    }
    
    @PostMapping("/listing/create")
    public String createListing(
    		@Valid @ModelAttribute("listing") Listing listing,
    		BindingResult result,
    		//RedirectAttributes redirectAttributes,
    		Model model,
    		@RequestParam("file") MultipartFile file) {
    	
    	if(result.hasErrors()) {
    		model.addAttribute("listing", listing);
    		return "newListing.jsp";
    	}

		this.fileService.save(file);
		listing.setImageUrl("uploads/" + file.getOriginalFilename());
    	
		//booking.setFormattedStartDate(outputFormatter.format(booking.getCreatedOn()));
		//booking.setFormattedStartDate(outputFormatter.format(booking.getCreatedOn()));
    	//System.out.println("Simple date: " + listing.getSimpleDate());
    	
    	this.listingService.createListing(listing);
    	
    	//redirectAttributes.addFlashAttribute("message", "gallery piece added");
    	
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/listing/edit/{id}")
    public String editGalleryPiece(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	Listing listing = listingService.findById(id);
    	model.addAttribute("listing", listing);
    	
    	return "editListing.jsp";
    }
    
    @PutMapping("/listing/edit/{id}")
    public String updateListing(
    		@Valid @ModelAttribute("listing") Listing listing, 
    		BindingResult result,
    		Model model,
    		@RequestParam("file") MultipartFile file) {
    	System.out.println("listing: " + listing.getId());
    	
    	if(result.hasErrors()) {
    		return "editListing.jsp";
    	}
    	
    	if( !file.isEmpty()) {
    		this.fileService.save(file);
    		listing.setImageUrl("uploads/" + file.getOriginalFilename());
        	System.out.println("New URL: " + listing.getImageUrl());
    	}
    	
    	//listing.setSimpleDate(outputFormatter.format(listing.getCreatedOn()));
    	
    	listingService.updateListing(listing);
    	return "redirect:/dashboard";
    }
    
    @DeleteMapping("/listing/delete/{id}")
    public String deleteListing(@PathVariable("id") Long id) {
        listingService.deleteListing(id);
        return "redirect:/dashboard";
    }
    
    @GetMapping("/listings")
    public String browseRentals(HttpSession session, Model model) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}

    	// get userId from session to cast to Long; session.getAttribute("userId") returns an object
    	model.addAttribute("listings", listingService.getAllListings());
    	
    	return "browseListings.jsp";
    }
	
}
