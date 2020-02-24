/*
 *@author Admin
 *@date Feb 23, 2020
*/
package com.devpro.java08blog.dto;

import java.io.Serializable;

public class PageTitle implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;

	public PageTitle(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
