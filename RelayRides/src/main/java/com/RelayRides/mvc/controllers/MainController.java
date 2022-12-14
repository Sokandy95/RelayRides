package com.RelayRides.mvc.controllers;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.RelayRides.mvc.models.Booking;
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

	//format date for customer view
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
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		System.out.println("Password: " + newUser.getPassword());

		User user = userService.register(newUser, result);

		if (result.hasErrors()) {
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
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
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

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		// get userId from session to cast to Long; session.getAttribute("userId")
		// returns an object
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findById(userId);
		model.addAttribute("user", userService.findById(userId));
		model.addAttribute("listings", listingService.findAllByUser(user));
		model.addAttribute("bookings", bookingService.findAllByUser(user));
		model.addAttribute("allBookings", bookingService.getAllBookings());

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
	public String newListing(
			Model model, 
			HttpSession session, 
			@ModelAttribute("listing") Listing listing
			) {

		User user = userService.findById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		System.out.println("User object: " + user);
		System.out.println(user.getId());

		return "newListing.jsp";
	}

	@PostMapping("/listing/create")
	public String createListing(
			@Valid @ModelAttribute("listing") Listing listing,
			@ModelAttribute("user") User user,
			BindingResult result,
			// RedirectAttributes redirectAttributes,
			Model model, 
			@RequestParam("file") MultipartFile file) {

		if (result.hasErrors()) {
			model.addAttribute("user", user);
			model.addAttribute("listing", listing);
			return "newListing.jsp";
		}

		this.fileService.save(file);
		listing.setImageUrl("uploads/" + file.getOriginalFilename());

		//booking.setFormattedStartDate(outputFormatter.format(booking.getCreatedOn()));
		//booking.setFormattedStartDate(outputFormatter.format(booking.getCreatedOn()));
    	//System.out.println("Simple date: " + listing.getSimpleDate());
    	
    	this.listingService.createListing(listing);
    	
    	return "redirect:/dashboard";
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
    
    @GetMapping("/listing/delete/{id}")
    public String deleteListing(@PathVariable("id") Long id) {
        listingService.deleteListing(id);
        return "redirect:/dashboard";
    }

	@GetMapping("/profile")
	public String profile(HttpSession session, Model model){
		User user = userService.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("updateUser", user);
    	
		
		return "profile.jsp";
	}
	@PostMapping("/profile")
	public String upProfile(HttpSession session, 
			@RequestParam("username")String username,
			@RequestParam("myBio")String myBio, @RequestParam("file") MultipartFile file) {
		User user = userService.findById((Long)session.getAttribute("userId"));
		if( !file.isEmpty()) {
    		this.fileService.save(file);
    		user.setImageUrl("uploads/" + file.getOriginalFilename());
        	System.out.println("New URL: " + user.getImageUrl());
    	}
		userService.updateProfile(user, username, myBio);
		
		
		return "redirect:/dashboard";
		
	}

	@GetMapping("/listing/edit/{id}")
	public String editListing(Model model, @PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Listing listing = listingService.findById(id);
		model.addAttribute("listing", listing);

		return "editListing.jsp";
	}
    
    @GetMapping("/listings")
    public String browseRentals(HttpSession session, Model model) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}

    	// get userId from session to cast to Long; session.getAttribute("userId") returns an object
    	model.addAttribute("listings", listingService.getAllListings());
    	model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
    	
    	return "browseListings.jsp";
    }
    
    @GetMapping("/listing/{id}")
    public String viewRental(HttpSession session, Model model, @PathVariable("id") Long id) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
    	
    	System.out.println("listing id: " + id);
    	System.out.println("userId: " + session.getAttribute("userId"));

    	// get userId from session to cast to Long; session.getAttribute("userId") returns an object
    	model.addAttribute("listing", listingService.findById(id));
    	Listing listing = listingService.findById(id);
    	
    	return "viewListing.jsp";
	}
    
    @GetMapping("/listing/reserve/{id}")
    public String makeReservation(HttpSession session, Model model, @PathVariable("id") Long id, @ModelAttribute("booking") Booking booking) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}

    	// get userId from session to cast to Long; session.getAttribute("userId") returns an object
    	model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
    	model.addAttribute("listing", listingService.findById(id));
    	model.addAttribute("booking", new Booking());
    	
    	return "newBooking.jsp";
    }
    
    @PostMapping("/booking/create")
    public String createBooking(
    		@ModelAttribute("listing") Listing listing,
    		@Valid @ModelAttribute("booking") Booking booking,
    		BindingResult result,
    		Model model,
    		HttpSession session) {
    	
    	if(result.hasErrors()) {
    		model.addAttribute("booking", booking);
        	model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
    		return "newBooking.jsp";
    	}
    	
    	booking.setFormattedStartDate(outputFormatter.format(booking.getStart_date()));
    	System.out.println("Simple start date: " + booking.getFormattedStartDate());
    	
    	booking.setFormattedEndDate(outputFormatter.format(booking.getEnd_date()));
    	System.out.println("Simple end date: " + booking.getFormattedEndDate());
    	
    	this.bookingService.createBooking(booking);
    	
    	//redirectAttributes.addFlashAttribute("message", "gallery piece added");
    	
    	return "redirect:/dashboard";
    }
    
	@GetMapping("/booking/owner/edit/{bookingId}")
	public String ownerEditBooking(
			Model model,
			@PathVariable("bookingId") Long bookingId,
			HttpSession session
			) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Booking booking = bookingService.findById(bookingId);
		model.addAttribute("booking", booking);

		return "ownerEditBooking.jsp";
	}
	
	@GetMapping("/booking/customer/edit/{bookingId}")
	public String customerEditBooking(
			Model model, 
			@PathVariable("bookingId") Long bookingId, 
			HttpSession session
			) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		Booking booking = bookingService.findById(bookingId);
		model.addAttribute("booking", booking);

		return "customerEditBooking.jsp";
	}
    
    @PutMapping("/booking/owner/edit/{id}")
    public String updateOwnerBooking(
    		@Valid @ModelAttribute("booking") Booking booking, 
    		BindingResult result,
    		Model model) {
    	
    	if(result.hasErrors()) {
    		model.addAttribute("booking", booking);
    		return "ownerEditBooking.jsp";
    	}
    	
    	System.out.println("new booking status: " + booking.getStatus());
    	
    	booking.setFormattedStartDate(outputFormatter.format(booking.getStart_date()));
    	System.out.println("Simple start date: " + booking.getFormattedStartDate());
    	
    	booking.setFormattedEndDate(outputFormatter.format(booking.getEnd_date()));
    	System.out.println("Simple end date: " + booking.getFormattedEndDate());
    	
    	bookingService.updateBooking(booking);
    	return "redirect:/dashboard";
    }
    
    @PutMapping("/booking/customer/edit/{id}")
    public String updateBooking(
    		@Valid @ModelAttribute("booking") Booking booking, 
    		BindingResult result,
    		Model model) {
    	
    	if(result.hasErrors()) {
    		model.addAttribute("booking", booking);
    		return "customerEditBooking.jsp";
    	}
    	
    	System.out.println("new booking status: " + booking.getStatus());
    	
    	booking.setFormattedStartDate(outputFormatter.format(booking.getStart_date()));
    	System.out.println("Simple start date: " + booking.getFormattedStartDate());
    	
    	booking.setFormattedEndDate(outputFormatter.format(booking.getEnd_date()));
    	System.out.println("Simple end date: " + booking.getFormattedEndDate());
    	
    	bookingService.updateBooking(booking);
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/booking/delete/{id}")
    public String deleteBooking(@PathVariable("id") Long id) {
        bookingService.deleteBooking(id);
        return "redirect:/dashboard";
    }
	

}
