/*
 *@author Admin
 *@date Mar 14, 2020
*/
package com.devpro.java08blog.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tblspecifications")
public class Specifications extends BaseEntity {

	@Column(name = "length")
	private Float length;

	@Column(name = "width")
	private Float width;

	@Column(name = "height")
	private Float height;

	@Column(name = "fuel_tank_capacity")
	private Float fuelTankCapacity;

	@Column(name = "wet_weight")
	private Float wetWeight;

	@Column(name = "displacement")
	private Float displacement;

	@Column(name = "horse_power")
	private String horsePower;

	@Column(name = "torque", length = 45)
	private String torque;

	@Column(name = "cylinders")
	private Integer cylinders;

	@Column(name = "gears")
	private Integer gears;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(unique = true)
	private Motorbike motorbike;

	public Float getLength() {
		return length;
	}

	public void setLength(Float length) {
		this.length = length;
	}

	public Float getWidth() {
		return width;
	}

	public void setWidth(Float width) {
		this.width = width;
	}

	public Float getHeight() {
		return height;
	}

	public void setHeight(Float height) {
		this.height = height;
	}

	public Float getFuelTankCapacity() {
		return fuelTankCapacity;
	}

	public void setFuelTankCapacity(Float fuelTankCapacity) {
		this.fuelTankCapacity = fuelTankCapacity;
	}

	public Float getWetWeight() {
		return wetWeight;
	}

	public void setWetWeight(Float wetWeight) {
		this.wetWeight = wetWeight;
	}

	public Float getDisplacement() {
		return displacement;
	}

	public void setDisplacement(Float displacement) {
		this.displacement = displacement;
	}

	public String getHorsePower() {
		return horsePower;
	}

	public void setHorsePower(String horsePower) {
		this.horsePower = horsePower;
	}

	public String getTorque() {
		return torque;
	}

	public void setTorque(String torque) {
		this.torque = torque;
	}

	public Integer getCylinders() {
		return cylinders;
	}

	public void setCylinders(Integer cylinders) {
		this.cylinders = cylinders;
	}

	public Integer getGears() {
		return gears;
	}

	public void setGears(Integer gears) {
		this.gears = gears;
	}

	public Motorbike getMotorbike() {
		return motorbike;
	}

	public void setMotorbike(Motorbike motorbike) {
		this.motorbike = motorbike;
	}
}
