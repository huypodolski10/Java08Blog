/*
 *@author Admin
 *@date Feb 20, 2020
*/
package com.devpro.java08blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.java08blog.dto.PageTitle;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/", "/home", "/index"}, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		
		model.addAttribute("pageTitle", new PageTitle("Trang chủ Webike"));
		
		return "home";
	}
}
