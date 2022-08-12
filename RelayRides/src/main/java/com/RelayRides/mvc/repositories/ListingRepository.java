package com.RelayRides.mvc.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.RelayRides.mvc.models.Listing;

@Repository
public interface ListingRepository extends CrudRepository<Listing, Long>{
	Optional<Listing> findById(Long id);
	Iterable<Listing> findAllById(Listing id);
	void deleteById(Long id);
}
