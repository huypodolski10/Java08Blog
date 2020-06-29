/*
 *@author Admin
 *@date Feb 20, 2020
*/
package com.devpro.java08blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.devpro.java08blog.entities.Category;
import com.devpro.java08blog.repositories.CategoryRepository;
import com.devpro.java08blog.repositories.MotorbikeRepository;

@Controller
public class HomeController {
	
	@Autowired MotorbikeRepository motorbikeRepo;
	@Autowired CategoryRepository categoryRepo;
	
	@GetMapping("/home")
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		Category sportCategory = categoryRepo.findByName("Sport-bike");
		Category nakedCategory = categoryRepo.findByName("Naked-bike");
		
		model.addAttribute("sportBikes", motorbikeRepo.findByCategoryAndStatus(sportCategory, true));
		model.addAttribute("nakedBikes", motorbikeRepo.findByCategoryAndStatus(nakedCategory, true));
		
		return "home";
	}
}
