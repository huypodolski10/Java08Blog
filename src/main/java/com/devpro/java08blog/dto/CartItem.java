/*
 *@author Admin
 *@date May 27, 2020
*/
package com.devpro.java08blog.dto;

import java.math.BigDecimal;

public class CartItem {
	private Integer motorbikeID;
	private String name;
	private BigDecimal price;
	private Integer quantity;

	public Integer getMotorbikeID() {
		return motorbikeID;
	}

	public void setMotorbikeID(Integer motorbikeID) {
		this.motorbikeID = motorbikeID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}
