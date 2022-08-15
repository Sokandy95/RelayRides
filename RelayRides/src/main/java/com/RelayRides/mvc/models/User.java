package com.RelayRides.mvc.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Username is required!")
	@Size(min = 6, max = 30, message = "Username must be between 6-30 characters long!")
	private String username;
	
	@NotEmpty(message = "First name is required!")
	@Size(min = 2, max = 20, message = "First name must be between 2-20 characters long!")
	private String first_name;
	
	@NotEmpty(message = "Last name is required!")
	@Size(min = 2, max = 20, message = "Last name must be between 2-20 characters long!")
	private String last_name;

	@NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email.")
    private String email;
	
    @NotEmpty(message="password is required!")
    @Size(min=8, max=128, message="password must be between 8 and 128 characters")
    private String password;
	
	@Transient
	@NotEmpty(message = "Confirm password is required!")
    @Size(min=8, max=128, message="confirm password must be between 8 and 128 characters")
	private String confirmPW;
	
	private Date created_at;
	private Date updated_at;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Listing> listings;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Booking> bookings;
	
	public User() {}

    @PrePersist
    protected void onCreate(){
        this.created_at = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updated_at = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPW() {
		return confirmPW;
	}

	public void setConfirmPW(String confirmPW) {
		this.confirmPW = confirmPW;
	}

	public List<Listing> getListings() {
		return listings;
	}

	public void setListings(List<Listing> listings) {
		this.listings = listings;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}
	
	
}
