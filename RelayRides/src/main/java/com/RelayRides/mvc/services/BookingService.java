package com.RelayRides.mvc.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.RelayRides.mvc.models.Booking;
import com.RelayRides.mvc.models.Listing;
import com.RelayRides.mvc.models.User;
import com.RelayRides.mvc.repositories.BookingRepository;

@Service
public class BookingService {

	@Autowired
	private BookingRepository bookingRepository;

	public Iterable<Booking> getAllBookings() {
		return bookingRepository.findAll();
	}

	public Booking createBooking(Booking booking) {
		return bookingRepository.save(booking);
	}

	public Booking findById(Long id) {
		Optional<Booking> optionalBooking = bookingRepository.findById(id);
		if (optionalBooking.isPresent()) {
			return optionalBooking.get();
		}
		return null;
	}

	public Iterable<Booking> findByUser(User user) {
		return bookingRepository.findAllByUser(user);
	}

	public Iterable<Booking> findByListing(Listing listing) {
		return bookingRepository.findAllByListing(listing);
	}

	public Booking updateBooking(Booking booking) {
		return bookingRepository.save(booking);
	}

	public void deleteBooking(Long id) {
		Optional<Booking> optionalBooking = bookingRepository.findById(id);
		if (optionalBooking.isPresent()) {
			bookingRepository.deleteById(id);
		}
	}

}
