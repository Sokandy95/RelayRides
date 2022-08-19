package com.RelayRides.mvc.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.RelayRides.mvc.models.LoginUser;
import com.RelayRides.mvc.models.User;
import com.RelayRides.mvc.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User register(User newUser, BindingResult result) {

		Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());

		// Reject if username is taken (present in database)
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "An account with that email aready exists");
		}
		// Reject if password doesn't match confirmation
		if (!newUser.getPassword().equals(newUser.getConfirmPW())) {
			result.rejectValue("confirmPW", "Matches", "Confirm password must match password");
		}

		// Return null if result has errors
		if (result.hasErrors()) {
			return null;
		}

		// Hash and set password, save user to database
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepository.save(newUser);
	}

	public User login(LoginUser newLoginObject, BindingResult result) {

		Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());

		// Find user in the DB by email
		// Reject if NOT present
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "User not found");
			return null;
		}

		// User exists, retrieve from DB
		User user = potentialUser.get();

		System.out.println("new pwd: " + newLoginObject.getPassword());
		System.out.println("stored pwd: " + user.getPassword());

		// Reject if BCrypt password match fails
		if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "invalid Password");
		}

		// Return null if result has errors
		if (result.hasErrors()) {
			return null;
		}
		// Otherwise, return the user object
		return user;
	}

	public User findById(Long id) {
		Optional<User> potentialUser = userRepository.findById(id);
		if (potentialUser.isPresent()) {
			return potentialUser.get();
		} else {
			return null;
		}
	}

	public User updateUser(User user) {
		return userRepository.save(user);
	}

	public void deleteUser(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if (optionalUser.isPresent()) {
			userRepository.deleteById(id);
		}
	}
<<<<<<< HEAD
	public User updateProfile(User user, String username, String myBio) {
		user.setUsername(username);
		user.setMyBio(myBio);
		user.setConfirmPW("helloWorld");
		return userRepository.save(user);
	}
	
=======

>>>>>>> ff4c55077169841d7210b2ba1626cdfed661ce2c
}
