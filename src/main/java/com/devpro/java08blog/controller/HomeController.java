/*
 *@author Admin
 *@date Feb 20, 2020
*/
package com.devpro.java08blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.devpro.java08blog.entity.Motorbike;
import com.devpro.java08blog.service.CategoryService;
import com.devpro.java08blog.service.MotorbikeService;

@Controller
public class HomeController {

	@Autowired
	MotorbikeService motorbikeService;

	@Autowired
	CategoryService categoryService;

	@GetMapping("/home")
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		List<String> categoryNames = categoryService.getAllCategoryName();
		Map<String, List<Motorbike>> motorbikeList = new HashMap<>();

		for (String categoryName : categoryNames) {
			List<Motorbike> motorbikes = motorbikeService.findByCategoryNameAndStatus(categoryName, true);
			motorbikeList.put(categoryName, motorbikes);
		}

		model.addAttribute("motorbikeList", motorbikeList);

		return "home";
	}
}
