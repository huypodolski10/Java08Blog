/*
 *@author Admin
 *@date Feb 25, 2020
*/
package com.devpro.java08blog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.java08blog.dto.MotorBike;
import com.devpro.java08blog.dto.PageTitle;

@Controller
public class SportBikeController {

	@RequestMapping(value = { "/sport-bike" }, method = RequestMethod.GET)
	public String sportBike(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("pageTitle", new PageTitle("Các sản phẩm sport-bike"));

		// Create a sport-bike list
		List<MotorBike> sportBikes = new ArrayList<>();
		sportBikes.add(new MotorBike("Kawasaki Ninja H2", "img/H2.jpg", "sport-bike"));
		sportBikes.add(new MotorBike("Kawasaki Ninja H2", "img/H2.jpg", "sport-bike"));
		sportBikes.add(new MotorBike("Kawasaki Ninja H2", "img/H2.jpg", "sport-bike"));

		model.addAttribute("sportBikes", sportBikes);

		return "sport-bike";
	}
}
