package com.RelayRides.mvc.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "listings")
public class Listing {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Make/Model is required!")
	@Size(min = 5, max = 20, message = "Make/Model must be between 5-20 characters long!")
	private String model;
	
	@NotEmpty(message = "Locationl is required!")
	@Size(min = 5, max = 30, message = "Location must be between 5-30 characters long!")
	private String location;
	
	@NotEmpty(message = "Please enter the daily rate!")
	private Float rate;
	
	@NotEmpty(message = "Please enter how many seats your vehicle has!")
	private Integer seats;
	
	@NotEmpty(message = "Please let us know if your vehicle is on the market!")
	private Boolean on_market;
	
	@Size(min=10, max=300, message = "Description must be between 10-300 characters long!")
	private String description;
	
	private Date created_at;
	private Date updated_at;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Float getRate() {
		return rate;
	}

	public void setRate(Float rate) {
		this.rate = rate;
	}

	public Integer getSeats() {
		return seats;
	}

	public void setSeats(Integer seats) {
		this.seats = seats;
	}

	public Boolean getOn_market() {
		return on_market;
	}

	public void setOn_market(Boolean on_market) {
		this.on_market = on_market;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
