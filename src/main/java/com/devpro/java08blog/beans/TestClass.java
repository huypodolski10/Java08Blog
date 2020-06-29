/*
 *@author Admin
 *@date May 30, 2020
*/
package com.devpro.java08blog.beans;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TestClass {
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private static Date date;
	
	public static void main(String[] args) {
		date = new Date();
		System.out.println(date);
	}
}
