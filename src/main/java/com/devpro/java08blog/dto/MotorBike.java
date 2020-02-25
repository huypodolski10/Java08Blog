/*
 *@author Admin
 *@date Feb 25, 2020
*/
package com.devpro.java08blog.dto;

public class MotorBike extends Product{
	private static final long serialVersionUID = -4333225112574988800L;
	
	private String motorType;

	public MotorBike(String productName, String productImgUrl, String motorType) {
		super(productName, productImgUrl);
		this.motorType = motorType;
	}

	public String getMotorType() {
		return motorType;
	}

	public void setMotorType(String motorType) {
		this.motorType = motorType;
	}
}
