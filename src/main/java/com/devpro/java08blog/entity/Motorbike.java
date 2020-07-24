/*
 *@author Admin
 *@date Mar 4, 2020
*/
package com.devpro.java08blog.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tblmotorbike")
public class Motorbike extends BaseEntity {

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "brand", length = 45)
	private String brand;

	@Column(name = "price", precision = 13, scale = 2)
	private BigDecimal price;

	@Column(name = "registration_tax", precision = 13, scale = 2)
	private BigDecimal registrationTax;

	@Column(name = "license_fee", precision = 13, scale = 2)
	private BigDecimal licenseFee;

	@Column(name = "civil_insurance", precision = 13, scale = 2)
	private BigDecimal civilInsurance;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private Category category;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "motorbike")
	private List<Attachment> attachments = new ArrayList<>();

	public void addAttachment(Attachment... attachments) {
		for (Attachment attachment : attachments) {
			attachment.setMotorbike(this);
			this.attachments.add(attachment);
		}
	}

	public void removeAttachment(Attachment attachment) {
		this.attachments.remove(attachment);
		attachment.setMotorbike(null);
	}

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "motorbike")
	private List<Comment> comments = new ArrayList<>();

	public void addComment(Comment... comments) {
		for (Comment comment : comments) {
			comment.setMotorbike(this);
			this.comments.add(comment);
		}
	}
	
	@OneToOne(mappedBy = "motorbike")
	private Specifications specifications;

	public void removeComment(Comment comment) {
		this.comments.remove(comment);
		comment.setMotorbike(null);
	}

	@ManyToMany(mappedBy = "motorbikes")
	private List<Invoice> invoices = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getRegistrationTax() {
		return registrationTax;
	}

	public void setRegistrationTax(BigDecimal registrationTax) {
		this.registrationTax = registrationTax;
	}

	public BigDecimal getLicenseFee() {
		return licenseFee;
	}

	public void setLicenseFee(BigDecimal licenseFee) {
		this.licenseFee = licenseFee;
	}

	public BigDecimal getCivilInsurance() {
		return civilInsurance;
	}

	public void setCivilInsurance(BigDecimal civilInsurance) {
		this.civilInsurance = civilInsurance;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Invoice> getInvoices() {
		return invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}

	public Specifications getSpecifications() {
		return specifications;
	}

	public void setSpecifications(Specifications specifications) {
		this.specifications = specifications;
	}
}
