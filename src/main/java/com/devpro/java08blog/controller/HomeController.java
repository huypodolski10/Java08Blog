/*
 *@author Admin
 *@date Feb 20, 2020
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

import com.devpro.java08blog.dto.Accessory;
import com.devpro.java08blog.dto.MotorBike;
import com.devpro.java08blog.dto.PageTitle;

@Controller
public class HomeController {

	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {

		model.addAttribute("pageTitle", new PageTitle("Trang chủ Webike.vn"));

		// Create a sport-bike list
		List<MotorBike> sportBikes = new ArrayList<>();
		sportBikes.add(new MotorBike("Kawasaki Ninja H2", "img/H2.jpg", "sport-bike"));
		sportBikes.add(new MotorBike("Kawasaki Ninja H2", "img/H2.jpg", "sport-bike"));
		sportBikes.add(new MotorBike("Kawasaki Ninja H2", "img/H2.jpg", "sport-bike"));

		model.addAttribute("sportBikes", sportBikes);

		// Create a naked-bike list
		List<MotorBike> nakedBikes = new ArrayList<>();
		nakedBikes.add(new MotorBike("KTM Duke 390", "img/KTM-Duke-390.jpg", "naked-bike"));
		nakedBikes.add(new MotorBike("KTM Duke 390", "img/KTM-Duke-390.jpg", "naked-bike"));
		nakedBikes.add(new MotorBike("KTM Duke 390", "img/KTM-Duke-390.jpg", "naked-bike"));

		model.addAttribute("nakedBikes", nakedBikes);

		// Create a accessories list
		List<Accessory> accessories = new ArrayList<>();
		accessories.add(new Accessory("Evotech - Chống đổ thân Triumph T100/T120", "img/Evotech.jpg"));
		accessories.add(new Accessory("Evotech - Chống đổ thân Triumph T100/T120", "img/Evotech.jpg"));
		accessories.add(new Accessory("Evotech - Chống đổ thân Triumph T100/T120", "img/Evotech.jpg"));

		model.addAttribute("accessories", accessories);
		
		return "home";
	}
}
