package com.RelayRides.mvc.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.RelayRides.mvc.models.Booking;
import com.RelayRides.mvc.models.Listing;
import com.RelayRides.mvc.models.User;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Long> {
	Optional<Booking> findById(Long id);

	Iterable<Booking> findAllById(Booking id);

	Iterable<Booking> findAllByUser(User user);

	Iterable<Booking> findAllByListing(Listing listing);

	void deleteById(Long id);
}