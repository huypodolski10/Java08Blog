/*
 *@author Admin
 *@date Mar 9, 2020
*/
package com.devpro.java08blog.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tblinvoice")
public class Invoice extends BaseEntity {

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "phone_number", length = 20, nullable = false)
	private String phoneNumber;

	@Column(name = "email", length = 45, nullable = false)
	private String email;

	@Column(name = "plan_date", nullable = false)
	private Date planDate;

	@Column(name = "location", length = 45, nullable = false)
	private String location;

	@Lob
	@Column(name = "note", columnDefinition = "text")
	private String note;

	@Column(name = "customer_id")
	private Integer customerId;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "tbl_motorbike_invoice", joinColumns = @JoinColumn(name = "invoice_id"), inverseJoinColumns = @JoinColumn(name = "motorbike_id"))
	private List<Motorbike> motorbikes = new ArrayList<>();
	
	public void addMotorbike(Motorbike...motorbikes) {
		for(Motorbike motorbike : motorbikes) {
			motorbike.getInvoices().add(this);
			this.motorbikes.add(motorbike);
		}
	}
	
	public void removeMotorbike(Motorbike motorbike) {
		motorbikes.remove(motorbike);
		motorbike.getInvoices().remove(this);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public List<Motorbike> getMotorbikes() {
		return motorbikes;
	}

	public void setMotorbikes(List<Motorbike> motorbikes) {
		this.motorbikes = motorbikes;
	}
}
