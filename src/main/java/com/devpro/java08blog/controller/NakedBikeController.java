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
public class NakedBikeController {

	@RequestMapping(value = { "/naked-bike" }, method = RequestMethod.GET)
	public String nakedBike(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {

		model.addAttribute("pageTitle", new PageTitle("Các sản phẩm naked-bike"));

		// Create a naked-bike list
		List<MotorBike> nakedBikes = new ArrayList<>();
		nakedBikes.add(new MotorBike("KTM Duke 390", "img/KTM-Duke-390.jpg", "naked-bike"));
		nakedBikes.add(new MotorBike("KTM Duke 390", "img/KTM-Duke-390.jpg", "naked-bike"));
		nakedBikes.add(new MotorBike("KTM Duke 390", "img/KTM-Duke-390.jpg", "naked-bike"));

		model.addAttribute("nakedBikes", nakedBikes);

		return "naked-bike";
	}
}
