/*
 *@author Admin
 *@date May 17, 2020
*/
package com.devpro.java08blog.dto;

import java.math.BigDecimal;

public class MotorbikeDto {
	private String name;
	private String brand;
	private BigDecimal price;
	private BigDecimal RegistrationTax;
	private BigDecimal licenseFee;
	private BigDecimal civilInsurance;
	private Integer categoryID;

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
		return RegistrationTax;
	}

	public void setRegistrationTax(BigDecimal registrationTax) {
		RegistrationTax = registrationTax;
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

	public void setCivilInsuarance(BigDecimal civilInsurance) {
		this.civilInsurance = civilInsurance;
	}

	public Integer getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}
}
