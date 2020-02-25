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

import com.devpro.java08blog.dto.Accessory;
import com.devpro.java08blog.dto.MotorBike;
import com.devpro.java08blog.dto.PageTitle;

@Controller
public class BikeAccessoryController {
	
	@RequestMapping(value = {"/bike-accessory"}, method = RequestMethod.GET)
	public String bikeComponent(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		model.addAttribute("pageTitle", new PageTitle("Các sản phẩm phụ tùng"));
		
		// Create a accessories list
		List<Accessory> accessories = new ArrayList<>();
		accessories.add(new Accessory("Evotech - Chống đổ thân Triumph T100/T120", "img/Evotech.jpg"));
		accessories.add(new Accessory("Evotech - Chống đổ thân Triumph T100/T120", "img/Evotech.jpg"));
		accessories.add(new Accessory("Evotech - Chống đổ thân Triumph T100/T120", "img/Evotech.jpg"));

		model.addAttribute("accessories", accessories);
		
		return "bike-accessory";
	}
}
