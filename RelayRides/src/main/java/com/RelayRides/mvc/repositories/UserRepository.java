package com.RelayRides.mvc.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.RelayRides.mvc.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	Optional<User> findByUsername(String username);

	Optional<User> findByEmail(String email);

	Optional<User> findById(Long id);

	Iterable<User> findAllById(User id);

	void deleteById(Long id);
}
