/*
 *@author Admin
 *@date Feb 25, 2020
*/
package com.devpro.java08blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.devpro.java08blog.entities.Motorbike;
import com.devpro.java08blog.repositories.CategoryRepository;
import com.devpro.java08blog.services.MotorbikeService;

@Controller
public class SportBikeController {

	@Autowired MotorbikeService motorbikeService;
	@Autowired CategoryRepository categoryRepo;
	
	@GetMapping("/sport-bike")
	public String sportBike(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		int pageNumber = 1;
		if (request.getParameter("page") != null) {
			pageNumber = Integer.valueOf(request.getParameter("page"));
			if (pageNumber < 1)
				pageNumber = 1;
		}
		List<Motorbike> motorbikes = motorbikeService.getAllSpecificBikes(categoryRepo.findByName("Sport-bike"), pageNumber);
		
		model.addAttribute("sportBikes", motorbikes);
		model.addAttribute("currentPage", pageNumber);
		return "sport-bike";
	}
}
