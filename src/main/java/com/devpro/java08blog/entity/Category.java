/*
 *@author Admin
 *@date Mar 7, 2020
*/
package com.devpro.java08blog.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tblcategory")
public class Category extends BaseEntity {

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "category", fetch = FetchType.LAZY)
	private List<Motorbike> bikes = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Motorbike> getBikes() {
		return bikes;
	}

	public void setBikes(List<Motorbike> bikes) {
		this.bikes = bikes;
	}

	public void add(Motorbike... motorbikes) {
		for (Motorbike motorbike : motorbikes) {
			motorbike.setCategory(this);
			bikes.add(motorbike);
		}
	}

	public void remove(Motorbike motorbike) {
		bikes.remove(motorbike);
		motorbike.setCategory(null);
	}
}
