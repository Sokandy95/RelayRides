package com.RelayRides.mvc.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "bookings")
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "Please enter a start date for your booking.")
	private Date start_date;

	@NotEmpty(message = "Please enter an end date for your booking.")
	private Date end_date;
	
	private int numDays;
	private float price;
	
	private String formattedStartDate;
	private String formattedEndDate;

	private Date created_at;
	private Date updated_at;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "listing_id")
	private Listing listing;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	public Booking() {
	}

	@PrePersist
	protected void onCreate() {
		this.created_at = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updated_at = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public int getNumDays() {
		return numDays;
	}

	public void setNumDays(int numDays) {
		this.numDays = numDays;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getFormattedStartDate() {
		return formattedStartDate;
	}

	public void setFormattedStartDate(String formattedStartDate) {
		this.formattedStartDate = formattedStartDate;
	}

	public String getFormattedEndDate() {
		return formattedEndDate;
	}

	public void setFormattedEndDate(String formattedEndDate) {
		this.formattedEndDate = formattedEndDate;
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

	public Listing getListing() {
		return listing;
	}

	public void setListing(Listing listing) {
		this.listing = listing;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
