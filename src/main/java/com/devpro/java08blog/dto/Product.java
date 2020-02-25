/*
 *@author Admin
 *@date Feb 25, 2020
*/
package com.devpro.java08blog.dto;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = -1640222579540819044L;

	private String productName;
	private String productImgUrl;

	public Product(String productName, String productImgUrl) {
		super();
		this.productName = productName;
		this.productImgUrl = productImgUrl;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImgUrl() {
		return productImgUrl;
	}

	public void setProductImgUrl(String productImgUrl) {
		this.productImgUrl = productImgUrl;
	}
}
