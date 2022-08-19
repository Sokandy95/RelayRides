package com.RelayRides.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.RelayRides.mvc.models.Listing;
import com.RelayRides.mvc.models.User;
import com.RelayRides.mvc.repositories.ListingRepository;

@Service
public class ListingService {

	@Autowired
	private ListingRepository listingRepository;

	public Iterable<Listing> getAllListings() {
		return listingRepository.findAll();
	}

	public Listing createListing(Listing listing) {
		return listingRepository.save(listing);
	}

	public Listing findById(Long id) {
		Optional<Listing> optionalListing = listingRepository.findById(id);
		if (optionalListing.isPresent()) {
			return optionalListing.get();
		}
		return null;
	}

	public Iterable<Listing> findByUser(User user) {
		return listingRepository.findAllByUser(user);
	}

	public Listing updateListing(Listing listing) {
		return listingRepository.save(listing);
	}

	public void deleteListing(Long id) {
		Optional<Listing> optionalListing = listingRepository.findById(id);
		if (optionalListing.isPresent()) {
			listingRepository.deleteById(id);
		}
	}

}
