package com.RelayRides.mvc.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.RelayRides.mvc.models.Booking;

@Repository
public interface BookingRepository extends CrudRepository <Booking, Long>{
	Optional<Booking> findById(Long id);
	Iterable<Booking> findAllById(Booking id);
	void deleteById(Long id);
}
